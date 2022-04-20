/*
	File: 		mode1.c
	Edition: 	2021/5/31
	
	15 Balls Rule
*/

#include<math.h>
#include<stdlib.h>
#include<random.h>

#include"imgui.h"
#include"graphics.h"
#include"extgraph.h"

#include"ui.h"
#include"draw.h"
#include"types.h"
#include"video.h"
#include"physics.h"

static int CheckExit();
static int CheckFirstCollision();
static int GameOver();
static void EndGame();
static void DealBreakRule(int);
static void PrintStatus();

typedef struct Player{
	int num;
	int color;
}Player;

typedef struct ExitBall{
	int num;
	int cue;
	struct ExitBall *next;
}ExitBall;

static double V_MAX=20;
static int TimeItv=20;
static double mx,my;
static double CueAngle=180;
static double LastForceY=TableCenterY;
static int ResetMode=0;
static Ball Balls[16];
static int UserBoxMode=0;
static Player player[2];
static int PlayerNum;
static int Continue=0;
static int FirstCollision=1;
static ExitBall *head=NULL,*p1=NULL,*p2=NULL,*lastp=NULL;
static int CueNum=0; 
static int BreakRule=0;
static char str1_1[100],str1_2[100],str1_3[100],str2_1[100],str2_2[100],str3_1[100],str3_2[100];
static int End=0;

void InitDraw(){
	int rand,used[16]={0}; 
	double BallCoordinate[16][2]={
	{TableCenterX-TableWidth/4,TableCenterY},
	{TableCenterX+TableWidth/4,TableCenterY},
	{TableCenterX+TableWidth/4+sqrt(3)*BallRadius,TableCenterY+BallRadius},
	{TableCenterX+TableWidth/4+sqrt(3)*BallRadius,TableCenterY-BallRadius},
	{TableCenterX+TableWidth/4+2*sqrt(3)*BallRadius,TableCenterY-2*BallRadius},
	{TableCenterX+TableWidth/4+3*sqrt(3)*BallRadius,TableCenterY+3*BallRadius},
	{TableCenterX+TableWidth/4+2*sqrt(3)*BallRadius,TableCenterY+2*BallRadius},
	{TableCenterX+TableWidth/4+2*sqrt(3)*BallRadius,TableCenterY},
	{TableCenterX+TableWidth/4+3*sqrt(3)*BallRadius,TableCenterY+1*BallRadius},
	{TableCenterX+TableWidth/4+3*sqrt(3)*BallRadius,TableCenterY-1*BallRadius},
	{TableCenterX+TableWidth/4+3*sqrt(3)*BallRadius,TableCenterY-3*BallRadius},
	{TableCenterX+TableWidth/4+4*sqrt(3)*BallRadius,TableCenterY+4*BallRadius},
	{TableCenterX+TableWidth/4+4*sqrt(3)*BallRadius,TableCenterY+2*BallRadius},
	{TableCenterX+TableWidth/4+4*sqrt(3)*BallRadius,TableCenterY},
	{TableCenterX+TableWidth/4+4*sqrt(3)*BallRadius,TableCenterY-2*BallRadius},
	{TableCenterX+TableWidth/4+4*sqrt(3)*BallRadius,TableCenterY-4*BallRadius}};
	Balls[0]=(Ball){Pure,0," ","White","White",0,0,0,0,0};
	Balls[1]=(Ball){Pure,1,"1","Yellow","Black",0,0,0,0,0};
	Balls[2]=(Ball){Pure,2,"2","Blue","White",0,0,0,0,0};
	Balls[3]=(Ball){Pure,3,"3","Red","Black",0,0,0,0,0};
	Balls[4]=(Ball){Pure,4,"4","Violet","Black",0,0,0,0,0};
	Balls[5]=(Ball){Pure,5,"5","Orange","Black",0,0,0,0,0};
	Balls[6]=(Ball){Pure,6,"6","Green","Black",0,0,0,0,0};
	Balls[7]=(Ball){Pure,7,"7","Brown","White",0,0,0,0,0};
	Balls[8]=(Ball){Pure,8,"8","Black","White",0,0,0,0,0};
	Balls[9]=(Ball){Mixed,9,"9","Yellow","Black",0,0,0,0,0};
	Balls[10]=(Ball){Mixed,10,"10","Blue","Black",0,0,0,0,0};
	Balls[11]=(Ball){Mixed,11,"11","Red","Black",0,0,0,0,0};
	Balls[12]=(Ball){Mixed,12,"12","Violet","Black",0,0,0,0,0};
	Balls[13]=(Ball){Mixed,13,"13","Orange","Black",0,0,0,0,0};
	Balls[14]=(Ball){Mixed,14,"14","Green","Black",0,0,0,0,0};
	Balls[15]=(Ball){Mixed,15,"15","Brown","Black",0,0,0,0,0};
	
	rand=(int)RandomInteger(7,9);
	Balls[8].x=BallCoordinate[rand][0];
	Balls[8].y=BallCoordinate[rand][1];
	used[rand]=1;
	
	Balls[0].x=BallCoordinate[0][0];
	Balls[0].y=BallCoordinate[0][1];
	used[0]=1;
	
	
	for(int i=1;i<16;i++)
	{
		/**/ 
		if(i==8) continue;
		do{
			rand=(int)RandomInteger(1,15);
		}while(used[rand]==1);
		used[rand]=1;
		/**/
		Balls[i].x=BallCoordinate[rand][0];
		Balls[i].y=BallCoordinate[rand][1];
	}

	CueAngle=180;
}

static void DrawAll(){
	if(button(GenUIID(114514),1,1,2,1,"退出")) exit(0);
	
	DrawTable();
	DrawUserBox(UserBoxMode,Balls,PlayerNum); 
	DrawMsgBox1();
	DrawMsgBox2();
	if(Balls[0].exit){
		ResetMode=1;
	}
	for(int i=0;i<16;++i) if(!Balls[i].exit) DrawBall(Balls[i]);
	if(ResetMode){
		Balls[0].x=mx,Balls[0].y=my;
		Balls[0].vx=0,Balls[0].vy=0;
		DrawBall(Balls[0]);
	}
	if(!StillMoving()&&!End){
		if(!ResetMode){
			CueAngle=asin((my-Balls[0].y)/sqrt((my-Balls[0].y)*(my-Balls[0].y)+(mx-Balls[0].x)*(mx-Balls[0].x)));
			if(mx<Balls[0].x) CueAngle=M_PI-CueAngle;
			DrawCue(Balls[0].x,Balls[0].y,CueAngle*180/M_PI);
			
			LastForceY+=ForceBoxHeight*TimeItv*0.001/1.5;//1.5s
			if(LastForceY>ForceBoxY+ForceBoxHeight) LastForceY=ForceBoxY;
			DrawForceBox(LastForceY);
		}
	}else LastForceY=TableCenterY;
}

static void TimerEvent(int event){
	int exitball;
	int rulenum=0; 
	static int firstball=0;
	static int laststate=0;
	static int sign=0;
	static int flag=0;
	if(laststate==1) sign=1;
	
	if(event==1){
		DisplayClear();
		if(FirstCollision&&UserBoxMode){
			firstball=CheckFirstCollision();
			//printf("%d\n",firstball);
		} 
		
		if(FirstCollision&&firstball)
		{
			FirstCollision=0;
		}
		if(!ResetMode||StillMoving())
		CheckCollide();
		if((exitball=CheckExit())!=-1)
		{
			if(UserBoxMode==0){
				head->num=exitball;
				head->cue=CueNum;
				p1=head;
				lastp=head;
				flag=1;
				player[PlayerNum].color=Balls[exitball].type;
				if(player[1].color==Pure){
					player[0].color=Mixed;
					UserBoxMode=1;
				}
				if(player[1].color==Mixed){
					player[0].color=Pure;
					UserBoxMode=2;
				}
				if(player[0].color==Pure){
					player[1].color=Mixed;
					UserBoxMode=2;
				}
				if(player[0].color==Mixed){
					player[1].color=Pure;
					UserBoxMode=1;
				}
			}
			
			else{
				p2=(ExitBall*)malloc(sizeof(ExitBall));
				p2->num=exitball;
				p2->cue=CueNum;
				p2->next=NULL;
				p1->next=p2;
				p1=p2;
			}
		}
		
		if(!StillMoving()&&laststate==0&&sign==1)
		{
			if(Balls[8].exit) 
			{
				EndGame();
				WaitForMouseDown();
				End=1;
			}
			if(!StillMoving()&&UserBoxMode){
				lastp=head;
				while(lastp!=NULL&&lastp->cue!=CueNum){
					lastp=lastp->next;
				} 
				if(lastp==NULL) Continue=0;
				else
				while(lastp!=NULL){
					if(Balls[lastp->num].type==player[PlayerNum].color){
						Continue=1;
						break;
					}
					Continue=0;
					lastp=lastp->next;
				}
				if(firstball==8)
				{
					if(!GameOver()) {
						BreakRule=1;
						rulenum=1;
					}
				}
				else
				if(!FirstCollision&&Balls[firstball].type!=player[PlayerNum].color&&!flag){
					BreakRule=1;
					rulenum=2;
				}
				if(FirstCollision==1&&Continue!=1){
					BreakRule=1;
					rulenum=3;
				}
				FirstCollision=1;
				firstball=0;
				if(!BreakRule) {
					sprintf(str2_1,"无犯规");
				}
				if(Continue) sprintf(str2_2,"由%d玩家连续击球",!PlayerNum+1);  
				if(flag) flag=0;
			}
		}
		PrintStatus();
		DrawAll();
		
		if(!StillMoving()&&laststate==0&&sign==1&&Continue==0&&!BreakRule){
			PlayerNum=!PlayerNum;
			sign=0;
		}
		if(!StillMoving()&&BreakRule){
			DealBreakRule(rulenum);
			BreakRule=0;
			sign=0;
		}
	 
		laststate=StillMoving();
	}
}

static void MouseEvent(int x, int y, int button, int event)
{
	static int sign=0;
	mx=ScaleXInches(x);
	my=ScaleYInches(y);
	uiGetMouse(x,y,button,event);
	if(event==BUTTON_UP){
		if(ResetMode){
			sign=0;
			for(int i=1;i<=15;i++)
			{
				if(!Balls[i].exit&&sqrt((Balls[i].x-mx)*(Balls[i].x-mx)+(Balls[i].y-my)*(Balls[i].y-my))<2*BallRadius)
				sign=1;
				if(mx<TableCenterX-TableWidth/2||mx>TableCenterX+TableWidth/2||my>TableCenterY+TableHeight/2||my<TableCenterY-TableHeight/2)
				sign=1;
			}
			if(sign==0)
			{
				ResetMode=0;
				Balls[0].exit=0;
			}
			
		}else if(!StillMoving()){
			SaveStep(V_MAX*(LastForceY-(TableCenterY-ForceBoxHeight/2))/ForceBoxHeight,CueAngle,!PlayerNum);
			SetSpeed(&Balls[0],V_MAX*(LastForceY-(TableCenterY-ForceBoxHeight/2))/ForceBoxHeight,CueAngle);
			CueNum++;
		} 
	}
}

void StartMode1(){
	InitSave(Balls,16);
	
	InitDraw();
	PlayerNum=1;
	player[1].num=1;
	player[1].color=-1;
	player[0].num=0;
	player[0].color=-1;
	sprintf(str2_1,"此处为犯规提示");
	sprintf(str2_2," "); 
	
	head=(ExitBall*)malloc(sizeof(ExitBall)); 
	head->next=NULL;

	SetBalls(Balls,16);
	DrawAll();
	SetTime(TimeItv*0.001);
	startTimer(1,TimeItv);
	registerTimerEvent(TimerEvent);
	registerMouseEvent(MouseEvent);
}

static int CheckExit(){
	static int hasexit[16]={0};
	for(int i=1;i<=15;i++){
		if(Balls[i].exit!=hasexit[i]){
			hasexit[i]=Balls[i].exit;
			return i;
		}
	}
	return -1;
}

static int CheckFirstCollision(){
	if(!UserBoxMode) return 0;
	for(int i=1;i<=15;i++){
		if(Balls[i].exit) continue;
		if(Balls[i].vx!=0||Balls[i].vy!=0) return i;
	}
	return 0;
}

static int GameOver(){
		if(player[PlayerNum].color==Pure){
			for(int i=1;i<=7;i++)
			if(!Balls[i].exit) return 0;
			return 1;
		}
		if(player[PlayerNum].color==Mixed){
			for(int i=9;i<=15;i++)
			if(!Balls[i].exit) return 0;
			return 1;
		}
}

static void EndGame(){
	if(!GameOver) sprintf(str3_1,"%d号玩家胜利",!PlayerNum+1);
	else sprintf(str3_1,"%d号玩家胜利",PlayerNum+1);
	sprintf(str3_2,"按Esc返回菜单");
	DrawAll();
	DrawMsgBox3();
	DrawMsg3("楷体",str3_1,str3_2);
}

static void DealBreakRule(int rulenum){
	switch(rulenum)
	{
		case 1: sprintf(str2_1,"%d号玩家首撞8号球",!PlayerNum+1); break;
		case 2: sprintf(str2_1,"%d号玩家首撞非本色球",!PlayerNum+1); break;
		case 3: sprintf(str2_1,"%d号玩家没撞到任何球",!PlayerNum+1); break;
	}
	sprintf(str2_2,"由%d号玩家发任意球",PlayerNum+1);
	PlayerNum=!PlayerNum;
	ResetMode=1;
}

static void PrintStatus(){
	if(UserBoxMode)
	{
		sprintf(str1_1,"当前球局封闭");
		sprintf(str1_2,"由%d号玩家击球",!PlayerNum+1);
		sprintf(str1_3,"只能击打%s球",player[PlayerNum].color==Pure?"纯色":"花色");
	}
	else
	{
		sprintf(str1_1,"当前球局开放\n");
		sprintf(str1_2,"由%d号玩家击球",!PlayerNum+1);
		sprintf(str1_3," ");
	}
	
	DrawMsg1("楷体",str1_1,str1_2,str1_3);
	DrawMsg2("楷体",str2_1,str2_2);
}
