#pragma once

#define inf 0x3f3f3f3f

struct BinHeap {
	int Size;
	struct pair {
		int id, key;
	}*data;				//heap
	int* idpos;			//an assistant array to find the elements in O(1)

	~BinHeap() {
		delete[] data, delete[] idpos;
	}
	void initialize(int n) {
		Size = n;
		data = new pair[n + 1];
		idpos = new int[n + 1];
	}
	void clear(int n) {
		for (int i = 1;i <= n;++i) {
			data[i] = pair{ i,inf };
			idpos[i] = i;
		}
	}
	int top() { return data[1].id; }
	void pop() {
		data[1].key = inf;
		pair ret = data[1];
		int now = 1;
		while (1) {
			int nxt;
			if ((now << 1) <= Size) {
				if ((now << 1 | 1) <= Size && data[now << 1].key > data[now << 1 | 1].key) nxt = now << 1 | 1;
				else nxt = now << 1;	//Get which son to replace the original node
				data[now] = data[nxt];
				idpos[data[nxt].id] = now;
				now = nxt;				//Continue to move downwards
			}
			else {
				data[now] = ret;
				idpos[ret.id] = now;
				break;					//At the bottom, return
			}
		}								//modify the value to inf and move it downwards
	}
	void decrease_key(int id, int key) {
		pair x{ id,key };
		int t = idpos[id], i = t;
		while (data[i >> 1].key > key) {
			data[i] = data[i >> 1];
			idpos[data[i].id] = i;
			i >>= 1;
		}
		data[i] = x;
		idpos[id] = i;					//modify the key value and move it upwards
	}
};

void Bin_Dijkstra(int x, BinHeap& H);
void SP_Bin();