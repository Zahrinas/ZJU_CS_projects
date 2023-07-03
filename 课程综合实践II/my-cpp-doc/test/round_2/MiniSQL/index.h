#pragma once

#include<map>

#include"types.h"
using namespace std;

struct IndexType {
	Data data;
	where pos;
	IndexType();
	IndexType(Data d, where pos);

	bool operator<(const IndexType& ano) const;
	bool operator==(const IndexType& ano) const;
};

struct BPTree {
	struct Node {
		IndexType data[3 + 1];
		Node* son[3 + 1];
		bool avai[3 + 1];
		Node* father;
		int size;
		bool leaf;
		int Block, Location;

		Node(Node* f, Index& idx, bool isleaf);
		Node(Node* f, int DataType, where posw, string FILENAME);

		~Node();

		vector<char> toString();
		int getSize(int dataTpye);
	}*root;
	Index idx;

	BPTree(Index idx);

	~BPTree();

	void writeBack(Node* now);

	void insert_by_order(IndexType t, Node* p, bool avai, Node* now);
	void rejust(Node* now);

	void insert(Node* now, IndexType t);
	void erase(Node* now, Data key);
	void print(Node* now);

	set<where> search(Node* now, Data key);
	set<where> searchUR(Node* now, Data keyR, bool contain);
	set<where> searchLU(Node* now, Data keyL, bool contain);
};