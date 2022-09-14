#include<cmath>
#include<cstdio>
#include<cstdlib>
#include<iostream>
#include<algorithm>
using namespace std;

#include<queue>

int n, m, len;
int id[256];
int freq[256];
char idor[256];
char cdi[256];
string code[256];
void preinput() {
	cin >> n;
	for (int i = 0;i < n;++i) {
		cin >> idor[i];
		id[idor[i]] = i;	//Map characters into integer [0,n)
		cin >> freq[i];		//Frequency
	}
	cin >> m;
}//Input function for global parameters
void huffman() {
	priority_queue<int, vector<int>, greater<int>> heap;	//Using a min-heap
	for (int i = 0;i < n;++i) heap.push(freq[i]);
	while (heap.size() != 1) {
		int a = heap.top();
		heap.pop();
		int b = heap.top();
		heap.pop();
		len += a + b;
		heap.push(a + b);
	}
}//This is a simplified huffman-code process, only calculate the coded length.
void readsol() {
	for (int i = 0;i < n;++i) cin >> cdi[i] >> code[id[cdi[i]]];
}//Input function for each solution
bool prefix(int a, int b) {
	if (code[a].length() > code[b].length()) return 0;	//Length exceeded, apparently not a prefix
	for (int i = 0;i < code[a].length();++i) {
		if (code[a][i] != code[b][i]) return 0;			//If different, then not a prefix
	}
	return 1;
}//Determine prefix, to verify the correctness of a huffman-code
string verify() {
	int slen = 0;
	for (int i = 0;i < n;++i) slen += freq[i] * code[i].length();
	if (slen != len) return "No";									//The coded length is different
	sort(code, code + n);
	for (int i = 1;i < n;++i) if (prefix(i - 1, i)) return "No";	//Contain a prefix
	return "Yes";													//If both not detected, then it's correct.
}
signed main(signed, char**, char**) {
	preinput();
	huffman();
	for (int i = 0;i < m;++i) {
		readsol();
		cout << verify() << endl;
	}
}