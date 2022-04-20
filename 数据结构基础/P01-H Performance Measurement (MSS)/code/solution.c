#include<math.h>
#include<time.h>
#include<stdio.h>
#include<stdlib.h>
#define lop(c,t) for(int c=1;c<=(t);++c)
#define loop(c,t) for(int c=0;c<(t);++c)

#define MAX_SIZE (1000+5)
int n,ans;
int area[MAX_SIZE][MAX_SIZE];
int sum[MAX_SIZE][MAX_SIZE];
void GetInput(){
	scanf("%d",&n);
	lop(i,n) lop(j,n) scanf("%d",&area[i][j]);
}
void DealSum(){
	lop(i,n) lop(j,n) sum[i][j]=area[i][j]+sum[i-1][j]+sum[i][j-1]-sum[i-1][j-1];
																		//Using Inclusion-Exclusion Principle
}
int Algo_N6(){
	int ret=0;
	lop(i,n) lop(j,n){
		for(int k=i;k<=n;++k) for(int l=j;l<=n;++l){
			int sum=0;
			for(int m=i;m<=k;++m) for(int n=j;n<=l;++n){
				sum+=area[m][n];
			}
			if(sum>ret) ret=sum;
		}
	}
	return ret;
}
int Algo_N4(){
	DealSum();
	int ret=0;
	lop(i,n) lop(j,n){
		for(int k=i;k<=n;++k) for(int l=j;l<=n;++l){
			int nows=sum[k][l]-sum[i-1][l]-sum[k][j-1]+sum[i-1][j-1];	//Sum of a[i...k][j...l]
																		//Using Inclusion-Exclusion Principle
			if(nows>ret) ret=nows;
		}
	}
	return ret;
}
int Algo_N3(){
	DealSum();
	int ret=0;
	lop(i,n) for(int j=i;j<=n;++j){
		int nows=0;
		lop(k,n){
			nows+=sum[j][k]-sum[i-1][k]-sum[j][k-1]+sum[i-1][k-1];		//Sum of a[i...j][k]
																		//Using Inclusion-Exclusion Principle
			if(nows<0) nows=0;
			if(nows>ret) ret=nows;
		}
	}
	return ret;
}
signed main(){
	GetInput();
	
	clock_t start=clock();
	lop(i,10) ans=Algo_N3();											//Change the function to switch algorithms.
	clock_t stop=clock();
	double duration=((double)(stop-start))/CLK_TCK;
	
	//printf("Ticks:%ld Time:%lf\n",stop-start,duration);				//use this line to get ticks and time used.
	printf("%d",ans);
	exit(0);
}