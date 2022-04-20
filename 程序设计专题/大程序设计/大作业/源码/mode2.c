/*
	File: 		mode2.c
	Edition: 	2021/6/2
	
	Snooker Rule
*/

#include<math.h>

#include"graphics.h"
#include"extgraph.h"

#include"draw.h"
#include"imgui.h"
#include"types.h"
#include"video.h"
#include"physics.h"

static int LastPhase;
static int TimeItv=20;
static int SetMode;
static int FirstBall;
static int Player;
static int NextColor;
static int Checked;
static int RuleMsg;
static int PREClicked;
static int Clicked;
static int GameOver;
static int Score[2];
static double mx,my;
static double CueAngle;
static double LastForceY=ForceBoxY;
static double LastCond[22];
static char buf1[30],buf2[30],buf3[30];

static char ColorCHN[6][10]={"»Æ","ÂÌ","×Ø","À¶","·Û","ºÚ"};

static double InitCoor[22][2]={
	{0,0},
	{TableCenterX+TableWidth/4+0.5,TableCenterY},
	{TableCenterX+TableWidth/4+0.5+sqrt(3)*BallRadius,TableCenterY+BallRadius},
	{TableCenterX+TableWidth/4+0.5+sqrt(3)*BallRadius,TableCenterY-BallRadius},
	{TableCenterX+TableWidth/4+0.5+2*sqrt(3)*BallRadius,TableCenterY+2*BallRadius},
	{TableCenterX+TableWidth/4+0.5+2*sqrt(3)*BallRadius,TableCenterY},
	{TableCenterX+TableWidth/4+0.5+2*sqrt(3)*BallRadius,TableCenterY-2*BallRadius},
	{TableCenterX+TableWidth/4+0.5+3*sqrt(3)*BallRadius,TableCenterY+3*BallRadius},
	{TableCenterX+TableWidth/4+0.5+3*sqrt(3)*BallRadius,TableCenterY+1*BallRadius},
	{TableCenterX+TableWidth/4+0.5+3*sqrt(3)*BallRadius,TableCenterY-1*BallRadius},
	{TableCenterX+TableWidth/4+0.5+3*sqrt(3)*BallRadius,TableCenterY-3*BallRadius},
	{TableCenterX+TableWidth/4+0.5+4*sqrt(3)*BallRadius,TableCenterY+4*BallRadius},
	{TableCenterX+TableWidth/4+0.5+4*sqrt(3)*BallRadius,TableCenterY+2*BallRadius},
	{TableCenterX+TableWidth/4+0.5+4*sqrt(3)*BallRadius,TableCenterY},
	{TableCenterX+TableWidth/4+0.5+4*sqrt(3)*BallRadius,TableCenterY-2*BallRadius},
	{TableCenterX+TableWidth/4+0.5+4*sqrt(3)*BallRadius,TableCenterY-4*BallRadius},
	{TableCenterX-TableWidth/4,TableCenterY-TableHeight/4},
	{TableCenterX-TableWidth/4,TableCenterY+TableHeight/4},
	{TableCenterX-TableWidth/4,TableCenterY},
	{TableCenterX,TableCenterY},
	{TableCenterX+TableWidth/4,TableCenterY},
	{TableCenterX+TableWidth*89/192,TableCenterY}
};
static Ball ball[22]={
	{Pure,0,"","White","White",0,0,0,0,0},
	{Pure,1,"","Red","Red",0,0,0,0,0},
	{Pure,1,"","Red","Red",0,0,0,0,0},
	{Pure,1,"","Red","Red",0,0,0,0,0},
	{Pure,1,"","Red","Red",0,0,0,0,0},
	{Pure,1,"","Red","Red",0,0,0,0,0},
	{Pure,1,"","Red","Red",0,0,0,0,0},
	{Pure,1,"","Red","Red",0,0,0,0,0},
	{Pure,1,"","Red","Red",0,0,0,0,0},
	{Pure,1,"","Red","Red",0,0,0,0,0},
	{Pure,1,"","Red","Red",0,0,0,0,0},
	{Pure,1,"","Red","Red",0,0,0,0,0},
	{Pure,1,"","Red","Red",0,0,0,0,0},
	{Pure,1,"","Red","Red",0,0,0,0,0},
	{Pure,1,"","Red","Red",0,0,0,0,0},
	{Pure,1,"","Red","Red",0,0,0,0,0},
	{Pure,2,"","Yellow","Yellow",0,0,0,0,0},
	{Pure,3,"","Green","Green",0,0,0,0,0},
	{Pure,4,"","Brown","Brown",0,0,0,0,0},
	{Pure,5,"","Blue","Blue",0,0,0,0,0},
	{Pure,6,"","Pink","Pink",0,0,0,0,0},
	{Pure,7,"","Black","Black",0,0,0,0,0}
};

static void PrintStatus(){
	int InAll=0;
	for(int i=1;i<22;++i) InAll+=ball[i].exit;
	
	sprintf(buf1,"Íæ¼Ò1£º%d·Ö",Score[0]);
	sprintf(buf2,"Íæ¼Ò2£º%d·Ö",Score[1]);
	if(InAll!=21){
		sprintf(buf3,"Íæ¼Ò%dÐÐ¶¯",Player+1);
		DrawMsg1("Î¢ÈíÑÅºÚ",buf1,buf2,buf3);
	}
	else{
		if(Score[0]==Score[1]) sprintf(buf3,"Æ½¾Ö¡£");
		else sprintf(buf3,"Íæ¼Ò%dÊ¤Àû£¡",(Score[0]<Score[1])+1);
		DrawMsg1("Î¢ÈíÑÅºÚ",buf1,buf2,buf3);
		GameOver=1;
		return;
	}
	
	if(!SetMode){
		if(!LastPhase){
			if(NextColor) DrawMsg3("Î¢ÈíÑÅºÚ","ÔÊÐí»÷´òÈÎÒâ²ÊÇò","");
			else DrawMsg3("Î¢ÈíÑÅºÚ","ÔÊÐí»÷´òºìÇò","");
		}else{
			sprintf(buf1,"Ö»ÔÊÐí»÷´ò%sÇò",ColorCHN[LastPhase-16]);
			DrawMsg3("Î¢ÈíÑÅºÚ",buf1,"");
		}
		printf("Now P%d\nPlayer1:%d Player2:%d\n\n",Player+1,Score[0],Score[1]);
	}else DrawMsg3("Î¢ÈíÑÅºÚ","·ÅÖÃ°×ÇòÓÚ¿ªÇòÇø","");
	
	if(Clicked){
		if(RuleMsg){
			sprintf(buf1,"Íæ¼Ò%d·¸¹æ",!Player+1);
			sprintf(buf2,"¶ÔÊÖ»ñµÃ%d·Ö",RuleMsg);
			DrawMsg2("Î¢ÈíÑÅºÚ",buf1,buf2);
		}
		else DrawMsg2("Î¢ÈíÑÅºÚ","ÕýÈ·»÷Çò","");
	}
}

static void DrawAll(){
	DrawTable();
	PrintStatus();
	if(button(GenUIID(114514),1,1,2,1,"ÍË³ö")) exit(0);
	if(!GameOver){
		if(SetMode){
			ball[0].x=mx,ball[0].y=my;
			DrawBall(ball[0]);
		}
		for(int i=0;i<22;++i){
			if(!ball[i].exit) DrawBall(ball[i]);
			if(i&&!FirstBall&&!ball[i].exit&&(ball[i].vx||ball[i].vy)) FirstBall=i;
		}
		if(!StillMoving()){
			if(!SetMode){
				CueAngle=asin((my-ball[0].y)/sqrt((my-ball[0].y)*(my-ball[0].y)+(mx-ball[0].x)*(mx-ball[0].x)));
				if(isnan(CueAngle)) CueAngle=M_PI;
				if(mx<ball[0].x) CueAngle=M_PI-CueAngle;
				DrawCue(ball[0].x,ball[0].y,CueAngle*180/M_PI);
				
				LastForceY+=ForceBoxHeight*TimeItv*0.001/1.5;
				if(LastForceY>ForceBoxY+ForceBoxHeight) LastForceY=ForceBoxY;
				DrawForceBox(LastForceY);
			}
		}else LastForceY=ForceBoxY;
	}
}

static void ResetColorBall(int id){
	ball[id].exit=0;
	for(int i=0;i<22;++i){
		if(!ball[i].exit&&CoorDistance(ball[i].x,ball[i].y,InitCoor[id][0],InitCoor[id][1])<2*BallRadius) break;
		if(i==21){
			ball[id].x=InitCoor[id][0],ball[id].y=InitCoor[id][1];
			return;
		}
	}
	for(int i=21;i>=16;--i) for(int j=0;j<22;++j){
		if(!ball[j].exit&&CoorDistance(ball[j].x,ball[j].y,InitCoor[i][0],InitCoor[i][1])<2*BallRadius) break;
		if(j==21){
			ball[id].x=InitCoor[i][0],ball[id].y=InitCoor[i][1];
			return;
		}
	}
	for(double pos=InitCoor[id][0]+BallRadius;pos<TableW;pos+=BallRadius) for(int i=0;i<22;++i){
		if(!ball[i].exit&&CoorDistance(ball[i].x,ball[i].y,pos,InitCoor[id][1])<2*BallRadius) break;
		if(i==21){
			ball[id].x=pos,ball[id].y=InitCoor[id][1];
			return;
		}
	}
	for(int i=21;i>=16;--i) for(double pos=InitCoor[i][0]+BallRadius;pos<TableW;pos+=BallRadius) for(int j=0;j<22;++j){
		if(!ball[j].exit&&CoorDistance(ball[j].x,ball[j].y,pos,InitCoor[i][1])<2*BallRadius) break;
		if(j==21){
			ball[id].x=pos,ball[id].y=InitCoor[i][1];
			return;
		}
	}
}

static int TrueFirstBall(){
	if(LastPhase) return FirstBall==LastPhase;
	else if(NextColor) return 16<=FirstBall&&FirstBall<=22;
	else return 1<=FirstBall&&FirstBall<=15;
}

static void CheckStatus(){
	int rcnt=0,ccnt=0,maxp=7;
	for(int i=1;i<22;++i) if(!ball[i].exit&&maxp>ball[i].num_int) maxp=ball[i].num_int;
	if(maxp<4) maxp=4;
	if(ball[0].exit){
		for(int i=21;i>15;--i){
			if(ball[i].exit&&!LastCond[i]){
				if(maxp<ball[i].num_int) maxp=ball[i].num_int;
				ResetColorBall(i);
			}
			if(i==FirstBall&&maxp<ball[i].num_int) maxp=ball[i].num_int;
		}
		SetMode=1;
		RuleMsg=maxp;
		Score[Player=!Player]+=maxp;
		return;
	}
	for(int i=1;i<22;++i) if(ball[i].exit&&!LastCond[i]){
		if(i<16) ++rcnt;
		else ++ccnt;
		if(maxp<ball[i].num_int) maxp=ball[i].num_int;
	}
	if((rcnt&&ccnt)||ccnt>=2||(!NextColor&&ccnt)||(NextColor&&rcnt)||!TrueFirstBall()){
		for(int i=21;i>15;--i){
			if(ball[i].exit&&!LastCond[i]){
				if(maxp<ball[i].num_int) maxp=ball[i].num_int;
				ResetColorBall(i);
			}
			if(i==FirstBall&&maxp<ball[i].num_int) maxp=ball[i].num_int;
		}
		RuleMsg=maxp;
		Score[Player=!Player]+=maxp;
		return;
	}else if(rcnt||ccnt){
		if(NextColor){
			Score[Player]+=ball[FirstBall].num_int;
			if(!LastPhase) ResetColorBall(FirstBall);
		}
		else Score[Player]+=rcnt;
		NextColor=!NextColor;
		return;
	}
	Player=!Player;
}

static void CheckNextBall(){
	int InRed=0;
	for(int i=1;i<16;++i) InRed+=ball[i].exit;
	if(InRed==15) for(int i=16;i<22;++i) if(!ball[i].exit){
		NextColor=1;
		LastPhase=i;
		break;
	}
}

static void TimerEvent(int event){
	if(event==1){
		DisplayClear();
		if(!SetMode) CheckCollide();
		if(StillMoving()) PREClicked=1;
		else if(!Checked){
			RuleMsg=0;
			CheckStatus();
			CheckNextBall();
			FirstBall=0;
			Checked=1;
			if(PREClicked) Clicked=1;
		}
		DrawAll();
	}
}

static void MouseEvent(int x,int y,int button,int event){
	mx=ScaleXInches(x);
	my=ScaleYInches(y);
	uiGetMouse(x,y,button,event);
	if(event==BUTTON_UP&&!StillMoving()){
		if(SetMode){
			ball[0].x=mx,ball[0].y=my;
			if(ball[0].x>TableCenterX-TableWidth/4
				||CoorDistance(TableCenterX-TableWidth/4,TableCenterY,ball[0].x,ball[0].y)>TableHeight/4) return;
			for(int i=1;i<22;++i) if(CoorDistance(ball[0].x,ball[0].y,ball[i].x,ball[i].y)<2*BallRadius) return;
			ball[0].exit=0;
			SetMode=0;
		}else{
			double GainSpeed=25*(LastForceY-(TableCenterY-ForceBoxHeight/2))/ForceBoxHeight;
			for(int i=0;i<22;++i) LastCond[i]=ball[i].exit;
			SaveStep(GainSpeed,CueAngle,Player);
			SetSpeed(&ball[0],GainSpeed,CueAngle);
			Checked=0;
		}
	}
}

void StartMode2(){
	for(int i=0;i<22;++i){
		ball[i].x=InitCoor[i][0];
		ball[i].y=InitCoor[i][1];
	}
	
	SetBalls(ball,22);
	InitSave(ball,22);
	
	DrawAll();
	SetMode=1;
	Checked=1;
	PrintStatus();
	
	SetTime(TimeItv*0.001);
	startTimer(1,TimeItv);
	registerTimerEvent(TimerEvent);
	registerMouseEvent(MouseEvent);
}