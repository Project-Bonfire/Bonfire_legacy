# Credit-based FIFO synthesis scripts
####################################################################################################

# create folder for reporting area later
sh mkdir area

####################################################################################################

# Original FIFO one-hot (credit-based)

# Read and analyze all vhdl files
analyze -library WORK -format vhdl {../RTL/Router/credit_based/RTL/FIFO_one_hot_credit_based.vhd}
# Elaborate Original FIFO one-hot (credit-based)
elaborate FIFO_credit_based -architecture behavior -library DEFAULT -parameters "DATA_WIDTH = 32"
# clock period set to 10 ns
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
# reset signal
set_dont_touch reset
# compile 
compile -exact_map
# report area (save to output file)
report_area > area/FIFO_one_hot_credit_based_area.txt
# Remove all designs (cached)
remove_design -designs

####################################################################################################

# FIFO one-hot (credit-based) with packet dropping

# Read and analyze all vhdl files
analyze -library WORK -format vhdl {../RTL/Router/credit_based/RTL/FIFO_one_hot_credit_based_packet_drop.vhd}
# Elaborate FIFO one-hot (credit-based) with packet dropping
elaborate FIFO_credit_based -architecture behavior -library DEFAULT -parameters "DATA_WIDTH = 32"
# clock period set to 10 ns
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
# reset signal
set_dont_touch reset
# compile 
compile -exact_map
# report area (save to output file)
report_area > area/FIFO_one_hot_credit_based_packet_drop_area.txt
# Remove all designs (cached)
remove_design -designs

####################################################################################################

# FIFO one-hot (credit-based) with packet dropping and flit saving

# Read and analyze all vhdl files
analyze -library WORK -format vhdl {../RTL/Router/credit_based/RTL/FIFO_one_hot_credit_based_packet_drop_flit_saving.vhd}
# Elaborate FIFO one-hot (credit-based) with packet dropping and flit saving
elaborate FIFO_credit_based -architecture behavior -library DEFAULT -parameters "DATA_WIDTH = 32"
# clock period set to 10 ns
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
# reset signal
set_dont_touch reset
# compile 
compile -exact_map
# report area (save to output file)
report_area > area/FIFO_one_hot_credit_based_packet_drop_flit_saving_area.txt
# Remove all designs (cached)
remove_design -designs


####################################################################################################

# FIFO one-hot (credit-based) with packet dropping and fault classifier support

# Read and analyze all vhdl files
analyze -library WORK -format vhdl {../RTL/Router/credit_based/RTL/FIFO_one_hot_credit_based_packet_drop_classifier_support.vhd}
# Elaborate FIFO one-hot (credit-based) with packet dropping and fault classifier support
elaborate FIFO_credit_based -architecture behavior -library DEFAULT -parameters "DATA_WIDTH = 32"
# clock period set to 10 ns
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
# reset signal
set_dont_touch reset
# compile 
compile -exact_map
# report area (save to output file)
report_area > area/FIFO_one_hot_credit_based_packet_drop_classifier_support_area.txt
# Remove all designs (cached)
remove_design -designs

####################################################################################################

exit

####################################################################################################