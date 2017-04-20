##################################
# NoC IP GENERATION SCRIPT       #
# Copyright (c) 2017 Karl Janson #
##################################

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

set proj_dir "${proj_root}/ip_repo/NoC"
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

create_project NoC ${proj_dir} -part xc7z020clg484-1 -ip -force

puts "The Bonfire IP will be generated in ${proj_dir}"

##############################################
# Set the directory path for the new project #
##############################################

set proj_dir [get_property directory [current_project]]

##########################
# Set project properties #
##########################

set obj [get_projects NoC]
set_property "board_part" "em.avnet.com:zed:part0:1.3" $obj
set_property "compxlib.activehdl_compiled_library_dir" \
  "$proj_dir/NoC.cache/compile_simlib/activehdl" $obj
set_property "compxlib.funcsim" "1" $obj
set_property "compxlib.ies_compiled_library_dir" \
  "$proj_dir/NoC.cache/compile_simlib/ies" $obj
set_property "compxlib.modelsim_compiled_library_dir" \
  "$proj_dir/NoC.cache/compile_simlib/modelsim" $obj
set_property "compxlib.overwrite_libs" "0" $obj
set_property "compxlib.questa_compiled_library_dir" \
  "$proj_dir/NoC.cache/compile_simlib/questa" $obj
set_property "compxlib.riviera_compiled_library_dir" \
  "$proj_dir/NoC.cache/compile_simlib/riviera" $obj
set_property "compxlib.timesim" "1" $obj
set_property "compxlib.vcs_compiled_library_dir" \
  "$proj_dir/NoC.cache/compile_simlib/vcs" $obj
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


#############################################
# Create 'sources_1' fileset (if not found) #
#############################################

if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}


###########################
# Set IP repository paths #
###########################

set obj [get_filesets sources_1]
set_property "ip_repo_paths" [list\
  "[file normalize ${proj_dir}]"\
  ] $obj

###############################################################
# Rebuild user ip_repo's index before adding any source files #
###############################################################

update_ip_catalog -rebuild


#############################
# Setup 'sources_1' fileset #
#############################


# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
set files [list \
"[file normalize "${network_RTL_dir}/component_pack.vhd"]"\
"[file normalize "${plasma_RTL_dir}/mlite_pack.vhd"]"\
"[file normalize "${network_RTL_dir}/Allocator_with_checkers_with_FI/Arbiter_in_one_hot_checkers.vhd"]"\
"[file normalize "${network_RTL_dir}/Allocator_with_checkers_with_FI/Arbiter_in_one_hot_with_checkers_with_FI.vhd"]"\
"[file normalize "${network_RTL_dir}/Allocator_with_checkers_with_FI/Arbiter_out_one_hot_pseudo_checkers.vhd"]"\
"[file normalize "${network_RTL_dir}/Allocator_with_checkers_with_FI/arbiter_out_one_hot_with_checkers_with_FI.vhd"]"\
"[file normalize "${network_RTL_dir}/Allocator_with_checkers_with_FI/allocator_logic_pseudo_checkers.vhd"]"\
"[file normalize "${network_RTL_dir}/Allocator_with_checkers_with_FI/allocator_credit_counter_logic_pseudo_checkers.vhd"]"\
"[file normalize "${network_RTL_dir}/Allocator_with_checkers_with_FI/allocator_with_checkers_with_FI.vhd"]"\
"[file normalize "${network_RTL_dir}/FIFO_one_hot_credit_based_packet_drop_classifier_support_with_checkers_with_FI/FIFO_one_hot_credit_based_packet_drop_classifier_support_checkers.vhd"]"\
"[file normalize "${network_RTL_dir}/FIFO_one_hot_credit_based_packet_drop_classifier_support_with_checkers_with_FI/FIFO_one_hot_credit_based_packet_drop_classifier_support_with_checkers_with_FI.vhd"]"\
"[file normalize "${network_RTL_dir}/LBDR_packet_drop_with_checkers_with_FI/Cx_Reconf_pseudo_checkers.vhd"]"\
"[file normalize "${network_RTL_dir}/LBDR_packet_drop_with_checkers_with_FI/Rxy_Reconf_pseudo_checkers.vhd"]"\
"[file normalize "${network_RTL_dir}/LBDR_packet_drop_with_checkers_with_FI/LBDR_packet_drop_routing_part_pseudo_checkers.vhd"]"\
"[file normalize "${network_RTL_dir}/LBDR_packet_drop_with_checkers_with_FI/LBDR_packet_drop_with_checkers_with_FI.vhd"]"\
"[file normalize "${network_RTL_dir}/ParityChecker_for_LBDR.vhd"]"\
"[file normalize "${network_RTL_dir}/counter_threshold.vhd"]"\
"[file normalize "${network_RTL_dir}/checkers_counter_threshold.vhd"]"\
"[file normalize "${network_RTL_dir}/Fault_injector.vhd"]"\
"[file normalize "${network_RTL_dir}/shift_register_serial_in.vhd"]"\
"[file normalize "${network_RTL_dir}/NI.vhd"]"\
"[file normalize "${network_RTL_dir}/xbar.vhd"]"\
"[file normalize "${network_RTL_dir}/customized_routers/Router_32_bit_NW_credit_based_packet_drop_classifier_SHMU_will_full_set_of_checkers_with_FI.vhd"]"\
"[file normalize "${network_RTL_dir}/customized_routers/Router_32_bit_NE_credit_based_packet_drop_classifier_SHMU_will_full_set_of_checkers_with_FI.vhd"]"\
"[file normalize "${network_RTL_dir}/customized_routers/Router_32_bit_SW_credit_based_packet_drop_classifier_SHMU_will_full_set_of_checkers_with_FI.vhd"]"\
"[file normalize "${network_RTL_dir}/customized_routers/Router_32_bit_SE_credit_based_packet_drop_classifier_SHMU_will_full_set_of_checkers_with_FI.vhd"]"\
"[file normalize "${IJTAG_RTL_dir}/SIB_mux_pre_FCX_SELgate.vhd"]"\
"[file normalize "${IJTAG_RTL_dir}/ScanMux.vhd"]"\
"[file normalize "${IJTAG_RTL_dir}/ScanRegister.vhd"]"\
"[file normalize "${plasma_RTL_dir}/alu.vhd"]"\
"[file normalize "${plasma_RTL_dir}/bus_mux.vhd"]"\
"[file normalize "${plasma_RTL_dir}/cache.vhd"]"\
"[file normalize "${plasma_RTL_dir}/control.vhd"]"\
"[file normalize "${plasma_RTL_dir}/ddr_ctrl.vhd"]"\
"[file normalize "${plasma_RTL_dir}/eth_dma.vhd"]"\
"[file normalize "${plasma_RTL_dir}/mem_ctrl.vhd"]"\
"[file normalize "${plasma_RTL_dir}/mult.vhd"]"\
"[file normalize "${plasma_RTL_dir}/pc_next.vhd"]"\
"[file normalize "${plasma_RTL_dir}/pipeline.vhd"]"\
"[file normalize "${plasma_RTL_dir}/ram.vhd"]"\
"[file normalize "${plasma_RTL_dir}/reg_bank.vhd"]"\
"[file normalize "${plasma_RTL_dir}/shifter.vhd"]"\
"[file normalize "${plasma_RTL_dir}/uart.vhd"]"\
"[file normalize "${plasma_RTL_dir}/mlite_cpu.vhd"]"\
"[file normalize "${plasma_RTL_dir}/plasma.vhd"]"\
"[file normalize "${plasma_RTL_dir}/NoC_Node.vhd"]"\
"[file normalize "${network_RTL_dir}/network_2x2_customized_packet_drop_SHMU_credit_based_with_checkers.vhd"]"\
"[file normalize "${network_RTL_dir}/network_2x2_customized_packet_drop_SHMU_credit_based_with_checkers_with_PE_top.vhd"]"
]
add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files

######################
# Start IP packaging #
######################

ipx::package_project -root_dir $proj_dir -import_files


set_property  ip_repo_paths  [list $proj_dir] [current_project]


###########################################
# Update the IP catalog before continuing #
###########################################

update_ip_catalog

#############################################
# Specify other IP configuration parameters #
#############################################

set_property "vendor" "ati.ttu.ee" [ipx::current_core]
set_property "library" "Bonfire" [ipx::current_core]
set_property "name" "NoC" [ipx::current_core]
set_property "display_name" "NoC" [ipx::current_core]
set_property "description" "Network-on-Chip" [ipx::current_core]
set_property "vendor_display_name" "Project Bonfire" [ipx::current_core]
set_property "company_url" "https://github.com/Project-Bonfire" [ipx::current_core]
set_property "taxonomy" {/Communication_&_Networking/Networking} [ipx::current_core]

##############################
# Check the IP  for problems #
##############################

ipx::check_integrity [ipx::current_core ]


######################
# Finalize the build #
######################

ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]

#################
# Save the core #
#################

ipx::save_core [ipx::current_core ]

##########################
# Rebuild the IP catalog #
##########################

update_ip_catalog -rebuild

########################
# All done, thank you! #
########################

close_project
