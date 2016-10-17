##################################
# NoC GENERATION SCRIPT       #
# Copyright (c) 2016 Karl Janson #
##################################


##################
# Create project #
##################

create_project NoC_2x2 ../../../integration/NoC_2x2 -part xc7z020clg484-1 -force

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

create_bd_design "NoC_2x2"
#update_compile_order -fileset sources_1 <-- Not needed right now???

###########
# Add IPs #
###########

# Router
set_property  ip_repo_paths  /home/karl/git-temp/project-bonfire/seperate-repos/master/Bonfire/integration/ip_repo/Router [current_project]
update_ip_catalog

# NI
set_property  ip_repo_paths  {/home/karl/git-temp/project-bonfire/seperate-repos/master/Bonfire/integration/ip_repo/Router /home/karl/git-temp/project-bonfire/seperate-repos/master/Bonfire/integration/ip_repo/NoC_NI} [current_project]
update_ip_catalog

############
# Add Zynq #
############

# Add IP
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup

# Run design automation
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]

# Connect AXI clock
connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK]

################
# Add router 0 #
################
# Add IP
startgroup
create_bd_cell -type ip -vlnv user.org:user:router:1.0 router_0
endgroup

# Connect clock and reset
connect_bd_net [get_bd_pins router_0/reset] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
connect_bd_net [get_bd_pins router_0/clk] [get_bd_pins processing_system7_0/FCLK_CLK0]

# Configure router
startgroup
set_property -dict [list CONFIG.DATA_WIDTH {32} CONFIG.Rxy_rst {60} CONFIG.Cx_rst {10} CONFIG.NoC_size {2} CONFIG.current_address {0}] [get_bd_cells router_0]
endgroup

############
# Add NI 0 #
############

# Add IP
startgroup
create_bd_cell -type ip -vlnv user.org:user:NI:1.0 NI_0
endgroup

# Connect clock and reset
connect_bd_net [get_bd_pins NI_0/reset] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
connect_bd_net [get_bd_pins NI_0/clk] [get_bd_pins processing_system7_0/FCLK_CLK0]

# Connection to router
connect_bd_intf_net [get_bd_intf_pins NI_0/router_in] [get_bd_intf_pins router_0/local_out]
connect_bd_intf_net [get_bd_intf_pins NI_0/router_out] [get_bd_intf_pins router_0/local_in]

# Configure NI
startgroup
set_property -dict [list CONFIG.DATA_WIDTH {32} CONFIG.NI_DEPTH {16}] [get_bd_cells NI_0]
endgroup

################
# Add router 1 #
################
# Add IP
startgroup
create_bd_cell -type ip -vlnv user.org:user:router:1.0 router_1
endgroup

# Connect clock and reset
connect_bd_net [get_bd_pins router_1/reset] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
connect_bd_net [get_bd_pins router_1/clk] [get_bd_pins processing_system7_0/FCLK_CLK0]

# Configure router
startgroup
set_property -dict [list CONFIG.DATA_WIDTH {32} CONFIG.Rxy_rst {60} CONFIG.Cx_rst {12} CONFIG.NoC_size {2} CONFIG.current_address {1}] [get_bd_cells router_1]
endgroup

############
# Add NI 1 #
############

# Add IP
startgroup
create_bd_cell -type ip -vlnv user.org:user:NI:1.0 NI_1
endgroup

# Connect clock and reset
connect_bd_net [get_bd_pins NI_1/reset] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
connect_bd_net [get_bd_pins NI_1/clk] [get_bd_pins processing_system7_0/FCLK_CLK0]

# Connection to router
connect_bd_intf_net [get_bd_intf_pins NI_1/router_in] [get_bd_intf_pins router_1/local_out]
connect_bd_intf_net [get_bd_intf_pins NI_1/router_out] [get_bd_intf_pins router_1/local_in]

# Configure NI
startgroup
set_property -dict [list CONFIG.DATA_WIDTH {32} CONFIG.NI_DEPTH {16}] [get_bd_cells NI_1]
endgroup

################
# Add router 2 #
################
# Add IP
startgroup
create_bd_cell -type ip -vlnv user.org:user:router:1.0 router_2
endgroup

# Connect clock and reset
connect_bd_net [get_bd_pins router_2/reset] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
connect_bd_net [get_bd_pins router_2/clk] [get_bd_pins processing_system7_0/FCLK_CLK0]

# Configure router
startgroup
set_property -dict [list CONFIG.DATA_WIDTH {32} CONFIG.Rxy_rst {60} CONFIG.Cx_rst {3} CONFIG.NoC_size {2} CONFIG.current_address {2}] [get_bd_cells router_2]
endgroup

############
# Add NI 2 #
############

# Add IP
startgroup
create_bd_cell -type ip -vlnv user.org:user:NI:1.0 NI_2
endgroup

# Connect clock and reset
connect_bd_net [get_bd_pins NI_2/reset] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
connect_bd_net [get_bd_pins NI_2/clk] [get_bd_pins processing_system7_0/FCLK_CLK0]

# Connection to router
connect_bd_intf_net [get_bd_intf_pins NI_2/router_in] [get_bd_intf_pins router_2/local_out]
connect_bd_intf_net [get_bd_intf_pins NI_2/router_out] [get_bd_intf_pins router_2/local_in]

# Configure NI
startgroup
set_property -dict [list CONFIG.DATA_WIDTH {32} CONFIG.NI_DEPTH {16}] [get_bd_cells NI_2]
endgroup

################
# Add router 3 #
################
# Add IP
startgroup
create_bd_cell -type ip -vlnv user.org:user:router:1.0 router_3
endgroup

# Connect clock and reset
connect_bd_net [get_bd_pins router_3/reset] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
connect_bd_net [get_bd_pins router_3/clk] [get_bd_pins processing_system7_0/FCLK_CLK0]

# Configure router
startgroup
set_property -dict [list CONFIG.DATA_WIDTH {32} CONFIG.Rxy_rst {60} CONFIG.Cx_rst {5} CONFIG.NoC_size {2} CONFIG.current_address {3}] [get_bd_cells router_3]
endgroup

############
# Add NI 0 #
############

# Add IP
startgroup
create_bd_cell -type ip -vlnv user.org:user:NI:1.0 NI_3
endgroup

# Connect clock and reset
connect_bd_net [get_bd_pins NI_3/reset] [get_bd_pins processing_system7_0/FCLK_RESET0_N]
connect_bd_net [get_bd_pins NI_3/clk] [get_bd_pins processing_system7_0/FCLK_CLK0]

# Connection to router
connect_bd_intf_net [get_bd_intf_pins NI_3/router_in] [get_bd_intf_pins router_3/local_out]
connect_bd_intf_net [get_bd_intf_pins NI_3/router_out] [get_bd_intf_pins router_3/local_in]

# Configure NI
startgroup
set_property -dict [list CONFIG.DATA_WIDTH {32} CONFIG.NI_DEPTH {16}] [get_bd_cells NI_0]
endgroup

#################################
# Connect routers to each other #
#################################
# Router 0 <-> Router 1
connect_bd_intf_net [get_bd_intf_pins router_0/west_out] [get_bd_intf_pins router_1/east_in]
connect_bd_intf_net [get_bd_intf_pins router_0/west_in] [get_bd_intf_pins router_1/east_out]

# Router 2 <-> Router 4
connect_bd_intf_net [get_bd_intf_pins router_2/west_out] [get_bd_intf_pins router_3/east_in]
connect_bd_intf_net [get_bd_intf_pins router_2/west_in] [get_bd_intf_pins router_3/east_out]

# Router 0 <-> Router 2
connect_bd_intf_net [get_bd_intf_pins router_0/south_out] [get_bd_intf_pins router_2/north_in]
connect_bd_intf_net [get_bd_intf_pins router_0/south_in] [get_bd_intf_pins router_2/north_out]

# Router 1 <-> Router 3
connect_bd_intf_net [get_bd_intf_pins router_1/south_out] [get_bd_intf_pins router_3/north_in]
connect_bd_intf_net [get_bd_intf_pins router_1/south_in] [get_bd_intf_pins router_3/north_out]

#################################
# Clean up the schematic design #
#################################
set_property location {2 355 63} [get_bd_cells router_0]
set_property location {2 394 -128} [get_bd_cells NI_0]

set_property location {2 1013 -17} [get_bd_cells router_1]
set_property location {2 998 -203} [get_bd_cells NI_1]

set_property location {1 407 457} [get_bd_cells router_2]
set_property location {1 372 298} [get_bd_cells NI_2]

set_property location {3 1006 473} [get_bd_cells router_3]
set_property location {2 1046 305} [get_bd_cells NI_3]


######################
# Save block diagran #
######################
#regenerate_bd_layout
save_bd_design

#close_project
