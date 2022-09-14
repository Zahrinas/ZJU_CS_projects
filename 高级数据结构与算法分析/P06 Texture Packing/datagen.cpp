#include<cmath>
#include<cstdio>
#include<cstdlib>
#include<iostream>
#include<algorithm>
using namespace std;
#define lop(i,n) for(int i=1;i<=(n);++i)
#define loop(i,n) for(int i=0;i<(n);++i)
#define inf 0x3f3f3f3f

#include<ctime>
#include<random>
int x,y,blocks,bcnt;
int resb[10000+5][2];
default_random_engine e;
int rand_in(int l,int r){
	uniform_int_distribution<int> dis(l,r-1);
	return dis(e);	//generate a random integer in [l,r)
}
bool getblocks(int n,int xl,int yl){
	if(xl<=0||yl<=0) return 0;		//Impossible to genarate a block
	if(n==1){
		resb[bcnt][0]=xl,resb[bcnt][1]=yl;
		++bcnt;
		return 1;					//generate one block
	}
	if(n==2){
		int type=rand_in(0,2);
		if(type){
			if(yl==1) return 0;
			int yr=rand_in(1,yl);
			return getblocks(1,xl,yr)&&getblocks(1,xl,yl-yr);	//divide in 2 heights
		}else{
			if(xl==1) return 0;
			int xr=rand_in(1,xl);
			return getblocks(1,xr,yl)&&getblocks(1,xl-xr,yl);	//divide in 2 widths
		}		//to generate 2 blocks
	}
	int nx=rand_in(1,xl+1);
	int ny=rand_in(1,yl+1);
	int b1=rand_in(1,n-1);
	int b2=rand_in(1,n-b1);
	int b3=n-b1-b2;
	return getblocks(b1,nx,ny)&&getblocks(b2,xl-nx,ny)&&getblocks(b3,xl,yl-ny);
		//Divide into 3 parts of blocks: (nx,ny),(xl-nx,ny),(xl,yl-ny)
}
bool gen(){
	bcnt=0;
	int topx=rand_in(1,x+1);
	int boty=rand_in(1,y);
	int topb=rand_in(2,blocks);
	int botb=blocks-topb;
	int rddx=rand_in(1,topx);
	
	if(botb==0) return 0;
	return getblocks(1,rddx,y-boty)&&getblocks(topb-1,topx-rddx,y-boty)&&getblocks(botb,x,boty);
		//Divide into 3 parts of blocks: (rddx,y-boty),(topx-rddx,y-boty),(x,boty)
}
signed main(signed,char**,char**){
	freopen("out.txt","w",stdout);
	srand(time(0));
	e.seed(rand());
	//cout<<"Input the given width, optimal height and number of blocks:"<<endl;
	cin>>x>>y>>blocks;
	while(!gen()) ;
	cout<<x<<' '<<blocks<<endl;
	for(int i=0;i<blocks;++i) cout<<resb[i][0]<<' '<<resb[i][1]<<endl;
}