#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <netdb.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <sys/wait.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define BUFSIZE 1024
#define MAXERRS 16

extern char **environ; /* the environment */
void HandleThread(void *socket);
/*
 * error - wrapper for perror used for bad syscalls
 */
void error(char *msg) {
    perror(msg);
    exit(1);
}

/*
 * cerror - returns an error message to the client
 */
void cerror(FILE *stream, char *cause, char *errno,
            char *shortmsg, char *longmsg) {
    fprintf(stream, "HTTP/1.1 %s %s\n", errno, shortmsg);
    fprintf(stream, "Content-type: text/html\n");
    fprintf(stream, "\n");
    fprintf(stream, "<html><title>Tiny Error</title>");
    fprintf(stream, "<body bgcolor=""ffffff"">\n");
    fprintf(stream, "%s: %s\n", errno, shortmsg);
    fprintf(stream, "<p>%s: %s\n", longmsg, cause);
    fprintf(stream, "<hr><em>The Tiny Web server</em>\n");
}

/*
 * cerror - returns an error message to the client
 */
void login_response(FILE *stream, char *msg) {
    fprintf(stream, "HTTP/1.1 200 OK\r\n");
    fprintf(stream, "Content-type: text/html\r\n");
    fprintf(stream, "\r\n");
    fprintf(stream, "<html><title>%s</title>", msg);
    fprintf(stream, "<body>\n");
    fprintf(stream, "%s\n", msg);
    fprintf(stream, "<hr><em>The Tiny Web server</em>\n");
}

int main(int argc, char **argv) {
    
    /* variables for connection management */
    int parentfd;          /* parent socket */
    int childfd;           /* child socket */
    int portno;            /* port to listen on */
    int clientlen;         /* byte size of client's address */
    struct hostent *hostp; /* client host info */
    char *hostaddrp;       /* dotted decimal host addr string */
    int optval;            /* flag value for setsockopt */
    struct sockaddr_in serveraddr; /* server's addr */
    struct sockaddr_in clientaddr; /* client addr */
    

    portno = 5646;
    
    /* open socket descriptor */
    parentfd = socket(AF_INET, SOCK_STREAM, 0);
    if (parentfd < 0)
        error("ERROR opening socket");
    
    /* allows us to restart server immediately */
    optval = 1;
    setsockopt(parentfd, SOL_SOCKET, SO_REUSEADDR,
               (const void *)&optval , sizeof(int));
    
    /* bind port to socket */
    bzero((char *) &serveraddr, sizeof(serveraddr));
    serveraddr.sin_family = AF_INET;
    serveraddr.sin_addr.s_addr = inet_addr("127.0.0.1");

    serveraddr.sin_port = htons((unsigned short)portno);
    if (bind(parentfd, (struct sockaddr *) &serveraddr,
             sizeof(serveraddr)) < 0)
        error("ERROR on binding");
    
    /* get us ready to accept connection requests */
    if (listen(parentfd, 10) < 0) /* allow 5 requests to queue up */
        error("ERROR on listen");
    
    // wait for a connection request, parse HTTP,
    // serve requested content, close connection.
    clientlen = sizeof(clientaddr);
    while (1) {
        
        /* wait for a connection request */
        childfd = accept(parentfd, (struct sockaddr *) &clientaddr, &clientlen);
        if (childfd < 0)
            error("ERROR on accept");
        
        pthread_t tid;
        if (pthread_create(&tid, NULL, HandleThread, &childfd) != 0) {
            close(childfd);
            error("Error: client create thread failed\n");
        }
        else {
            printf("Server: Connection succeed\n");
        }
    }
}

void HandleThread(void *socket)
{
    int childfd = *((int*)socket);
    char buf[BUFSIZE];     // message buffer
    char method[BUFSIZE];  // request method
    char url[BUFSIZE];     // request url
    char version[BUFSIZE]; // request method
    int is_static;         /* static request? */
    char filename[BUFSIZE];/* path derived from url */
    char filetype[BUFSIZE];/* path derived from url */
    char cgiargs[BUFSIZE]; /* cgi argument list */
    char *p;
    struct stat sbuf;      /* file status */
    int fd;                /* static content filedes */
    int pid;               /* process id from fork */
    int wait_status;       /* status from wait */

    FILE *stream;
    // open the child socket descriptor as a stream
    if ((stream = fdopen(childfd, "r+")) == NULL) {
        error("ERROR on fdopen");
    }
        
    printf("-------------------------------\n");
    // get the HTTP request line
    fgets(buf, BUFSIZE, stream);
    printf("%s", buf);
    sscanf(buf, "%s %s %s\n", method, url, version);
    
    if (strcasecmp(method, "GET") && strcasecmp(method, "POST")) {
        cerror(stream, method, "501", "Not Implemented",
                "Tiny does not implement this method");
        fclose(stream);
        close(childfd);
        return;
    }
    
    // read (and ignore) the HTTP headers
    int content_length = -1;  
    fgets(buf, BUFSIZE, stream);
    printf("%s", buf);
    while(strcmp(buf, "\r\n")) {
        fgets(buf, BUFSIZE, stream);
        printf("%s", buf);
        buf[15] = '\0'; //利用 \0 进行分隔
        if (strcasecmp(buf, "Content-Length:") == 0)  
            content_length = atoi(&(buf[16]));
    }
    printf("content_length = %d\n", content_length);

    // can't find content_length  
    if (!strcasecmp(method, "POST") && content_length == -1) {  
        cerror(stream, method, "400", "BAD REQUEST",
                "Have not find content_length");
        return;
    }
    
    if (!strstr(url, "cgi-bin")) { // static content
        printf("static content\n");
        is_static = 1;
        strcpy(cgiargs, "");
        strcpy(filename, "doc");
        strcat(filename, url);
        if (url[strlen(url)-1] == '/')
            strcat(filename, "index.html");
    }
    else { // dynamic content
        printf("dynamic content\n");

        is_static = 0;
        p = index(url, '?');
        if (p) {
            strcpy(cgiargs, p+1);
            *p = '\0';
        }
        else {
            strcpy(cgiargs, "");
        }
        strcpy(filename, ".");
        strcat(filename, url);
    }

    if (!strcasecmp(method, "GET")) {
        printf("GET!!!!!!!!!!\n");
        /* make sure the file exists */
        if (stat(filename, &sbuf) < 0) {
            cerror(stream, filename, "404", "Not found",
                "Tiny couldn't find this file");
            fclose(stream);
            close(childfd);
            return;
        }
        printf("file exist\n");
        /* serve static content */
        if (is_static) {
            if (strstr(filename, ".html"))
                strcpy(filetype, "text/html");
            else if (strstr(filename, ".gif"))
                strcpy(filetype, "image/gif");
            else if (strstr(filename, ".jpg"))
                strcpy(filetype, "image/jpg");
            else
                strcpy(filetype, "text/plain");
            
            /* print response header */
            fprintf(stream, "HTTP/1.1 200 OK\n");
            fprintf(stream, "Server: Tiny Web Server\n");
            fprintf(stream, "Content-length: %d\n", (int)sbuf.st_size);
            fprintf(stream, "Content-type: %s\n", filetype);
            fprintf(stream, "\r\n");
            fflush(stream);
            
            /* Use mmap to return arbitrary-sized response body */
            fd = open(filename, O_RDONLY);
            p = mmap(0, sbuf.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
            fwrite(p, 1, sbuf.st_size, stream);
            munmap(p, sbuf.st_size);
        }
        
        /* serve dynamic content */
        else {
            /* make sure file is a regular executable file */
            if (!(S_IFREG & sbuf.st_mode) || !(S_IXUSR & sbuf.st_mode)) {
                cerror(stream, filename, "403", "Forbidden",
                    "You are not allow to access this item");
                fclose(stream);
                close(childfd);
                return ;
            }
            
            /* a real server would set other CGI environ vars as well*/
            setenv("QUERY_STRING", cgiargs, 1); 
            
            /* print first part of response header */
            sprintf(buf, "HTTP/1.1 200 OK\n");
            write(childfd, buf, strlen(buf));
            sprintf(buf, "Server: Tiny Web Server\n");
            write(childfd, buf, strlen(buf));
            
            /* create and run the child CGI process so that all child
            output to stdout and stderr goes back to the client via the
            childfd socket descriptor */
            pid = fork();
            if (pid < 0) {
                perror("ERROR in fork");
                exit(1);
            }
            else if (pid > 0) { /* parent process */
                wait(&wait_status);
            }
            else { /* child  process*/
                close(0); /* close stdin */
                dup2(childfd, 1); /* map socket to stdout */
                dup2(childfd, 2); /* map socket to stderr */
                if (execve(filename, NULL, environ) < 0) {
                    perror("ERROR in execve");
                }
            }
        }
            
        /* clean up */
        fclose(stream);
        close(childfd);
        
    }
    else if (!strcasecmp(method, "POST")) {
        printf("POST!!!!!!!!!!!!!!!!!!!!\n");
        printf("filename = %s\n", filename);
        if (strcmp(filename, "doc/html/dopost") != 0) {
            // cerror(stream, filename, "404", "Not found",
            //     "Tiny couldn't find this file");
            /* print response header */
            fprintf(stream, "HTTP/1.1 404 Not found\r\n");
            fprintf(stream, "Server: Tiny Web Server\r\n");
            fprintf(stream, "Content-length: %d\r\n", (int)strlen("<p>404 Not found\r\n"));
            fprintf(stream, "Content-type: text/html\r\n");
            fprintf(stream, "\r\n");
            fprintf(stream, "<p>404 Not found\r\n"); 
            fflush(stream);

            fclose(stream);
            close(childfd);
            return;
        }
        printf("get a line from stream...\n");
        // fprintf(stream, "HTTP/1.1 200 OK\r\n");
        fgets(buf, content_length + 1, stream);
        printf("last buf = %s\n", buf);
        int i;
        int index = -1;
        for (i = 0; i < content_length; i++) {
            if (buf[i] == '&') {
                index = i;
            }
        }
        if (index == -1) {
            printf("error\n");
            exit(0);
        }
        buf[index] = '\0';
        buf[content_length] = '\0';
        char *login;
        char *pass;
        login = buf + 6;
        pass = buf + index + 6;
        printf("login = %s\n", login);
        printf("pass = %s\n", pass);

        int msglength = 0;
        char *msg;
        if (strcmp(login, "3200105646") == 0 && strcmp(pass, "5646") == 0) {
            // login_response(stream, "login succeed");
            // msglength = strlen("login succeed");
            msg = "login succeed";
        }
        else {
            // msglength = strlen("login failed");
            msg = "login failed";
        }
        /* print response header */
        msglength = strlen(msg);
        fprintf(stream, "HTTP/1.1 200 OK\r\n");
        fprintf(stream, "Server: Tiny Web Server\r\n");
        fprintf(stream, "Content-length: %d\r\n", (int)strlen("<p>\r\n") + msglength);
        fprintf(stream, "Content-type: text/html\r\n");
        fprintf(stream, "\r\n");
        fprintf(stream, "<p>%s\r\n", msg);
        fflush(stream);
    }
}
