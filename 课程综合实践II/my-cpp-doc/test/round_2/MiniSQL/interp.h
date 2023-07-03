#pragma once

#include"API.h"
#include"types.h"
#include"record.h"
#include"catalog.h"
using namespace std;

struct Interpreter {
	string stc;

	vector<Attribute> getAttribute(string s, int pos, int& RetPrimary);
	void getIndexInfo(string s, int pos, string& Tname, int& Indexp);
	vector<condition> getCondition(stringstream& ss, Table t, bool& tagOr);

	bool getstc(istream& in);
	void normalize();

	bool EXEC_EXIT();
	bool EXEC_CREATE();
	bool EXEC_SHOW_TABLE();
	bool EXEC_INSERT();
	bool EXEC_DELETE();
	bool EXEC_SELECT();
	bool EXEC_DROP();
	bool EXEC_FILE();
	bool EXEC_show();
	bool EXEC();
};