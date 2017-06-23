SOURCEDIR = src
BUILDDIR = ../../tmp/bin/plasma_utils

CC = gcc
CFLAGS = -O -g

LD = ld

RM = rm -rf

all: dir $(BUILDDIR)/convert_to_bin $(BUILDDIR)/convert_to_bin_le $(BUILDDIR)/bin_to_hex $(BUILDDIR)/gen_ram_image

dir:
	mkdir -p $(BUILDDIR)

# Same as "objcopy -I elf32-big -O binary [filename].elf [filename].bin"
$(BUILDDIR)/convert_to_bin:
	@echo "\nMaking convert_to_bin..."
	@$(CC) $(CFLAGS) -o $(BUILDDIR)/convert_to_bin $(SOURCEDIR)/convert.c


$(BUILDDIR)/convert_to_bin_le:
	@echo "\nMaking convert_to_bin_le..."
	@$(CC) $(CFLAGS) -DLITTLE_ENDIAN -o $(BUILDDIR)/convert_to_bin_le $(SOURCEDIR)/convert.c

$(BUILDDIR)/bin_to_hex:
	@echo "\nMaking bin_to_hex..."
	@$(CC) $(CFLAGS) -o $(BUILDDIR)/bin_to_hex $(SOURCEDIR)/bintohex.c

$(BUILDDIR)/gen_ram_image:
	@echo "\nMaking get_ram_image..."
	@$(CC) $(CFLAGS) -o $(BUILDDIR)/gen_ram_image $(SOURCEDIR)/gen_ram_image.c

clean:
	-$(RM) $(BUILDDIR)
