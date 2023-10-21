//arch/riscv/kernel/proc.c
#include "printk.h" 
#include "string.h"
#include "defs.h"
#include "proc.h"
#include "rand.h"
#include "elf.h"
#include "mm.h"
#include "vm.h"

extern void __dummy();
extern void __switch_to(struct task_struct* prev, struct task_struct* next);

struct task_struct* idle;           // idle process
struct task_struct* current;        // 指向当前运行线程的 `task_struct`
struct task_struct* task[NR_TASKS]; // 线程数组, 所有的线程都保存在此

extern unsigned long swapper_pg_dir[];
extern char uapp_start[];
extern char uapp_end[];

void task_init() {
    // 1. 调用 kalloc() 为 idle 分配一个物理页
    // 2. 设置 state 为 TASK_RUNNING;
    // 3. 由于 idle 不参与调度 可以将其 counter / priority 设置为 0
    // 4. 设置 idle 的 pid 为 0
    // 5. 将 current 和 task[0] 指向 idle
    
    idle = (struct task_struct*) kalloc();
    idle->state = TASK_RUNNING;
    idle->counter = 0;
    idle->priority = 0;
    idle->pid = 0;
    idle->pgd = swapper_pg_dir;
    idle->thread.sscratch = 0;
    
    current = task[0] = idle;

    // 1. 参考 idle 的设置, 为 task[1] ~ task[NR_TASKS - 1] 进行初始化
    // 2. 其中每个线程的 state 为 TASK_RUNNING, counter 为 0, priority 使用 rand() 来设置, pid 为该线程在线程数组中的下标。
    // 3. 为 task[1] ~ task[NR_TASKS - 1] 设置 `thread_struct` 中的 `ra` 和 `sp`,
    // 4. 其中 `ra` 设置为 __dummy （见 4.3.2）的地址,  `sp` 设置为 该线程申请的物理页的高地址
    for(int i = 1; i < NR_TASKS; ++i){
        task[i] = (struct task_struct*) kalloc();
        task[i]->state = TASK_RUNNING;
        task[i]->counter = 0;
        task[i]->priority = rand();
        task[i]->pid = i;
        task[i]->pgd = (pagetable_t)alloc_page();
        
        memcpy(task[i]->pgd, swapper_pg_dir, PGSIZE);
        
        task[i]->pgd = (pagetable_t)VA2PA((uint64_t)task[i]->pgd);
        
        //ELF
        
        Elf64_Ehdr* ehdr = (Elf64_Ehdr*)uapp_start;
        uint64_t phdr_start = (uint64_t)ehdr + ehdr->e_phoff;
        int phdr_cnt = ehdr->e_phnum;

        Elf64_Phdr* phdr;
        int load_phdr_cnt = 0;
        for (int j = 0; j < phdr_cnt; j++) {
            phdr = (Elf64_Phdr*)(phdr_start + sizeof(Elf64_Phdr) * j);
            if (phdr->p_type == PT_LOAD) {
                uint64_t pg_cnt = (PGOFFSET(phdr->p_vaddr) + phdr->p_memsz - 1) / PGSIZE + 1;
                uint64_t uapp_new = alloc_pages(pg_cnt);
                uint64_t load_addr = ((uint64_t)uapp_start + phdr->p_offset);
                memcpy((void*)(uapp_new + PGOFFSET(phdr->p_vaddr)), (void*)(load_addr), phdr->p_memsz);
                create_mapping((uint64*)PA2VA((uint64_t)task[i]->pgd), PGROUNDDOWN(phdr->p_vaddr), VA2PA(uapp_new), pg_cnt * PGSIZE, (phdr->p_flags | 0x8) << 1 | 1);
            }
        }

        uint64_t u_stack_begin = alloc_page();
        create_mapping((uint64*)PA2VA((uint64_t)task[i]->pgd), USER_END - PGSIZE, VA2PA(u_stack_begin), PGSIZE, 23);

        task[i]->thread.sepc = ehdr->e_entry;
        task[i]->thread.sstatus = (1 << 18) | (1 << 5);
        task[i]->thread.sscratch = USER_END;
        
        //BINARY
        
        /*uint64_t pg_cnt = (uapp_end - uapp_start - 1) / PGSIZE + 1; 
        uint64_t uapp_new = alloc_pages(pg_cnt);
        memcpy((void*)uapp_new, uapp_start, pg_cnt * PGSIZE);
        
        uint64_t u_stack_begin = alloc_page();
        create_mapping((uint64*)PA2VA((uint64_t)task[i]->pgd), 0, VA2PA(uapp_new), pg_cnt * PGSIZE, 31);
        create_mapping((uint64*)PA2VA((uint64_t)task[i]->pgd), USER_END - PGSIZE, VA2PA(u_stack_begin), PGSIZE, 23);
        
        task[i]->thread.sepc = USER_START;
        task[i]->thread.sstatus = (1 << 18) | (1 << 5);
        task[i]->thread.sscratch = USER_END;*/
        
        task[i]->thread.ra = (uint64) __dummy;
        task[i]->thread.sp = (uint64) task[i] + PGSIZE;
    }

    printk("...proc_init done!\n");
}

void dummy() {
    uint64 MOD = 1000000007;
    uint64 auto_inc_local_var = 0;
    int last_counter = -1;
    while(1) {
        if (last_counter == -1 || current->counter != last_counter) {
            last_counter = current->counter;
            auto_inc_local_var = (auto_inc_local_var + 1) % MOD;
            printk("[PID = %d] is running. auto_inc_local_var = %d\n", current->pid, auto_inc_local_var);
            printk("Its thread is at: %x%x\n",(uint64)current >> 32, (uint64)current);
        }
    }
}

void switch_to(struct task_struct* next) {
    printk("\nSwitch to [pid = %d, ctr = %d]\n", next->pid, next->counter);
    if(next != current){
        struct task_struct* old = current;
        current = next;
        __switch_to(old, next);
    }
}

void do_timer(){
    if(current == idle) schedule();
    else if(--current->counter == 0) schedule();
}

#ifdef SJF
void schedule(){
    struct task_struct* next = task[0];
    while(1){
        for(int i = 1; i < NR_TASKS; ++i){
            if(task[i]->counter && (next == task[0] || task[i]->counter < next->counter)) next = task[i];
        }
        if(next->counter == 0){
            for(int i = 1; i < NR_TASKS; ++i){
                task[i]->counter = rand();
            }
        }else break;
    }
    switch_to(next);
}
#endif

#ifdef PRIORITY
void schedule(){
    struct task_struct* next = task[0];
    while(1){
        for(int i = 1; i < NR_TASKS; ++i){
            if(task[i]->counter && (next == task[0] || task[i]->priority < next->priority || (task[i]->priority == next->priority && task[i]->counter < next->counter))) next = task[i];
        }
        if(next->counter == 0){
            for(int i = 1; i < NR_TASKS; ++i){
                task[i]->counter = rand();
            }
        }else break;
    }
    switch_to(next);
}
#endif
