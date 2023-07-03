#pragma once
#include<string> 

#include"index.h"
#include"types.h"
#include"buffer.h"
using namespace std;

struct catalog {
	catalog();
	void modifyTableInfo(Table t);
	void modifyIndexInfo(Index idx);
	void buildIndexFromTable(string T, int Indexp, string I);

	set<where> getTupleFrom(Table t, int Block);
	int eraseTupleFrom(Table t, where posw);

	Tuple getTuple(Table t, where pos);

	bool hasTable(string s);
	bool hasIndex(string s);
	Table getTable(string s);
	Index getIndex(string s);
	void dropTable(string s);
	void dropIndex(string s);
	void createTable(string s, vector<Attribute> &Attributes, int Primary);
	void createIndex(string Tname, int Indexp, string Iname);
	void showTable(string s);
};