#include<stdio.h>
#include<stdlib.h>

typedef struct nodetype{
	int data;
	struct nodetype* next;
}node;
node *head,*tail,*now,*pre;

int n;

void insert(int data){
	node* p=malloc(sizeof(node));
	p->data=data,p->next=head;
	if(head) tail=tail->next=p;
	else head=tail=p;
}
signed main(signed argc,char** argv,char** env){
	scanf("%d",&n);
	for(int i=1;i<=n;++i) insert(i);
	now=head;
	while(n!=1){
		for(int i=0;i<2;++i){
			pre=now;
			now=now->next;
		}
		pre->next=now->next;
		free(now);
		now=pre->next;
		--n;
	}
	printf("%d号候选猴子当选猴王！\n",now->data);
	system("pause");
	exit(0);
}//Zaric