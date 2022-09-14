#include"gen.h"

#include<algorithm>

void gen(int type, int n, int* seq) {
	for (int i = 1;i <= n;++i) seq[i] = seq[n + i] = i;
	if (type == 2) std::reverse(seq + n + 1, seq + n + n + 1);
	if (type == 3) std::random_shuffle(seq + 1, seq + n + 1), std::random_shuffle(seq + n + 1, seq + n + n + 1);
	//Using C++ STL to generate the sequence.
	//To indicate case 2, reverse the deletion sequence.
	//To indicate case 3, randomly shuffle the insertion sequence and deletion sequence.
	//insertion: index 1~n; deletion: index n+1~2n
}