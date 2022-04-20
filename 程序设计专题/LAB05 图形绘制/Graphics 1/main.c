#include"graphics.h"

#define HouseWidth (2.0)
#define WallWidth (2.0)
#define WindowWidth (0.4)
#define DoorWidth (0.6)
#define TopWidth (0.4)
#define TunWidth (0.2)
#define RoofWidth (2)
#define HouseHeight (4)
#define WallHeight (2)
#define WindowHeight (0.4)
#define DoorHeight (1.6)
#define TopHeight (0.2)
#define TunHeight (0.8)
#define RoofHeight (1.6)
#define RoofSlope (RoofHeight*2/RoofWidth)

void DrawSquare(double,double,double,double);
void DrawHouse(double,double);
void DrawRoof(double,double);
void DrawTun(double,double);

void Main(){
	InitGraphics();
	DrawHouse(GetWindowWidth()/2-HouseWidth/2,GetWindowHeight()/2-HouseHeight/2);
}
void DrawSquare(double x,double y,double dx,double dy){
	MovePen(x,y);
	DrawLine(dx,0);
	DrawLine(0,dy);
	DrawLine(-dx,0);
	DrawLine(0,-dy);
}
void DrawHouse(double x,double y){
	DrawSquare(x,y,WallWidth,WallHeight);
	DrawSquare(x+HouseWidth*0.2,y+HouseHeight*0.3,WindowWidth,WindowHeight);
	DrawSquare(x+HouseWidth*0.5,y,DoorWidth,DoorHeight);
	DrawRoof(x,y+HouseHeight*0.5);
}
void DrawRoof(double x,double y){
	MovePen(x,y);
	DrawLine(RoofWidth*0.5,RoofHeight);
	DrawLine(RoofWidth*0.5,-RoofHeight);
	DrawTun(x+RoofWidth*0.1,y+RoofHeight*0.1*2);
}
void DrawTun(double x,double y){
	MovePen(x,y);
	DrawLine(0,TunHeight);
	DrawSquare(x-TunWidth*0.5,y+TunHeight,TopWidth,TopHeight);
	MovePen(x+TunWidth,y+TunHeight);
	DrawLine(0,-(TunHeight-TunWidth*RoofSlope));
}