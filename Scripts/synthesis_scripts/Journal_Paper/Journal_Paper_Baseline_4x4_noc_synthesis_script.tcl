remove_design -designs

analyze -library WORK -format vhdl {../RTL/Router/credit_based/RTL/xbar.vhd ../RTL/Router/credit_based/RTL/LBDR.vhd ../RTL/Router/credit_based/RTL/FIFO_one_hot_credit_based.vhd ../RTL/Router/credit_based/RTL/arbiter_out.vhd ../RTL/Router/credit_based/RTL/arbiter_in.vhd ../RTL/Router/credit_based/RTL/allocator.vhd ../RTL/Router/credit_based/RTL/Router_32_bit_credit_based.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/tmp/simul_temp/network_4x4_credit_based.vhd}
elaborate network_4x4 -architecture behavior -library DEFAULT -parameters "DATA_WIDTH = 32, DATA_WIDTH_LV = 11"

create_clock -name "clk" -period 5 -waveform { 0 2.5  }  { clk  }

set_dont_touch reset
link

saif_map -start

compile_ultra -no_autoungroup

read_saif -input network_FT_activity.saif -instance_name tb_network_4x4/NoC
report_power -analysis_effort high -hierarchy -levels 2 > noc_full_Baseline_activity_power_results.txt