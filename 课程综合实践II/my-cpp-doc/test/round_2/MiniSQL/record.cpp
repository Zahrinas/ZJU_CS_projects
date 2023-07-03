#include<set>
#include<iostream>
#include<algorithm>

#include"types.h"
#include"index.h"
#include"extras.h"
#include"record.h"
using namespace std;

extern BufferManager Buffer;
extern catalog cata;
RecordManager rec;

void RecordManager::insertIntoIndex(Index idx, IndexType t) {
	BPTree tree(idx);
	tree.insert(tree.root, t);
}

void RecordManager::deleteFromIndex(Index idx, Data key) {
	BPTree tree(idx);
	tree.erase(tree.root, key);
}

set<where> RecordManager::indexSearch(Index idx, condition c) {
	BPTree tree(idx);
	switch (c.comp) {
	case eq:  return tree.search(tree.root, c.data);
	case lt:  return tree.searchUR(tree.root, c.data, 0);
	case gt:  return tree.searchLU(tree.root, c.data, 0);
	case leq: return tree.searchUR(tree.root, c.data, 1);
	case geq: return tree.searchLU(tree.root, c.data, 1);
	default: {
		set<where> LU = tree.searchLU(tree.root, c.data, 0);
		set<where> UR = tree.searchUR(tree.root, c.data, 0);
		for (auto i = UR.begin();i != UR.end();++i) LU.insert(*i);
		return LU;
	}
	}
}

bool RecordManager::multiUnique(Table table, int Indexp, Tuple tuple) {
	vector<condition> c;
	c.push_back(condition(Indexp, eq, tuple.data[Indexp]));
	return select(table, c, 0).size();
}

void RecordManager::insert(Table table, Tuple tuple) {
	where pos = Buffer.whereToInsert(table.TName + ".table", table.dataSize(), table.BlockCnt);
	cata.modifyTableInfo(table);
	int Asize = table.Attributes.size();
	Buffer.insertTo(pos, tuple.toString());
	for (int i = 0;i < Asize;++i) if (table.Attributes[i].IndexName != "#") {
		Index Idx = cata.getIndex(table.Attributes[i].IndexName);
		insertIntoIndex(Idx, IndexType(tuple.data[i], pos));
	}
}

void RecordManager::deleteTuple(Table t, vector<condition> conds, bool Or) {
	set<where> selection;
	if (conds.size()) selection = select(t, conds, Or);
	else selection = selectAll(t);
	for (auto i = selection.begin();i != selection.end();++i) {
		Tuple tuple = cata.getTuple(t, *i);
		cata.eraseTupleFrom(t, *i);
		for (int j = 0;j < (int)t.Attributes.size();++j) {
			if (t.Attributes[j].IndexName != "#") {
				Index idx = cata.getIndex(t.Attributes[j].IndexName);
				deleteFromIndex(idx, tuple.data[j]);
			}
		}
	}
	printf("%d row(s) deleted.", (int)selection.size());
}

set<where> RecordManager::selectAll(Table t) {
	set<where> ret, res;
	for (int i = 1;i <= t.BlockCnt;++i) {
		res = cata.getTupleFrom(t, i);
		for (auto j = res.begin();j != res.end();++j) {
			ret.insert(*j);
		}
	}
	return ret;
}

set<where> RecordManager::selectByCond(Table t, condition c) {
	if (t.Attributes[c.attr].IndexName != "#") {
		Index idx = cata.getIndex(t.Attributes[c.attr].IndexName);
		return indexSearch(idx, c);
	}
	set<where> ret, res;
	for (int i = 1;i <= t.BlockCnt;++i) {
		res = cata.getTupleFrom(t, i);
		for (auto j = res.begin();j != res.end();++j) {
			if (satisfy(cata.getTuple(t, *j), c)) ret.insert(*j);
		}
	}
	return ret;
}

set<where> RecordManager::select(Table t, vector<condition> conds, bool Or) {
	int Csize = conds.size();
	set<where> ret, res, tmp;
	if (Csize == 0) ret = selectAll(t);
	else {
		bool first = 1;
		for (int i = 0;i < Csize;++i) {
			if (first) {
				ret = selectByCond(t, conds[i]);
				first = 0;
			}
			else {
				res = selectByCond(t, conds[i]);
				if (Or) {
					set_union(ret.begin(), ret.end(), res.begin(), res.end(), inserter(tmp, tmp.begin()));
				}
				else set_intersection(ret.begin(), ret.end(), res.begin(), res.end(), inserter(tmp, tmp.begin()));
				ret = tmp;
				tmp.clear();
			}
		}
	}
	return ret;
}