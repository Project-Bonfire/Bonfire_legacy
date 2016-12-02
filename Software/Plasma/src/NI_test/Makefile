CFLAGS = -O0 -Wall -c -s
CFLAGS += -fno-pic -mips1 -mno-abicalls -msoft-float
ASFLAGS = -O0 -Wall -mips1 -msoft-float

GCC_MIPS = mips-linux-gnu-gcc $(CFLAGS)
AS_MIPS = mips-linux-gnu-as $(ASFLAGS)
LD_MIPS = mips-linux-gnu-ld
DUMP_MIPS = mips-linux-gnu-objdump

all: ni_test_send ni_test_recv

ni_test_send:
	$(AS_MIPS) -o boot.o ../../lib/boot.asm
	$(GCC_MIPS) ni_test_send.c
	$(GCC_MIPS) ../../lib/plasma.c
	$(LD_MIPS) -Ttext 0 -e entry -s -N -o ni_test_send.elf \
		boot.o ni_test_send.o plasma.o

ni_test_recv:
	$(AS_MIPS) -o boot.o ../../lib/boot.asm
	$(GCC_MIPS) ni_test_recv.c
	$(GCC_MIPS) ../../lib/plasma.c
	$(LD_MIPS) -Ttext 0 -e entry -s -N -o ni_test_recv.elf \
		boot.o ni_test_recv.o plasma.o

clean:
	rm -f *.elf code*.txt *.o *.bin
