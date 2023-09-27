#include "print.h"
#include "sbi.h"

void puts(char *s) {
    for(int i = 0; s[i]; ++i){
        sbi_ecall(0x1, 0x0, s[i], 0, 0, 0, 0, 0);
    }
}

void puti(int x) {
    if(x==0) sbi_ecall(0x1, 0x0, '0', 0, 0, 0, 0, 0);
    else{
        int stack[10];
        int num=0;
        if(x<0) sbi_ecall(0x1, 0x0, '-', 0, 0, 0, 0, 0);
        while(x){
            stack[num++]=x%10;
            x/=10;
        }
        for(int i = num - 1; i >= 0; --i){
            sbi_ecall(0x1, 0x0, '0' + stack[i], 0, 0, 0, 0, 0);
        }
    }
}
