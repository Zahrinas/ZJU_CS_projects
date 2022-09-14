#include<cmath>
#include<cstdio>
#include<cstdlib>
#include<iostream>
#include<algorithm>
using namespace std;

#include<ctime>
const int RUN_TIMES = 10;
const int MOD = 1000000007;
enum { RED, BLACK };				//Map RED into 0, BLACK into 1
int n, run, ans;
int calc[505][505][2];				//Calculated or not
int res[505][505][2];				//Memorized Result, initially zero
int mul(long long a, long long b) {
	return a * b % MOD;				//Multiply, using long long to avoid overflow
}
int dfs(int len, int bht, int color) {				//Memorized Search on a subtree. parameters:
													//len: number of nodes in that subtree;
													//bht: black height of that subtree;
													//color: the color of that root. 
	if (bht < 0) return 0;							//BHT<0, impossible
	if (len == 0) return color == BLACK && bht == 0;//NULL node, must be BLACK and BHT=0
	int& ret = res[len][bht][color];
	if (calc[len][bht][color] == run) return ret;
	else calc[len][bht][color] = run;				//If calculated, return
	ret = 0;
	bht -= color;									//Get BHT of its sons(SBHT)
	double lb = pow(2, bht) - 1;					//Minimum number of nodes in its sons
	for (int i = lb;i < len - lb;++i) {				//Enumerate number of nodes of its two sons
		if (color == RED) {
			ret += mul(dfs(i, bht, BLACK), dfs(len - i - 1, bht, BLACK));
			ret %= MOD;								//Two sons must be BLACK, SBHT=BHT, get the result
		}
		else {
			ret += mul(dfs(i, bht, BLACK), dfs(len - i - 1, bht, BLACK));
			ret %= MOD;
			ret += mul(dfs(i, bht, RED), dfs(len - i - 1, bht, BLACK));
			ret %= MOD;
			ret += mul(dfs(i, bht, BLACK), dfs(len - i - 1, bht, RED));
			ret %= MOD;
			ret += mul(dfs(i, bht, RED), dfs(len - i - 1, bht, RED));
			ret %= MOD;								//Two sons can be any color, SBHT=BHT-1, add up the result
		}
	}
	return ret;										//return the caculated result
}
signed main(signed, char**, char**) {
	//cin >> n;
	freopen("out.txt", "w", stdout);
	
	for (n = 1;n <= 500;++n) {

		clock_t start = clock();

		for (run = 1;run <= RUN_TIMES;++run) {
			ans = 0;
			for (int i = 1;i <= n;++i) {	//Enumerate the BHT of the whole tree
				ans += dfs(n, i, BLACK);
				ans %= MOD;					//Add up the result
			}
		}

		clock_t end = clock();

		printf("N:%d time used:%lf result:%d\n", n, double(end - start) / CLOCKS_PER_SEC, ans);
	}

	//cout << ans << endl;
}