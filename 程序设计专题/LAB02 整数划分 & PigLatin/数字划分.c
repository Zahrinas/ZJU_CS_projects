#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int k;
char buf[10001];
void divide(const int x,const int m,const int p){
	for(int i=m;i;--i){
		sprintf(buf+p,"%d",i);
		if(x-i==0) puts(buf);
		else if(x-i>0){
			sprintf(buf+p+strlen(buf+p),"+");
			divide(x-i,i,p+strlen(buf+p));
		}
	}
}
signed main(signed argc,char** argv,char** env){
	scanf("%d",&k);
	sprintf(buf,"%d = ",k);
	divide(k,k-1,strlen(buf));
	system("pause");
	exit(0);
}//Zaric  