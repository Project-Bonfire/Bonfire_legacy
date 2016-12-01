SRC_DIR = ./src
BIN_DIR = ../../tmp/bin/plasma_simu #not used yet



GCC_EXEC = gcc
C_FLAGS = -Wall -O -g

GCC_COMMAND = $(GCC_EXEC) $(C_FLAGS)

RM_COMMAND = rm -rf

all: mlite_simulator

clean:
	-$(RM_COMMAND) mlite_simulator

# Same as "objcopy -I elf32-big -O binary [filename].elf [filename].bin"
mlite_simulator:
	@$(GCC_EXEC) -o mlite_simulator $(SRC_DIR)/mlite_simulator.c
