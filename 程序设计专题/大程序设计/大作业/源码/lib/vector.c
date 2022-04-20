#include"vector.h"

double VectorX(vec a){
	return a.l*cos(a.d);
}

double VectorY(vec a){
	return a.l*sin(a.d);
}

vec NewVector(double length,double direction){
	vec ret;
	ret.l=length;
	ret.d=direction;
	return ret;
}

vec ToVector(double x,double y){
	vec ret;
	ret.l=sqrt(x*x+y*y);
	ret.d=atan2(y,x);
	return ret;
}

vec HorResolve(vec a,double direction){
	return NewVector(a.l*cos(a.d-direction),direction);
}

vec VerResolve(vec a,double direction){
	return NewVector(a.l*sin(a.d-direction),direction+0.5*M_PI);
}