SRC_DIR = ./src
BIN_DIR = ../../tmp/bin/plasma_tools #not used yet



GCC_EXEC = gcc
C_FLAGS = -Wall -O -g

GCC_COMMAND = $(GCC_EXEC) $(C_FLAGS)

RM_COMMAND = rm -rf

all: convert_to_bin convert_to_bin_le bin_to_hex

clean:
	-$(RM_COMMAND) convert_to_bin convert_to_bin_le bin_to_hex

# Same as "objcopy -I elf32-big -O binary [filename].elf [filename].bin"
convert_to_bin:
	@$(GCC_EXEC) -o convert_to_bin $(SRC_DIR)/convert.c

convert_to_bin_le:
	@$(GCC_EXEC) -DLITTLE_ENDIAN -o convert_to_bin_le $(SRC_DIR)/convert.c

bin_to_hex:
	@$(GCC_EXEC) -o bin_to_hex $(SRC_DIR)/bintohex.c
