#include<math.h>
#include<stdio.h>
#include<stdlib.h>
#define lop(c,t) for(int c=1;c<=(t);++c)
#define loop(c,t) for(int c=0;c<(t);++c)

#include<time.h>
#define Maxn (100+5)
#define Eps (1e-4)										//The precision of lim
typedef struct point{
	double x,y;
}point;
point pa[Maxn],pb[Maxn];
int acnt,bcnt,preb,swaflag,extl;
int mt[Maxn],vote[Maxn];								//mt=match
double lim;
point Vector(point a,point b){
	point ret;
	ret.x=a.x-b.x,ret.y=a.y-b.y;
	return ret;
}														//Vector Minus
double Cross(point a,point b){return a.x*b.y-a.y*b.x;}	//Vector Cross Product (For Area Calculation)
double Length(point a){return sqrt(a.x*a.x+a.y*a.y);}	//Vector Length
void GetInput(){
	scanf("%d%d",&acnt,&bcnt);
	if(acnt>bcnt){
		swaflag=1;
		int t=bcnt;
		bcnt=acnt;
		acnt=t;
		lop(i,bcnt) scanf("%lf%lf",&pb[i].x,&pb[i].y);
		lop(i,acnt) scanf("%lf%lf",&pa[i].x,&pa[i].y);	//If N>M then switch the input
	}else{
		lop(i,acnt) scanf("%lf%lf",&pa[i].x,&pa[i].y);
		lop(i,bcnt) scanf("%lf%lf",&pb[i].x,&pb[i].y);
	}
}
double Ratio(double a,double b){
	if(a==0&&b==0) return 1;							//The least Ratio
	else if(a&&b) return fmax(a/b,b/a);					//Get Ratio(>=1)
	else return lim;									//Break Search Process
}
double GetWeight(point a1,point a2,point a3,point b1,point b2,point b3){
	double ret=0;
	double alen1=Length(Vector(a3,a2)),blen1=Length(Vector(b3,b2));
	double alen2=Length(Vector(a3,a1)),blen2=Length(Vector(b3,b1));
	double aarea=Cross(Vector(a3,a2),Vector(a3,a1)),barea=Cross(Vector(b3,b2),Vector(b3,b1));
	ret+=Ratio(alen1,blen1);
	ret+=Ratio(alen2,blen2);							//Ratio of Connecting Edges
	ret+=Ratio(aarea,barea);							//Ratio of Areas
	return ret;
}														//The least value is 3
int Expand(int sp1,int p1,int sp2,int p2,double excl){
	if(++extl>1e5) return 0;							//If Expand process run more than 1e5 times then return
	if(p1==acnt){
		if(excl+GetWeight(pa[sp1],pa[p1],pa[1],pb[sp2],pb[p2],pb[mt[1]])<lim) return 1;
		else return 0;
	}
	int ret=0;
	for(int j=p2+1;j<=bcnt+1-(acnt-p1);++j){
		double delta=GetWeight(pa[sp1],pa[p1],pa[p1+1],pb[sp2],pb[p2],pb[j]);
		if(excl+delta+3*(acnt-p1)<lim) ret+=Expand(p1,p1+1,p2,j,excl+delta);	//Get Votes
	}
	return ret;
}
signed main(signed argc,char** argv,char** env){
	GetInput();
	
	double t1=clock();
	lop(i,acnt){
		++preb,extl=0;
		lim=4.1*(acnt-i+1),extl=0;
		for(int j=preb;j<=bcnt;++j){
			if(i==1) mt[i]=j;
			vote[j]=Expand(i-1?i-1:i,i,mt[i-1]?mt[i-1]:j,j,0);
			if(vote[preb]<vote[j]) preb=j;							//Get the match that received most votes
		}
		if(vote[mt[i]=preb]==0){									//No solution(vote unsucessful)
			printf("Hard to find a solution close enough.\n");
			exit(0);
		}
	}
	double t2=clock();
	printf("Time used: %lf\n",(t2-t1)/CLOCKS_PER_SEC);
	
	lop(i,acnt){
		if(swaflag) printf("(%d, %d)\n",mt[i],i);
		else printf("(%d, %d)\n",i,mt[i]);
	}
}