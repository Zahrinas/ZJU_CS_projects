#pragma once
#include "types.h"

struct APICLASS {
	void insertTuple(Table table, Tuple tuple);
	void deleteTuple(Table t, vector<condition> conds, bool Or);
	set<where> select(Table t, vector<condition> conds, bool Or);
};