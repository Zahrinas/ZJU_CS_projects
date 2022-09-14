#pragma once

#include<stack>

#include"fibheap.h"

using namespace fib_heap;
struct memory_poll {
	FibHeapNode* Poll;
	std::stack<int> stk;
	memory_poll(int x);
	FibHeapNode* getnew();
	void getdelete(FibHeapNode* x);
};//a memory pool only for That FibHeap Realization