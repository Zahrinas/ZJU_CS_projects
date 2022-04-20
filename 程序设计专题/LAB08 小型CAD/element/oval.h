#ifndef _OVAL_H_
#define _OVAL_H_

#include"graphics.h"

typedef struct{
	double x1,y1,x2,y2;
}Oval;

void ShOval(double x1,double y1,double x2,double y2){
	MovePen(x2,y2);
	DrawEllipticalArc((x2-x1)/2,(y2-y1)/2,0,360);
}
#endif