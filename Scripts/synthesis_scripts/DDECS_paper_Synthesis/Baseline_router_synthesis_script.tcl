remove_design -designs
analyze -library WORK -format vhdl {../../RTL/Router/credit_based/RTL/xbar.vhd ../../RTL/Router/credit_based/RTL/LBDR.vhd ../../RTL/Router/credit_based/RTL/FIFO_one_hot_credit_based.vhd ../../RTL/Router/credit_based/RTL/arbiter_out.vhd ../../RTL/Router/credit_based/RTL/arbiter_in.vhd ../../RTL/Router/credit_based/RTL/allocator.vhd ../../RTL/Router/credit_based/RTL/Router_32_bit_credit_based.vhd}
elaborate ROUTER_CREDIT_BASED -architecture BEHAVIOR -library DEFAULT -parameters "DATA_WIDTH = 32, current_address = 5, Cx_rst = 15, NoC_size = 4" -update
create_clock -name "clk" -period 5 -waveform { 0 2.5  }  { clk  }
set_dont_touch reset
link
# compile -exact_map -area_effort none 
#compile -exact_map -area_effort low
# compile -exact_map -area_effort medium
compile -exact_map 
report_area 
uplevel #0 { report_area -hierarchy } > Baseline_credit_based_router_area_results.txt
report_qor > Baseline_router_critical_path_delay_report.txt