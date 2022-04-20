#include<stdio.h>

#include"graphics.h"
#include"extgraph.h"

#include"ui.h"
#include"draw.h"
#include"imgui.h"
#include"video.h"
#include"types.h"
#include"physics.h"

static FILE* file;
static Ball* ball;
static int bsize;
static int Avail;
static int started;
static int player;
static int TimeItv=20;
static double CueAngle;
static double Speed;
static char FileName[30];
static char buf1[30];

static void GetFileName(){
	OpenConsole();
	printf("请输入要读取的录像文件名：（不需要输入路径）\n");
	scanf("%s",buf1);
	sprintf(FileName,"./gamedata/%s",buf1);
	if(!(file=fopen(FileName,"r"))){
		printf("文件打开失败，请核对文件名。\n");
		GetFileName();
	}
	else CloseConsole();
}

void InitSave(Ball* Balls,int BallCnt){
	file=fopen("./gamedata/newrecord","w");
	ball=Balls,bsize=BallCnt;
	fprintf(file,"%d\n\n",bsize);
}

static void strread(char* dest){
	char ch=fgetc(file);
	int pos=0;
	while(ch!=','){
		dest[pos++]=ch;
		ch=fgetc(file);
	}
	dest[pos]=0;
}

void SaveStep(double Speed,double CueAngle,int p){
	for(int i=0;i<bsize;++i){
		fprintf(file,"%d,",ball[i].type);
		fprintf(file,"%d,",ball[i].num_int);
		fprintf(file,"%s,",ball[i].num_str);
		fprintf(file,"%s,",ball[i].color);
		fprintf(file,"%s,",ball[i].textcolor);
		fprintf(file,"%d,",ball[i].exit);
		fprintf(file,"%lf,",ball[i].x);
		fprintf(file,"%lf\n",ball[i].y);
	}
	fprintf(file,"%d\n",p);
	fprintf(file,"%lf,%lf\n\n",CueAngle,Speed);
	fflush(file);
}

static void NextStep(){
	if(feof(file)){
		Avail=0;
		return;
	}
	for(int i=0;i<bsize;++i){
		fscanf(file,"%d,",&ball[i].type);
		fscanf(file,"%d,",&ball[i].num_int);
		strread(ball[i].num_str);
		strread(ball[i].color);
		strread(ball[i].textcolor);
		fscanf(file,"%d,",&ball[i].exit);
		fscanf(file,"%lf,",&ball[i].x);
		fscanf(file,"%lf",&ball[i].y);
		ball[i].vx=ball[i].vy=0;
		if(!ball[i].exit) DrawBall(ball[i]);
	}
	fscanf(file,"%d",&player);
	fscanf(file,"%lf,%lf\n\n",&CueAngle,&Speed);
}

static void TimerEvent(int event){
	DisplayClear();
	SetFont("微软雅黑");
	SetPointSize(20);
	if(button(GenUIID(123),1,1,2,1,"Main Menu")) InitUI();
	if(!Avail){
		DrawMsg2("微软雅黑","录像已结束","");
		return;
	}
	sprintf(buf1,"玩家%d的行动",player+1);
	DrawMsg3("微软雅黑",buf1,"");
	if(!started) DrawCue(ball[0].x,ball[0].y,CueAngle*180/M_PI);
	if(button(GenUIID(124),1,3,2,1,"Next Step")&&!StillMoving()){
		started=1;
		SetSpeed(&ball[0],Speed,CueAngle);
	}
	if(started&&!StillMoving()){
		NextStep();
		started=0;
	}
	if(Avail){
		CheckCollide();
		DrawTable();
		for(int i=0;i<22;++i) if(!ball[i].exit) DrawBall(ball[i]);
	}
}

static void MouseEvent(int x,int y,int button,int event){
	uiGetMouse(x,y,button,event);
}

void InitRead(){
	DisplayClear();
	GetFileName();
	file=fopen(FileName,"r");
	fscanf(file,"%d",&bsize);
	ball=malloc(sizeof(Ball)*bsize);
	for(int i=0;i<bsize;++i){
		ball[i].num_str=malloc(sizeof(char)*4);
		ball[i].color=malloc(sizeof(char)*8);
		ball[i].textcolor=malloc(sizeof(char)*8);
	}
	SetBalls(ball,bsize);
	SetTime(TimeItv*0.001);
	startTimer(1,TimeItv);
	registerTimerEvent(TimerEvent);
	registerMouseEvent(MouseEvent);
	Avail=1;
	NextStep();
}