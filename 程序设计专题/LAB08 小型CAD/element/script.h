#ifndef _SCRIPT_H_
#define _SCRIPT_H_

#include"graphics.h"

typedef struct{
	double x,y;
	int size;
	char* str;
}Script;

void ShScript(double x,double y,char* str){
	MovePen(x,y);
	DrawTextString(str);
}
#endif