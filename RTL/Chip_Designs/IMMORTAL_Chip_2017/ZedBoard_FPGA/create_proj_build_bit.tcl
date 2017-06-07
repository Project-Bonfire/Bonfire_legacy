# This script, gets vhd files, generates bitstream, for that read and do next 3 comments.

#1 set this generic first and point it to your Bonfire folder.
  set origin /home/tsotne/ownCloud/git/Bonfire_sim/Bonfire
#2 then, to run the script:
  # in GUI      : open Vivado and : Tools -> Run Tcl Script -> point to this script
  # in Terminal [first fix the path on this line] : vivado -mode tcl -source /home/tsotne/ownCloud/git/Bonfire_sim/Bonfire/RTL/Chip_Designs/IMMORTAL_Chip_2017/ZedBoard_FPGA/create_proj_build_bit.tcl
#3 to communicate with UART: NoC writes into Pmod JB2, reads from Pmod JB1, with boud rate: 57600.
  # example: picocom -b 57600 /dev/ttyUSB0






# create project
start_gui
create_project immortal_zed $origin/tmp/vivado/immortal_zed -part xc7z020clg484-1 -force
set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
set_property target_language VHDL [current_project]

# add vhd files
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/component_pack.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/shift_register_serial_in.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/Allocator_with_checkers_with_FI/Arbiter_out_one_hot_pseudo_checkers.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/Fault_injector.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/Allocator_with_checkers_with_FI/Arbiter_in_one_hot_checkers.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/mlite_pack.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/shifter.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/reg_bank_tri_port.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/pipeline.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/pc_next.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/mult.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/mem_ctrl.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/control.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/bus_mux.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/alu.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/Allocator_with_checkers_with_FI/allocator_logic_pseudo_checkers.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/Allocator_with_checkers_with_FI/allocator_credit_counter_logic_pseudo_checkers.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/Allocator_with_checkers_with_FI/Arbiter_in_one_hot_with_checkers_with_FI.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/FIFO_one_hot_credit_based_packet_drop_classifier_support_with_checkers_with_FI/FIFO_one_hot_credit_based_packet_drop_classifier_support_checkers.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/LBDR_packet_drop_with_checkers_with_FI/Cx_Reconf_pseudo_checkers.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/LBDR_packet_drop_with_checkers_with_FI/LBDR_packet_drop_routing_part_pseudo_checkers.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/Allocator_with_checkers_with_FI/arbiter_out_one_hot_with_checkers_with_FI.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/LBDR_packet_drop_with_checkers_with_FI/Rxy_Reconf_pseudo_checkers.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/IJTAG_files/ScanRegister.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/ram_xilinx_3.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/ram_xilinx_2.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/ram_xilinx_1.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/ram_xilinx_0.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/uart.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/ram.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/mlite_cpu.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/cache.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/NI.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/eth_dma.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/Allocator_with_checkers_with_FI/allocator_with_checkers_with_FI.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/counter_threshold.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/ParityChecker_for_LBDR.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/xbar.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/LBDR_packet_drop_with_checkers_with_FI/LBDR_packet_drop_with_checkers_with_FI.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/FIFO_one_hot_credit_based_packet_drop_classifier_support_with_checkers_with_FI/FIFO_one_hot_credit_based_packet_drop_classifier_support_with_checkers_with_FI.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/IJTAG_files/ScanMux.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/IJTAG_files/SReg.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/plasma.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/customized_routers/Router_32_bit_NW_credit_based_packet_drop_classifier_SHMU_will_full_set_of_checkers_with_FI.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/customized_routers/Router_32_bit_SW_credit_based_packet_drop_classifier_SHMU_will_full_set_of_checkers_with_FI.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/customized_routers/Router_32_bit_SE_credit_based_packet_drop_classifier_SHMU_will_full_set_of_checkers_with_FI.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/customized_routers/Router_32_bit_NE_credit_based_packet_drop_classifier_SHMU_will_full_set_of_checkers_with_FI.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/IJTAG_files/AsyncDataRegisterAdapter.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/IJTAG_files/SIB_mux_pre_FCX_SELgate.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/plasma_RTL/NoC_Node.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/network_2x2_customized_packet_drop_SHMU_credit_based_with_checkers.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/network_files/network_2x2_customized_packet_drop_SHMU_credit_based_with_checkers_with_PE_top.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/ZedBoard_FPGA/toppest_module.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/Testbenches/network_2x2_NI_PE_credit_based_tb_top.vhd
add_files -norecurse -scan_for_includes $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/Testbenches/sim_uart.vhd
set_property used_in_simulation false [get_files  $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/ZedBoard_FPGA/toppest_module.vhd]
set_property used_in_synthesis false [get_files  $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/Testbenches/network_2x2_NI_PE_credit_based_tb_top.vhd]
set_property used_in_synthesis false [get_files -of_objects [get_filesets sources_1] $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/Testbenches/sim_uart.vhd]



# add constraints
add_files -fileset constrs_1 -norecurse           $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/ZedBoard_FPGA/constraints.xdc
set_property used_in_synthesis false [get_files   $origin/RTL/Chip_Designs/IMMORTAL_Chip_2017/ZedBoard_FPGA/constraints.xdc]



#add clock generator [CLKOUT1_REQUESTED_OUT_FREQ and CLKOUT2_REQUESTED_OUT_FREQ contain values how many mhz they generate]
create_ip -name clk_wiz -vendor xilinx.com -library ip -version 5.3 -module_name clk_wiz_0
set_property -dict [list CONFIG.CLKOUT2_USED {true} CONFIG.CLK_OUT1_PORT {clk1_noc} CONFIG.CLK_OUT2_PORT {clk2_ijtag} CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {25.000} CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {5.000} CONFIG.USE_LOCKED {false} CONFIG.USE_RESET {false} CONFIG.MMCM_DIVCLK_DIVIDE {1} CONFIG.MMCM_CLKFBOUT_MULT_F {6.250} CONFIG.MMCM_CLKOUT0_DIVIDE_F {25.000} CONFIG.MMCM_CLKOUT1_DIVIDE {125} CONFIG.NUM_OUT_CLKS {2} CONFIG.CLKOUT1_JITTER {196.678} CONFIG.CLKOUT1_PHASE_ERROR {128.132} CONFIG.CLKOUT2_JITTER {270.159} CONFIG.CLKOUT2_PHASE_ERROR {128.132}] [get_ips clk_wiz_0]
generate_target {instantiation_template} [get_files $origin/tmp/vivado/immortal_zed/immortal_zed.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci]



#create bitstream
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1


#open FPGA programmer
open_hw
connect_hw_server
open_hw_target
