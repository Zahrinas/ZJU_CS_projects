#include"graphics.h"
#include"extgraph.h"

void MouseWork(int,int,int,int);

void Main(){
	InitGraphics();
	registerMouseEvent(MouseWork);
}
//Abandoned
/*void MouseWork(int x,int y,int button,int event){
	static int Drawing=0;
	double dx=ScaleXInches(x);
	double dy=ScaleYInches(y);
	switch(event){
		case BUTTON_DOWN:{
			if(button==LEFT_BUTTON) Drawing=1;
			break;
		}
		case BUTTON_UP:{
			if(button==LEFT_BUTTON) Drawing=0;
			break;
		}
		case MOUSEMOVE:{
			if(Drawing){
				MovePen(dx,dy);
				DrawArc(1e-2,0,360);
			}
			break;
		}
	}
}*/
void MouseWork(int x,int y,int button,int event){
	static int Drawing=0;
	static double prex=-1,prey=-1;
	double dx=ScaleXInches(x);
	double dy=ScaleYInches(y);
	if(prex<0&&prey<0) prex=dx,prey=dy;
	switch(event){
		case BUTTON_DOWN:{
			if(button==LEFT_BUTTON) Drawing=1,prex=prey=-1;
			break;
		}
		case BUTTON_UP:{
			if(button==LEFT_BUTTON) Drawing=0;
			break;
		}
		case MOUSEMOVE:{
			if(Drawing){
				MovePen(prex,prey);
				DrawLine(dx-prex,dy-prey);
				prex=dx,prey=dy;
			}
			break;
		}
	}
}