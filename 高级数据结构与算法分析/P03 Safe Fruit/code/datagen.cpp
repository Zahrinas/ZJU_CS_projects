#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){
    int choice;
    printf("Input any number: the program randomly generates N and M;\n"
           "Input 1: user inputs N and M;\n"
           "Input 0: Exit;\n");
    scanf("%d",&choice);
    while(choice){
        int N,M;
        if(choice==1){
            printf("Please enter N and M:\n");
            scanf("%d %d", &N, &M);
        }
        else{
            srand(time(NULL));
            N=rand()%100;
            M=rand()%100;
            while(N>(int)(M*(M-1)/2)){
                N=rand()%100;
            }
        }
        FILE* fout=fopen("data/input.txt","w");
        fprintf(fout,"%d %d\n",N,M);
        int **tips,num=0;
        tips=(int**) malloc((M+1)*sizeof(int*));
        for(int i=0;i<=M;i++){
            tips[i]=(int*)malloc((M+1)*sizeof(int));
        }
        for(int i=0;i<=M;i++){
            for(int j=0;j<=M;j++){
                tips[i][j]=0;
            }
        }
        while(num<N){
            int tipsA=rand()%M+1,tipsB=rand()%M+1;
            if((tips[tipsA][tipsB])==0&&(tipsA<tipsB)){
                tips[tipsA][tipsB]=1;
                num++;
            }
        }
        
        for(int i=1;i<=M;i++){
            for(int j=1;j<=M;j++){
                if(tips[i][j]){
                    fprintf(fout,"%03d %03d\n",i,j);
                }
            }
        }
        for(int k=1;k<=M;k++){
            fprintf(fout,"%03d %d\n",k,rand()%1000+1);
        }
        for(int i=0;i<=M;i++){
            free(tips[i]);
        }
        free(tips);
        fflush(fout);
        printf("\nData Generate Finished; Please read input.txt in data folder\n\n"
               "Input any number: the program randomly generates N and M;\n"
               "Input 1: user inputs N and M;\n"
               "Input 0: Exit;\n");
        scanf("%d",&choice);
    }
    return 0;
}
