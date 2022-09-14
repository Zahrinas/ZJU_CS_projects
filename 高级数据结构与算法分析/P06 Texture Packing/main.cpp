#include<cstdio>
#include<cstdlib>
#include<iostream>
#include<vector>
#include<ctime>
#include<algorithm>
using namespace std;

const int Times=10000;
struct texture{ // structure of textures
	int width;
	int height;
	bool operator<(const texture& x) const{ // overload '<' to make comparison easier
		return height>x.height;
	}
};
typedef struct texture T;
int max_width;

void FirstFit(T* blocks,int N); // First-Fit algorithm
void NextFit(T* blocks,int N); // Next-Fit algorithm

int main(){
	int N; // number of textures
	scanf("%d %d",&max_width,&N);
	T* blocks=(T*)malloc(N*sizeof(struct texture));
	for(int i=0;i<N;i++) scanf("%d %d",&blocks[i].width,&blocks[i].height);
	sort(blocks,blocks+N); // arrange all textures in decreasing order of height
	
	//clock_t start=clock();
	//for(int i=0;i<Times;++i) 
		NextFit(blocks,N);
	//clock_t endt=clock();
	//cout<<double(endt-start)/Times/CLOCKS_PER_SEC<<endl;
	
	FirstFit(blocks,N);
	
	free(blocks);
	return 0;
}

void NextFit(T* blocks,int N){
	vector< vector<int> > packing; // record the levels
	vector<int> level; // record the widths in each level
	int current_width=0,total_height=blocks[0].height;
	for(int i=0;i<N;i++){ // for each texture
		if(current_width+blocks[i].width<=max_width){ // if it can put in the current level
			level.push_back(blocks[i].width);
			current_width+=blocks[i].width; // just put it in
		}
		else{ // if it cannot put in the current level
			packing.push_back(level);
			level.clear();
			level.push_back(blocks[i].width);
			total_height+=blocks[i].height;
			current_width=blocks[i].width; // put it in a new level, and update the total height
		}
	}
	packing.push_back(level); // remember the last level though it may not full
	printf("By NFDH, the minimum height is %d.\n",total_height);
//  ¡ý¡ý¡ý¡ý¡ý¡ý¡ý¡ý¡ýuse this block of code to check the width in each level ¡ý¡ý¡ý¡ý¡ý
	/*for(auto i:packing){
		for(auto j:i){
			cout<<j<<" ";
		}
		cout<<endl;
	}*/
}

void FirstFit(T* blocks,int N){
	vector< vector<int> > packing; // record the levels
	/* NOTICE: Unlike NFDH, the first element of each level in
	   FFDH's 'packing' records the width of the current level. */
	vector<int> init;
	init.push_back(0);
	packing.push_back(init); // make a zero level in 'packing' to start the algorithm
	int total_height=blocks[0].height;
	for(int i=0;i<N;i++){ // for each texture
		int flag=0; // record whether the texture is put in or not
		for(vector<int>& j:packing){ // for each level
			if(j[0]+blocks[i].width<=max_width){ // if the texture can be put in certain level
				j.push_back(blocks[i].width);
				j[0]+=blocks[i].width;
				flag=1; // Just put it in and mark that it has been processed
				break;
			}
		}
		if(!flag){ // if the texture cannot be put in any level
			vector<int> new_level;
			new_level.push_back(blocks[i].width); // record current width
			new_level.push_back(blocks[i].width); // record the texture
			packing.push_back(new_level);
			total_height+=blocks[i].height; // put it in a new level and update the total height
		}
	}
	printf("By FFDH, the minimum height is %d.\n",total_height);
//  ¡ý¡ý¡ý¡ý¡ý¡ý¡ý¡ý¡ýuse this block of code to check the width in each level ¡ý¡ý¡ý¡ý¡ý
	/*for(auto i:packing){
		for(auto j:i){
			cout<<j<<" ";
		}
		cout<<endl;
	}*/
}
