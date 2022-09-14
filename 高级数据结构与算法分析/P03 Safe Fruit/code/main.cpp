#include<cmath>
#include<cstdio>
#include<cstdlib>
#include<iostream>
#include<algorithm>
using namespace std;

const int inf = 0x3f3f3f3f;

int n, m;					//given number of tips and fruits
int lx[1005][2];			//given tips

struct edge {
	int t;
	edge* next;
}*head[105];				//save the tips by id
int value[105];				//cost of each fruit
int ori[105], getid[1005];	//map the original 3-digit id to number 1~m

int remi[105];				//memorize the maximum amount of fruits we can select in [index,m]

int bansel[105];			//current mark of which fruit cannot be selected
int sol[105];
int siz, cost;				//current solution considered

int fin[105];
int maxf, minc;				//the optimal solution currently
void addedge(int s, int t) {
	head[s] = new edge{ t,head[s] };
}
void input() {
	cin >> n >> m;
	for (int i = 0;i < n;++i) cin >> lx[i][0] >> lx[i][1];				//store the tips
	for (int i = 1;i <= m;++i) {
		int a;
		cin >> a >> value[i];
		ori[i] = a, getid[a] = i;	//give each fruit in basket an id - i
	}
	for (int i = 0;i < n;++i) if (getid[lx[i][0]] && getid[lx[i][1]]) {	//if both in the basket
		int minx = min(getid[lx[i][0]], getid[lx[i][1]]);
		int maxx = max(getid[lx[i][0]], getid[lx[i][1]]);
		addedge(minx, maxx);		//add an edge from the smaller id to the bigger id
									//because in a backtrack procedure we don't concern that reversed edge
	}
}
void check() {
	if (siz > maxf) {
		maxf = siz, minc = cost;
		copy(sol, sol + siz, fin);	//current size > optimal solution, save
	}
	else if (siz == maxf && cost < minc) {
		minc = cost;
		copy(sol, sol + siz, fin);	//current cost < optimal cost, save
	}
}
int dfs(int now) {
	if (now == m + 1) {			//boundary condition
		check();
		return 0;				//compare the solution and return
	}
	int res1 = -inf, res2 = -inf;
	if (siz + remi[now + 1] >= maxf) {
		res1 = dfs(now + 1);	//not selected, search the next
	}
	if (bansel[now] == 0 && siz + 1 + remi[now + 1] >= maxf) {
		sol[siz++] = now, cost += value[now];	//modify the current condition
		for (edge* ptr = head[now];ptr;ptr = ptr->next) {
			++bansel[ptr->t];					//add a ban-mark for fruits that have an edge with current
		}
		res2 = dfs(now + 1);	//selected, search the next
		--siz, cost -= value[now];
		for (edge* ptr = head[now];ptr;ptr = ptr->next) {
			--bansel[ptr->t];
		}										//backtrack
	}
	if (siz == 0) remi[now] = max(res1, res2 + 1);	//memorize the most fruits can be selected in [now,m]
	return max(res1, res2 + 1);						//return the most fruits in [now,m] currently
}
void output() {
	printf("%d\n", maxf);
	for (int i = 0;i < maxf;++i) fin[i] = ori[fin[i]];	//we convert id into its original id
	sort(fin, fin + maxf);								//and sort
	for (int i = 0;i < maxf;++i) printf("%03d%c", fin[i], i + 1 == maxf ? '\n' : ' ');
	printf("%d\n", minc);
}
signed main(signed, char**, char**) {
	input();
	dfs(1);				//start the depth-first search process from id 1
	output();
}