#include<math.h>
#include<stdio.h>
#include<stdlib.h>
#define lop(c,m) for(int c=1;c<=(m);++c)
#define loop(c,m) for(int c=0;c<(m);++c)

#define MAXM 1000
#define inf 0x3f3f3f3f
typedef struct{
	int id,key;
}pair;
struct heaptype{
	pair data[2*MAXM+5];			//heap
	int idpos[2*MAXM+5];			//an assistant array to find the elements in O(1)
}h;									//minheap.
int top(){return h.data[1].id;}
void decrease_key(int id,int key){
	pair x;
	x.id=id,x.key=key;
	int t=h.idpos[id],i=t;
	while(h.data[i>>1].key>key){
		h.data[i]=h.data[i>>1];
		h.idpos[h.data[i].id]=i;
		i>>=1;
	}
	h.data[i]=x;
	h.idpos[id]=i;					//modify the key value and move it upwards
}
void pop(){
	h.data[1].key=inf;
	pair ret=h.data[1];
	int now=1;
	while(1){
		int nxt;
		if(h.data[now<<1].key){
			if(h.data[now<<1|1].key&&h.data[now<<1].key>h.data[now<<1|1].key) nxt=now<<1|1;
			else nxt=now<<1;
		}else{
			h.data[now]=ret;
			h.idpos[ret.id]=now;
			break;
		}
		if(h.data[nxt].key<ret.key){
			h.data[now]=h.data[nxt];
			h.idpos[h.data[nxt].id]=now;
			now=nxt;
		}
		else{
			h.data[now]=ret;
			h.idpos[ret.id]=now;
			break;
		}
	}								//modify the value to inf and move it downwards
}
typedef struct edgetype{
	int target;
	int weight;
	int lre;
	struct edgetype *next;
}edge;								//an edge, list node
edge* head[MAXM+5];					//head of the lists
int m,n,cnt;
int dist[2][MAXM+5],from[2][MAXM+5];//distance and shortest route from which vertex
int vis[MAXM+5],path[MAXM+5];		//visited marks for Dijkstra, and the 2nd-shortest path route
void addedge(int lrs,int ss,int tt,int ww){
	edge* p=(edge*)malloc(sizeof(edge));
	p->target=tt,p->weight=ww,p->lre=lrs,p->next=head[ss];
	head[ss]=p;						//add an edge from ss to tt, weighted ww
}
void dijkstra(int x,int lr){
	lop(i,m){
		vis[i]=0;
		dist[lr][i]=inf;
		pair xx;
		xx.id=i,xx.key=inf;
		h.data[i]=xx;
		h.idpos[i]=i;
	}								//initialize the heap and visited and distance array
	dist[lr][x]=0;
	decrease_key(x,0);				//modify dist[x] to 0
	while(!vis[top()]){
		int now=top();				//get the vertex with minimum distance
		pop();
		vis[now]=1;					//check visited
		for(edge *p=head[now];p;p=p->next) if(p->lre==lr){
			if(dist[lr][now]+p->weight<dist[lr][p->target]){
				dist[lr][p->target]=dist[lr][now]+p->weight;
				decrease_key(p->target,dist[lr][p->target]);	//modify distance
				from[lr][p->target]=now;						//remember shortest path
			}
		}
	}
}
void printpath(int rems,int remt){
	int pp=rems;
	while(rems!=1){
		path[from[0][rems]]=rems;
		rems=from[0][rems];
	}											//get the route from 1 to rems
	while(rems!=pp){
		printf("%d ",rems);
		rems=path[rems];
	}
	printf("%d ",rems);							//print
	while(remt!=m){
		printf("%d ",remt);
		path[remt]=from[1][remt];
		remt=from[1][remt];
	}											//get the route from remt to n
	printf("%d",m);								//print
}
int main(){
	scanf("%d%d",&m,&n);
	loop(i,n){
		int x,y,z;
		scanf("%d%d%d",&x,&y,&z);
		addedge(0,x,y,z);
		addedge(1,y,x,z);						//for 2 different Dijkstra processes
	}
	dijkstra(1,0);
	dijkstra(m,1);								//Dijkstra process
	int minc=inf,rems,remt;
	lop(i,m){
		for(edge* p=head[i];p;p=p->next){
			int d=dist[0][i]+p->weight+dist[1][p->target];
			if(d!=dist[0][m]&&minc>d){			//get the minimum length except the shortest
				minc=d;
				rems=i,remt=p->target;			//and remember the edge V_s to V_t
			}
		}
	}
	printf("%d ",minc);
	printpath(rems,remt);						//print the path
}