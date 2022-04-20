#include<math.h>
#include<stdio.h>
#include<stdlib.h>
#define lop(c,t) for(int c=1;c<=(t);++c)
#define loop(c,t) for(int c=0;c<(t);++c)

#include<time.h>
int a,b;
signed main(signed argc,char** argv,char** env){
	srand(time(NULL));
	scanf("%d %d",&a,&b);
	printf("%d %d\n",a,b);
	lop(i,a) printf("%d %d\n",rand(),rand());
	lop(i,b) printf("%d %d\n",rand(),rand());
}