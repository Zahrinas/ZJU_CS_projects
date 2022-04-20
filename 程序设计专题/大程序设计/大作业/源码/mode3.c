/*
	File: 		mode3.c
	Edition: 	2021/6/10
	
	Nine-Ball Rule
*/
#include<math.h>

#include"imgui.h"
#include"graphics.h"
#include"extgraph.h"

#include"draw.h"
#include"types.h"
#include"video.h"
#include"physics.h"

static Ball balls[10];
static Ball OutBall[8];
static double CueAngle;
static double vmax=30;
static int isLegal=1; //白球是否入洞 
static double LastForceY=TableCenterY;
static int TimeItv=20;
static double mx,my;
static int Player=0; 
static int Num=0;//不在场球的个数
static int Goal=0;//需要打进洞的球 
static int count;
static int Now=0;
static char str[100];

static void StartGame(){
	double InitCoordinate[10][2]={
	{TableCenterX-TableWidth/4,TableCenterY},
	{TableCenterX+TableWidth/4,TableCenterY},
	{TableCenterX+TableWidth/4+sqrt(3)*BallRadius,TableCenterY+BallRadius},
	{TableCenterX+TableWidth/4+sqrt(3)*BallRadius,TableCenterY-BallRadius},
	{TableCenterX+TableWidth/4+2*sqrt(3)*BallRadius,TableCenterY+2*BallRadius},
	{TableCenterX+TableWidth/4+2*sqrt(3)*BallRadius,TableCenterY-2*BallRadius},
	{TableCenterX+TableWidth/4+3*sqrt(3)*BallRadius,TableCenterY+1*BallRadius},
	{TableCenterX+TableWidth/4+3*sqrt(3)*BallRadius,TableCenterY-1*BallRadius},
	{TableCenterX+TableWidth/4+4*sqrt(3)*BallRadius,TableCenterY},
	{TableCenterX+TableWidth/4+2*sqrt(3)*BallRadius,TableCenterY}
	};
	
	balls[0]=(Ball){Pure,0," ","White","White",0,0,0,0,0};
	balls[1]=(Ball){Pure,1,"1","Yellow","Black",0,0,0,0,0};
	balls[2]=(Ball){Pure,2,"2","Blue","Black",0,0,0,0,0};
	balls[3]=(Ball){Pure,3,"3","Red","Black",0,0,0,0,0};
	balls[4]=(Ball){Pure,4,"4","Gray","Black",0,0,0,0,0};
	balls[5]=(Ball){Pure,5,"5","Orange","Black",0,0,0,0,0};
	balls[6]=(Ball){Pure,6,"6","Green","Black",0,0,0,0,0};
	balls[7]=(Ball){Pure,7,"7","Brown","Black",0,0,0,0,0};
	balls[8]=(Ball){Pure,8,"8","Black","White",0,0,0,0,0};
	balls[9]=(Ball){Mixed,9,"9","Yellow","Black",0,0,0,0,0};
	
	OutBall[0]=OutBall[1]=OutBall[2]=OutBall[3]=OutBall[4]=OutBall[5]=OutBall[6]=OutBall[7]=OutBall[8]=(Ball){Pure,10,"","White","White",0,0,0,0,0};
	
	for(int i=0;i<10;i++){
		balls[i].x=InitCoordinate[i][0];
		balls[i].y=InitCoordinate[i][1];
	}
}

static void DrawAll(){
	if(button(GenUIID(114514),1,1,2,1,"退出")) exit(0);
	
	DrawTable();
	for(int i=0;i<10;++i){
		if(balls[i].exit==0)DrawBall(balls[i]);
		else{
			if(balls[i].vx!=0||balls[i].vy!=0)Now=i;
		}
	}
	if(balls[0].exit) isLegal=0;
	if(isLegal==0){
		balls[0].x=mx,balls[0].y=my;
		balls[0].vx=0,balls[0].vy=0;
		DrawBall(balls[0]);
	}
	if(!StillMoving()){
		if(isLegal==1){
			CueAngle=asin((my-balls[0].y)/sqrt((my-balls[0].y)*(my-balls[0].y)+(mx-balls[0].x)*(mx-balls[0].x)));
			if(isnan(CueAngle)) CueAngle=M_PI;
			if(mx<balls[0].x) CueAngle=M_PI-CueAngle;
			DrawCue(balls[0].x,balls[0].y,CueAngle*180/M_PI);
			
			LastForceY+=ForceBoxHeight*TimeItv*0.001/1.5;
			if(LastForceY>ForceBoxY+ForceBoxHeight) LastForceY=ForceBoxY;
			DrawForceBox(LastForceY);
		}
	}else
		LastForceY=TableCenterY;
	
	if(balls[9].exit==1&&(balls[1].exit==0||balls[2].exit==0||balls[3].exit==0||balls[4].exit==0||balls[5].exit==0||balls[6].exit==0||balls[7].exit==0||balls[8].exit==0)){
		balls[9]=(Ball){Mixed,9,"9","Yellow","Black",0,TableCenterX+TableWidth/4,TableCenterY,0,0};
		DrawBall(balls[9]);
	}
	
	MovePen(TableCenterX-TableWidth*0.9,TableCenterY+TableWidth/8+1.5);
	DrawTextString("按数字顺序由小到大击球"); 
	MovePen(TableCenterX-TableWidth*0.9,TableCenterY+TableWidth/8+1.0);
	DrawTextString("最终将9号球击打入袋的玩家获胜");
	MovePen(TableCenterX-TableWidth*0.9,TableCenterY+TableWidth/8);
	DrawTextString("玩家1");
	MovePen(TableCenterX-TableWidth*0.9,TableCenterY-TableWidth/8);
	DrawTextString("玩家2");
	if(isLegal==1){
		if(Player%2==0||Player==0) {
			SetPenSize(2);
			SetPenColor("Black");
			drawRectangle(TableCenterX-TableWidth*0.9-0.1,TableCenterY+TableWidth/8-0.1,1.0,0.5,0);
		}
		else{
			SetPenSize(2);
			SetPenColor("Black");
			drawRectangle(TableCenterX-TableWidth*0.9-0.1,TableCenterY-TableWidth/8-0.1,1.0,0.5,0);
		}	
	}
	
	for(int i=1;i<9;i++){
		if(balls[i].exit==0){
			Goal=i;
			break;
		}
	}
	for(int i=1;i<9;i++){
		if(balls[i].exit==1)count++;
	}
}

static void Legal(){
	if(!StillMoving){
		if(Now!=0&&Goal!=Num)Player=Player+1;
	}
}

static void TimerEvent(int event){
	if(event==1){
		DisplayClear();
		CheckCollide();
		DrawAll();
		Legal();
	}
}

static void MouseEvent(int x, int y, int button, int event){
	mx=ScaleXInches(x);
	my=ScaleYInches(y);
	uiGetMouse(x,y,button,event);
	
	if(event==BUTTON_UP){
		if(isLegal==0){
			isLegal=1;
			balls[0].exit=0;
			Player=Player+1;
		}else{
			if(Num==count)Player=Player+1;
			else Num=count;
			SaveStep(vmax*(LastForceY-(TableCenterY-ForceBoxHeight/2))/ForceBoxHeight,CueAngle,!(Player%2));
			SetSpeed(&balls[0],vmax*(LastForceY-(TableCenterY-ForceBoxHeight/2))/ForceBoxHeight,CueAngle);
		}
	}
	
} 

void GameResults(){
	if(balls[9].exit==1&&balls[1].exit==1&&balls[2].exit==1&&balls[3].exit==1&&balls[4].exit==1&&balls[5].exit==1&&balls[6].exit==1&&balls[7].exit==1&&balls[8].exit==1){
		cancelTimer(1);
		DisplayClear();
		MovePen(TableCenterX-TableWidth*0.9,TableCenterY-TableWidth/8-0.8);
		SetPenColor("Red");
		if(Player%2==0) DrawTextString("Player1 won the game.");
		else DrawTextString("Player2 won the game.");
	}
}

void StartMode3(){
	InitSave(balls,10);
	
	StartGame();
	SetBalls(balls,10);
	DrawAll();
	
	SetTime(TimeItv*0.001);
	startTimer(1,TimeItv);
	registerTimerEvent(TimerEvent);
	registerMouseEvent(MouseEvent);
	GameResults();
}
