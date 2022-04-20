#include<math.h>

#include"graphics.h"

#include"vector.h"
#include"types.h"

static Ball* Balls;
static int BallCount;
static double TimeCheck;
static double FrictionRate=0.9;

double CoorDistance(double x1,double y1,double x2,double y2){
	double dx=x1-x2,dy=y1-y2;
	return sqrt(dx*dx+dy*dy);
}

static void Friction(){
	double v,vn;
	for(int i=0;i<BallCount;++i){
		if(!Balls[i].exit){
			v=sqrt(Balls[i].vx*Balls[i].vx+Balls[i].vy*Balls[i].vy);
			if(v<FrictionRate*M_GC*TimeCheck) Balls[i].vx=Balls[i].vy=0;
			else{
				vn=v-FrictionRate*M_GC*TimeCheck;
				Balls[i].vx*=vn/v;
				Balls[i].vy*=vn/v;
			}
		}
	}
}

static int Exit(double t){
	double lx=TableCenterX;
	double ly=TableCenterY;
	for(int i=0;i<BallCount;++i) if(!Balls[i].exit){
		if(CoorDistance(
		lx+TableWidth/2+0.1-CornerArcRadius*cos(5*M_PI/180),ly+TableHeight/2+0.1-CornerArcRadius*sin(5*M_PI/180),
		Balls[i].x+Balls[i].vx*t,Balls[i].y+Balls[i].vy*t)<CornerArcRadius) return 1;
		if(CoorDistance(
		lx-TableWidth/2-0.1+CornerArcRadius*cos(5*M_PI/180),ly-TableHeight/2-0.1+CornerArcRadius*sin(5*M_PI/180),
		Balls[i].x+Balls[i].vx*t,Balls[i].y+Balls[i].vy*t)<CornerArcRadius) return 1;
		if(CoorDistance(
		lx+TableWidth/2+0.1-CornerArcRadius*sin(5*M_PI/180),ly-TableHeight/2-0.1+CornerArcRadius*cos(5*M_PI/180),
		Balls[i].x+Balls[i].vx*t,Balls[i].y+Balls[i].vy*t)<CornerArcRadius) return 1;
		if(CoorDistance(
		lx-TableWidth/2-0.1+CornerArcRadius*sin(5*M_PI/180),ly+TableHeight/2+0.1-CornerArcRadius*cos(5*M_PI/180),
		Balls[i].x+Balls[i].vx*t,Balls[i].y+Balls[i].vy*t)<CornerArcRadius) return 1;
		if(Balls[i].x+Balls[i].vx*t>TableCenterX-MarginArcRadius*sqrt(2)/2
			&&Balls[i].x+Balls[i].vx*t<TableCenterX+MarginArcRadius*sqrt(2)/2
			&&(Balls[i].y+Balls[i].vy*t>TableY+TableH||Balls[i].y+Balls[i].vy*t<TableY)) return 1;
	}
	return 0;
}

static int EdgeCollide(double t){
	for(int i=0;i<BallCount;++i) if(!Balls[i].exit){
		if(Balls[i].x+Balls[i].vx*t<TableX) return 1;
		if(Balls[i].x+Balls[i].vx*t>TableX+TableW) return 1;
		if(Balls[i].y+Balls[i].vy*t<TableY) return 1;
		if(Balls[i].y+Balls[i].vy*t>TableY+TableH) return 1;
	}
	return 0;
}

static int BallCollide(double t){
	double ds;
	for(int i=0;i<BallCount;++i) if(!Balls[i].exit){
		for(int j=i+1;j<BallCount;++j) if(!Balls[j].exit){
			ds=CoorDistance(Balls[i].x+Balls[i].vx*t,Balls[i].y+Balls[i].vy*t,
							Balls[j].x+Balls[j].vx*t,Balls[j].y+Balls[j].vy*t);
			if(ds<2*BallRadius-Eps) return 1;
		}
	}
	return 0;
}

static int HasEvent(double t){
	return Exit(t)||EdgeCollide(t)||BallCollide(t);
}


static void MovePos(double t){
	for(int i=0;i<BallCount;++i) if(!Balls[i].exit){
		Balls[i].x+=Balls[i].vx*t;
		Balls[i].y+=Balls[i].vy*t;
	}
}

static double NextEvent(double lat){
	double l=lat,r=TimeCheck;
	while(r-l>Eps){
		double mid=(l+r)/2;
		if(HasEvent(mid-lat)) r=mid;
		else l=mid;
	}
	return r;
}
static void DealExit(){
	double lx=TableCenterX;
	double ly=TableCenterY;
	for(int i=0;i<BallCount;++i) if(!Balls[i].exit){
		if(CoorDistance(
		lx+TableWidth/2+0.1-CornerArcRadius*cos(5*M_PI/180),ly+TableHeight/2+0.1-CornerArcRadius*sin(5*M_PI/180),
		Balls[i].x,Balls[i].y)<CornerArcRadius) Balls[i].exit=1,Balls[i].vx=0,Balls[i].vy=0;
		if(CoorDistance(
		lx-TableWidth/2-0.1+CornerArcRadius*cos(5*M_PI/180),ly-TableHeight/2-0.1+CornerArcRadius*sin(5*M_PI/180),
		Balls[i].x,Balls[i].y)<CornerArcRadius) Balls[i].exit=1,Balls[i].vx=0,Balls[i].vy=0;
		if(CoorDistance(
		lx+TableWidth/2+0.1-CornerArcRadius*sin(5*M_PI/180),ly-TableHeight/2-0.1+CornerArcRadius*cos(5*M_PI/180),
		Balls[i].x,Balls[i].y)<CornerArcRadius) Balls[i].exit=1,Balls[i].vx=0,Balls[i].vy=0;
		if(CoorDistance(
		lx-TableWidth/2-0.1+CornerArcRadius*sin(5*M_PI/180),ly+TableHeight/2+0.1-CornerArcRadius*cos(5*M_PI/180),
		Balls[i].x,Balls[i].y)<CornerArcRadius) Balls[i].exit=1,Balls[i].vx=0,Balls[i].vy=0;
		if(Balls[i].x>TableCenterX-MarginArcRadius*sqrt(2)/2
			&&Balls[i].x<TableCenterX+MarginArcRadius*sqrt(2)/2
			&&(Balls[i].y>TableY+TableH||Balls[i].y<TableY)) Balls[i].exit=1,Balls[i].vx=0,Balls[i].vy=0;
	}
}

static void DealEdge(){
	for(int i=0;i<BallCount;++i) if(!Balls[i].exit){
		if(Balls[i].x<TableX){
			Balls[i].x=2*TableX-Balls[i].x;
			Balls[i].vx=-Balls[i].vx;
		}else if(Balls[i].x>TableX+TableW){
			Balls[i].x=2*(TableX+TableW)-Balls[i].x;
			Balls[i].vx=-Balls[i].vx;
		}
		if(Balls[i].y<TableY){
			Balls[i].y=2*TableY-Balls[i].y;
			Balls[i].vy=-Balls[i].vy;
		}else if(Balls[i].y>TableY+TableH){
			Balls[i].y=2*(TableY+TableH)-Balls[i].y;
			Balls[i].vy=-Balls[i].vy;
		}
	}
}

static void DealBall(){
	double ds;
	for(int i=0;i<BallCount;++i) if(!Balls[i].exit){
		for(int j=i+1;j<BallCount;++j) if(!Balls[j].exit){
			ds=CoorDistance(Balls[i].x,Balls[i].y,Balls[j].x,Balls[j].y);
			if(ds<2*BallRadius-Eps){
				double Dir=atan2(Balls[i].y-Balls[j].y,Balls[i].x-Balls[j].x);
				double InDs=BallRadius-ds/2;
				vec a=ToVector(Balls[i].vx,Balls[i].vy);
				vec b=ToVector(Balls[j].vx,Balls[j].vy);
				Balls[i].vx=VectorX(HorResolve(b,Dir))+VectorX(VerResolve(a,Dir));
				Balls[i].vy=VectorY(HorResolve(b,Dir))+VectorY(VerResolve(a,Dir));
				Balls[j].vx=VectorX(HorResolve(a,Dir))+VectorX(VerResolve(b,Dir));
				Balls[j].vy=VectorY(HorResolve(a,Dir))+VectorY(VerResolve(b,Dir));
				Balls[i].x+=InDs*cos(Dir),Balls[i].y+=InDs*sin(Dir);
				Balls[j].x+=InDs*-cos(Dir),Balls[j].y+=InDs*-sin(Dir);
			}
		}
	}
	MovePos(Eps);
}

static void DealEvent(double t){
	MovePos(t);
	DealExit();
	DealEdge();
	DealBall();
}
static void CollideAndMove(){
	double t,latest=0;
	while((t=NextEvent(latest))<TimeCheck){
		DealEvent(t-latest);
		latest=t;
	}
	DealEvent(t-latest);
}

void CheckCollide(){
	Friction();
	CollideAndMove();
}

void SetSpeed(Ball* bptr,double spd,double radian){
	bptr->vx=spd*-cos(radian);
	bptr->vy=spd*-sin(radian);
}

int StillMoving(){
	for(int i=0;i<BallCount;++i) if(!Balls[i].exit){
		if(Balls[i].vx!=0||Balls[i].vy!=0) return 1;
	}
	return 0;
}

void SetBalls(Ball* bptr,int size){
	Balls=bptr,BallCount=size;
}

void SetTime(double t){
	TimeCheck=t;
}