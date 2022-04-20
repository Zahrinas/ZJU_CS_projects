/*
	File: 		vector.h
	Edition: 	2021/5/26
	
	Private vector functions.
*/

#ifndef _VECTOR_H_
#define _VECTOR_H_
#define M_PI 3.1415926535

#include<math.h>

typedef struct vec{
	double l,d;
}vec;

//获取向量X轴上的投影
double VectorX(vec a);

//获取向量Y轴上的投影
double VectorY(vec a);

//以长度和方向新建向量
vec NewVector(double length,double direction);

//以X轴投影和Y轴投影新建向量
vec ToVector(double x,double y);

//向量在dir方向上的投影向量
vec HorResolve(vec a,double direction);

//向量在dir方向上的垂直向量分解
vec VerResolve(vec a,double direction);

#endif
