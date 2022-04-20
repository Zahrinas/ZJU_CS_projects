#ifndef _ANGLE_H
#define _ANGLE_H

#include"graphics.h"
#include<math.h>

static double _Radian;

void forward(double distance){
	DrawLine(distance*cos(_Radian),distance*sin(_Radian));
}

void turn(double angle){
	_Radian+=angle*M_PI/180;
}

void move(double distance){
	MovePen(GetCurrentX()+distance*cos(_Radian),
			GetCurrentY()+distance*sin(_Radian));
}

#endif