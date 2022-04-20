#include<stdio.h>
#include<stdlib.h>

#define STUSIZE (50000+5)
#define CRSSIZE (2000+5)
#define NAMELEN (10+5)

typedef struct nodetype{
	int data;
	struct nodetype* next;
}node;
typedef struct listtype{
	node *head,*tail;
}list;
void insert(list* l,const int d){
	node* p=malloc(sizeof(node));
	p->data=d,p->next=NULL;
	if(l->head==NULL) l->head=l->tail=p;
	else l->tail=l->tail->next=p;
}

list stulist[STUSIZE],crslist[CRSSIZE];
int stuid[STUSIZE];
char stuname[STUSIZE][NAMELEN],crsname[CRSSIZE][NAMELEN];

int crscount,stucount;
char buf[5];

char nextchar(){
	char ch;
	while((ch=getchar())==' ') ;
	ungetc(ch,stdin);
	return ch;
}
void inputfunc(){
	freopen("data.txt","r",stdin);
	scanf(" %*s %*s");
	while(nextchar()!='\n') scanf(" %s",crsname[crscount++]);
	while(scanf("%d",&stuid[stucount])!=EOF){
		scanf(" %s",stuname[stucount]);
		for(int i=0;i<crscount;++i){
			scanf(" %s",buf);
			if(buf[0]=='Y'){
				insert(&stulist[stucount],i);
				insert(&crslist[i],stucount);
			}
		}
		++stucount;
	}
}
void printcrs(){
	FILE* output=fopen("studentlist.txt","w");
	fprintf(output,"This is the student list of each course.\n");
	for(int i=0;i<crscount;++i){
		fprintf(output,"COURSE %s:",crsname[i]);
		for(node* p=crslist[i].head;p;p=p->next) fprintf(output," %s",stuname[p->data]);
		fputc('\n',output);
	}
}
void printstu(){
	FILE* output=fopen("courselist.txt","w");
	fprintf(output,"This is the course list of each student.\n");
	for(int i=0;i<stucount;++i){
		fprintf(output,"ID %d, STUDENT %s:",stuid[i],stuname[i]);
		for(node* p=stulist[i].head;p;p=p->next) fprintf(output," %s",crsname[p->data]);
		fputc('\n',output);
	}
}
signed main(signed argc,char** argv,char** env){
	inputfunc();
	printcrs();
	printstu();
	exit(0);
}//Zaric