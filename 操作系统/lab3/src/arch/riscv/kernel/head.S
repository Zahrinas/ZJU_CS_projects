.extern start_kernel

    .section .text.init
    .globl _start
_start:
    la sp, boot_stack_top
    call mm_init
    call task_init

    la t0, _traps
    csrw stvec, t0
        # set stvec = _traps
    
    csrr t0, sie
    ori t0, t0, 32
    csrw sie, t0
        # set sie[STIE] = 1
    
    mv a6, x0
    mv a7, x0
    rdtime t0
    la t1, 10000000
    add a0, t0, t1
    ecall
        # set first time interrupt
    
    csrr t0, sstatus
    ori t0, t0, 2
    csrw sstatus, t0
        # set sstatus[SIE] = 1

    j start_kernel

    .section .bss.stack
    .globl boot_stack
boot_stack:
    .space 4096 * 4 # <-- change to your stack size

    .globl boot_stack_top
boot_stack_top:
