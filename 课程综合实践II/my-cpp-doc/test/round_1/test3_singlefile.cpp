#include <bits/stdc++.h>
using namespace std;

/**
 * @brief A's discription
 * class A : B {}  <- this is a defination in comment
 */
class A {
public:
    string A_method_1() {
        string s = "\"";  // This is a \" test
        return "class F : E {}";  // This is a defination in string
    }
    void A_method_2() {

    }
    void A_function_1() {

    }
private:
    int A_int;
    double A_double;
};

class B : A {  // no discription
public:
    void B_method_1() {

    }
    void B_method_2() {

    }
    void B_function_1() {

    }
private:
    int B_int;
    double B_double;
};

class C{

};

class D: public A, private B{

};

class E: public A{}

class F:public A{};

void f() {
    
}
int main() {
    return 0;
}