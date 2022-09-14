#pragma once

struct BST {
private:
	struct node {
		int val;
		node* father;
		node* son[2];
		node(int x, node* f) :val(x), father(f) { son[0] = son[1] = NULL; }
	}*root;
	bool sonn(node* now) {
		return (now == NULL || now->father == NULL) ? 0 : now == now->father->son[1];
		//This "macro" is used to test if a node is a left son or a right son.
	}
	void connect(node* x, node* f, bool s) {
		if (x) x->father = f;
		if (f) f->son[s] = x;
		else root = x;
		//This "macro" is used to make x a son of f.
	}
	node* _extreme(node* now, bool x) {
		while (now->son[x]) now = now->son[x];
		return now;
		//Find max/min element in a non-empty subtree
	}
	void _insert(int x, node* now) {
		int nxt = (now->val < x);			//nxt is used to mark which son is the next considered
		while (now->son[nxt] != NULL) {
			now = now->son[nxt];
			nxt = (now->val < x);
		}
		now->son[nxt] = new node(x, now);	//Assign new node with key x
	}
	void _erase(int x, node* now) {
		while (now->val != x) now = now->son[now->val < x];							//Find the node with key x
		if (now->son[0] == NULL) connect(now->son[1], now->father, sonn(now));
		else if (now->son[1] == NULL) connect(now->son[0], now->father, sonn(now));	//0~1 son conditions
		else {
			node* alt = _extreme(now->son[1], 0);									//Find the successor
			connect(now->son[0], alt, 0);
			if (alt->father != now) {
				connect(alt->son[1], alt->father, 0);
				connect(now->son[1], alt, 1);
			}
			connect(alt, now->father, sonn(now));									//2 son conditions
		}
		//Replace the node with its successor, and do necessary connections.
		delete now;																	//Release the space occupied
	}
public:
	void insert(int x) {
		if (root == NULL) root = new node(x, NULL);
		else _insert(x, root);
	}
	void erase(int x) {
		_erase(x, root);
	}
};

double Opr_BST(int k, int n, int* memory);