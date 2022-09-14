#include<stack>
#include<cmath>

#include"memorypoll.h"
#include"fibheap.h"

fib_heap::FibHeapNode** A;	//Supplementary Array in FibHeap Consolidation

memory_poll* mp;			//The pointer to memory pool.

namespace fib_heap {

	FibHeapNode* FibHeap::insert(int id, int newKey)
	{
		FibHeapNode* newNode = _create_node(id, newKey);
		_insert_node(newNode);
		return newNode;
	}

	void FibHeap::merge(FibHeap& another)
	{
		m_minNode = _merge(m_minNode, another.m_minNode);
		m_numOfNodes += another.m_numOfNodes;
		another.m_minNode = nullptr; // so that another 
		another.m_numOfNodes = 0;
	}

	int  FibHeap::extract_min()
	{
		FibHeapNode* minNode = _extract_min_node();
		int ret = minNode->key;
		mp->getdelete(minNode);
		return ret;
	}

	FibHeapNode* FibHeap::_create_node(int id, int newKey)
	{
		FibHeapNode* newNode = mp->getnew();
		newNode->V = id;
		newNode->key = newKey;
		newNode->left = newNode;
		newNode->right = newNode;
		newNode->parent = nullptr;
		newNode->child = nullptr;
		newNode->degree = 0;
		newNode->mark = false;
		return newNode;
	}


	void FibHeap::_insert_node(FibHeapNode* newNode)
	{
		m_minNode = _merge(m_minNode, newNode);
		m_numOfNodes++;
	}


	/*******************************************************************
	* Remove x from its circular list
	* Without changing the content of x
	* Without freeing x's memory space
	*******************************************************************/
	void FibHeap::_remove_from_circular_list(FibHeapNode* x)
	{
		if (x->right == x) // the root list only has one node before the operation
		{
			return;
		}
		FibHeapNode* leftSib = x->left;
		FibHeapNode* rightSib = x->right;
		leftSib->right = rightSib;
		rightSib->left = leftSib;
	}


	FibHeapNode* FibHeap::_merge(FibHeapNode* a, FibHeapNode* b)
	{
		if (a == nullptr)
			return b;
		if (b == nullptr)
			return a;
		if (a->key > b->key) // swap node 
		{
			FibHeapNode* temp = a;
			a = b;
			b = temp;
		}
		FibHeapNode* aRight = a->right;
		FibHeapNode* bLeft = b->left;
		a->right = b;
		b->left = a;
		aRight->left = bLeft;
		bLeft->right = aRight;

		return a;
	}


	/***********************************************************
	 * Rearrange the heap
	 * Update the m_minNode
	 * Return the current minimum node
	***********************************************************/
	FibHeapNode* FibHeap::_extract_min_node()
	{
		FibHeapNode* min = m_minNode;
		if (min != nullptr) // the heap is not empty
		{
			_unparent_all(min->child);
			_merge(min, min->child); // merge the child circular list into root
			_remove_from_circular_list(min);
			if (min == min->right) // the heap will be empty after the operation
				m_minNode = nullptr;
			else
			{
				m_minNode = min->right; // minNode need not be the minimum at this time
				_Zconsolidate();
			}
			m_numOfNodes--;
		}
		return min;
	}

	/*make all nodes' parent nullptr in a circular list*/
	void FibHeap::_unparent_all(FibHeapNode* x)
	{
		if (x == nullptr)
			return;
		FibHeapNode* y = x;
		do {
			y->parent = nullptr;
			y = y->right;
		} while (y != x);
	}

	void FibHeap::Zlink_to(FibHeapNode* s, FibHeapNode* f) {
		_remove_from_circular_list(s);
		if (!f->child) f->child = s, s->left = s->right = s;
		else Zlink(f->child, s);
		s->parent = f;
		++f->degree;
		s->mark = 0;
	}//Make s a son of f

	void FibHeap::Zmerge_without_size(FibHeapNode* n) {
		if (!m_minNode) {
			m_minNode = n;
			n->left = n->right = n;
		}
		else {
			Zlink(m_minNode, n);
			n->parent = 0;
			if (n->key < m_minNode->key) m_minNode = n;
		}
	}//Add n to the root list without size change

	void FibHeap::_Zconsolidate()
	{
		std::stack<FibHeapNode*> stk;
		int D = log2(m_numOfNodes) / log2(1.618);
		for (int i = 0;i <= D;++i) A[i] = 0;
		stk.push(m_minNode);
		for (FibHeapNode* x = m_minNode->right;x != m_minNode;x = x->right) stk.push(x);
		while (!stk.empty()) {				//Use a stack to guarantee every node in root list is dealt
			FibHeapNode* x = stk.top();
			stk.pop();
			int d = x->degree;
			while (A[d]) {
				FibHeapNode* y = A[d];
				if (y->key < x->key) std::swap(x, y);
				Zlink_to(y, x);
				A[d] = 0;
				++d;						//Merge on degree d.
			}
			A[d] = x;
		}
		m_minNode = 0;
		for (int i = 0;i <= D;++i) if (A[i]) Zmerge_without_size(A[i]);
	}//Rebuild the heap after deletion.

	void FibHeap::_make_child(FibHeapNode* child, FibHeapNode* parent)
	{
		_remove_from_circular_list(child);
		child->left = child->right = child;
		child->parent = parent;
		parent->child = _merge(parent->child, child); // add child into parent's children list
		parent->degree++;
		child->mark = false;
	}

	void FibHeap::Zlink(FibHeapNode* old, FibHeapNode* now) {
		now->right = old->right;
		now->left = old;
		old->right->left = now;
		old->right = now;
	}//Insert now to the list which old is in

	void FibHeap::_cut(FibHeapNode* x, FibHeapNode* y)
	{
		_remove_from_circular_list(x);
		if (x->right == x) // x is the only child of y
		{
			y->child = nullptr;
		}
		else
		{
			y->child = x->right; // update y's child 
		}
		y->degree--;
		Zlink(m_minNode, x);
		x->parent = nullptr;
		x->mark = false;
	}
	void FibHeap::_cascading_cut(FibHeapNode* y)
	{
		FibHeapNode* z = y->parent;
		if (z != nullptr)
		{
			if (y->mark == false)
				y->mark = true;
			else
			{
				_cut(y, z);
				_cascading_cut(z);
			}
		}
	}
	void FibHeap::_decrease_key(FibHeapNode* x, int newKey)
	{
		x->key = newKey;
		FibHeapNode* y = x->parent;
		if (y != nullptr && x->key < y->key)
		{
			_cut(x, y);
			_cascading_cut(y);
		}
		if (x->key < m_minNode->key)
			m_minNode = x;
	}
}