#include<math.h>
#include<time.h>
#include<stdio.h>
#include<stdlib.h>
#define lop(c,t) for(int c=1;c<=(t);++c)
#define loop(c,t) for(int c=0;c<(t);++c)

signed main(){
	srand(time(NULL));
	int n;
	scanf("%d",&n);
	printf("%d\n",n);
	lop(i,n) lop(j,n) printf("%d%c",(rand()%2?1:-1)*rand()%100+1,j==n?'\n':' ');
}