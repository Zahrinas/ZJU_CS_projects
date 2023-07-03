#include<sstream>
#include<iostream>

#include"types.h"
#include"extras.h"
using namespace std;

extern char Temp[65536];

string lower(string s) {
	int len = s.length();
	string ret = "";
	for (int i = 0;i < len;++i) {
		if (isupper(s[i])) ret += tolower(s[i]);
		else ret += s[i];
	}
	return ret;
}

string getword(string s, int pos) {
	int len = s.length();
	string ret = "";
	for (int i = pos;i < len;++i) {
		if (isspace(s[i])) break;
		else ret += s[i];
	}
	return ret;
}

Data dataCast(int Type, stringstream& ss) {
	int datai;
	float dataf;
	if (Type == -1) {
		ss >> datai;
		return datai;
	}
	else if (Type == 0) {
		ss >> dataf;
		return dataf;
	}
	else {
		int pos = 0;
		char ch;
		while ((ch = ss.get()) != '\'');
		do {
			ch = ss.get();
			Temp[pos++] = ch;
		} while (ch != '\'');
		Temp[--pos] = '\0';
		return Data(Type, Temp);
	}
}

bool satisfy(Tuple t, condition c) {
	switch (c.comp) {
	case eq:  return t.data[c.attr] == c.data;
	case neq: return t.data[c.attr] != c.data;
	case lt:  return t.data[c.attr] < c.data;
	case gt:  return t.data[c.attr] > c.data;
	case leq: return t.data[c.attr] <= c.data;
	case geq: return t.data[c.attr] >= c.data;
	}
	return 0;
}