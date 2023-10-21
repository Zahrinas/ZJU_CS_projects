OUTPUT_ARCH( "riscv" )
ENTRY( _start )
MEMORY {
    ram (wxa!ri): ORIGIN = 0x0000000080000000 + (0x200000), LENGTH = 128 * 1024 * 1024 - (0x200000)
    ramv (wxa!ri): ORIGIN = (0xffffffe000000000) + (0x200000), LENGTH = ((0xffffffff00000000) - (0xffffffe000000000)) - (0x200000)
}
BASE_ADDR = (0xffffffe000000000) + (0x200000);
SECTIONS
{
    . = BASE_ADDR;
    _skernel = .;
    .text : ALIGN(0x1000){
        _stext = .;
        *(.text.init)
        *(.text.entry)
        *(.text .text.*)
        _etext = .;
    } >ramv AT>ram
    .rodata : ALIGN(0x1000){
        _srodata = .;
        *(.srodata .srodata.*)
        *(.rodata .rodata.*)
        _erodata = .;
    } >ramv AT>ram
    .data : ALIGN(0x1000){
        _sdata = .;
        *(.sdata .sdata*)
        *(.data .data.*)
        _edata = .;
    } >ramv AT>ram
    .bss : ALIGN(0x1000){
        _sbss = .;
        *(.bss.stack)
        *(.sbss .sbss.*)
        *(.bss .bss.*)
        _ebss = .;
    } >ramv AT>ram
    _ekernel = .;
}
