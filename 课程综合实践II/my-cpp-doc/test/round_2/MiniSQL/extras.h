#pragma once
#include<string>

#include"types.h"
using namespace std;

string lower(string s);
string getword(string s, int pos);
bool satisfy(Tuple t, condition c);
Data dataCast(int Type, stringstream& ss);