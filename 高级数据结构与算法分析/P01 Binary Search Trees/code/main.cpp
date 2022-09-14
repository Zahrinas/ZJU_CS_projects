#include<cmath>
#include<cstdio>
#include<cstring>
#include<iostream>
#include<algorithm>
using namespace std;

#include"BST.h"
#include"splaytree.h"
#include"AVLtree.h"
#include"gen.h"

int seq[20000 + 5];
signed main(signed, char**, char**) {
	srand(1919810);											//initialize the random seed
	freopen("out.txt", "w", stdout);						//give out the result to out.txt
	for (int i = 1;i <= 3;++i) {
		cout << endl << "data type: " << i << endl;
		for (int j = 1000;j <= 10000;j += 500) {
			gen(i, j, seq);									//generate the insertion&deletion sequence
			cout << "size: " << j << endl;
			cout << "BST: " << Opr_BST(1, j, seq) << endl;	//Binary Sort Tree Process
			cout << "SPL: " << Opr_SPL(1, j, seq) << endl;	//Splay Tree Process
			cout << "AVL: " << Opr_AVL(1, j, seq) << endl;	//AVL Tree Process
		}
	}
}