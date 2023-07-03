#include<string>
#include<fstream>

#include"buffer.h"
#include"extras.h"
#include"record.h"
#include"catalog.h"
using namespace std;

extern RecordManager rec;
extern BufferManager Buffer;
catalog cata;

catalog::catalog() {
}

void catalog::buildIndexFromTable(string T, int Indexp, string I) {
	Table t = getTable(T);
	set<where> x = rec.selectAll(t);
	Index idx = getIndex(I);
	BPTree tree(idx);
	for (auto i = x.begin();i != x.end();++i) {
		where pos = *i;
		Tuple tuple = getTuple(t, pos);
		tree.insert(tree.root, IndexType(tuple.data[Indexp], pos));
	}
}

Tuple catalog::getTuple(Table t, where posw) {
	int No = Buffer.getBufferNum(posw.FILENAME, posw.Block);
	Tuple tp(t.Attributes.size());
	int pos = posw.Location;
	tp.size = t.Attributes.size();
	for (int i = 0;i < tp.size;++i) {
		Data data(t.Attributes[i].Type, &Buffer.Blocks[No].values[pos]);
		pos += data.size();
		tp.data.push_back(data);
	}
	return tp;
}

set<where> catalog::getTupleFrom(Table t, int Block) {
	int No = Buffer.getBufferNum(t.TName + ".table", Block);
	set<where> ret;
	int size = t.dataSize();
	int CAP = BlockSize / size;
	for (int num = 0;num < CAP;++num) {
		if (Buffer.Blocks[No].values[num*size] == '#') continue;
		ret.insert(where(t.TName + ".table", Block, num*size));
	}
	Buffer.useBlock(No);
	return ret;
}

int catalog::eraseTupleFrom(Table t, where posw) {
	int No = Buffer.getBufferNum(posw.FILENAME, posw.Block);
	int size = t.dataSize();
	memset(&Buffer.Blocks[No].values[posw.Location], '#', sizeof(char)*size);
	Buffer.setWritten(No);
	return 1;
}

bool catalog::hasTable(string s) {
	ifstream file;
	file.open(s + ".table");
	if (file.is_open()) {
		file.close();
		return 1;
	}
	else return 0;
}

bool catalog::hasIndex(string s) {
	ifstream file;
	file.open(s + ".index");
	if (file.is_open()) {
		file.close();
		return 1;
	}
	else return 0;
}

Table catalog::getTable(string s) {
	vector<Attribute> atr;
	int AtrSize, BlockCnt, Primary;

	int FirstBlock = Buffer.getBufferNum(s + ".table", 0);
	char* begin = Buffer.Blocks[FirstBlock].values;
	int pos = 0;

	memcpy(&AtrSize, &begin[pos], sizeof(int));
	pos = pos + sizeof(int);
	memcpy(&BlockCnt, &begin[pos], sizeof(int));
	pos = pos + sizeof(int);
	memcpy(&Primary, &begin[pos], sizeof(int));
	pos = pos + sizeof(int);

	for (int i = 0;i < AtrSize;++i) atr.push_back(Attribute("", "", 0, 0));

	for (int i = 0;i < AtrSize;++i) {
		atr[i].Name = &begin[pos];
		pos += (atr[i].Name.length() + 1) * sizeof(char);
	}

	for (int i = 0;i < AtrSize;++i) {
		memcpy(&atr[i].Type, &begin[pos], sizeof(int));
		pos = pos + sizeof(int);
	}

	for (int i = 0;i < AtrSize;++i) {
		memcpy(&atr[i].Unique, &begin[pos], sizeof(bool));
		pos = pos + sizeof(bool);
	}

	for (int i = 0;i < AtrSize;++i) {
		atr[i].IndexName = &begin[pos];
		pos += (atr[i].IndexName.length() + 1) * sizeof(char);
	}

	Buffer.setWritten(FirstBlock);
	return Table(s, atr, BlockCnt, Primary);
}

Index catalog::getIndex(string s) {
	string TableNm;
	int Type;

	int FirstBlock = Buffer.getBufferNum(s + ".index", 0);
	char* begin = Buffer.Blocks[FirstBlock].values;
	int pos = 0, BC, RB, RL;

	TableNm = &begin[pos];
	pos += (TableNm.length() + 1) * sizeof(char);

	memcpy(&BC, &begin[pos], sizeof(int));
	pos += sizeof(int);
	memcpy(&Type, &begin[pos], sizeof(int));
	pos += sizeof(int);
	memcpy(&RB, &begin[pos], sizeof(int));
	pos += sizeof(int);
	memcpy(&RL, &begin[pos], sizeof(int));
	pos += sizeof(int);

	Buffer.setWritten(FirstBlock);
	return Index(s, TableNm, Type, BC, RB, RL);
}

void catalog::dropTable(string s) {
	if (!hasTable(s)) throw("Table name invalid.");
	Buffer.writeFile(s + ".table");
	remove((s + ".table").c_str());
}

void catalog::dropIndex(string s) {
	if (!hasIndex(s)) throw("Index name invalid.");
	Buffer.writeFile(s + ".index");
	remove((s + ".index").c_str());
}

void catalog::modifyTableInfo(Table t) {
	int No = Buffer.getBufferNum(t.TName + ".table", 0);

	char* begin = Buffer.Blocks[No].values;
	int pos = 0, bn = t.BlockCnt, AtrSize = t.Attributes.size();

	memcpy(&begin[pos], &AtrSize, sizeof(int));
	pos = pos + sizeof(int);
	memcpy(&begin[pos], &bn, sizeof(int));
	pos = pos + sizeof(int);
	memcpy(&begin[pos], &t.PrimaryKey, sizeof(int));
	pos = pos + sizeof(int);

	for (int i = 0; i < AtrSize; ++i) {
		memcpy(&begin[pos], t.Attributes[i].Name.c_str(), (t.Attributes[i].Name.length() + 1) * sizeof(char));
		pos = pos + (t.Attributes[i].Name.length() + 1) * sizeof(char);
	}

	for (int i = 0; i < AtrSize; ++i) {
		memcpy(&begin[pos], &t.Attributes[i].Type, sizeof(int));
		pos = pos + sizeof(int);
	}

	for (int i = 0; i < AtrSize; ++i) {
		memcpy(&begin[pos], &t.Attributes[i].Unique, sizeof(bool));
		pos = pos + sizeof(bool);
	}

	for (int i = 0; i < AtrSize; ++i) {
		memcpy(&begin[pos], t.Attributes[i].IndexName.c_str(), (t.Attributes[i].IndexName.length() + 1) * sizeof(char));
		pos = pos + (t.Attributes[i].IndexName.length() + 1) * sizeof(char);
	}

	Buffer.setWritten(No);
}

void catalog::createTable(string s, vector<Attribute> &atr, int Primary) {
	if (hasTable(s)) throw("Table already exists.");
	if (0 <= Primary && Primary < (int)atr.size()) atr[Primary].Unique = true;
	else throw("Primary Key out of range.");

	fstream fout(s + ".table", ios::out);
	fout.close();

	atr[Primary].IndexName = s + "_prm";
	modifyTableInfo(Table(s, atr, 0, Primary));

	createIndex(s, Primary, s + "_prm");
}

void catalog::modifyIndexInfo(Index idx) {
	int No = Buffer.getBufferNum(idx.IDXName + ".index", 0);

	char* begin = Buffer.Blocks[No].values;
	int pos = 0;

	memcpy(&begin[pos], idx.Table.c_str(), sizeof(char)*(idx.Table.length() + 1));
	pos += sizeof(char)*(idx.Table.length() + 1);
	memcpy(&begin[pos], &idx.BlockCnt, sizeof(int));
	pos += sizeof(int);
	memcpy(&begin[pos], &idx.DataType, sizeof(int));
	pos += sizeof(int);
	memcpy(&begin[pos], &idx.RootB, sizeof(int));
	pos += sizeof(int);
	memcpy(&begin[pos], &idx.RootL, sizeof(int));
	pos += sizeof(int);

	Buffer.setWritten(No);
}

void catalog::createIndex(string Tname, int Indexp, string Iname) {
	if (hasIndex(Iname)) throw("Index already exists.");
	Table t = getTable(Tname);
	if (t.Attributes[Indexp].Unique == 0) throw("Attribute not Unique");

	fstream fout(Iname + ".index", ios::out);
	fout.close();

	modifyIndexInfo(Index(Iname, Tname, t.Attributes[Indexp].Type, 0, 0, 0));

	buildIndexFromTable(Tname, Indexp, Iname);
}

void catalog::showTable(string s) {
	Table t = getTable(s);
	printf("%s:\n", s.c_str());
	int AtrSize = t.Attributes.size();
	for (int i = 0;i < AtrSize;++i) {
		printf("%s ", t.Attributes[i].Name.c_str());
		printf("%s ", t.Attributes[i].IndexName.c_str());
		if (t.Attributes[i].Type == -1) printf("int ");
		else if (t.Attributes[i].Type == 0) printf("float ");
		else printf("char(%d) ", t.Attributes[i].Type);
		if (t.Attributes[i].Unique) printf("unique ");
		if (i == t.PrimaryKey) printf("primary ");
		putchar('\n');
	}
}