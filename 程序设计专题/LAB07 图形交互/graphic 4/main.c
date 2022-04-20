#include<ctype.h>
#include<windows.h>
#include<winuser.h>
#include"graphics.h"
#include"extgraph.h"

#define BUFSIZE 100000

static double cury;
static char buf[BUFSIZE],temp[BUFSIZE];
static int curpos,curstate;
static double precur,nowcur;

void KeyWork(int,int);
void CharWork(char);
void TimerWork(int);
void OperateString(int);
void FormNewBuf(char);
void FormBackspaceBuf();
void FormDeleteBuf();
void RefreshCursor();
void RewriteCursor();
double getlen();

void Main(){
	InitGraphics();
	cury=GetWindowHeight()-GetFontHeight();
	registerKeyboardEvent(KeyWork);
	registerCharEvent(CharWork);
	registerTimerEvent(TimerWork);
	startTimer(1,500);
}
void KeyWork(int key,int event){
	RefreshCursor();
	if(event==KEY_DOWN) switch(key){
		case VK_LEFT:{
			if(curpos) --curpos;
			break;
		}
		case VK_RIGHT:{
			if(buf[curpos]) ++curpos;
			break;
		}
		case VK_RETURN:{
			cury-=GetFontHeight();
			OpenConsole();
			puts(buf);
			buf[0]=0,curpos=0;
			break;
		}
		case VK_BACK:{
			OperateString(0);
			FormBackspaceBuf();
			OperateString(1);
			break;
		}
		case VK_DELETE:{
			OperateString(0);
			FormDeleteBuf();
			OperateString(1);
			break;
		}
	}
	RewriteCursor();
}
void CharWork(char ch){
	RefreshCursor();
	if(ch&&'\n'&&ch!='\r'&&ch!='\b'){	
		OperateString(0);
		FormNewBuf(ch);
		OperateString(1);
	}
}
void TimerWork(int timer){
	if(curstate) RefreshCursor();
	else RewriteCursor();
}
void OperateString(int opr){
	MovePen(0,cury);
	SetEraseMode(!opr);
	DrawTextString(buf);
}
void FormNewBuf(char ch){
	sprintf(temp,buf+curpos);
	buf[curpos++]=ch;
	sprintf(buf+curpos,temp);
}
void FormBackspaceBuf(){
	sprintf(temp,buf+curpos);
	if(curpos) --curpos;
	sprintf(buf+curpos,temp);
}
void FormDeleteBuf(){
	if(buf[curpos]){
		sprintf(temp,buf+curpos+1);
		sprintf(buf+curpos,temp);
	}
}
void RefreshCursor(){
	MovePen(precur,cury);
	SetEraseMode(1);
	DrawLine(0,GetFontHeight());
	curstate=0;
}
void RewriteCursor(){
	precur=nowcur=getlen();
	MovePen(nowcur,cury);
	SetEraseMode(0);
	DrawLine(0,GetFontHeight());
	curstate=1;
}
double getlen(){
	for(int i=0;i<curpos;++i) temp[i]=buf[i];
	temp[curpos]=0;
	return TextStringWidth(temp);
}