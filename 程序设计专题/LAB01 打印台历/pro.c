#include<stdio.h>
#include<stdlib.h>

int year;
int daycount[12]={31,28,31,30,31,30,31,31,30,31,30,31};
char* monthname[12]={"January","February","March","April","May","June",
				"July","August","September","October","November","December"};
int checkdays(int x){
	if(x%400==0) return 1;
	if(x%100==0) return 0;
	return x%4==0;
}
int pmonth(int leap,int month,int start){
	int weekcheck=start;
	for(int i=0;i<start;++i) printf("   ");
	for(int i=1;i<=daycount[month]+(leap&&month==1);++i){
		printf("%-3d",i);
		++weekcheck;
		if(weekcheck==7) puts(""),weekcheck=0;
	}
	if(weekcheck) puts("");
	puts("");
	return weekcheck;
}
void print(){
	int weekstart=1,day=checkdays(year);
	for(int i=1900;i<year;++i) weekstart=(weekstart+1+checkdays(i))%7;
	for(int i=0;i<12;++i){
		printf("   %s %d\n",monthname[i],year);
		puts("Su Mo Tu We Th Fr Sa");
		weekstart=pmonth(day,i,weekstart);
	}
}
signed main(signed argc,char** argv,char** env){
	scanf("%d",&year);
	print();
	exit(0);
}//Zaric