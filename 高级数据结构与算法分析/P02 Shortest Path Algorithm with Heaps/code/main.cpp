#include<cmath>
#include<cstdio>
#include<cstdlib>
#include<iostream>
#include<algorithm>

using namespace std;

#include<random>
#include<fstream>
#include"main.h"
#include"binheap.h"
#include"fibheap.h"

const int QUERY = 10;		//The number of querys.

edge** head;				//head of the lists of edges
int n, m;					//the number of Vertexes and Edges
int query[QUERY][2];		//querys
int* dist;					//distance array
void addedge(int s, int t, int w) {
	head[s] = new edge{ t,w,head[s] };	//insert an edge to the edge list of node s
}
void readdata() {
	string str;
	ifstream fin("data/USA-road-d.NY.gr");		//Data Path for read
	while (fin >> str) if (str == "sp") break;
	fin >> n >> m;
	dist = new int[n + 1];
	head = new edge*[n + 1];
	fill(head, head + n + 1, nullptr);			//Allocate and assign
	while (fin >> str) if (str == "arcs") break;
	fin >> str;
	for (int i = 0;i < m;++i) {
		int s, t, w;
		fin >> str >> s >> t >> w;
		addedge(s, t, w);						//Read and add edges
	}
	cout << "Data Read Finished..." << endl;
}
void genquery() {
	default_random_engine e;
	uniform_int_distribution<int> rd(1, n);		//Use C++11 <Random> to generate some querys.
	for (int i = 0;i < QUERY;++i) {
		query[i][0] = rd(e);
		query[i][1] = rd(e);
	}
}
signed main(signed, char**, char**) {
	readdata();
	genquery();
	SP_Bin();
	SP_Fib();
}