.global __start
__start:
addi x0, x0, 0

# F0F0F0F0 in 0x1C
# FFFFFFF0 miss, read 0x010~0x01C to set 1 line 0
lb x1, 0x01C(x0)

# FFFFF0F0 hit
lh x2, 0x01C(x0)

# F0F0F0F0 hit
lw x3, 0x01C(x0) 

# 000000F0 hit
lbu x4, 0x01C(x0)

# 0000F0F0 hit
lhu x5, 0x01C(x0)

# miss, read 0x210~0x21C to cache set 1 line 1
lw x0, 0x210(x0)

# x1 = 0xABCDE71C
lui x1 0xABCDE
addi x1, x1, 0x71C

# miss, read 0x000~0x00C to cache set 0 line 0
sb x1, 0x0(x0)

# hit
sh x1, 0x4(x0)

# hit
sw x1, 0x8(x0)

# miss, read 0x200~0x20C to cache set 0 line 1
lw x6, 0x200(x0)

# miss, write 0x000~0x00C back to ram, then read 0x400~40C to cache set 0 line 0
lw x7, 0x400(x0)

# miss, no write back because of clean, read 0x410~41C to chache set 1 line 0
lw x8, 0x410(x0)

# end
loop:
ori x16, x0, 0xED

jal x0, loop