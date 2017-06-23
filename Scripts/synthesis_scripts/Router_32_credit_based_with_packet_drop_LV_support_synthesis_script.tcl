# Credit_based Flow Control router with packet dropping and LV network support synthesis script
####################################################################################################

# create folder for reporting area later
sh mkdir area

####################################################################################################

# Read and analyze all vhdl files for credit-based flow control router (RTL codes)

analyze -library WORK -format vhdl {../RTL/Fault_Management/Fault_management_network/packetizer_LV.vhd ../RTL/Router/credit_based/RTL/counter_threshold.vhd ../RTL/Router/credit_based/RTL/arbiter_in.vhd ../RTL/Router/credit_based/RTL/arbiter_out.vhd ../RTL/Router/credit_based/RTL/allocator.vhd ../RTL/Router/credit_based/RTL/FIFO_one_hot_credit_based_packet_drop_classifier_support.vhd ../RTL/Router/credit_based/RTL/LBDR.vhd ../RTL/Router/credit_based/RTL/xbar.vhd ../RTL/Router/credit_based/RTL/Router_32_bit_credit_based_packet_drop_LV_compatible.vhd}

####################################################################################################

# FIFO credit-based with packet dropping and fault classification support
elaborate FIFO_credit_based -architecture behavior -library DEFAULT -parameters "DATA_WIDTH = 32"
# clock period set to 10 ns
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
# reset signal
set_dont_touch reset
# compile
compile -exact_map
# report area (save to output file)
report_area > area/FIFO_one_hot_credit_based_packet_drop_classifier_support_area.txt

####################################################################################################

# Counter Threshold Classifier
elaborate counter_threshold_classifier -architecture behavior -library DEFAULT -parameters "counter_depth = 4, healthy_counter_threshold = 15, faulty_counter_threshold = 4"
# clock period set to 10 ns
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
# reset signal
set_dont_touch reset
# compile
compile -exact_map
# report area (save to output file)
report_area > area/counter_threshold_area.txt

####################################################################################################

# Router (credit-based flow control) (32 bit data width, XY routing, router ID 5, network size: 4x4 (2D Mesh))
elaborate router_credit_based_parity_lv -architecture behavior -library DEFAULT -parameters "DATA_WIDTH = 32, DATA_WIDTH_LV = 11, current_address = 5, Rxy_rst = 60, Cx_rst = 15, healthy_counter_threshold = 15, faulty_counter_threshold = 4, counter_depth = 4, NoC_size = 4"
# clock period set to 10 ns
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
# reset signal
set_dont_touch reset
# compile
compile -exact_map
# report area (save to output file)
report_area > area/Router_32_bit_credit_based_packet_drop_LV_compatible_area.txt

####################################################################################################

# Remove all designs (cached)
# remove_design -designs
exit

####################################################################################################