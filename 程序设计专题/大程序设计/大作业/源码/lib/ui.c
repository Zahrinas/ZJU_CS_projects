#include"imgui.h"
#include"graphics.h"
#include"extgraph.h"

void DrawUI(){
	DisplayClear();
	SetFont("微软雅黑");
	SetPointSize(20);
	if(button(GenUIID(1),9,9,5,1,"十五球规则")) StartMode1();
	else if(button(GenUIID(2),9,7,5,1,"斯诺克规则")) StartMode2();
	else if(button(GenUIID(3),9,5,5,1,"花式九球规则")) StartMode3();
	else if(button(GenUIID(4),9,3,5,1,"读取录像")) InitRead();
	else if(button(GenUIID(5),9,1,5,1,"退出")) exit(0);
}

static void TimerEvent(int event){
	DrawUI();
}

static void MouseEvent(int x,int y,int key,int event){
	uiGetMouse(x,y,key,event);
}

void InitUI(){
	startTimer(1,20);
	registerTimerEvent(TimerEvent);
	registerMouseEvent(MouseEvent);
	DrawUI();
}