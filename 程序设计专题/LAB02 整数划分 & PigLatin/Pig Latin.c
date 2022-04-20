#include<ctype.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

char vowel[]="aeiouAEIOU";
char word[100001];
void dealwith(){
	int fstv=strcspn(word,vowel);
	if(fstv==0){
		printf("%s-Way",word);
		return;
	}
	int len=strlen(word);
	if(fstv==len)  printf(word);
	else{
		for(int i=fstv;i<len;++i) putchar(word[i]);
		putchar('-');
		for(int i=0;i<fstv;++i) putchar(word[i]);
		printf("ay");
		return;
	}
}
signed main(signed argc,char** argv,char** env){
	int wp=0;
	char rd;
	while((rd=getchar())!=EOF){
		if(isalpha(rd)) word[wp++]=rd;
		else{
			if(wp) word[wp]=0,dealwith();
			wp=0;
			putchar(rd);
		}
	}
	exit(0);
}//Zaric  