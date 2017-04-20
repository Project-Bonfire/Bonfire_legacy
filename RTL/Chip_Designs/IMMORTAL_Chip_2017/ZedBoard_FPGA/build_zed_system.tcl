#################################################
# IMMORTAL CHIP ZEDBOARD TEST GENERATION SCRIPT #
# Copyright (c) 2017 Karl Janson                #
#################################################

package require Tcl 8.5
package require cmdline

puts "\n\nBONFIRE 2x2 NoC Generator with Plasmas\n"

####################
# Argument parsing #
####################

# Process the command line
set parameters {
    { proj-root.arg "."    "Path to Bonfire root directory. Default value:" }
}

set usage "\n===================\n\nUsage: $argv0 \[options]"

if {[catch {array set options [cmdline::getoptions ::argv $parameters $usage]}]} {
    puts [cmdline::usage $parameters $usage]
    exit 1
} else {
    puts "\nRunning the script with the following configuration:\n"

    puts "* Using \"$options(proj-root)\" as the project root directory.\n"
}

set proj_root $options(proj-root)

set proj_dir "${proj_root}/immortal_zed_fpga"
set noc_ip_dir "${proj_root}/ip_repo/NoC"
set plasma_RTL_dir "${proj_root}/../plasma_RTL"
set network_RTL_dir "${proj_root}/../network_files"
set IJTAG_RTL_dir "${proj_root}/../IJTAG_files"

############
# Clean up #
############
file delete -force -- $proj_dir

##################
# Create project #
##################

create_project immortal_zed_fpga ${proj_dir} -part xc7z020clg484-1 -ip -force

puts "The Bonfire IP will be generated in ${proj_dir}"

##############################################
# Set the directory path for the new project #
##############################################

set proj_dir [get_property directory [current_project]]

##########################
# Set project properties #
##########################

set obj [get_projects immortal_zed_fpga]
set_property "board_part" "em.avnet.com:zed:part0:1.3" $obj
set_property "compxlib.activehdl_compiled_library_dir" \
  "$proj_dir/immortal_zed_fpga.cache/compile_simlib/activehdl" $obj
set_property "compxlib.funcsim" "1" $obj
set_property "compxlib.ies_compiled_library_dir" \
  "$proj_dir/immortal_zed_fpga.cache/compile_simlib/ies" $obj
set_property "compxlib.modelsim_compiled_library_dir" \
  "$proj_dir/immortal_zed_fpga.cache/compile_simlib/modelsim" $obj
set_property "compxlib.overwrite_libs" "0" $obj
set_property "compxlib.questa_compiled_library_dir" \
  "$proj_dir/immortal_zed_fpga.cache/compile_simlib/questa" $obj
set_property "compxlib.riviera_compiled_library_dir" \
  "$proj_dir/immortal_zed_fpga.cache/compile_simlib/riviera" $obj
set_property "compxlib.timesim" "1" $obj
set_property "compxlib.vcs_compiled_library_dir" \
  "$proj_dir/immortal_zed_fpga.cache/compile_simlib/vcs" $obj
set_property "compxlib.xsim_compiled_library_dir" "" $obj
set_property "corecontainer.enable" "0" $obj
set_property "default_lib" "xil_defaultlib" $obj
set_property "enable_optional_runs_sta" "0" $obj
set_property "generate_ip_upgrade_log" "1" $obj
set_property "ip_cache_permissions" "" $obj
set_property "ip_output_repo" "" $obj
set_property "managed_ip" "0" $obj
set_property "pr_flow" "0" $obj
set_property "sim.ip.auto_export_scripts" "1" $obj
set_property "sim.use_ip_compiled_libs" "0" $obj
set_property "simulator_language" "Mixed" $obj
set_property "source_mgmt_mode" "All" $obj
set_property "target_language" "VHDL" $obj
set_property "target_simulator" "XSim" $obj
set_property "xpm_libraries" "" $obj



###########################
# Set IP repository paths #
###########################

set_property "ip_repo_paths" [list\
  "[file normalize ${noc_ip_dir}]"\
  ] $obj

###############################################################
# Rebuild user ip_repo's index before adding any source files #
###############################################################

update_ip_catalog -rebuild

###########################
# Create Block Diagram    #
###########################

create_bd_design "immortal_design"
update_compile_order -fileset sources_1

#############################################
# Create HDL wrapper                        #
#############################################
make_wrapper -files [get_files $proj_dir/immortal_zed_fpga.srcs/sources_1/bd/immortal_design/immortal_design.bd] -top
add_files -norecurse $proj_dir/immortal_zed_fpga.srcs/sources_1/bd/immortal_design/hdl/immortal_design_wrapper.vhd
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

###############################
# Add and confire Zynq module #
###############################
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]
connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK]

###############################
# Add Reset Processing System #
###############################
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0
endgroup

connect_bd_net [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins processing_system7_0/FCLK_RESET0_N]


regenerate_bd_layout


###############################
# Add NoC IP                  #
###############################
startgroup
create_bd_cell -type ip -vlnv ati.ttu.ee:Bonfire:NoC:1.0 NoC_0
endgroup

connect_bd_net [get_bd_pins NoC_0/reset] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
connect_bd_net [get_bd_pins NoC_0/RST] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
connect_bd_net [get_bd_pins NoC_0/clk] [get_bd_pins processing_system7_0/FCLK_CLK0]
regenerate_bd_layout

###############################
# Create port definitions     #
###############################

# IJTAG
create_bd_port -dir I IJTAG_TCK
create_bd_port -dir I IJTAG_SEL
create_bd_port -dir I IJTAG_SI
create_bd_port -dir I IJTAG_SE
create_bd_port -dir I IJTAG_UE
create_bd_port -dir I IJTAG_CE
create_bd_port -dir O IJTAG_SO

# Fault manager
create_bd_port -dir O toF
create_bd_port -dir O toC

# UARTs
create_bd_port -dir I UART_0_IN
create_bd_port -dir O UART_0_OUT
create_bd_port -dir I UART_1_IN
create_bd_port -dir O UART_1_OUT
create_bd_port -dir I UART_2_IN
create_bd_port -dir O UART_2_OUT
create_bd_port -dir I UART_3_IN
create_bd_port -dir O UART_3_OUT

# GPIO
create_bd_port -dir I -from 21 -to 0 GPIO_in
create_bd_port -dir O -from 15 -to 0 GPIO_out


###############################
# Connect NoC pins            #
###############################
# IJTAG
connect_bd_net [get_bd_ports IJTAG_TCK] [get_bd_pins NoC_0/TCK]
connect_bd_net [get_bd_ports IJTAG_SEL] [get_bd_pins NoC_0/SEL]
connect_bd_net [get_bd_ports IJTAG_SI] [get_bd_pins NoC_0/SI]
connect_bd_net [get_bd_ports IJTAG_SE] [get_bd_pins NoC_0/SE]
connect_bd_net [get_bd_ports IJTAG_UE] [get_bd_pins NoC_0/UE]
connect_bd_net [get_bd_ports IJTAG_CE] [get_bd_pins NoC_0/CE]
connect_bd_net [get_bd_ports IJTAG_SO] [get_bd_pins NoC_0/SO]

# Fault manager
connect_bd_net [get_bd_ports toF] [get_bd_pins NoC_0/toF]
connect_bd_net [get_bd_ports toC] [get_bd_pins NoC_0/toC]

# UARTs
connect_bd_net [get_bd_ports UART_0_IN] [get_bd_pins NoC_0/uart_read_0]
connect_bd_net [get_bd_ports UART_0_OUT] [get_bd_pins NoC_0/uart_write_0]
connect_bd_net [get_bd_ports UART_1_IN] [get_bd_pins NoC_0/uart_read_1]
connect_bd_net [get_bd_ports UART_1_OUT] [get_bd_pins NoC_0/uart_write_1]
connect_bd_net [get_bd_ports UART_2_IN] [get_bd_pins NoC_0/uart_read_2]
connect_bd_net [get_bd_ports UART_2_OUT] [get_bd_pins NoC_0/uart_write_2]
connect_bd_net [get_bd_ports UART_3_IN] [get_bd_pins NoC_0/uart_read_3]
connect_bd_net [get_bd_ports UART_3_OUT] [get_bd_pins NoC_0/uart_write_3]

# GPIO
connect_bd_net [get_bd_ports GPIO_in] [get_bd_pins NoC_0/GPIO_in]
connect_bd_net [get_bd_ports GPIO_out] [get_bd_pins NoC_0/GPIO_out]

regenerate_bd_layout

save_bd_design
