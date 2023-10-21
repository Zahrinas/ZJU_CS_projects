.extern start_kernel

    .section .text.init
    .globl _start
_start:
    la sp, boot_stack_top
    call setup_vm
    call relocate
    call mm_init
    call setup_vm_final
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

relocate:
    # set ra = ra + PA2VA_OFFSET
    # set sp = sp + PA2VA_OFFSET (If you have set the sp before)

    li t0, 0xffffffdf80000000
    add ra, ra, t0
    add sp, sp, t0

    # set satp with early_pgtbl

    li t0, 8
    slli t0, t0, 60
    la t1, early_pgtbl
    srli t1, t1, 12
    or t0, t0, t1
    csrw satp, t0

    # flush tlb
    sfence.vma zero, zero

    # flush icache
    fence.i

    ret

    .section .bss.stack
    .globl boot_stack
boot_stack:
    .space 4096 * 4 # <-- change to your stack size

    .globl boot_stack_top
boot_stack_top:
