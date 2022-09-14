#include"BST.h"

#include<ctime>

BST tree;

double Opr_BST(int k, int n, int* memory) {
	clock_t start = clock();
	for (int i = 1;i <= k;++i) {
		for (int j = 1;j <= n;++j) tree.insert(memory[j]);
		for (int j = 1;j <= n;++j) tree.erase(memory[n + j]);
	}
	clock_t stop = clock();

	return ((double)(stop - start)) / CLK_TCK / k;
}