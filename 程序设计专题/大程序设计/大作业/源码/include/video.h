/*
	File: 		video.h
	Edition: 	2021/6/9
	
	To achieve save video and read.
*/

#ifndef _VIDEO_H_
#define _VIDEO_H_

void InitSave(Ball* Balls,int BallCnt);

void SaveStep(double Speed,double CueAngle,int p);

void InitRead();

#endif