#include"API.h"
#include"record.h"
#include"buffer.h"
#include"catalog.h"
using namespace std;

extern RecordManager rec;
APICLASS API;

void APICLASS::insertTuple(Table table, Tuple tuple) {
	for (int i = 0;i < (int)table.Attributes.size();++i) if (table.Attributes[i].Unique) {
		if (rec.multiUnique(table, i, tuple)) throw("Duplicated unique value.");
	}
	rec.insert(table, tuple);
}

void APICLASS::deleteTuple(Table t, vector<condition> conds, bool Or) {
	rec.deleteTuple(t, conds, Or);
}

set<where> APICLASS::select(Table t, vector<condition> conds, bool Or) {
	return rec.select(t, conds, Or);
}