// arch/riscv/kernel/vm.c
#include "mm.h"
#include "defs.h"
#include "printk.h"
#include <string.h>

/* early_pgtbl: 用于 setup_vm 进行 1GB 的 映射。 */
unsigned long  early_pgtbl[512] __attribute__((__aligned__(0x1000)));

void setup_vm(void) {
    /* 
    1. 由于是进行 1GB 的映射 这里不需要使用多级页表 
    2. 将 va 的 64bit 作为如下划分： | high bit | 9 bit | 30 bit |
        high bit 可以忽略
        中间9 bit 作为 early_pgtbl 的 index
        低 30 bit 作为 页内偏移 这里注意到 30 = 9 + 9 + 12， 即我们只使用根页表， 根页表的每个 entry 都对应 1GB 的区域。 
    3. Page Table Entry 的权限 V | R | W | X 位设置为 1
    */
    early_pgtbl[(PHY_START >> 30) & 0x1ff] = ((PHY_START >> 12) << 10) | 15;
    early_pgtbl[(VM_START >> 30) & 0x1ff] = ((PHY_START >> 12) << 10) | 15;
    printk("setup_vm done!\n");
}

/* swapper_pg_dir: kernel pagetable 根目录， 在 setup_vm_final 进行映射。 */
unsigned long  swapper_pg_dir[512] __attribute__((__aligned__(0x1000)));

extern uint64 _stext[];
extern uint64 _etext[];
extern uint64 _srodata[];
extern uint64 _erodata[];
extern uint64 _sdata[];

/* 创建多级页表映射关系 */
void create_mapping(uint64 *pgtbl2, uint64 va, uint64 pa, uint64 sz, int perm) {
    /*
    pgtbl2 为根页表的基地址
    va, pa 为需要映射的虚拟地址、物理地址
    sz 为映射的大小
    perm 为映射的读写权限

    创建多级页表的时候可以使用 kalloc() 来获取一页作为页表目录
    可以使用 V bit 来判断页表项是否存在
    */
    uint64* pgtbl1;
    uint64* pgtbl0;
    //printk("start paging: va = %x%x, pa = %x%x, sz = %x%x\n", va >> 32, va, pa >> 32, pa, sz >> 32, sz);
    for(uint64 vend = va+sz; va <= vend; va += PGSIZE, pa += PGSIZE){
        uint64 vpn2 = (va >> 30) & 0x1ff;
        uint64 vpn1 = (va >> 21) & 0x1ff;
        uint64 vpn0 = (va >> 12) & 0x1ff;
        if(pgtbl2[vpn2] & 0x1)
            pgtbl1 = (uint64*)((((uint64)pgtbl2[vpn2] >> 10) << 12) + PA2VA_OFFSET);
        else{
            pgtbl1 = (uint64*)kalloc();
            pgtbl2[vpn2] = ((((uint64)pgtbl1 - PA2VA_OFFSET) >> 12) << 10) | 0x1;
        }
        if(pgtbl1[vpn1] & 0x1)
            pgtbl0 = (uint64*)((((uint64)pgtbl1[vpn1] >> 10) << 12) + PA2VA_OFFSET);
        else{
            pgtbl0 = (uint64*)kalloc();
            pgtbl1[vpn1] = ((((uint64)pgtbl0 - PA2VA_OFFSET) >> 12) << 10) | 0x1;
        }
        if(!(pgtbl0[vpn0] & 0x1)) pgtbl0[vpn0] = ((pa >> 12) << 10) | perm;
    }
}

void setup_vm_final(void) {
    printk("setup vm final begin\n");
    memset(swapper_pg_dir, 0x0, PGSIZE);

    // No OpenSBI mapping required

    // mapping kernel text X|-|R|V
    //printk("setup vm final map1\n");
    create_mapping(swapper_pg_dir, (uint64)_stext, (uint64)_stext - PA2VA_OFFSET, (uint64)_srodata - (uint64)_stext, 11);

    // mapping kernel rodata -|-|R|V
    //printk("setup vm final map2\n");
    create_mapping(swapper_pg_dir, (uint64)_srodata, (uint64)_srodata - PA2VA_OFFSET, (uint64)_sdata - (uint64)_srodata, 3);

    // mapping other memory -|W|R|V
    //printk("setup vm final map3\n");
    create_mapping(swapper_pg_dir, (uint64)_sdata, (uint64)_sdata - PA2VA_OFFSET, PHY_END + PA2VA_OFFSET - (uint64)_sdata, 7);

    uint64 satp = (((uint64)swapper_pg_dir - PA2VA_OFFSET) >> 12) | 0x8000000000000000;
    __asm__ volatile(
        "csrw satp, %[base]\n"
        :
        : [base] "r" (satp)
    );

    // flush TLB
    asm volatile("sfence.vma zero, zero");

    // flush icache
    asm volatile("fence.i");
    
    printk("setup vm final finished\n");
}
