#ifndef _RECTANGLE_H_
#define _RECTANGLE_H_

#include"graphics.h"

typedef struct{
	double x1,y1,x2,y2;
}Rectangle;

void ShRectangle(double x1,double y1,double x2,double y2){
	MovePen(x1,y1);
	DrawLine(x2-x1,0);
	DrawLine(0,y2-y1);
	DrawLine(x1-x2,0);
	DrawLine(0,y1-y2);
}
#endif