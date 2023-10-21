#include "syscall.h"
#include "printk.h"

extern struct task_struct* current;

uint64_t sys_write(unsigned int fd, const char* buf, size_t count) {
    uint64_t ret = 0;
    for (int i = 0; i < count; i++) {
        if (fd == 1) {
            printk("%c", buf[i]);
            ++ret;
        }
    }
    return ret;
}

uint64_t sys_getpid() {
    return current->pid;
}
