/*
	File: 		types.h
	Edition: 	2021/5/27
	
	Basic ball type parameters and functions.
*/

#ifndef _TYPES_H_
#define _TYPES_H_

#include"strlib.h"

//draw.h
#define M_PI 3.1415926535
#define BallRadius 0.23
#define BallNumSize 3
#define TableWidth 12.7
#define TableHeight 6.35
#define OutTableWidth 13.7
#define CornerHoleRadius 0.27
#define CornerArcRadius 0.4
#define MarginWidth 0.5
#define MarginHoleRadius 0.3
#define MarginArcRadius 0.42
#define DefaultPointSize 12
#define CueLenth 8.2
#define CueWidth 0.12
#define CueHeadLenth 0.06
#define CueBlackLenth 0.06
#define TableCenterX 15.5
#define TableCenterY 7.0
#define ForceBoxX (TableCenterX-TableWidth-ForceBoxWidth)
#define ForceBoxY (TableCenterY-ForceBoxHeight/2)
#define ForceBoxHeight 4.8
#define ForceBoxWidth 1.0
#define UserBoxX TableCenterX
#define UserBoxY (TableCenterY-5.0)
#define UserBoxWidth TableWidth
#define UserBoxHeight 1.6

//physics.h
#define Eps 1e-4
#define TableW 12.2
#define TableH 5.9
#define TableX (TableCenterX-TableW/2)
#define TableY (TableCenterY-TableH/2)
#define M_GC 9.80665

enum ColorType{
	__,Pure,Mixed
};

typedef struct Ball{
	int type;      		//球的种类（花球/纯色球....)
						//花球为Mixed 纯色球为Pure 例如 ball1 = Pure;
	int num_int;   		//数字编号
	string num_str;		//字符串编号  例如 ball1.num="3";
	string color;  		//颜色  例如 ball1.color="Red";
	string textcolor;	//字符串颜色
	int exit;     		//是否还在场上  0：在场  1：不在场
	double x;     		//x坐标
	double y;      		//y坐标
	double vx;     		//x速度
	double vy;			//y速度
}Ball;

#endif