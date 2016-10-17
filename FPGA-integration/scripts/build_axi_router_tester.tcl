#######################################
# AXI ROUTER TESTER GENERATION SCRIPT #
# Copyright (c) 2016 Karl Janson      #
#######################################

package require Tcl 8.5
package require cmdline

#############################################################################
# Function for calculating the connectivity bits based on the network size. #
#                                                                           #
# @param node_id: Node address in the network                               #
# @param network_dime: The network size                                     #
#                                                                           #
# @return Connectivity bits                                                 #
#############################################################################

proc cx_rst_calculator {node_id network_dime} {

  set node_x [ expr $node_id % $network_dime ]
  set node_y [ expr $node_id / $network_dime ]

  if {$node_y == [expr $network_dime-1 ]} {
    set c_s 0
  } else {
    set c_s 1
  }

  if {$node_x == [expr $network_dime-1 ]} {
    set c_e 0
  } else {
    set c_e 1
  }

  return [expr $c_s*8+$node_x*4+$c_e*2+$node_y]
}

puts "\n\nBONFIRE ROTUER TESTER GENERATION SCRIPT\n"
puts "\nNOTE: XY routing is assumed\n"

####################
# Argument parsing #
####################

# Process the command line
set parameters {
  { proj-root.arg "../../.."    "Path to Bonfire root directory. Default value:" }
  { ni-depth.arg          16    "NI's FIFO size. Default value:" }
  { d.arg                  2    "Emulated NoC size that the router under test sees. Needs to be an even number Default value:" }
  { addr.arg               0    "The address of router in test in the emulated network. Default value:" }
  { generate                    "Generate and export bitsream. Disabled by default." }
  { sdk                         "Launch SDK (implies -generate). Disabled by default." }
  { close                       "Close the project after finishing. Disabled by default." }
}

set usage "\n===================\n\nUsage: $argv0 \[options]"

if {[catch {array set options [cmdline::getoptions ::argv $parameters $usage]}]} {
  puts [cmdline::usage $parameters $usage]
  exit 1

} else {
  if {[expr $options(d)%2] != 0} {
    puts "The network size should be an even number!"
    exit 1
  }

  if {$options(addr) > [expr pow($options(d), 2)-1]} {
    puts "There can be no router with address $options(addr) in a $options(d)x$options(d) network!"
    exit 1
  }

  puts "\nRunning the script with the following configuration:\n"

  puts "* Using \"$options(proj-root)\" as the project root directory"
  puts "  \t (vivado project will be created in \"$options(proj-root)/integration/AXI_NI_tester\")"
  puts "* Adding the NI with FIFO width $options(ni-depth)"
  puts "* Configuring the router for network size of $options(d)x$options(d)"
  puts "* Configuring the router to use address $options(addr)"

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

puts "The Router tester project will be created in ${proj-root}/integration/Router_tester"

create_project Router_tester ${proj-root}/integration/Router_tester -part xc7z020clg484-1 -force

##############################################
# Set the directory path for the new project #
##############################################

set proj_dir [get_property directory [current_project]]

############################
# Setup project properties #
############################

set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
set_property target_language VHDL [current_project]

################
# Add IP repos #
################

set_property ip_repo_paths [list \
  ${proj-root}/integration/ip_repo/NoC_NI_AXI \
  ${proj-root}/integration/ip_repo/NoC_Router \
] [current_fileset]

update_ip_catalog

#######################
# Create block design #
#######################

create_bd_design "Router_tester"

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

######################################
# Concat IP for multiple IRQ support #
######################################

# Add IP
startgroup
  create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0
endgroup

# Change the number of inputs to 5
startgroup
  set_property -dict [list CONFIG.NUM_PORTS {5}] \
    [get_bd_cells xlconcat_0]
endgroup

# Connect the output to Zynq's IRQ input
connect_bd_net [get_bd_pins xlconcat_0/dout] \
  [get_bd_pins processing_system7_0/IRQ_F2P]

################
# Add North NI #
################

# Add IP
startgroup
  create_bd_cell -type ip -vlnv ati.ttu.ee:Bonfire:NoC_NI_AXI:1.0 NoC_NI_AXI_N
endgroup

#Run connection automation for AXI, clock, reset
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {
  Master "/processing_system7_0/M_AXI_GP0" Clk "Auto"
  } [get_bd_intf_pins NoC_NI_AXI_N/s00_axi]

# Connect the interrupt output
connect_bd_net [get_bd_pins NoC_NI_AXI_N/AXI_RX_IRQ] [get_bd_pins xlconcat_0/In0]


# Configure NI
startgroup
  set_property -dict [list \
    CONFIG.C_S00_AXI_ADDR_WIDTH {4} \
    CONFIG.C_S00_AXI_DATA_WIDTH {32} \
    CONFIG.NI_DEPTH ${ni-depth}] \
    [get_bd_cells NoC_NI_AXI_N]
endgroup

###############
# Add East NI #
###############

# Add IP
startgroup
  create_bd_cell -type ip -vlnv ati.ttu.ee:Bonfire:NoC_NI_AXI:1.0 NoC_NI_AXI_E
endgroup

#Run connection automation for AXI, clock, reset
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {
  Master "/processing_system7_0/M_AXI_GP0" Clk "Auto"
  } [get_bd_intf_pins NoC_NI_AXI_E/s00_axi]

# Connect the interrupt output
connect_bd_net [get_bd_pins NoC_NI_AXI_E/AXI_RX_IRQ] [get_bd_pins xlconcat_0/In1]


# Configure NI
startgroup
  set_property -dict [list \
    CONFIG.C_S00_AXI_ADDR_WIDTH {4} \
    CONFIG.C_S00_AXI_DATA_WIDTH {32} \
    CONFIG.NI_DEPTH ${ni-depth}] \
    [get_bd_cells NoC_NI_AXI_E]
endgroup

################
# Add South NI #
################

# Add IP
startgroup
  create_bd_cell -type ip -vlnv ati.ttu.ee:Bonfire:NoC_NI_AXI:1.0 NoC_NI_AXI_S
endgroup

#Run connection automation for AXI, clock, reset
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {
  Master "/processing_system7_0/M_AXI_GP0" Clk "Auto"
  } [get_bd_intf_pins NoC_NI_AXI_S/s00_axi]

# Connect the interrupt output
connect_bd_net [get_bd_pins NoC_NI_AXI_S/AXI_RX_IRQ] [get_bd_pins xlconcat_0/In2]


# Configure NI
startgroup
  set_property -dict [list \
    CONFIG.C_S00_AXI_ADDR_WIDTH {4} \
    CONFIG.C_S00_AXI_DATA_WIDTH {32} \
    CONFIG.NI_DEPTH ${ni-depth}] \
    [get_bd_cells NoC_NI_AXI_S]
endgroup

###############
# Add West NI #
###############

# Add IP
startgroup
  create_bd_cell -type ip -vlnv ati.ttu.ee:Bonfire:NoC_NI_AXI:1.0 NoC_NI_AXI_W
endgroup

#Run connection automation for AXI, clock, reset
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {
  Master "/processing_system7_0/M_AXI_GP0" Clk "Auto"
  } [get_bd_intf_pins NoC_NI_AXI_W/s00_axi]

# Connect the interrupt output
connect_bd_net [get_bd_pins NoC_NI_AXI_W/AXI_RX_IRQ] [get_bd_pins xlconcat_0/In3]


# Configure NI
startgroup
  set_property -dict [list \
    CONFIG.C_S00_AXI_ADDR_WIDTH {4} \
    CONFIG.C_S00_AXI_DATA_WIDTH {32} \
    CONFIG.NI_DEPTH ${ni-depth}] \
    [get_bd_cells NoC_NI_AXI_W]
endgroup

################
# Add Local NI #
################

# Add IP
startgroup
  create_bd_cell -type ip -vlnv ati.ttu.ee:Bonfire:NoC_NI_AXI:1.0 NoC_NI_AXI_L
endgroup

#Run connection automation for AXI, clock, reset
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {
  Master "/processing_system7_0/M_AXI_GP0" Clk "Auto"
  } [get_bd_intf_pins NoC_NI_AXI_L/s00_axi]

# Connect the interrupt output
connect_bd_net [get_bd_pins NoC_NI_AXI_L/AXI_RX_IRQ] [get_bd_pins xlconcat_0/In4]


# Configure NI
startgroup
  set_property -dict [list \
    CONFIG.C_S00_AXI_ADDR_WIDTH {4} \
    CONFIG.C_S00_AXI_DATA_WIDTH {32} \
    CONFIG.NI_DEPTH ${ni-depth}] \
    [get_bd_cells NoC_NI_AXI_L]
endgroup

################
# Add Router 0 #
################

# Add IP
startgroup
  create_bd_cell -type ip -vlnv ati.ttu.ee:Bonfire:NoC_Router:1.0 NoC_Router_0
endgroup

# Connect the clock and reset signals
connect_bd_net [get_bd_pins NoC_Router_0/clk] \
  [get_bd_pins processing_system7_0/FCLK_CLK0]

connect_bd_net [get_bd_pins NoC_Router_0/reset] \
  [get_bd_pins rst_processing_system7_0_100M/peripheral_aresetn]

# Configure Router
startgroup
  set_property -dict [list \
    CONFIG.DATA_WIDTH {32} \
    CONFIG.Rxy_rst {60} \
    CONFIG.Cx_rst [cx_rst_calculator $options(addr) $options(d)] \
    CONFIG.NoC_size $options(d) \
    CONFIG.current_address $options(addr)] \
    [get_bd_cells NoC_Router_0]
endgroup

########################################################
# Make the connections between the NI-s and the router #
########################################################

# East
connect_bd_intf_net [get_bd_intf_pins NoC_NI_AXI_E/router_in] \
  [get_bd_intf_pins NoC_Router_0/east_out]

connect_bd_intf_net [get_bd_intf_pins NoC_NI_AXI_E/router_out] \
  [get_bd_intf_pins NoC_Router_0/east_in]

# North
connect_bd_intf_net [get_bd_intf_pins NoC_NI_AXI_N/router_in] \
  [get_bd_intf_pins NoC_Router_0/north_out]

connect_bd_intf_net [get_bd_intf_pins NoC_NI_AXI_N/router_out] \
  [get_bd_intf_pins NoC_Router_0/north_in]

# South
connect_bd_intf_net [get_bd_intf_pins NoC_NI_AXI_S/router_in] \
  [get_bd_intf_pins NoC_Router_0/south_out]

connect_bd_intf_net [get_bd_intf_pins NoC_NI_AXI_S/router_out]\
  [get_bd_intf_pins NoC_Router_0/south_in]

# West
connect_bd_intf_net [get_bd_intf_pins NoC_NI_AXI_W/router_in] \
  [get_bd_intf_pins NoC_Router_0/west_out]

connect_bd_intf_net [get_bd_intf_pins NoC_NI_AXI_W/router_out] \
  [get_bd_intf_pins NoC_Router_0/west_in]

# Local
connect_bd_intf_net [get_bd_intf_pins NoC_NI_AXI_L/router_in] \
  [get_bd_intf_pins NoC_Router_0/local_out]

connect_bd_intf_net [get_bd_intf_pins NoC_NI_AXI_L/router_out] \
  [get_bd_intf_pins NoC_Router_0/local_in]

################################################
# Save block diagran and generate VHDL wrapper #
################################################

save_bd_design

make_wrapper -files [get_files \
  ${proj-root}/integration/Router_tester/Router_tester.srcs/sources_1/bd/Router_tester/Router_tester.bd] -top

add_files -norecurse \
  ${proj-root}/integration/Router_tester/Router_tester.srcs/sources_1/bd/Router_tester/hdl/Router_tester_wrapper.vhd

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
  file mkdir ${proj-root}/integration/Router_tester/Router_tester.sdk
  file copy -force \
    ${proj-root}/integration/Router_tester/Router_tester.runs/impl_1/Router_tester_wrapper.sysdef \
    ${proj-root}/integration/Router_tester/Router_tester.sdk/Router_tester_wrapper.hdf
}

##############
# Launch SDK #
##############

if {$options(sdk)} {
  puts "\n\n################\nLaunching SDK...\n################\n\n"
  launch_sdk \
    -workspace ${proj-root}/integration/Router_tester/Router_tester.sdk \
    -hwspec ${proj-root}/integration/Router_tester/Router_tester.sdk/Router_tester_wrapper.hdf
}

#################
# Close project #
#################

if {$options(close)} {
  puts "\n\n######################\nClosing Vivado project\n######################\n"
  close_project
}
