ASM_SRC		= $(filter-out vmlinux.lds.S,$(sort $(wildcard *.S)))
C_SRC       = $(sort $(wildcard *.c))
OBJ		    = $(patsubst %.S,%.o,$(ASM_SRC)) $(patsubst %.c,%.o,$(C_SRC))

all:$(OBJ) vmlinux.lds

vmlinux.lds: vmlinux.lds.S
	$(GCC) -E -P -I../include -o $@ $^

%.o:%.S
	${GCC}  ${CFLAG} -c $<

%.o:%.c
	${GCC}  ${CFLAG} -c $<

clean:
	$(shell rm *.o vmlinux.lds 2>/dev/null)
