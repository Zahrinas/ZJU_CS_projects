#include"graphics.h"
#include<stdio.h>
#include<math.h>

#define Angle60 (M_PI/3)
double Length;
int Order;

void Input();
void DrawEdge();
void DrawKoch();
void Main(){
	Input();
	InitGraphics();
	MovePen(GetWindowWidth()/2-Length/2,GetWindowHeight()/2-Length/2);
	DrawKoch(Length,Order,0);
	DrawKoch(Length,Order,2*Angle60);
	DrawKoch(Length,Order,4*Angle60);
}
void Input(){
	OpenConsole();
	printf("Please Input Edge Length and Order:");
	scanf("%lf%d",&Length,&Order);
}
void DrawKoch(double Len,int Rank,double Dir){
	if(Rank==0){
		DrawLine(Len*cos(Dir),Len*sin(Dir));
		return;
	}
	DrawKoch(Len/3,Rank-1,Dir);
	DrawKoch(Len/3,Rank-1,Dir-Angle60);
	DrawKoch(Len/3,Rank-1,Dir+Angle60);
	DrawKoch(Len/3,Rank-1,Dir);
	
}