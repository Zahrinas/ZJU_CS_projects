#include"memorypoll.h"
memory_poll::memory_poll(int x) {
	Poll = new FibHeapNode[x];
	for (int i = 0;i < x;++i) stk.push(i);
}
FibHeapNode* memory_poll::getnew() {
	int ret = stk.top();
	stk.pop();
	return Poll + ret;
}
void memory_poll::getdelete(FibHeapNode* x) {
	stk.push(x - Poll);
}

//A simple memory pool.
//Available memory is put in the stack in the form of shift address.