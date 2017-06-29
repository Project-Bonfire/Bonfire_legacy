remove_design -designs
analyze -library WORK -format vhdl {/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Router/credit_based/RTL/xbar.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Router/credit_based/RTL/LBDR.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Router/credit_based/RTL/FIFO_one_hot_credit_based.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Router/credit_based/RTL/arbiter_out.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Router/credit_based/RTL/arbiter_in.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Router/credit_based/RTL/allocator.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Router/credit_based/RTL/Router_32_bit_credit_based.vhd}
elaborate ROUTER_CREDIT_BASED -architecture BEHAVIOR -library DEFAULT -parameters "DATA_WIDTH = 32, current_address = 5, Cx_rst = 15, NoC_size = 4" -update
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
set_dont_touch reset
link
# compile -exact_map -area_effort none 
#compile -exact_map -area_effort low
# compile -exact_map -area_effort medium
compile -exact_map -area_effort high
report_area 