#include "print.h"
#include "sbi.h"

extern void test();

int start_kernel() {
    puti(2022);
    puts(" Hello RISC-V\n");
    puts("This is a message from 3200105646.");

    test(); // DO NOT DELETE !!!

	return 0;
}
