#include<string.h>

#include"imgui.h"
#include"graphics.h"
#include"extgraph.h"
#include"linkedlist.h"

#include"line.h"
#include"oval.h"
#include"rectangle.h"
#include"script.h"

typedef struct NodeType{
	void* ptr;
	int type;
}Node;
Node* Select;
int DrawType,DrawStage,BufSize,Moving;
double curx,cury,remx,remy,delx,dely,rems;
linkedlistADT Graph;
char buf[100000+5];
char* remt;

int InCanvas(){
	return 4<=curx&&curx<=19&&2<=cury&&cury<=9;
}
bool PtrEqual(void* a,void* b){
	return a==b;
}
int InRange(double x,double lb,double rb){
	if(lb<=rb) return lb<=x&&x<=rb;
	else return rb<=x&&x<=lb;
}
void GraphMove(){
	if(Select->type==1){
		Line* ptr=Select->ptr;
		delx=ptr->x2-ptr->x1,dely=ptr->y2-ptr->y1;
	}
	if(Select->type==2){
		Oval* ptr=Select->ptr;
		delx=ptr->x2-ptr->x1,dely=ptr->y2-ptr->y1;
	}
	if(Select->type==3){
		Rectangle* ptr=Select->ptr;
		delx=ptr->x2-ptr->x1,dely=ptr->y2-ptr->y1;
	}
	if(Select->type==4){
		Script* ptr=Select->ptr;
		rems=ptr->size,remt=ptr->str;
	}
	Moving=Select->type;
	DeleteNode(Graph,Select,PtrEqual);
	Select=0;
}
void MovingTrait(){
	if(Moving==1) ShLine(curx,cury,curx+delx,cury+dely);
	if(Moving==2) ShOval(curx,cury,curx+delx,cury+dely);
	if(Moving==3) ShRectangle(curx,cury,curx+delx,cury+dely);
	if(Moving==4){
		SetPointSize(rems);
		ShScript(curx,cury,remt);
		SetPenSize(1);
	}
}
void AddtoList(){
	Node* p=malloc(sizeof(Node));
	p->type=DrawType;
	switch(DrawType){
		case 1:{
			Line* ptr=malloc(sizeof(Line));
			ptr->x1=remx,ptr->y1=remy,ptr->x2=curx,ptr->y2=cury;
			p->ptr=ptr;
			break;
		}
		case 2:{
			Oval* ptr=malloc(sizeof(Oval));
			ptr->x1=remx,ptr->y1=remy,ptr->x2=curx,ptr->y2=cury;
			p->ptr=ptr;
			break;
		}
		case 3:{
			Rectangle* ptr=malloc(sizeof(Rectangle));
			ptr->x1=remx,ptr->y1=remy,ptr->x2=curx,ptr->y2=cury;
			p->ptr=ptr;
			break;
		}
		case 4:{
			Script* ptr=malloc(sizeof(Script));
			ptr->x=curx,ptr->y=cury;
			ptr->size=rems;
			ptr->str=malloc(sizeof(char)*(strlen(remt)+1));
			strcpy(ptr->str,remt);
			p->ptr=ptr;
			break;
		}
	}
	if(DrawType) InsertNode(Graph,Graph,p);
	else free(p);
}
void Fix(){
	DrawType=Moving;
	if(1<=Moving&&Moving<=3){
		remx=curx,remy=cury;
		curx=remx+delx,cury=remy+dely;
		AddtoList();
	}
	if(Moving==4){
		remx=curx,remy=cury;
		AddtoList();
	}
	Moving=0;
}
void DrawGraph(){
	SetPenColor("Black");
	linkedlistADT now=NextNode(Graph,Graph);
	while(now){
		Node* p=NodeObj(Graph,now);
		if(p==Select) SetPenColor("Red");
		if(p->type==1){
			Line* pt=p->ptr;
			ShLine(pt->x1,pt->y1,pt->x2,pt->y2);
		}else if(p->type==2){
			Oval* pt=p->ptr;
			ShOval(pt->x1,pt->y1,pt->x2,pt->y2);
		}else if(p->type==3){
			Rectangle* pt=p->ptr;
			ShRectangle(pt->x1,pt->y1,pt->x2,pt->y2);
		}else{
			Script* pt=p->ptr;
			SetPointSize(pt->size);
			ShScript(pt->x,pt->y,pt->str);
		}
		if(p==Select) SetPenColor("Black");
		now=NextNode(Graph,now);
	}
	if(Moving) MovingTrait();
	else if(DrawStage){
		if(DrawType==1) ShLine(remx,remy,curx,cury);
		if(DrawType==2) ShOval(remx,remy,curx,cury);
		if(DrawType==3) ShRectangle(remx,remy,curx,cury);
		if(DrawType==4) ShScript(remx,remy,buf);
	}
}
void FindSelect(){
	linkedlistADT now=NextNode(Graph,Graph);
	while(now){
		Node* p=NodeObj(Graph,now);
		if(p->type==1){
			Line* pt=p->ptr;
			if(InRange(curx,pt->x1,pt->x2)&&InRange(cury,pt->y1,pt->y2)){
				Select=p;
				break;
			}
		}else if(p->type==2){
			Oval* pt=p->ptr;
			if(InRange(curx,pt->x1,pt->x2)&&InRange(cury,pt->y1,pt->y2)){
				Select=p;
				break;
			}
		}else if(p->type==3){
			Rectangle* pt=p->ptr;
			if(InRange(curx,pt->x1,pt->x2)&&InRange(cury,pt->y1,pt->y2)){
				Select=p;
				break;
			}
		}else{
			Script* pt=p->ptr;
			if(InRange(curx,pt->x,pt->x+TextStringWidth(pt->str))
				&&InRange(cury,pt->y,pt->y+GetFontHeight())){
				Select=p;
				break;
			}
		}
		now=NextNode(Graph,now);
	}
}
void Display(){
	DisplayClear();
	SetPenColor("Green");
	SetPenSize(3);
	ShRectangle(4,2,19,9);
	ShRectangle(4,1,19,1.3);
	SetPenColor("Blue");
	SetPointSize(20);
	drawLabel(4,1.05,"Enter Your Text Here:");
	MovePen(8,1.05);
	DrawTextString(buf);
	if(button(GenUIID(2),1,9,1.2,0.5,"Line")&&!Moving) DrawType=1;
	if(button(GenUIID(3),1,7,1.2,0.5,"Oval")&&!Moving) DrawType=2;
	if(button(GenUIID(4),1,5,1.2,0.5,"Rect")&&!Moving) DrawType=3;
	if(button(GenUIID(5),1,3,1.2,0.5,"Text")&&!Moving) DrawType=4;
	if(button(GenUIID(6),2.4,9,1.2,0.5,"Select")&&!Moving) DrawType=5;
	if(DrawType==5&&Select){
		if(Select->type==4){
			if(button(GenUIID(10),2.4,3,1.2,0.5,"SizeUp")){
				Script* ptr=Select->ptr;
				ptr->size+=10;
				DrawStage=0,DrawType=0,Select=0;
			}
			if(button(GenUIID(11),2.4,1,1.2,0.5,"SizeDown")){
				Script* ptr=Select->ptr;
				ptr->size-=10;
				DrawStage=0,DrawType=0,Select=0;
			}
		}else if(button(GenUIID(8),2.4,3,1.2,0.5,"Size Just")){
			if(Select->type==1){
				Line* ptr=Select->ptr;
				remx=ptr->x1,remy=ptr->y1;
			}else if(Select->type==2){
				Oval* ptr=Select->ptr;
				remx=ptr->x1,remy=ptr->y1;
			}else if(Select->type==3){
				Rectangle* ptr=Select->ptr;
				remx=ptr->x1,remy=ptr->y1;
			}else{
				Script* ptr=Select->ptr;
				remx=ptr->x,remy=ptr->y;
			}
			DeleteNode(Graph,Select,PtrEqual);
			DrawStage=1,DrawType=Select->type,Select=0;
		}
		if(button(GenUIID(7),2.4,7,1.2,0.5,"Delete")){
			DeleteNode(Graph,Select,PtrEqual);
			DrawStage=0,DrawType=0,Select=0;
		}
		if(button(GenUIID(9),2.4,5,1.2,0.5,"Move")){
			GraphMove();
			DrawStage=0,DrawType=0,Select=0;
		}
	}
	DrawGraph();
}
void MouseDo(int x,int y,int key,int event){
	curx=ScaleXInches(x),cury=ScaleYInches(y);
	uiGetMouse(x,y,key,event);
	if(InCanvas()&&event==BUTTON_UP){
		if(Moving) Fix();
		else if(DrawType==5) FindSelect();
		else if(DrawType==4){
			rems=16,remx=curx,remy=cury,remt=buf;
			AddtoList();
			buf[BufSize=0]=0;
			DrawStage=0;
		}else if(DrawStage){
			AddtoList();
			DrawStage=0;
		}else{
			remx=curx,remy=cury;
			DrawStage=1;
		}
	}
	Display();
}
void CharDo(char key){
	buf[BufSize++]=key;
	buf[BufSize]=0;
	Display();
}
void Main(){
	SetWindowSize(20,10);
	InitGraphics();
	registerMouseEvent(MouseDo);
	registerCharEvent(CharDo);
	Graph=NewLinkedList();
	Display();
}