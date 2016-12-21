BONFIRE_ROOT = ../../../..

# Compiler flags
CFLAGS = -O0 -Wall -c -s
CFLAGS += -fno-pic -mips1 -mno-abicalls -mfp32 #-msoft-float

# Assembler flags
ASFLAGS = -O0 -Wall -mips1 -mfp32#-msoft-float

# Assembler flags
LDFLAGS = -Ttext 0 -e entry -s -N

# Toolchain commands
CC 	 = mips-linux-gnu-gcc
AS 	 = mips-linux-gnu-as
LD 	 = mips-linux-gnu-ld

# System Commands
RM = rm -rf

# Program name
PROG_NAME = counter_test

# Directories
SOURCEDIR 	= src
LIBDIR 		= ../../lib
BUILDDIR	= $(BONFIRE_ROOT)/tmp/bin/$(PROG_NAME)
UTIL_FOLDER = $(BONFIRE_ROOT)/tmp/bin/plasma_utils
SIMUL_TEMP	= $(BONFIRE_ROOT)/tmp/simul_temp

# Program sources
PROG_C_SOURCES	= $(wildcard $(SOURCEDIR)/*.c)
PROG_MAIN_SRCS	= $(wildcard $(SOURCEDIR)/*_?.c)

PROG_SOURCES 	= $(filter-out $(PROG_MAIN_SRCS),$(PROG_C_SOURCES))

# Library sources
LIB_ASM_SOURCES = $(wildcard $(LIBDIR)/*.asm)
LIB_SOURCES 	= $(wildcard $(LIBDIR)/*.c)

# Object files
PROG_OBJECTS	  = $(patsubst $(SOURCEDIR)/%.c,$(BUILDDIR)/%.o,$(PROG_SOURCES))
PROG_MAIN_OBJECTS = $(patsubst $(SOURCEDIR)/%.c,$(BUILDDIR)/%.o,$(PROG_MAIN_SRCS))

LIB_OBJECTS 	= $(patsubst $(LIBDIR)/%.c,$(BUILDDIR)/%.o,$(LIB_SOURCES))
LIB_ASM_OBJECTS = $(patsubst $(LIBDIR)/%.asm,$(BUILDDIR)/%.o,$(LIB_ASM_SOURCES))
A="counter_test_0.o"

# Rules
PHONY: all

all: dir elf_files

test:
	@echo $(shell echo $A | tail -c 4 | head -c 1)

# Create a directory
dir:
	mkdir -p $(BUILDDIR)

# Build the executable
elf_files: $(LIB_ASM_OBJECTS) $(LIB_OBJECTS) $(PROG_OBJECTS) $(PROG_MAIN_OBJECTS)
	$(foreach prog,$(PROG_MAIN_OBJECTS),\
		$(LD) $(LDFLAGS) -o $(prog:%.o=%).elf \
		$(LIB_ASM_OBJECTS) $(LIB_OBJECTS) $(PROG_OBJECTS) $(prog);)
	#$(LD) $(LDFLAGS) -o $@ $^

# Build library related files
$(LIB_ASM_OBJECTS): $(BUILDDIR)/%.o : $(LIBDIR)/%.asm
	$(AS) $(ASFLAGS) -o $@ $^

$(LIB_OBJECTS): $(BUILDDIR)/%.o : $(LIBDIR)/%.c
	$(CC) -c $(CFLAGS) -o $@ $^

# Build program sources
$(PROG_OBJECTS): $(BUILDDIR)/%.o : $(SOURCEDIR)/%.c
	@$(CC) -c $(CFLAGS) -o $@ $^

$(PROG_MAIN_OBJECTS): $(BUILDDIR)/%.o : $(SOURCEDIR)/%.c
	@$(CC) -c $(CFLAGS) -o $@ $^

# Generate code.txt files
code_txt:
	@if [ ! -f $(UTIL_FOLDER)/convert_to_bin ]; then \
		echo "Plasma utils not compiled. I will compile them for you" && \
		echo && cd $(BONFIRE_ROOT)/Tools/Plasma_Utils/ && \
		make clean && make all; \
	fi
	$(foreach prog,$(PROG_MAIN_OBJECTS),\
		$(UTIL_FOLDER)/convert_to_bin \
		-i $(prog:%.o=%).elf \
		-t $(SIMUL_TEMP)/code_$(shell echo $(prog) | tail -c 4 | head -c 1).txt;)


clean:
	-$(RM) $(BUILDDIR)
