#include"graphics.h"
#include"extgraph.h"

#include"mode.h"

void Main(){
	SetWindowSize(23,12);
	InitGraphics();
	DefineColor("CueBrown1",.82,.73,.41);
	DefineColor("CueBrown2",.43,.2,.16);
	DefineColor("Pink",.996,.75,.793);
	//InitConsole();
	
	InitUI();
}