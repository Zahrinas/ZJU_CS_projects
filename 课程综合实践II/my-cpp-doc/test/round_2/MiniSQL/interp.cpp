#include<ctime>
#include<cctype>
#include<sstream>
#include<fstream>
#include<iostream>

#include"index.h"
#include"interp.h"
#include"extras.h"
using namespace std;

extern catalog cata;
extern APICLASS API;

vector<Attribute> Interpreter::getAttribute(string s, int pos, int& RetPrimary) {
	vector<Attribute> ret;
	stringstream ss(s.substr(pos, s.length()));
	string name, type, word, prim;
	char ch;
	int pritag = 0, t;
	ss >> ch;
	do {
		bool uni = 0;
		ss >> name >> type;
		if (name == "primary"&&type == "key") {
			ss >> ch >> prim >> ch;
			if (!pritag) pritag = 1;
			else throw("Multiple primary key.");
		}
		else if (type == "int") t = -1;
		else if (type == "float") t = 0;
		else if (type == "char") ss >> ch >> t >> ch;
		do {
			ss >> word;
			if (lower(word) == "unique") uni = 1;
		} while (word != ","&&word != ")");
		if (name != "primary") ret.push_back(Attribute(name, "#", t, uni));
	} while (word != ")");
	if (!pritag) throw("No primary key given.");
	int siz = ret.size();
	for (int i = 0;i < siz;++i) if (prim == ret[i].Name) RetPrimary = i;
	return ret;
}

void Interpreter::getIndexInfo(string s, int pos, string& Tname, int& Indexp) {
	stringstream ss(s.substr(pos, s.length()));
	string word, Aname;
	char ch;
	bool flag = 0;
	ss >> word >> Tname >> ch >> Aname;
	Table table = cata.getTable(Tname);
	int Asize = table.Attributes.size();
	for (int i = 0;i < Asize;++i) if (table.Attributes[i].Name == Aname) {
		if (!table.Attributes[i].Unique) throw("Attribute is not unique.");
		Indexp = i;
		flag = 1;
		break;
	}
	if (!flag) throw("Cannot find that attribute.");
}

vector<condition> Interpreter::getCondition(stringstream& ss, Table t, bool& tagOr) {
	vector<condition> conds;
	string word;
	char opd, opd2;
	ss >> word;
	int CondCnt = 0;
	while (word != ";") {
		ss >> word;
		if (word == ";") break;
		if (lower(word) == "and") ss >> word;
		if (lower(word) == "or") {
			tagOr = 1;
			ss >> word;
		}
		int atrid = 0;
		Compare comp;
		Data data;
		for (int i = 0;i < (int)t.Attributes.size();++i) {
			if (t.Attributes[i].Name == word) {
				atrid = i;
				break;
			}
		}
		ss >> opd >> opd2;
		if (opd == '=') {
			ss.putback(opd2);
			comp = eq;
			data = dataCast(t.Attributes[atrid].Type, ss);
		}
		else if (opd == '<') {
			if (opd2 == '>') {
				comp = neq;
				data = dataCast(t.Attributes[atrid].Type, ss);
			}
			else if (opd2 == '=') {
				comp = leq;
				data = dataCast(t.Attributes[atrid].Type, ss);
			}
			else {
				ss.putback(opd2);
				comp = lt;
				data = dataCast(t.Attributes[atrid].Type, ss);
			}
		}
		else if (opd == '>') {
			if (opd2 == '=') {
				comp = geq;
				data = dataCast(t.Attributes[atrid].Type, ss);
			}
			else {
				ss.putback(opd2);
				comp = gt;
				data = dataCast(t.Attributes[atrid].Type, ss);
			}
		}
		conds.push_back(condition(atrid, comp, data));
		++CondCnt;
	}
	return conds;
}

bool Interpreter::getstc(istream& in) {
	char ch;
	bool blank_flg = 1;
	stc = "";
	do {
		if (in.eof()) return 0;
		ch = in.get();
		if (!isspace(ch)) {
			stc += ch;
			blank_flg = 0;
		}
		else if (!blank_flg) {
			stc += ' ';
			blank_flg = 1;
		}
	} while (ch != ';');
	return 1;
}

void Interpreter::normalize() {
	int len = stc.length();
	bool instr = 0;
	for (int i = 0;i < len;++i) {
		switch (stc[i]) {
		case '<':case '>':case '=':case '(':
		case ')':case ';':case ',':case '*': {
			if (instr) continue;
			else {
				if (i&&stc[i - 1] != ' ') {
					stc.insert(i, " ");
					++i, ++len;
				}
				if (i < len&&stc[i + 1] != ' ') {
					stc.insert(i + 1, " ");
					++i, ++len;
				}
			}
			break;
		}
		case '\'': {
			instr ^= 1;
			break;
		}
		}
	}
}

bool Interpreter::EXEC_EXIT() {
	printf("Exiting. Bye.");
	return 0;
}

bool Interpreter::EXEC_DROP() {
	if (lower(stc.substr(0, 11)) == "drop table ") {
		string s = getword(stc, 11);
		if (cata.hasTable(s)) {
			Table table = cata.getTable(s);
			int AtrSize = table.Attributes.size();
			for (int i = 0;i < AtrSize;++i) {
				if (table.Attributes[i].IndexName != "#") {
					cata.dropIndex(table.Attributes[i].IndexName);
				}
			}
			cata.dropTable(s);
		}
		else throw("Table name invalid.");
	}
	else if (lower(stc.substr(0, 11)) == "drop index ") {
		string s = getword(stc, 11);
		if (cata.hasIndex(s)) {
			Index idx = cata.getIndex(s);
			Table table = cata.getTable(idx.Table);
			int AtrSize = table.Attributes.size();
			for (int i = 0;i < AtrSize;++i) {
				if (table.Attributes[i].IndexName == s) {
					table.Attributes[i].IndexName = "#";
					break;
				}
			}
			cata.modifyTableInfo(table);
			cata.dropIndex(s);
		}
		else throw("Index name invalid.");
	}
	else throw("Cannot recognize the instruction.");
	printf("Drop success.");
	return 1;
}

bool Interpreter::EXEC_CREATE() {
	if (lower(stc.substr(0, 13)) == "create table ") {
		string s = getword(stc, 13);
		int primary;
		vector<Attribute> Att = getAttribute(stc, 13 + s.length(), primary);
		cata.createTable(s, Att, primary);
	}
	else if (lower(stc.substr(0, 13)) == "create index ") {
		string s = getword(stc, 13), Tname;
		int Indexp;
		getIndexInfo(stc, 13 + s.length(), Tname, Indexp);
		Table table = cata.getTable(Tname);
		table.Attributes[Indexp].IndexName = s;
		cata.createIndex(Tname, Indexp, s);
		cata.modifyTableInfo(table);
	}
	else throw("Cannot recognize the instruction.");
	printf("Create success.");
	return 1;
}

bool Interpreter::EXEC_SHOW_TABLE() {
	string s = getword(stc, 11);
	cata.showTable(s);
	return 1;
}

bool Interpreter::EXEC_INSERT() {
	stringstream ss(stc);
	string word, Tname;
	ss >> word >> word >> Tname >> word >> word;
	Table table = cata.getTable(Tname);
	int Asize = table.Attributes.size();
	Tuple tuple(Asize);
	for (int i = 0;i < Asize;++i) {
		Data data;
		data = dataCast(table.Attributes[i].Type, ss);
		tuple.data.push_back(data);
		ss >> word;
	}
	API.insertTuple(table, tuple);
	printf("Insertion of 1 record success.");
	return 1;
}

bool Interpreter::EXEC_SELECT() {
	stringstream ss(stc);
	string word, Tname;
	bool flagAll = 0;
	vector<string> attr;
	set<int> attrid;
	ss >> word;
	do {
		ss >> word;
		if (word == "*") {
			flagAll = 1;
			continue;
		}
		else if (lower(word) == "from") break;
		else {
			attr.push_back(word);
			ss >> word;
		}
	} while (lower(word) != "from");
	ss >> Tname;
	Table t = cata.getTable(Tname);
	if (!flagAll) {
		for (int i = 0;i < (int)attr.size();++i) {
			cout << attr[i] << (i + 1 == (int)attr.size() ? '\n' : ' ');
			for (int j = 0;j < (int)t.Attributes.size();++j) {
				if (attr[i] == t.Attributes[j].Name) {
					attrid.insert(j);
					break;
				}
			}
		}
	}
	else {
		for (int i = 0;i < (int)t.Attributes.size();++i) {
			attrid.insert(i);
			cout << t.Attributes[i].Name << (i + 1 == (int)t.Attributes.size() ? '\n' : ' ');
		}
	}
	bool tagOr = 0;
	vector<condition> conds = getCondition(ss, t, tagOr);
	set<where> res = API.select(t, conds, tagOr);
	for (auto i = res.begin();i != res.end();++i) cata.getTuple(t, *i).output(attrid);
	printf("%d tuples selected.", (int)res.size());
	return 1;
}

bool Interpreter::EXEC_DELETE() {
	stringstream ss(stc);
	string word, Tname;
	ss >> word >> word >> Tname;
	Table t = cata.getTable(Tname);
	bool tagOr = 0;
	vector<condition> conds = getCondition(ss, t, tagOr);
	API.deleteTuple(t, conds, tagOr);
	return 1;
}

bool Interpreter::EXEC_FILE() {
	stringstream ss(stc);
	char ch;
	while ((ch = ss.get()) != ' ');
	string FILENAME;
	while ((ch = ss.get()) != ';') {
		if (!isspace(ch)) FILENAME += ch;
	}
	ifstream fin;
	fin.open(FILENAME);
	if (!fin.is_open()) {
		printf("Cannot find the file.");
		return 1;
	}
	bool ex_status = 1;
	while (ex_status) {
		try {
			if (!getstc(fin)) break;
			clock_t beg = clock();
			normalize();
			ex_status = EXEC();
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
	return 1;
}

bool Interpreter::EXEC_show(){
	stringstream ss(stc);
	string word,Iname;
	ss>>word>>word>>Iname;
	Index i=cata.getIndex(Iname);
	BPTree tree(i);
	tree.print(tree.root);
	return 1;
}

bool Interpreter::EXEC() {
	if (lower(stc.substr(0, 5)) == "quit ") return EXEC_EXIT();
	else if (lower(stc.substr(0, 11)) == "show table ") return EXEC_SHOW_TABLE();
	else if (lower(stc.substr(0, 7)) == "create ") return EXEC_CREATE();
	else if (lower(stc.substr(0, 7)) == "insert ") return EXEC_INSERT();
	else if (lower(stc.substr(0, 7)) == "delete ") return EXEC_DELETE();
	else if (lower(stc.substr(0, 7)) == "select ") return EXEC_SELECT();
	else if (lower(stc.substr(0, 5)) == "drop ") return EXEC_DROP();
	else if (lower(stc.substr(0, 9)) == "execfile ") return EXEC_FILE();
	else if (lower(stc.substr(0, 11)) == "show index ") return EXEC_show();
	else throw("Cannot recognize the instruction.");
}