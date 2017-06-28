# Credit_based Flow Control router synthesis script (for router and individual components)
####################################################################################################

# create folder for reporting area later
sh mkdir area

####################################################################################################

# Read and analyze all vhdl files for credit-based flow control router (RTL codes)

analyze -library WORK -format vhdl {../../RTL/Router/credit_based/RTL/arbiter_in.vhd ../../RTL/Router/credit_based/RTL/arbiter_out.vhd ../../RTL/Router/credit_based/RTL/allocator.vhd ../../RTL/Router/credit_based/RTL/FIFO_one_hot_credit_based.vhd ../../RTL/Router/credit_based/RTL/LBDR.vhd ../../RTL/Router/credit_based/RTL/Router_32_bit_credit_based.vhd ../../RTL/Router/credit_based/RTL/xbar.vhd}

####################################################################################################

# FIFO one-hot (credit-based)
elaborate FIFO_credit_based -architecture behavior -library DEFAULT -parameters "DATA_WIDTH = 32"
# clock period set to 10 ns
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
# reset signal
set_dont_touch reset
# compile 
compile -exact_map
# report area (save to output file)
report_area > area/FIFO_one_hot_credit_based_area.txt

####################################################################################################

# LBDR (XY routing, router ID 5, network size: 4x4 (2D Mesh))
elaborate LBDR -architecture behavior -library DEFAULT -parameters "cur_addr_rst = 5, Cx_rst = 15, NoC_size = 4"
# clock period set to 10 ns
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
# reset signal
set_dont_touch reset
# compile 
compile -exact_map
# report area (save to output file)
report_area > area/LBDR_area.txt

####################################################################################################

# Arbiter_in
elaborate arbiter_in -architecture behavior -library DEFAULT
# clock period set to 10 ns
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
# reset signal
set_dont_touch reset
# compile 
compile -exact_map
# report area (save to output file)
report_area > area/arbiter_in_area.txt

####################################################################################################

# Arbiter_out
elaborate arbiter_out -architecture behavior -library DEFAULT
# clock period set to 10 ns
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
# reset signal
set_dont_touch reset
# compile 
compile -exact_map
# report area (save to output file)
report_area > area/arbiter_out_area.txt

####################################################################################################

# Allocator
elaborate allocator -architecture behavior -library DEFAULT
# clock period set to 10 ns
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
# reset signal
set_dont_touch reset
# compile 
compile -exact_map
# report area (save to output file)
report_area > area/allocator_area.txt

####################################################################################################


####################################################################################################

# XBAR (32 bit)
elaborate XBAR -architecture behavior -library DEFAULT -parameters "DATA_WIDTH = 32"
# clock period set to 10 ns
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
# reset signal
set_dont_touch reset
# compile 
compile -exact_map
# report area (save to output file)
report_area > area/XBAR_area.txt

####################################################################################################

# Router (credit-based flow control) (32 bit data width, XY routing, router ID 5, network size: 4x4 (2D Mesh))
elaborate router_credit_based -architecture behavior -library DEFAULT -parameters "DATA_WIDTH = 32, current_address = 5, Cx_rst = 15, NoC_size = 4"
# clock period set to 10 ns
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
# reset signal
set_dont_touch reset
# compile 
compile -exact_map
# report area (save to output file)
report_area > area/Router_32_bit_credit_based_area.txt

####################################################################################################

# Remove all designs (cached)
remove_design -designs
exit

####################################################################################################