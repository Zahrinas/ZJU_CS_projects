#include"graphics.h"
#include"angle.h"

#define Length (0.8)

void PrintScale();
void PrintPiece();

void Main(){
	InitGraphics();
	SetPenColor("green");
	PrintScale();
}
void PrintScale(){
	MovePen(GetWindowWidth()*0.5,GetWindowHeight()*0.5);
	turn(90);
	for(int i=0;i<6;++i) PrintPiece();
	turn(20);
	for(int i=0;i<6;++i) PrintPiece();
	turn(20);
	for(int i=0;i<6;++i) PrintPiece();
}
void PrintPiece(){
	forward(Length);
	turn(60),forward(Length);
	turn(60),forward(Length);
	turn(60),forward(Length);
	turn(60),forward(Length);
	turn(60),forward(Length);
}