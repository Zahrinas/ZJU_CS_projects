#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#include <pthread.h>

#define PORT 5646
#define BUFFER_SIZE 1024
#define CONNECT_SUCCEED 0
#define CLIENT_NOT_EXIST 0
#define CLIENT_NOT_CONNECT 1
void error(char *msg);
void *ReceiveThread(void *sock_fd);

int main(){
	WSADATA wsdata;
	WSAStartup(MAKEWORD(2, 2), &wsdata);
    // Create a socket for the client
    int client_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (client_socket < 0) {
        error("Error: create socket failed");
    }

    // Setting address parameters
    struct sockaddr_in server_addr;
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = inet_addr("127.0.0.1"); // ip address
    server_addr.sin_port = htons(PORT); // port number

    int connected = 0;

    // select menu
    printf("\n");
    printf("Client:\n");
    printf("[1] Connect\n");
    printf("[2] Disconnect\n");
    printf("[3] Get time\n");
    printf("[4] Get host name\n");
    printf("[5] Get activitiy link list\n");
    printf("[6] Send message\n");
    printf("[7] Exit\n");
    printf("Select a number above: \n");

    // transfer    
    char buffer[BUFFER_SIZE];
    while(1) {
        scanf("%s", buffer);
        if (strcmp(buffer, "1") == 0) {
            // have connected
            if (connected == 1) {
                printf("Client: Have connected\n");
            }
            // have not connected
            // connect failed
            else if (connect(client_socket, (struct sockaddr*)&server_addr, sizeof(server_addr)) != CONNECT_SUCCEED) {
                close(client_socket);
                // error("Error: connect failed");
                printf("Client: Connect failed");
            }
            // connect succeed
            else {
                connected = 1;
                pthread_t tid;

                // create the thread to receive data
                // if (pthread_create(&tid, NULL, ReceiveThread, NULL) != 0) {
                if (pthread_create(&tid, NULL, ReceiveThread, &client_socket) != 0) {
                    connected = 0;
                    close(client_socket);
                    error("Error: client create thread failed\n");
                }
                else {
                    printf("Server: Connection succeed\n");
                }
            }
        }
        else if (strcmp(buffer, "2") == 0) {
            if (connected == 1) {
                connected = 0;
                printf("Server: disconnected and exit\n");
                close(client_socket);
                break;
            }
            else {
                printf("No connection\n");
            }
        }
        else if (strcmp(buffer, "3") == 0) {
            if (connected == 1) {
                char *request_packet = (char*)malloc(sizeof(int) + 4 * sizeof(char));
                *request_packet = '$';
                *(request_packet + 1) = 'Q';
                *(request_packet + 2) = 'T';
                *(int*)(request_packet + 3) = -1;
                *((char*)((int *)(request_packet + 3) + 1)) = '$';
                 for (int i = 0; i < 100; i++) {
                     // if (send(client_socket, request_packet, sizeof(int) + 4 * sizeof(char), 0) < 0) {
                     //     perror("Send time request failed\n");
                     // }
                     if (send(client_socket, request_packet, BUFFER_SIZE, 0) < 0) {
                         perror("Send time request failed\n");
                     }
                 }
                if (send(client_socket, request_packet, sizeof(int) + 4 * sizeof(char), 0) < 0) {
                    perror("Send time request failed\n");
                }
                // wait for ReceiveThread s
            }
            else {
                printf("No connection\n");
            }
        }
        else if (strcmp(buffer, "4") == 0) {
            if (connected == 1) {
                char *request_packet = (char*)malloc(sizeof(int) + 4 * sizeof(char));
                *request_packet = '$';
                *(request_packet + 1) = 'Q';
                *(request_packet + 2) = 'N';
                *(int*)(request_packet + 3) = -1;
                *((char*)((int *)(request_packet + 3) + 1)) = '$';
                if (send(client_socket, request_packet, sizeof(int) + 4 * sizeof(char), 0) < 0) {
                    perror("Send host name request failed\n");
                }
                // wait for ReceiveThread 
            }
            else {
                printf("No connection\n");
            }
        }
        else if (strcmp(buffer, "5") == 0) {
            if (connected == 1) {
                char *request_packet = (char*)malloc(sizeof(int) + 4 * sizeof(char));
                *request_packet = '$';
                *(request_packet + 1) = 'Q';
                *(request_packet + 2) = 'L';// send client list
                *(int*)(request_packet + 3) = -1;
                *((char*)((int *)(request_packet + 3) + 1)) = '$';
                if (send(client_socket, request_packet, sizeof(int) + 4 * sizeof(char), 0) < 0) {
                    perror("Send client list request failed\n");
                }
                // wait for ReceiveThread
            }
            else {
                printf("No connection\n");
            }
        }
        else if (strcmp(buffer, "6") == 0) {
            if (connected == 1) {
                int list_number;
                char content[BUFFER_SIZE];
                memset(content, 0, sizeof(content));
                printf("Please enter the client list number\n");
                scanf("%d", &list_number);
                printf("Please input what you want to send.\n");
                getchar();
                fgets(content, BUFFER_SIZE, stdin);
                content[strcspn(content, "\n")] = 0;

                // build the packet
                int length = sizeof(int) + 4 * sizeof(char) + sizeof(int) + strlen(content);
                char *request_packet = (char*)malloc(length * sizeof(char));
                *request_packet = '$';
                *(request_packet + 1) = 'Q';
                *(request_packet + 2) = 'M';// send message
                *(int*)(request_packet + 3) = length;
                *((char*)((int *)(request_packet + 3) + 1)) = '$';
                *((int*)((char*)((int *)(request_packet + 3) + 1) + 1)) = list_number;
                printf("target client number = %d\n", *((int*)((char*)((int *)(request_packet + 3) + 1) + 1)));
                // printf("%d\n", *((int*)(request_packet + 8)));
                
                strcpy((char*)((int*)((char*)((int *)(request_packet + 3) + 1) + 1) + 1), content);
                printf("content = %s\n", (request_packet + 12));

                // send the message request packet
                if (send(client_socket, request_packet, BUFFER_SIZE, 0) < 0) {
                    perror("Send message request failed\n");
                }
            }
            else {
                printf("No connection\n");
            }
        }
        else if (strcmp(buffer, "7") == 0) {
            if (connected == 1) {
                connected = 0;
            }
            close(client_socket);
            printf("Exit\n");
            // exit(1);
            break;// jump to while loop
        }
        else {
            printf("Invalid selection!\n");
        }
        sleep(1);
        printf("\n");
        printf("Client:\n");
        printf("[1] Connect\n");
        printf("[2] Disconnect\n");
        printf("[3] Get time\n");
        printf("[4] Get host name\n");
        printf("[5] Get activitiy link list\n");
        printf("[6] Send message\n");
        printf("[7] Exit\n");
        printf("Select a number above: \n");

    }

    return 0;
}

void error(char *msg) {
    perror(msg);
    exit(1);
}

// This will handle connection for each client
void *ReceiveThread(void *sock_fd) {
	// Get the socket descriptor
	int conn_id = *(int*)sock_fd;
	
	// response data
	char response[BUFFER_SIZE];
	
	// read response continue
	while (1) {
        // judge if a complete response packet
        if (recv(conn_id, response, BUFFER_SIZE, 0) > 0) {
            if (*response == '$' && *(response + 1) == 'R' && *((char*)((int*)(response + 3) + 1)) == '$') {
                if (*(response + 2) == 'T') {
                    int lengh = *(int*)(response + 3);
                    char *host_time = (char*)malloc(lengh * sizeof(char) - sizeof(char) * 4 - sizeof(int) + sizeof(char));
                    strcpy(host_time, (char*)((int *)(response + 3) + 1) + 1);
                    *(host_time + lengh - 8) = 0;
                    printf("Successfully received, time is\n%s\n", host_time);
                    free(host_time);
                }
                else if (*(response + 2) == 'N') {
                    int lengh = *(int*)(response + 3);
                    char *host_name = (char*)malloc(lengh * sizeof(char) - sizeof(char) * 4 - sizeof(int) + sizeof(char));
                    strcpy(host_name, (char*)((int *)(response + 3) + 1) + 1);
                    *(host_name + lengh - 8) = 0;
                    printf("Name is %s\n", host_name);
                    free(host_name);
                    printf("\n");
                }
                else if (*(response + 2) == 'L') {
                    int lengh = *(int*)(response + 3);
                    // char *client_list = (char*)malloc(lengh * sizeof(char) - sizeof(char) * 4 - sizeof(int) + sizeof(char));
                    char *p = (char*)((int *)(response + 3) + 1) + 1;
                    int client_num = (lengh * sizeof(char) - sizeof(char) * 4 - sizeof(int)) / (sizeof(int) + sizeof(struct sockaddr_in));
                    struct sockaddr_in addr_in;
                    printf("The client list received is:\n");
                    for (int i = 0; i < client_num; i++) {
                        int sequence = *((int*)p);
                        printf("[%d] ", sequence);
                        p = (char*)((int*)p + 1);
                        addr_in = *((struct sockaddr_in*)p);
                        printf("addr = %s, port = %d\n", inet_ntoa(addr_in.sin_addr), ntohs(addr_in.sin_port));
                        p = (char*)((struct sockaddr_in*)p + 1);
                    }
                    printf("\n");
                }
                else if (*(response + 2) == 'M') {
                    int error_code = *((int*)((char*)((int *)(response + 3) + 1) + 1));
                    printf("error_code = %d\n", *((int*)((char*)((int *)(response + 3) + 1) + 1)));
                    if (error_code == CLIENT_NOT_EXIST) {
                        printf("Target client does not exist.\n");
                    }
                    if (error_code == CLIENT_NOT_CONNECT) {
                        printf("Target client does not connect.\n");
                    }
                }
            }
            // instruction packet
            if (*response == '$' && *(response + 1) == 'I' && *((char*)((int*)(response + 3) + 1)) == '$') {
                if (*(response + 2) == 'M') {
                    int list_number = *((int*)((char*)((int *)(response + 3) + 1) + 1));
                    char *p = (char*)((int*)((char*)((int *)(response + 3) + 1) + 1) + 1);
                    printf("Client[%d] send you message:\n", list_number);
                    // getchar();// debug
                    // printf("%s", p);
                    puts(p);
                }
            }
        }
		memset(response, 0, BUFFER_SIZE);
	}
	
	// exiting
	pthread_exit(NULL);
} 
