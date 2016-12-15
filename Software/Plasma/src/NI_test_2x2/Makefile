CFLAGS = -O0 -Wall -c -s
CFLAGS += -fno-pic -mips1 -mno-abicalls -mfp32 #-msoft-float
ASFLAGS = -O0 -Wall -mips1 -mfp32 #-msoft-float

# The compiler does not support floating soft-floats. Try to avoid floats, okey?

GCC_MIPS = mips-linux-gnu-gcc $(CFLAGS)
AS_MIPS = mips-linux-gnu-as $(ASFLAGS)
LD_MIPS = mips-linux-gnu-ld
DUMP_MIPS = mips-linux-gnu-objdump

all: ni_test_0 ni_test_1 ni_test_2 ni_test_3

ni_test_0:
	$(AS_MIPS) -o boot.o ../../lib/boot.asm
	$(GCC_MIPS) ni_test_0.c
	$(GCC_MIPS) ../../lib/plasma.c
	$(GCC_MIPS) ../../lib/packets.c
	$(GCC_MIPS) ../../lib/bonfire.c
	$(LD_MIPS) -Ttext 0 -e entry -s -N -o ni_test_0.elf \
		boot.o ni_test_0.o plasma.o packets.o bonfire.o

ni_test_1:
	$(AS_MIPS) -o boot.o ../../lib/boot.asm
	$(GCC_MIPS) ni_test_1.c
	$(GCC_MIPS) ../../lib/plasma.c
	$(GCC_MIPS) ../../lib/packets.c
	$(GCC_MIPS) ../../lib/bonfire.c
	$(LD_MIPS) -Ttext 0 -e entry -s -N -o ni_test_1.elf \
		boot.o ni_test_1.o plasma.o packets.o bonfire.o

ni_test_2:
	$(AS_MIPS) -o boot.o ../../lib/boot.asm
	$(GCC_MIPS) ni_test_2.c
	$(GCC_MIPS) ../../lib/plasma.c
	$(GCC_MIPS) ../../lib/packets.c
	$(GCC_MIPS) ../../lib/bonfire.c
	$(LD_MIPS) -Ttext 0 -e entry -s -N -o ni_test_2.elf \
		boot.o ni_test_2.o plasma.o packets.o bonfire.o

ni_test_3:
	$(AS_MIPS) -o boot.o ../../lib/boot.asm
	$(GCC_MIPS) ni_test_3.c
	$(GCC_MIPS) ../../lib/plasma.c
	$(GCC_MIPS) ../../lib/packets.c
	$(GCC_MIPS) ../../lib/bonfire.c
	$(LD_MIPS) -Ttext 0 -e entry -s -N -o ni_test_3.elf \
		boot.o ni_test_3.o plasma.o packets.o bonfire.o



clean:
	rm -f *.elf code*.txt *.o *.bin
