#include<queue>
#include<iostream>

#include"index.h"
#include"buffer.h"
#include"catalog.h"
using namespace std;

extern catalog cata;
extern BufferManager Buffer;
extern char Temp[65536];

static BPTree::Node* Pre;

IndexType::IndexType() {
}

IndexType::IndexType(Data d, where pos) :data(d), pos(pos) {
}

bool IndexType::operator<(const IndexType& ano) const {
	return data < ano.data;
}

bool IndexType::operator==(const IndexType& ano) const {
	return data == ano.data;
}

BPTree::Node::Node(Node* f, Index& idx, bool isleaf) :father(f), size(0), leaf(isleaf) {
	where pos = Buffer.whereToInsert(idx.IDXName + ".index", getSize(idx.DataType), idx.BlockCnt);
	cata.modifyIndexInfo(idx);
	Block = pos.Block;
	Location = pos.Location;
}

BPTree::Node::Node(Node* f, int DataType, where posw, string FILENAME)
	: father(f), Block(posw.Block), Location(posw.Location) {
	int No = Buffer.getBufferNum(posw.FILENAME, posw.Block);
	char* begin = Buffer.Blocks[No].values;
	int pos = posw.Location, Block, Location;

	memcpy(&leaf, &begin[pos], sizeof(bool));
	pos += sizeof(bool);
	memcpy(&size, &begin[pos], sizeof(int));
	pos += sizeof(int);
	if (leaf) {
		if (Pre) Pre->son[3] = this;
		Pre = this;
		for (int i = 0;i < size;++i) {
			data[i].data = Data(DataType, &begin[pos]);
			pos += data[i].data.size();
			data[i].pos.FILENAME = FILENAME;
			memcpy(&data[i].pos.Block, &begin[pos], sizeof(int));
			pos += sizeof(int);
			memcpy(&data[i].pos.Location, &begin[pos], sizeof(int));
			pos += sizeof(int);
			memcpy(&avai[i], &begin[pos], sizeof(bool));
			pos += sizeof(bool);
		}
	}
	else {
		for (int i = 0;i < size;++i) {
			data[i].data = Data(DataType, &begin[pos]);
			pos += data[i].data.size();
			memcpy(&Block, &begin[pos], sizeof(int));
			pos += sizeof(int);
			memcpy(&Location, &begin[pos], sizeof(int));
			pos += sizeof(int);
			son[i] = new Node(this, DataType, where(posw.FILENAME, Block, Location), FILENAME);
		}
	}
	Buffer.useBlock(No);
}

BPTree::Node::~Node() {
}

vector<char> BPTree::Node::toString() {
	int pos = 0;
	memcpy(&Temp[pos], &leaf, sizeof(bool));
	pos += sizeof(bool);
	memcpy(&Temp[pos], &size, sizeof(int));
	pos += sizeof(int);
	if (leaf) {
		for (int i = 0;i < size;++i) {
			data[i].data.writeTo(&Temp[pos]);
			pos += data[i].data.size();
			memcpy(&Temp[pos], &data[i].pos.Block, sizeof(int));
			pos += sizeof(int);
			memcpy(&Temp[pos], &data[i].pos.Location, sizeof(int));
			pos += sizeof(int);
			memcpy(&Temp[pos], &avai[i], sizeof(bool));
			pos += sizeof(bool);
		}
	}
	else {
		for (int i = 0;i < size;++i) {
			data[i].data.writeTo(&Temp[pos]);
			pos += data[i].data.size();
			memcpy(&Temp[pos], &son[i]->Block, sizeof(int));
			pos += sizeof(int);
			memcpy(&Temp[pos], &son[i]->Location, sizeof(int));
			pos += sizeof(int);
		}
	}
	return vector<char>(Temp, Temp + pos);
}

int BPTree::Node::getSize(int dataType) {
	int ret = 0;
	ret += sizeof(bool);
	ret += sizeof(int);
	ret += 3 * (2 * sizeof(int));
	if (dataType == -1) ret += 3 * sizeof(int);
	else if (dataType == 0) ret += 3 * sizeof(float);
	else ret += 3 * sizeof(char)*(dataType + 1);
	ret += 3 * sizeof(bool);
	return ret;
}

BPTree::BPTree(Index id) :idx(id) {
	if (idx.RootB == 0) {
		root = new Node(0, idx, 1);
		return;
	}
	Pre = 0;
	root = new Node(0, idx.DataType, where(idx.IDXName + ".index", idx.RootB, idx.RootL), idx.Table + ".table");
	Pre->son[3] = 0;
}

BPTree::~BPTree() {
	idx.RootB = root->Block;
	idx.RootL = root->Location;
	cata.modifyIndexInfo(idx);
	writeBack(root);
}

void BPTree::writeBack(Node* now) {
	Buffer.insertTo(where(idx.IDXName + ".index", now->Block, now->Location), now->toString());
	if (!now->leaf) for (int i = 0;i < now->size;++i) writeBack(now->son[i]);
	delete now;
}

void BPTree::insert_by_order(IndexType t, Node* p, bool avai, Node* now) {
	++now->size;
	for (int i = 0; i < now->size; ++i) {
		if (i == now->size - 1 || t < now->data[i]) {
			for (int j = now->size - 1; j > i; --j) {
				now->data[j] = now->data[j - 1];
				now->son[j] = now->son[j - 1];
				now->avai[j] = now->avai[j - 1];
			}
			now->data[i] = t;
			now->son[i] = p;
			now->avai[i] = avai;
			return;
		}
		else if (t == now->data[i]) {
			--now->size;
			now->avai[i] = avai;
			return;
		}
	}
}

void BPTree::rejust(Node* now) {
	int pos = 0;
	Node *f = now->father;
	if (f) {
		for (int i = 0; i < f->size; ++i) if (f->son[i] == now) pos = i;
		f->data[pos] = now->data[0];
		if (now->size == 3 + 1) {
			Node *nxt = new Node(f, idx, now->leaf);
			insert_by_order(now->data[2], now->son[2], now->avai[2], nxt);
			insert_by_order(now->data[3], now->son[3], now->avai[3], nxt);
			if (now->leaf) {
				now->son[3] = nxt;
			}
			else {
				now->son[2]->father = nxt;
				now->son[3]->father = nxt;
			}
			now->size = 2;
			insert_by_order(nxt->data[0], nxt, 0, f);
		}
		rejust(f);
	}
	else if (now->size == 3 + 1) {
		root = now->father = f = new Node(0, idx, 0);
		Node *nxt = new Node(f, idx, now->leaf);
		insert_by_order(now->data[2], now->son[2], now->avai[2], nxt);
		insert_by_order(now->data[3], now->son[3], now->avai[3], nxt);
		if (now->leaf) {
			now->son[3] = nxt;
		}
		else {
			now->son[2]->father = nxt;
			now->son[3]->father = nxt;
		}
		now->size = 2;
		insert_by_order(now->data[0], now, 0, f);
		insert_by_order(nxt->data[0], nxt, 0, f);
	}
}

void BPTree::insert(Node* now, IndexType t) {
	if (now->leaf) {
		insert_by_order(t, NULL, 1, now);
		rejust(now);
	}
	else {
		for (int i = now->size - 1; i >= 0; --i)
			if (!(t < now->data[i]) || i == 0) {
				insert(now->son[i], t);
				return;
			}
	}
}

void BPTree::erase(Node* now, Data key) {
	for (int i = now->size - 1;i >= 0;--i) {
		if (!(key < now->data[i].data)) {
			if (now->leaf) now->avai[i] = 0;
			else erase(now->son[i], key);
			return;
		}
	}
}

void BPTree::print(Node* now){
	queue<Node*> q[2];
	bool n=1;
	q[n].push(now);
	while(!q[n].empty()){
		Node* p=q[n].front();
		q[n].pop();
		if(p->leaf){
			cout<<'(';
			for(int i=0;i<p->size;++i){
				if(idx.DataType==-1) cout<<p->data[i].data.valueInt()<<' ';
				else if(idx.DataType==0) cout<<p->data[i].data.valueFloat()<<' ';
				else cout<<p->data[i].data.valueString()<<' ';
			}
			cout<<')';
		}else{
			cout<<'(';
			for(int i=0;i<p->size;++i){
				if(idx.DataType==-1) cout<<p->data[i].data.valueInt()<<' ';
				else if(idx.DataType==0) cout<<p->data[i].data.valueFloat()<<' ';
				else cout<<p->data[i].data.valueString()<<' ';
				q[n^1].push(p->son[i]);
			}
			cout<<')';
		}
		if(q[n].empty()){
			n^=1;
			cout<<endl;
		}
	}
}

set<where> BPTree::search(Node* now, Data key) {
	for (int i = now->size - 1;i >= 0;--i) {
		if (now->data[i].data <= key) {
			if (now->leaf) {
				set<where> ret;
				if (now->avai[i] && now->data[i].data == key) ret.insert(now->data[i].pos);
				return ret;
			}
			else return search(now->son[i], key);
		}
	}
	return set<where>();
}

set<where> BPTree::searchUR(Node* now, Data keyR, bool contain) {
	if (now->leaf) {
		set<where> ret;
		int i = 0;
		while (now && (now->data[i].data < keyR || (contain&&now->data[i].data == keyR))) {
			if (now->avai[i]) ret.insert(now->data[i].pos);
			if (i + 1 == now->size) i = 0, now = now->son[3];
			else ++i;
		}
		return ret;
	}
	else return searchUR(now->son[0], keyR, contain);
}

set<where> BPTree::searchLU(Node* now, Data keyL, bool contain) {
	for (int i = now->size - 1;i >= 0;--i) {
		if (now->data[i].data <= keyL) {
			if (now->leaf) {
				set<where> ret;
				if (now->avai[i] && contain&&now->data[i].data == keyL) ret.insert(now->data[i].pos);
				if (i + 1 == now->size) i = 0, now = now->son[3];
				else ++i;
				while (now) {
					if (now->avai[i]) ret.insert(now->data[i].pos);
					if (i + 1 == now->size) i = 0, now = now->son[3];
					else ++i;
				}
				return ret;
			}
			else return searchLU(now->son[i], keyL, contain);
		}
	}
	return set<where>();
}