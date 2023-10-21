#include "printk.h"
#include "defs.h"

// Please do not modify

void test() {
    printk("kernel is running!\n");
    int i = 0;
    while (1)
    {
        if (++i % 40000000 == 0)
        {
            i = 0;
            printk("kernel is running!\n");
        }
    }
}
