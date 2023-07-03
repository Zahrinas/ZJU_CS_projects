#include<cstring>
#include<iostream>

#include"types.h"
#include"index.h"
using namespace std;

char Temp[65536];

where::where() {
}

where::where(string FILENAME, int Block, int Loc) :
	FILENAME(FILENAME), Block(Block), Location(Loc) {
}

bool where::operator<(const where& opd) const {
	if (Block == opd.Block) return Location < opd.Location;
	return Block < opd.Block;
}

Data::Data() :Type(-1), p(new int()) {
}

Data::Data(int x) : Type(-1), p(new int(x)) {
}

Data::Data(float x) : Type(0), p(new float(x)) {
}

Data::Data(string x, int Len) : Type(Len), p(new string(x)) {
}

Data::Data(const Data &opd) : Type(opd.Type) {
	if (Type == -1) {
		p = new int();
		*(int *)p = opd.valueInt();
	}
	else if (Type == 0) {
		p = new float();
		*(float *)p = opd.valueFloat();
	}
	else p = new string(opd.valueString());
}

Data::Data(int type, char* src) :Type(type) {
	if (Type == -1) {
		p = new int();
		memcpy(p, src, sizeof(int));
	}
	else if (Type == 0) {
		p = new float();
		memcpy(p, src, sizeof(float));
	}
	else {
		p = new string();
		for (int i = 0;i < type;++i) {
			if (src[i]) *(string*)p += src[i];
			else return;
		}
	}
}

Data::~Data() {
	if (Type == -1) delete (int*)p;
	else if (Type == 0) delete (float*)p;
	else delete (string*)p;
}

int Data::valueInt() const {
	if (Type == -1) return *(int *)p;
	else throw("Illegal Type Cast");
}

float Data::valueFloat() const {
	if (Type == 0) return *(float *)p;
	else throw("Illegal Type Cast");
}

string Data::valueString() const {
	if (Type > 0) return *(string *)p;
	else throw("Illegal Type Cast");
}

int Data::size() {
	if (Type == -1) return sizeof(int);
	if (Type == 0) return sizeof(float);
	return sizeof(char)*(Type + 1);
}

void Data::writeTo(void* dst) {
	if (Type == -1) memcpy(dst, p, sizeof(int));
	else if (Type == 0) memcpy(dst, p, sizeof(float));
	else {
		string v = valueString();
		memset(dst, 0, sizeof(char)*(Type + 1));
		memcpy(dst, v.c_str(), sizeof(char)*(v.length() + 1));
	}
}

bool Data::operator<(const Data &opd) const {
	if (Type == -1) return valueInt() < opd.valueInt();
	if (Type == 0) return valueFloat() < opd.valueFloat();
	return valueString() < opd.valueString();
}

bool Data::operator>(const Data &opd) const {
	return opd < *this;
}

bool Data::operator!=(const Data &opd) const {
	return (*this < opd) || (*this > opd);
}

bool Data::operator==(const Data &opd) const {
	return !(*this != opd);
}

bool Data::operator<=(const Data &opd) const {
	return !(*this > opd);
}

bool Data::operator>=(const Data &opd) const {
	return !(*this < opd);
}

const Data& Data::operator=(const Data &opd) {
	if (Type == -1) delete (int*)p;
	else if (Type == 0) delete (float*)p;
	else delete (string*)p;

	Type = opd.Type;
	if (Type == -1) {
		p = new int();
		*(int *)p = opd.valueInt();
	}
	else if (Type == 0) {
		p = new float();
		*(float *)p = opd.valueFloat();
	}
	else p = new string(opd.valueString());
	return *this;
}

Attribute::Attribute(string N, string I, int T, bool U) :
	Type(T), Name(N), Unique(U), IndexName(I) {
}

int Attribute::size() {
	if (Type == -1) return sizeof(int);
	else if (Type == 0) return sizeof(float);
	else return sizeof(char) * (Type + 1);
}

condition::condition(int attr, Compare comp, Data data) :
	attr(attr), comp(comp), data(data) {
}

Tuple::Tuple(int s) : size(s) {
}

void Tuple::output(set<int> attrid) const {
	for (auto i = attrid.begin();i != attrid.end();++i) {
		if (data[*i].Type == -1) cout << data[*i].valueInt() << ' ';
		else if (data[*i].Type == 0) cout << data[*i].valueFloat() << ' ';
		else cout << data[*i].valueString() << ' ';
	}
	cout << endl;
}

vector<char> Tuple::toString() {
	int pos = 0;
	for (int i = 0;i < size;++i) {
		data[i].writeTo(&Temp[pos]);
		pos += data[i].size();
	}
	return vector<char>(Temp, Temp + pos);
}

Index::Index(string IDX, string TLB, int DataT, int BlockCnt, int RB, int RL) :
	IDXName(IDX), Table(TLB), DataType(DataT), BlockCnt(BlockCnt), RootB(RB), RootL(RL) {
}

Table::Table(std::string name, std::vector<Attribute> attr, int BlockCnt, int prim)
	: TName(name), Attributes(attr), PrimaryKey(prim), BlockCnt(BlockCnt) {
}

int Table::dataSize() {
	int ret = 0;
	for (int i = 0; i < int(Attributes.size()); ++i)
		ret += Attributes[i].size();
	return ret;
}