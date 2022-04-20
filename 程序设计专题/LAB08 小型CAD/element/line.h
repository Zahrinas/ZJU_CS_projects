#ifndef _LINE_H_
#define _LINE_H_

#include"graphics.h"

typedef struct{
	double x1,y1,x2,y2;
}Line;

void ShLine(double x1,double y1,double x2,double y2){
	MovePen(x1,y1);
	DrawLine(x2-x1,y2-y1);
}
#endif