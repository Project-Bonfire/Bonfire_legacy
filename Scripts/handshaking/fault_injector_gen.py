import sys
from math import ceil, log

if '--help' in sys.argv[1:]:
  print "\t-DW [data_width]: sets the data width of the network!"
  print "\t-o: specifies the name and path of the output file. default path is current folder!"
  print "\t**Example: python fault_injector_gen.py -DW 32 -o ../output.vhd"
  print "\t           generates a fault_injector that for 32 bit data link into ../output.vhd"
  sys.exit()

if '-DW' in sys.argv[1:]:
  data_width = int(sys.argv[sys.argv.index('-DW')+1])
  if data_width % 2 != 0:
    raise ValueError("wrong data width. please choose powers of 2. for example 32!")
else:
  data_width = 32


if '-o'  in sys.argv[1:]: 
  file_path = sys.argv[sys.argv.index('-o')+1]
  if ".vhd" not in file_path:
      raise ValueError("wrong file extention. only vhdl files are accepted!")
else:
  file_path = 'fault_injector_'+str(data_width)+'bit.vhd'

fi_file = open(file_path, 'w')

fi_addres_width = int(ceil(log(data_width,2)))    

fi_file.write("--Copyright (C) 2016 Siavoosh Payandeh Azad")
fi_file.write("\n")
fi_file.write("library ieee;\n")
fi_file.write("use ieee.std_logic_1164.all;\n")
fi_file.write("USE ieee.numeric_std.ALL; \n")
fi_file.write("\n")
fi_file.write("entity fault_injector is \n")
fi_file.write("	generic(DATA_WIDTH : integer := 32);\n")
fi_file.write("	port(\n")
fi_file.write("		data_in: in std_logic_vector (DATA_WIDTH-1 downto 0);\n")
fi_file.write("		address: in std_logic_vector("+str(fi_addres_width-1)+" downto 0);\n")
fi_file.write("		sta_0: in std_logic;\n")
fi_file.write("		sta_1: in std_logic;\n")
fi_file.write("		data_out: out std_logic_vector (DATA_WIDTH-1 downto 0)\n")
fi_file.write("		);\n")
fi_file.write("end fault_injector;\n")
fi_file.write("\n")
fi_file.write("architecture behavior of fault_injector is\n")
fi_file.write("signal mask: std_logic_vector (DATA_WIDTH-1 downto 0);\n")
fi_file.write("begin \n")
fi_file.write("\n")
fi_file.write("--  data_in |  sta_0 | sta_1  |  data_out\n")
fi_file.write("--  --------|--------|--------|----------  \n")
fi_file.write("--      0   |    0   |  0     |   0       \n")
fi_file.write("--      1   |    0   |  0     |   1   \n")
fi_file.write("--      X   |    0   |  1     |   1                     \n")
fi_file.write("--      X   |    1   |  0     |   0      \n")
fi_file.write("\n")
fi_file.write("  mask <=  std_logic_vector(to_unsigned(to_integer(signed(address)), mask'length));\n")
fi_file.write("  Gen_faulty:\n")
fi_file.write("  for i in 0 to DATA_WIDTH-1 generate\n")
fi_file.write("	data_out(i)  <= (data_in(i) and not sta_1 and not sta_0) or (mask(i) and sta_1);\n")
fi_file.write("  end generate;                          \n")
fi_file.write("end;\n")

fi_file.close()