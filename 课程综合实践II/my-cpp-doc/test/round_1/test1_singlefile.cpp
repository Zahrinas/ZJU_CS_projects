#include <bits/stdc++.h>
using namespace std;

/**
 * @brief A's discription
 * class A : B {}  <- this is a defination in comment
 */
class A {
    void f0();
public:
    string f1() {
        string s = "\"";  // This is a \" test
        return "class F : E {}";  // This is a defination in string
    }
    void f2() {

    }
    void f3() {

    }
protected:
    void protected_func();
private:
    void private_func();
    int i;
    double d;
};

class B : A {  // no discription
public:
    void B1() {

    }
    void B2() {

    }
    void B3() {

    }
private:
    int x, y;
    double d1, d2;
};

template<class T>
class C{

};

class D: public A, private B{

};

template<class T, class T2>
class E{}

class F;

void f() {
    
}
int main() {
    return 0;
}