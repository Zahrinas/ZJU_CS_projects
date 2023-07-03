#pragma once

#include<set>
#include<string>
#include<vector>

using namespace std;

typedef enum {
	eq, neq, lt, gt, leq, geq
} Compare;

struct where {
	string FILENAME;
	int Block;
	int Location;

	where();
	where(string FILENAME, int Block, int Loc);
	bool operator<(const where& opd) const;
};

struct Data {
	int Type;
	void* p;

	Data();
	Data(int x);
	Data(float x);
	Data(string x, int Len);
	Data(const Data &opd);
	Data(int type, char* src);

	~Data();

	int size();
	int valueInt() const;
	float valueFloat() const;
	string valueString() const;
	void writeTo(void* dst);

	bool operator<(const Data &opd) const;
	bool operator>(const Data &opd) const;
	bool operator==(const Data &opd) const;
	bool operator!=(const Data &opd) const;
	bool operator>=(const Data &opd) const;
	bool operator<=(const Data &opd) const;

	const Data& operator=(const Data &opd);
};

struct Attribute {
	int Type;
	string Name;
	bool Unique;
	string IndexName;

	Attribute(string N, string I, int T, bool U);
	int size();
};

struct condition {
	int attr;
	Compare comp;
	Data data;

	condition(int attr, Compare comp, Data data);
};

struct Tuple {
	vector<Data> data;
	int size;

	Tuple(int s);
	vector<char> toString();
	void output(set<int> attrid) const;
};

struct Index {
	string IDXName;
	string Table;
	int DataType;
	int BlockCnt;
	int RootB, RootL;

	Index(string IDX, string TLB, int DataT, int BlockCnt, int RB, int RL);
};

struct Table {
	string TName;

	vector<Attribute> Attributes;
	int PrimaryKey;

	int BlockCnt;

	Table(string name, vector<Attribute> attr, int BlockCnt, int prim);

	int dataSize();
};