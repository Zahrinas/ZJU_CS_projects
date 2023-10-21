// trap.c 
#include "syscall.h"
#include "printk.h"
#include "clock.h"
#include "proc.h"

void trap_handler(unsigned long scause, unsigned long sepc, struct pt_regs *regs) {
    // 通过 `scause` 判断trap类型
    // 1. 如果是interrupt 判断是否是timer interrupt
    // 1.1 如果是timer interrupt 则打印: "[S] Supervisor Mode Timer Interrupt"
    //     并通过 `clock_set_next_event()` 设置下一次时钟中断
    //     关于 `clock_set_next_event()` 见 4.5 节
    // 1.2 & 2. 其他interrupt / exception 可以直接忽略
    
    // YOUR CODE HERE
    printk("\nTrap: %x%x\n", scause>>32, scause);
    if(scause & 0x8000000000000000){
        if((scause & 0x00000005) == 0x00000005){
            //printk("[S] Supervisor Mode Timer Interrupt\n");
            do_timer();
            clock_set_next_event();
        }
    }else{
        if((scause & 0x00000008) == 0x00000008){
            switch (regs->reg[16]){ //x17
                case 64:
                    regs->reg[9] = sys_write(regs->reg[9], (const char*)regs->reg[10], regs->reg[11]); //x10
                    break;
                case 172:
                    regs->reg[9] = sys_getpid();
                    break;
            }
            regs->sepc += 4;
        }
    }
}
