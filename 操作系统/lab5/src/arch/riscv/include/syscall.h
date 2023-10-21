#ifndef _SYSCALL_H_
#define _SYSCALL_H_

#include "stdint.h"
#include "proc.h"

#include <stddef.h>

uint64_t sys_write(unsigned int fd, const char* buf, size_t count);

uint64_t sys_getpid();

#endif
