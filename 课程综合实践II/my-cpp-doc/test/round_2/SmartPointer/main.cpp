#include <iostream>
#include <fstream>
using namespace std;

#include "src/String.h"

#define JUDGE(x, c, s) {\
    cout << (s) << "\t";\
    if ( x ) {\
        credit += c;\
        cout << "PASS " << (c) << " " << credit << endl;\
    } else {\
        cout << "FAIL 0" << endl;\
    }\
}

int main(int argc, char* argv[])
{
    int credit = 0;

    String s1 = "Hello";
    JUDGE(s1.refCount()==1, 1, "create\t");
    String s2 = s1;
    JUDGE(s2.refCount()==2 &&
        s1.getRaw() == s2.getRaw(), 1, "create copy");
    JUDGE(s1.length() == 5, 1, "length\t");
    String s3 = "bye";
    s1 = s3;
    JUDGE(s2.refCount()==1, 1, "assigment dec");
    JUDGE(s3.refCount()==2, 1, "assigment ins");
    String s4 = "bye";
    JUDGE(s3.refCount()==2, 1, "assigment iso");
    JUDGE(s4.getRaw() != s3.getRaw(), 1, "assigment iso2");
    JUDGE(s3 == s4, 1, "operator ==");
    String s5 = s3+s4;
    JUDGE(s5 == "byebye", 1, "operator+ 1");
    JUDGE(s5.getRaw() != s3.getRaw(), 1, "operator+ 2");
    cout << credit << endl;
}