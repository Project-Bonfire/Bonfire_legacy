###################################
# AXI NI TESTER GENERATION SCRIPT #
# Copyright (c) 2016 Karl Janson  #
###################################

package require Tcl 8.5
package require cmdline

puts "\n\nBONFIRE NI AXI TESTER GENERATION SCRIPT\n"

####################
# Argument parsing #
####################

# Process the command line
set parameters {
    { proj-root.arg "../../.."    "Path to Bonfire root directory. Default value:" }
    { ni-depth.arg          16    "NI's FIFO size. Default value:" }
    { generate                    "Generate and export bitsream. Disabled by default." }
    { sdk                         "Launch SDK (implies -generate). Disabled by default." }
    { close                       "Close the project after finishing. Disabled by default." }
}

set usage "\n===================\n\nUsage: $argv0 \[options]"

if {[catch {array set options [cmdline::getoptions ::argv $parameters $usage]}]} {
    puts [cmdline::usage $parameters $usage]
    exit 1
} else {
    puts "\nRunning the script with the following configuration:\n"

    puts "* Using \"$options(proj-root)\" as the project root directory."
    puts "  \t (vivado project will be created in \"$options(proj-root)/integration/AXI_NI_tester\")"
    puts "* Adding the NI with FIFO width $options(ni-depth)."

    if {$options(generate) || $options(sdk)} {
      puts "* Will generate the bitsream"
    }

    if {$options(sdk)} {
      puts "* Will launch SDK after bitstream generation has finished"
    }

    if {$options(close)} {
      puts "* Will close the vivado project after finishing"
    }
}

set proj-root $options(proj-root)
set ni-depth $options(ni-depth)

##################
# Create project #
##################

puts "\n\n#####################\nBuilding schematic...\n#####################\n\n"

puts "The AXI NI tester project will be created in ${proj-root}/integration/AXI_NI_tester"

create_project AXI_NI_tester ${proj-root}/integration/AXI_NI_tester -part xc7z020clg484-1 -force

##############################################
# Set the directory path for the new project #
##############################################

set proj_dir [get_property directory [current_project]]

############################
# Setup project properties #
############################

set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
set_property target_language VHDL [current_project]


#######################
# Create block design #
#######################

create_bd_design "AXI_NI_tester"

################
# Add IP repos #
################
set ni_repo_path ${proj-root}/integration/ip_repo/NoC_NI_AXI

set_property ip_repo_paths [list \
  ${proj-root}/integration/ip_repo/NoC_NI_AXI \
] [current_fileset]

update_ip_catalog

############
# Add Zynq #
############

# Add IP
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup

# Run design automation
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {
  make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable"
  }  [get_bd_cells processing_system7_0]

# Connect AXI clock
connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] \
  [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK]

# Add interrupt input
startgroup
  set_property -dict [list \
    CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
    CONFIG.PCW_IRQ_F2P_INTR {1}
    ] [get_bd_cells processing_system7_0]
endgroup

############
# Add NI 0 #
############

# Add IP
startgroup
  create_bd_cell -type ip -vlnv ati.ttu.ee:Bonfire:NoC_NI_AXI:1.0 NoC_NI_AXI_0
endgroup

#Run connection automation for AXI, clock, reset
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {
  Master "/processing_system7_0/M_AXI_GP0" Clk "Auto"
  } [get_bd_intf_pins NoC_NI_AXI_0/s00_axi]

# Connect the interrupt output
connect_bd_net [get_bd_pins NoC_NI_AXI_0/AXI_RX_IRQ] \
               [get_bd_pins processing_system7_0/IRQ_F2P]

# Connect router input of the NI to router input (loopback connection)
connect_bd_intf_net [get_bd_intf_pins NoC_NI_AXI_0/router_in] \
                    [get_bd_intf_pins NoC_NI_AXI_0/router_out]

# Configure NI
startgroup
set_property -dict [list \
  CONFIG.C_S00_AXI_ADDR_WIDTH {4} \
  CONFIG.C_S00_AXI_DATA_WIDTH {32} \
  CONFIG.NI_DEPTH ${ni-depth}] \
  [get_bd_cells NoC_NI_AXI_0]
endgroup

################################################
# Save block diagran and generate VHDL wrapper #
################################################

save_bd_design

make_wrapper -files [get_files \
  ${proj-root}/integration/AXI_NI_tester/AXI_NI_tester.srcs/sources_1/bd/AXI_NI_tester/AXI_NI_tester.bd] -top

add_files -norecurse \
  ${proj-root}/integration/AXI_NI_tester/AXI_NI_tester.srcs/sources_1/bd/AXI_NI_tester/hdl/AXI_NI_tester_wrapper.vhd

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

##################################
# Bitsream generation and export #
##################################

if {$options(generate) || $options(sdk)} {

  puts "\n\n#######################\nGenerating bitstream...\n#######################\n\n"

  # Generate bitstream (involves synthesis and implementation)
  launch_runs impl_1 -to_step write_bitstream
  wait_on_run impl_1

  # Export the bitstream
  file mkdir ${proj-root}/integration/AXI_NI_tester/AXI_NI_tester.sdk
  file copy -force \
    ${proj-root}/integration/AXI_NI_tester/AXI_NI_tester.runs/impl_1/AXI_NI_tester_wrapper.sysdef \
    ${proj-root}/integration/AXI_NI_tester/AXI_NI_tester.sdk/AXI_NI_tester_wrapper.hdf
}

##############
# Launch SDK #
##############

if {$options(sdk)} {
  puts "\n\n################\nLaunching SDK...\n################\n\n"
  launch_sdk \
    -workspace ${proj-root}/integration/AXI_NI_tester/AXI_NI_tester.sdk \
    -hwspec ${proj-root}/integration/AXI_NI_tester/AXI_NI_tester.sdk/AXI_NI_tester_wrapper.hdf
}

#################
# Close project #
#################

if {$options(close)} {
  puts "\n\n######################\nClosing Vivado project\n######################\n"
  close_project
}
