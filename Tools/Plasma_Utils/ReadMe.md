# Tools for Plasma CPU

**Some generic tools used for the Plasma CPU. The tools are adopted from the Plasma CPU project.**

## Disclaimer:
_The Plasma CPU project has been placed into the public domain by its original author
Steve Rhoads (rhoadss@yahoo.com), and is free for commercial and non-commercial use._

_This software is provided "as is" and any express or implied warranties, including,
but not limited to, the implied warranties of merchantability and fitness for a
particular purpose are disclaimed._


_The code has been modified by Karl Janson in 2016. Above mentioned license applies
to this version as well._

## Tools
The following tools are included:
* **convert_to_bin:**

  Reads [filename].elf (in MIPS-I 32-bit ELF executable format) and outputs
  [filename].bin (objects in binary format) and code.txt (text file with the opcodes, for VHDL simulation).
  All input and output files are assumed to be in big endian format.

  Essentially the same as "objcopy -I elf32-big -O binary [filename].elf [filename].bin"


* **convert_to_bin_le:**

	The same as convert_to_bin, but in little endian format


* **bin_to_hex:**

	Convert the binary object file [filename].bin into hexadecimal object file [filename].hex

## Building
* **To build** the tools, run __make all__ in the root directory (or __make <tool_name>__ to only build a specific tool)
* **To clean**, run __make clean__
