#include<math.h>
#include<string.h>

#include"extgraph.h"

#include"draw.h"
#include"types.h"
#include"physics.h"

static double Angle=0;

static void Forward(double distance)
{
	DrawLine(distance*cos(Angle*M_PI/180),distance*sin(Angle*M_PI/180));
}

static void Turn(double angle)
{
	Angle=Angle+angle;
}

static void Move( double distance)
{
	double x,y;
	x=GetCurrentX();
	y=GetCurrentY();
	MovePen(x+distance*cos(Angle*M_PI/180),y+distance*sin(Angle*M_PI/180));
}

void DrawBall(struct Ball ball)
{
	SetPenSize(2);
	double FilledRadius=BallRadius-0.02;
	if(ball.type==Pure) //纯色球 
	{
		MovePen(ball.x+FilledRadius,ball.y);
		SetPenColor(ball.color);
		StartFilledRegion(1);
		DrawArc(FilledRadius,0,360);
		EndFilledRegion();
		SetPenColor("Black");
		MovePen(ball.x+BallRadius,ball.y);
		DrawArc(BallRadius,0,360);
		MovePen(ball.x-0.08,ball.y-0.1);
		SetPenSize(BallNumSize);
		SetFont("Elephant");
		SetPointSize(18);
		SetPenColor(ball.textcolor);
		if(strlen(ball.num_str)>1)
		MovePen(GetCurrentX()-TextStringWidth("1")/2,GetCurrentY());
		DrawTextString(ball.num_str);
		SetFont("Default");
		SetPenColor("Black");
		SetPointSize(DefaultPointSize);	
	}
	if(ball.type==Mixed) //花球 or 混色球 
	{
		MovePen(ball.x+FilledRadius,ball.y);
		SetPenColor(ball.color);
		StartFilledRegion(1);
		DrawLine(-1.5*FilledRadius,sqrt(3)/2*FilledRadius);
		DrawArc(FilledRadius,120,60);
		DrawLine(1.5*FilledRadius,-sqrt(3)/2*FilledRadius);
		DrawArc(FilledRadius,-60,60);
		EndFilledRegion();
		SetPenColor("Black");
		MovePen(ball.x+BallRadius,ball.y);
		DrawArc(BallRadius,0,360);
		MovePen(ball.x-0.08,ball.y-0.1);
		SetPenSize(BallNumSize);
		SetFont("Elephant");
		SetPointSize(18);
		SetPenColor(ball.textcolor);
		if(strlen(ball.num_str)>1)
		MovePen(GetCurrentX()-TextStringWidth("1")/2,GetCurrentY());
		DrawTextString(ball.num_str);
		SetFont("Default");
		SetPenColor("Black");
		SetPointSize(DefaultPointSize);	
	}
	
}

void DrawUserBall(double x,double y,int num,Ball *Balls)
{
	SetPenSize(2);
	double FilledRadius=BallRadius-0.03;
	if(Balls[num].type==Pure) //纯色球 
	{
		MovePen(x+FilledRadius,y);
		SetPenColor(Balls[num].color);
		StartFilledRegion(1);
		DrawArc(FilledRadius,0,360);
		EndFilledRegion();
		SetPenColor("Black");
		MovePen(x+BallRadius,y);
		DrawArc(BallRadius,0,360);
		MovePen(x-0.08,y-0.1);
		SetPenSize(BallNumSize);
		SetFont("Elephant");
		SetPointSize(18);
		SetPenColor(Balls[num].textcolor);
		if(strlen(Balls[num].num_str)>1)
		MovePen(GetCurrentX()-TextStringWidth("1")/2,GetCurrentY());
		DrawTextString(Balls[num].num_str);
		SetFont("Default");
		SetPenColor("Black");
		SetPointSize(DefaultPointSize);	
	}
	if(Balls[num].type==Mixed) //花球 or 混色球 
	{
		MovePen(x+FilledRadius,y);
		SetPenColor(Balls[num].color);
		StartFilledRegion(1);
		DrawLine(-1.5*FilledRadius,sqrt(3)/2*FilledRadius);
		DrawArc(FilledRadius,120,60);
		DrawLine(1.5*FilledRadius,-sqrt(3)/2*FilledRadius);
		DrawArc(FilledRadius,-60,60);
		EndFilledRegion();
		SetPenColor("Black");
		MovePen(x+BallRadius,y);
		DrawArc(BallRadius,0,360);
		MovePen(x-0.08,y-0.1);
		SetPenSize(BallNumSize);
		SetFont("Elephant");
		SetPointSize(18);
		SetPenColor(Balls[num].textcolor);
		if(strlen(Balls[num].num_str)>1)
		MovePen(GetCurrentX()-TextStringWidth("1")/2,GetCurrentY());
		DrawTextString(Balls[num].num_str);
		SetFont("Default");
		SetPenColor("Black");
		SetPointSize(DefaultPointSize);	
	}
	
}

void DrawTable()
{
	double lx,ly;
	lx=TableCenterX;
	ly=TableCenterY;
	Angle=0;
	SetPenColor("Black"); /*设置画笔颜色*/
    SetPenSize(3);  /*设置画笔粗细*/
	
	//从左下角开始画外桌 
	MovePen(lx-TableWidth/2-sqrt(2)/2*CornerHoleRadius,ly-TableHeight/2+sqrt(2)/2*CornerHoleRadius);
	DrawArc(CornerHoleRadius,135,180);
	DrawLine(TableWidth/2-sqrt(2)/2*CornerHoleRadius-MarginHoleRadius,0);
	DrawArc(MarginHoleRadius,180,180);
	DrawLine(TableWidth/2-sqrt(2)/2*CornerHoleRadius-MarginHoleRadius,0);
	DrawArc(CornerHoleRadius,180+45,180);
	DrawLine(0,TableHeight-2*CornerHoleRadius*sqrt(2)/2);
	DrawArc(CornerHoleRadius,-45,180);
	DrawLine(-TableWidth/2+sqrt(2)/2*CornerHoleRadius+MarginHoleRadius,0);
	DrawArc(MarginHoleRadius,0,180);
	DrawLine(-TableWidth/2+sqrt(2)/2*CornerHoleRadius+MarginHoleRadius,0);
	DrawArc(CornerHoleRadius,45,180);
	DrawLine(0,-TableHeight+2*CornerHoleRadius*sqrt(2)/2);
	
	//再接着画内桌 
	Turn(45);
	Forward(CornerHoleRadius);
	Turn(45);
	Forward(TableHeight-CornerHoleRadius*2*sqrt(2));
	Turn(45);
	Forward(CornerHoleRadius);
	Turn(-90);
	Move(2*CornerHoleRadius);
	Turn(-90);
	Forward(CornerHoleRadius);
	Turn(45);
	Forward(TableWidth/2-sqrt(2)*CornerHoleRadius-MarginHoleRadius-cos(75*M_PI/180)*sqrt(2)/2*CornerHoleRadius);
	Turn(75);
	Forward(sqrt(2)/2*CornerHoleRadius);
	Turn(-75);
	Move(2*MarginHoleRadius);
	Turn(-75);
	Forward(sqrt(2)/2*CornerHoleRadius);
	Turn(75);
	Forward(TableWidth/2-sqrt(2)*CornerHoleRadius-MarginHoleRadius-cos(75*M_PI/180)*sqrt(2)/2*CornerHoleRadius);
	Turn(45);
	Forward(CornerHoleRadius);
	Turn(-90);
	Move(2*CornerHoleRadius);
	Turn(-90);
	Forward(CornerHoleRadius);
	Turn(45);
	Forward(TableHeight-CornerHoleRadius*4*sqrt(2)/2);
	Turn(45);
	Forward(CornerHoleRadius);
	Turn(-90);
	Move(2*CornerHoleRadius);
	Turn(-90);
	Forward(CornerHoleRadius);
	Turn(45);
	Forward(TableWidth/2-sqrt(2)*CornerHoleRadius-MarginHoleRadius-cos(75*M_PI/180)*sqrt(2)/2*CornerHoleRadius);
	Turn(75);
	Forward(sqrt(2)/2*CornerHoleRadius);
	Turn(-75);
	Move(2*MarginHoleRadius);
	Turn(-75);
	Forward(sqrt(2)/2*CornerHoleRadius);
	Turn(75);
	Forward(TableWidth/2-sqrt(2)*CornerHoleRadius-MarginHoleRadius-cos(75*M_PI/180)*sqrt(2)/2*CornerHoleRadius);
	Turn(45);
	Forward(CornerHoleRadius); 
	
	MovePen(lx+TableWidth/2+MarginWidth+sqrt(2)/2*CornerHoleRadius,ly+TableHeight/2-sqrt(2)/2*CornerHoleRadius);
	DrawLine(0,sqrt(2)/2*CornerHoleRadius);
	DrawArc(MarginWidth+sqrt(2)/2*CornerHoleRadius,0,90);
	DrawLine(-TableWidth,0);
	DrawArc(MarginWidth+sqrt(2)/2*CornerHoleRadius,90,90);
	DrawLine(0,-TableHeight);
	DrawArc(MarginWidth+sqrt(2)/2*CornerHoleRadius,180,90);
	DrawLine(TableWidth,0);
	DrawArc(MarginWidth+sqrt(2)/2*CornerHoleRadius,270,90);
	DrawLine(0,TableHeight);
	
	MovePen(lx+TableWidth/2+0.1-CornerArcRadius*cos(5*M_PI/180),ly+TableHeight/2+0.1-CornerArcRadius*sin(5*M_PI/180));
	DrawArc(CornerArcRadius,180+5,80);
	MovePen(lx-TableWidth/2-0.1+CornerArcRadius*cos(5*M_PI/180),ly-TableHeight/2-0.1+CornerArcRadius*sin(5*M_PI/180));
	DrawArc(CornerArcRadius,5,80);
	MovePen(lx+TableWidth/2+0.1-CornerArcRadius*sin(5*M_PI/180),ly-TableHeight/2-0.1+CornerArcRadius*cos(5*M_PI/180));
	DrawArc(CornerArcRadius,90+5,80);
	MovePen(lx-TableWidth/2-0.1+CornerArcRadius*sin(5*M_PI/180),ly+TableHeight/2+0.1-CornerArcRadius*cos(5*M_PI/180));
	DrawArc(CornerArcRadius,270+5,80);
	
	MovePen(lx-MarginArcRadius*cos(40*M_PI/180),ly+0.45+TableHeight/2-MarginArcRadius*sin(40*M_PI/180));
	DrawArc(MarginArcRadius,220,100);
	MovePen(lx+MarginArcRadius*cos(40*M_PI/180),ly-0.45-TableHeight/2+MarginArcRadius*sin(40*M_PI/180));
	DrawArc(MarginArcRadius,40,100);
	Angle=0;
	
	//开球线 
	MovePen(lx-TableWidth/4,ly+TableHeight/2);
	SetPenSize(1);
	DrawLine(0,-TableHeight);
	MovePen(lx-TableWidth/4,ly+0.05);
	DrawArc(0.05,90,360);
	MovePen(lx-TableWidth/4,ly+TableHeight/4);
	DrawArc(TableHeight/4,90,180);
	
	//中点圆
	MovePen(lx,ly+0.05);
	DrawArc(0.05,90,360);
}

void DrawCue(double x,double y,double angle)
{
	SetPenSize(2);
	SetPenColor("Black");
	MovePen(x,y);
	Angle=angle;
	Move(2*BallRadius);
	
	Turn(-90);
	Move(CueWidth/2);
	Turn(90);
	Forward(CueLenth);
	Turn(90);
	Forward(CueWidth);
	Turn(90);
	Forward(CueLenth);
	
	DrawArc(CueWidth/2,angle+90,180);
	Angle=angle;
	Move(CueHeadLenth);
	StartFilledRegion(1);
	Turn(90);
	Forward(CueWidth);
	Turn(-90);
	Forward(CueBlackLenth);
	Turn(-90);
	Forward(CueWidth);
	Turn(-90);
	Forward(CueBlackLenth);
	EndFilledRegion();
	
	SetPenColor("CueBrown1");
	Turn(180);
	Move(CueBlackLenth);
	StartFilledRegion(0.6);
	Forward((CueLenth-CueHeadLenth)*2/3);
	Turn(90);
	Forward(CueWidth);
	Turn(90);
	Forward((CueLenth-CueHeadLenth)*2/3);
	Turn(90);
	Forward(CueWidth);
	EndFilledRegion();
	SetPenColor("Black");
	
	SetPenColor("CueBrown2");
	Turn(90);
	Move((CueLenth-CueHeadLenth)*2/3+CueHeadLenth);
	StartFilledRegion(0.8);
	Forward((CueLenth-CueHeadLenth)/3-CueHeadLenth);
	Turn(90);
	Forward(CueWidth);
	Turn(90);
	Forward((CueLenth-CueHeadLenth)/3-CueHeadLenth);
	Turn(90);
	Forward(CueWidth);
	EndFilledRegion();
	SetPenColor("Black");
}

void DrawBar(double a,double b)
{
	MovePen(TableCenterX-TableWidth,TableCenterY+a*ForceBoxHeight);
	DrawLine(-ForceBoxWidth/b,0);
	MovePen(TableCenterX-TableWidth-ForceBoxWidth,TableCenterY+a*ForceBoxHeight);
	DrawLine(ForceBoxWidth/b,0);
}

void DrawForceBox(double y)
{
	SetPenSize(2);
	SetPenColor("Black");
	MovePen(TableCenterX-TableWidth,TableCenterY);
	DrawLine(0,ForceBoxHeight/2);
	DrawLine(-ForceBoxWidth,0);
	DrawLine(0,-ForceBoxHeight);
	DrawLine(ForceBoxWidth,0);
	DrawLine(0,ForceBoxHeight/2);
	
	for(int i=-23;i<=23;i+=2)
	DrawBar(i/50.0,4);
	
	SetPenColor("Red");
	for(int i=-3;i<=3;i+=2)
	DrawBar(i/10.0,3);
	SetPenColor("Black");
	
	SetPenColor("Green");
	MovePen(TableCenterX-TableWidth,y);
	DrawLine(-ForceBoxWidth,0);
	SetPenColor("Black");
	
	SetPenColor("Red");
	SetFont("Elephant");
	MovePen(TableCenterX-TableWidth-ForceBoxWidth+0.05,TableCenterY-ForceBoxHeight/2-0.25);
	DrawTextString("力度MIN");
	MovePen(TableCenterX-TableWidth-ForceBoxWidth+0.05,TableCenterY+ForceBoxHeight/2+0.12);
	DrawTextString("力度MAX");
	SetPenColor("Black");
	SetFont("Default");
}

void DrawUserBox(int mode, Ball* Balls, int PlayerNum)
{
	static double ballcoor[16][2]={{0,0}};
	static int sign=0;
	if(sign==0)
	{
		for(int i=1;i<=15;i++)
		{
			if(i<=7)
			ballcoor[i][0]=UserBoxX-(17.5-2.5*(i-1))*BallRadius-3*BallRadius;
			else
			if(i>=9)
			ballcoor[i][0]=UserBoxX-(17.5-2.5*(i-1))*BallRadius+3*BallRadius;
			else
			ballcoor[i][0]=UserBoxX-(17.5-2.5*(i-1))*BallRadius;
			ballcoor[i][1]=UserBoxY-0.5;
		}
		sign=1;
	}
	MovePen(UserBoxX-UserBoxWidth/2,UserBoxY-UserBoxHeight/2);
	SetPenColor("Black");
	SetPenSize(2);
	DrawLine(UserBoxWidth,0);
	DrawLine(0,UserBoxHeight);
	DrawLine(-UserBoxWidth,0);
	DrawLine(0,-UserBoxHeight);
	
	switch(mode)
	{
		case 0:
			{
				for(int i=1;i<=15;i++)
				{
					MovePen(ballcoor[i][0],ballcoor[i][1]+BallRadius);
					DrawArc(BallRadius,-90,360);
				}
				MovePen(UserBoxX-UserBoxWidth/2+0.5,UserBoxY-0.16);
				SetPointSize(32);
				SetFont("Elephant");
				if(PlayerNum==1){
					SetPenColor("Red");
					DrawTextString("P1");
					SetPenColor("Black");
					MovePen(UserBoxX+UserBoxWidth/2-0.5-TextStringWidth("P2"),UserBoxY-0.16);
					DrawTextString("P2");
				}
				if(PlayerNum==0){
					DrawTextString("P1");
					MovePen(UserBoxX+UserBoxWidth/2-0.5-TextStringWidth("P2"),UserBoxY-0.16);
					SetPenColor("Red");
					DrawTextString("P2");
					SetPenColor("Black");
				}
				SetPointSize(18);
				MovePen(UserBoxX-3*BallRadius,UserBoxY-UserBoxHeight/2);
				DrawLine(0,UserBoxHeight);
				MovePen(UserBoxX+3*BallRadius,UserBoxY-UserBoxHeight/2);
				DrawLine(0,UserBoxHeight);
			}break;
		case 1:
			{
				MovePen(UserBoxX-UserBoxWidth/2+0.5,UserBoxY-0.16);
				SetPointSize(32);
				SetFont("Elephant");
				if(PlayerNum==1){
					SetPenColor("Red");
					DrawTextString("P1");
					SetPenColor("Black");
					MovePen(UserBoxX+UserBoxWidth/2-0.5-TextStringWidth("P2"),UserBoxY-0.16);
					DrawTextString("P2");
				}
				if(PlayerNum==0){
					DrawTextString("P1");
					MovePen(UserBoxX+UserBoxWidth/2-0.5-TextStringWidth("P2"),UserBoxY-0.16);
					SetPenColor("Red");
					DrawTextString("P2");
					SetPenColor("Black");
				}
				SetPointSize(18);
				MovePen(UserBoxX-3*BallRadius,UserBoxY-UserBoxHeight/2);
				DrawLine(0,UserBoxHeight);
				MovePen(UserBoxX+3*BallRadius,UserBoxY-UserBoxHeight/2);
				DrawLine(0,UserBoxHeight);
				for(int i=1;i<=15;i++)
				{
					if(!Balls[i].exit)
					DrawUserBall(ballcoor[i][0],ballcoor[i][1]+2*BallRadius,i,Balls);
				}
			}break;
		case 2:
			{
				MovePen(UserBoxX-UserBoxWidth/2+0.5,UserBoxY-0.16);
				SetPointSize(32);
				SetFont("Elephant");
				if(PlayerNum==1){
					SetPenColor("Red");
					DrawTextString("P1");
					SetPenColor("Black");
					MovePen(UserBoxX+UserBoxWidth/2-0.5-TextStringWidth("P2"),UserBoxY-0.16);
					DrawTextString("P2");
				}
				if(PlayerNum==0){
					DrawTextString("P1");
					MovePen(UserBoxX+UserBoxWidth/2-0.5-TextStringWidth("P2"),UserBoxY-0.16);
					SetPenColor("Red");
					DrawTextString("P2");
					SetPenColor("Black");
				}
				SetPointSize(18);
				MovePen(UserBoxX-3*BallRadius,UserBoxY-UserBoxHeight/2);
				DrawLine(0,UserBoxHeight);
				MovePen(UserBoxX+3*BallRadius,UserBoxY-UserBoxHeight/2);
				DrawLine(0,UserBoxHeight);
				for(int i=1;i<=15;i++)
				{
					if(!Balls[16-i].exit)
					DrawUserBall(ballcoor[i][0],ballcoor[i][1]+2*BallRadius,16-i,Balls);
				}
			}break;
	}
}

void DrawMsgBox1()
{
	MovePen(TableCenterX-TableWidth/2-5,TableCenterY+TableHeight/2);
	SetPenSize(2);
	SetPenColor("Black");
	DrawLine(3.0,0);
	DrawLine(0,-1.5);
	DrawLine(-3,0);
	DrawLine(0,1.5);
}

void DrawMsg1(char* Font,char *str1_1,char *str1_2,char *str1_3)
{
	SetPointSize(25);
	SetFont(Font);
	MovePen(TableCenterX-TableWidth/2-4.5,TableCenterY+TableHeight/2-0.5);
	DrawTextString(str1_1);
	MovePen(TableCenterX-TableWidth/2-4.6,TableCenterY+TableHeight/2-0.5-GetFontHeight());
	DrawTextString(str1_2);
	MovePen(TableCenterX-TableWidth/2-4.7,TableCenterY+TableHeight/2-0.5-2*GetFontHeight());
	DrawTextString(str1_3);
}

void DrawMsgBox2()
{
	MovePen(TableCenterX-TableWidth/2-5,TableCenterY+TableHeight/2-2);
	SetPenSize(2);
	SetPenColor("Black");
	DrawLine(3.0,0);
	DrawLine(0,-1.2);
	DrawLine(-3,0);
	DrawLine(0,1.2);
}

void DrawMsg2(char* Font,char *str2_1,char *str2_2)
{
	SetPointSize(25);
	SetFont(Font);
	MovePen(TableCenterX-TableWidth/2-4.9,TableCenterY+TableHeight/2-2.5);
	DrawTextString(str2_1);
	MovePen(TableCenterX-TableWidth/2-4.8,TableCenterY+TableHeight/2-2.5-GetFontHeight());
	DrawTextString(str2_2);
}

void DrawMsgBox3()
{
	MovePen(TableCenterX-TableWidth/2-5,TableCenterY+TableHeight/2-3.7);
	SetPenSize(2);
	SetPenColor("Red");
	DrawLine(3.0,0);
	DrawLine(0,-1.2);
	DrawLine(-3,0);
	DrawLine(0,1.2);
}

void DrawMsg3(char* Font,char *str3_1,char *str3_2)
{
	SetPointSize(25);
	SetFont(Font);
	MovePen(TableCenterX-TableWidth/2-4.5,TableCenterY+TableHeight/2-4);
	DrawTextString(str3_1);
	MovePen(TableCenterX-TableWidth/2-4.5,TableCenterY+TableHeight/2-4-GetFontHeight());
	DrawTextString(str3_2);

}
