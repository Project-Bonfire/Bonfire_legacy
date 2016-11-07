analyze -library WORK -format vhdl {/home/bniazmand/pc/Bonfire_backup/src/EHA/synthesis_design_analyzer/FIFO_one_hot_credit_based_packet_drop.vhd}
elaborate FIFO_CREDIT_BASED -architecture BEHAVIOR -library DEFAULT -parameters "DATA_WIDTH = 32"
create_clock -name "clk" -period 10 -waveform { 0 5  }
set_dont_touch reset
compile -exact_map
report_area > area/FIFO_one_hot_credit_based_packet_drop_area.txt