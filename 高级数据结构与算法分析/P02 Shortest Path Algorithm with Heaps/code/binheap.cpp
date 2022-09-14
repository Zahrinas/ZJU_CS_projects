#include"main.h"
#include"binheap.h"

#include<ctime>
#include<iostream>

const int QUERY = 10;				//The number of querys.

extern int n, m;					//the number of Vertexes and Edges
extern edge** head;					//head of the lists
extern int query[QUERY][2];			//querys
extern int* dist;					//distance array

void Bin_Dijkstra(int x, int t, BinHeap& H) {
	for (int i = 1;i <= n;++i) dist[i] = inf;	//initialize distance array
	H.clear(n);									//Fill the heap with n times of inf
	dist[x] = 0;
	H.decrease_key(x, 0);						//modify dist[x] to 0
	while (H.Size) {
		int now = H.top();						//get the vertex with minimum distance
		if (now == t) return;						//Already found the result
		H.pop();
		for (edge *p = head[now];p;p = p->next) {
			if (dist[now] + p->weight < dist[p->target]) {
				dist[p->target] = dist[now] + p->weight;	//modify distance
				H.decrease_key(p->target, dist[p->target]);	//modify the key value in heap
			}
		}
	}
}
void SP_Bin() {
	BinHeap H;
	H.initialize(n);			//Create the heap

	clock_t start = clock();
	for (int i = 0;i < QUERY;++i) {
		Bin_Dijkstra(query[i][0], query[i][1], H);	//For each query run dijkstra.
		//std::cout<<dist[query[i][1]]<<std::endl;	//this is the query result, omitted in output.
	}
	clock_t stop = clock();
	printf("BinHeap:%lf\n", (double)(stop - start) / CLK_TCK);
}