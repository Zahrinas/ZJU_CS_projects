#include<ctime>
#include<iostream>
#include<exception>

#include"types.h"
#include"interp.h"
using namespace std;

Interpreter i;
bool ex_status = 1;
signed main(signed, char**, char**) {
	printf("Welcome to MiniSQL.\n");
	while (ex_status) {
		try {
			printf(">>>");
			i.getstc(cin);
			clock_t beg = clock();
			i.normalize();
			//cout<<i.stc<<endl;
			ex_status = i.EXEC();
			clock_t end = clock();
			putchar('\n');
			printf("time used: %.3lfs", (double)(end - beg) / CLOCKS_PER_SEC);
			putchar('\n');
			putchar('\n');
		}
		catch (const char* s) {
			printf(s);
			putchar('\n'), putchar('\n');
			continue;
		}
	}
}