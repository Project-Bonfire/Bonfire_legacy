SOURCEDIR = src
BUILDDIR = ../../tmp/bin/plasma_utils

CC = gcc
CFLAGS = -O -g

LD = ld

RM = rm -rf

all: dir $(BUILDDIR)/convert_to_bin $(BUILDDIR)/convert_to_bin_le $(BUILDDIR)/bin_to_hex

dir:
	mkdir -p $(BUILDDIR)

# Same as "objcopy -I elf32-big -O binary [filename].elf [filename].bin"
$(BUILDDIR)/convert_to_bin:
	@echo "\nMaking convert_to_bin..."
	@$(CC) -c $(CFLAGS) -o $(BUILDDIR)/convert_to_bin $(SOURCEDIR)/convert.c


$(BUILDDIR)/convert_to_bin_le:
	@echo "\nMaking convert_to_bin_le..."
	@$(CC) -c $(CFLAGS) -DLITTLE_ENDIAN -o $(BUILDDIR)/convert_to_bin_le $(SOURCEDIR)/convert.c

$(BUILDDIR)/bin_to_hex:
	@echo "\nMaking bin_to_hex..."
	@$(CC) -c $(CFLAGS) -o $(BUILDDIR)/bin_to_hex $(SOURCEDIR)/bintohex.c

clean:
	-$(RM) $(BUILDDIR)
