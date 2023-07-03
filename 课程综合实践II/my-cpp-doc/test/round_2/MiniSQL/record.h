#pragma once

#include"types.h"
#include"buffer.h"
#include"catalog.h"
using namespace std;

struct RecordManager {
	bool multiUnique(Table table, int Indexp, Tuple tuple);
	void insertIntoIndex(Index idx, IndexType t);
	void deleteFromIndex(Index idx, Data key);
	void insert(Table table, Tuple tuple);
	void deleteTuple(Table t, vector<condition> conds, bool Or);

	set<where> indexSearch(Index idx, condition c);
	set<where> selectAll(Table t);
	set<where> selectByCond(Table t, condition c);
	set<where> select(Table t, vector<condition> conds, bool Or);
};

