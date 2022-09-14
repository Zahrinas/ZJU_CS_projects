#pragma once
namespace fib_heap {
	struct FibHeapNode
	{
		int key; // assume the element is int...
		FibHeapNode* left;
		FibHeapNode* right;
		FibHeapNode* parent;
		FibHeapNode* child;
		int degree;
		bool mark;
		int V; // for shortest path 
	};

	class FibHeap {
	public:
		FibHeapNode* m_minNode;
		int m_numOfNodes;

		FibHeap() {  // initialize a new and empty Fib Heap
			m_minNode = nullptr;
			m_numOfNodes = 0;
		}

		/* Insert a node with key value new_key
		   and return the inserted node*/
		FibHeapNode* insert(int id, int newKey);

		/* Merge current heap with another*/
		void merge(FibHeap& another);

		/* Return the key of the minimum node*/
		int  extract_min();

		/* Decrease the key of node x to newKey*/
		void decrease_key(FibHeapNode* x, int newKey);

		// private:
		FibHeapNode* _create_node(int id, int newKey);
		void _insert_node(FibHeapNode* newNode);
		void _remove_from_circular_list(FibHeapNode* x);
		FibHeapNode* _merge(FibHeapNode* a, FibHeapNode* b);
		void _make_child(FibHeapNode* child, FibHeapNode* parent);
		void _unparent_all(FibHeapNode* x);
		FibHeapNode* _extract_min_node();
		void _decrease_key(FibHeapNode* x, int newKey);
		void _cut(FibHeapNode* x, FibHeapNode* y);
		void _cascading_cut(FibHeapNode* y);

		void Zmerge_without_size(FibHeapNode* n);
		void _Zconsolidate();
		void Zlink(FibHeapNode* old, FibHeapNode* now);
		void Zlink_to(FibHeapNode* s, FibHeapNode* f);
	};
}

void Fib_Dijkstra(int x, int t, fib_heap::FibHeap& H);
void SP_Fib();