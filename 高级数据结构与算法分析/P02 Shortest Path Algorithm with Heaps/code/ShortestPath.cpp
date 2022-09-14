#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include "fibheap.h"

using namespace fib_heap;
using namespace std;

#include<ctime>
#include"main.h"
#include"memorypoll.h"
#define inf 0x3f3f3f3f

const int QUERY = 10;					//The number of querys.
typedef int Vertex;      /* vertices are numbered from 0 to MaxVertexNum-1 */

extern int n, m;					//the number of Vertexes and Edges
extern edge** head;					//head of the lists
extern int query[QUERY][2];			//querys
extern int* dist;					//distance array

extern memory_poll* mp;				//A memory pool for FibHeap for optimazation
extern FibHeapNode** A;				//Supplementary Array in FibHeap Consolidation
FibHeapNode** pos;					//To Find the required node of decrease_key opr in O(1) 

void Fib_Dijkstra(int x, int t, FibHeap& H) {
	for (int i = 1;i <= n;++i) if (i != x) {
		dist[i] = inf;							//initialize distance array
		pos[i] = H.insert(i, inf);					//and insert into heap
	}
	dist[x] = 0;									//initialize distance array
	pos[x] = H.insert(x, 0);						//modify dist[x] to 0
	while (H.m_numOfNodes) {
		int now = H.m_minNode->V;						//get the vertex with minimum distance
		if (now == t) {									//If the query-targeted vertex is that vertex
			while (H.m_numOfNodes) H.extract_min();
			return;									//Clear the heap and return.
		}
		H.extract_min();							//pop
		for (edge *p = head[now];p;p = p->next) {
			if (dist[now] + p->weight < dist[p->target]) {
				dist[p->target] = dist[now] + p->weight;				//modify distance
				H._decrease_key(pos[p->target], dist[p->target]);	//modify the key value in heap
			}
		}
	}
}

void SP_Fib() {
	A = new FibHeapNode *[n + 1];
	FibHeap H;
	pos = new FibHeapNode *[n + 1];
	mp = new memory_poll(n + 1);			//Allocate the Fibonacci heap and Memory Pool

	clock_t start = clock();
	for (int i = 0;i < QUERY;++i) {
		Fib_Dijkstra(query[i][0], query[i][1], H);	//For each query run dijkstra.
		//std::cout<<dist[query[i][1]]<<std::endl;	//this is the query result, omitted in output.
	}
	clock_t stop = clock();
	printf("FibHeap:%lf\n", (double)(stop - start) / CLK_TCK);
}