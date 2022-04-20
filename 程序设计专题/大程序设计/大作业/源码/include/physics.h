/*
	File: 		physics.h
	Edition: 	2021/6/2
	
	Physics simulator.
*/

#ifndef _PHYSICS_H_
#define _PHYSICS_H_
#define M_PI 3.1415926535

//坐标间距离
double CoorDistance(double x1,double y1,double x2,double y2);

//初始化计时间隔
void SetTime(double t);

//用存储球数据的数组及其大小初始化
void SetBalls(Ball* bptr,int size);

//设置速度（击球等）
void SetSpeed(Ball* bptr,double spd,double radian);

//按计时间隔，触发球数据刷新
void CheckCollide();

//球是否还在运动
int StillMoving();
#endif