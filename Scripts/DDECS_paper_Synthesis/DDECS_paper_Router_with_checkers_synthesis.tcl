remove_design -designs
define_design_lib WORK -path ./WORK
analyze -library WORK -format vhdl {/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/ParityChecker_for_LBDR.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/xbar.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/counter_threshold.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/LBDR_packet_drop_with_checkers/Rxy_Reconf_pseudo_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/LBDR_packet_drop_with_checkers/LBDR_packet_drop_routing_part_pseudo_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/LBDR_packet_drop_with_checkers/Cx_Reconf_pseudo_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/LBDR_packet_drop_with_checkers/LBDR_packet_drop_with_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/FIFO_one_hot_credit_based_packet_drop_classifier_support_with_checkers/FIFO_one_hot_credit_based_packet_drop_classifier_support_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/FIFO_one_hot_credit_based_packet_drop_classifier_support_with_checkers/FIFO_one_hot_credit_based_packet_drop_classifier_support_with_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/Allocator_with_checkers/Arbiter_out_one_hot_pseudo_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/Allocator_with_checkers/arbiter_out_one_hot_with_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/Allocator_with_checkers/Arbiter_in_one_hot_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/Allocator_with_checkers/Arbiter_in_one_hot_with_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/Allocator_with_checkers/allocator_logic_pseudo_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/Allocator_with_checkers/allocator_credit_counter_logic_pseudo_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/Allocator_with_checkers/allocator_with_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/checkers_counter_threshold.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/Router_32_bit_credit_based_packet_drop_classifier_SHMU_will_full_set_of_checkers.vhd}
elaborate ROUTER_CREDIT_BASED_PD_C_SHMU -architecture BEHAVIOR -library DEFAULT -parameters "DATA_WIDTH = 32, current_address = 5, Rxy_rst = 60, Cx_rst = 15, healthy_counter_threshold = 15, faulty_counter_threshold = 4, counter_depth = 4, NoC_size = 4" -update
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
set_dont_touch reset
compile -exact_map
uplevel #0 { report_area -hierarchy } > area.txt