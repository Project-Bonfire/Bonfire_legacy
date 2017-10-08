# Parameter(s) for the topmodule (if any)
set TOP_MODULE_NAME "ROUTER_CREDIT_BASED"
set ARCHITECTURE_NAME "BEHAVIOR"
set RTL_FORMAT "vhdl"
set RTL_FILES_PATH "{../RTL/Router/credit_based/RTL/xbar.vhd ../RTL/Router/credit_based/RTL/LBDR.vhd ../RTL/Router/credit_based/RTL/FIFO_one_hot_credit_based.vhd ../RTL/Router/credit_based/RTL/arbiter_out.vhd ../RTL/Router/credit_based/RTL/arbiter_in.vhd ../RTL/Router/credit_based/RTL/allocator.vhd ../RTL/Router/credit_based/RTL/Router_32_bit_credit_based.vhd}"
set PARAMETERS "-parameters \"DATA_WIDTH = 32, current_address = 5, Cx_rst = 15, NoC_size = 4\""

# These gates are removed because of performing fault simulation using Turbo Tester (to make sure the circuit doesn't have gates that fan-out free regions cannot be extracted from them).
# set_dont_use {class/EO class/EN class/EOP class/ENP class/EO3 class/EN3 class/EO3P class/EN3P class/EOI class/ENI class/FD1S class/FD2S class/FD4S class/IVDA class/IVDAP class/B2I class/B2IP class/B3I class/B3IP class/AO4P class/NR* class/EO1P class/ND*}

set analyze_commmand "analyze -library WORK -format $RTL_FORMAT $RTL_FILES_PATH"
eval $analyze_commmand

# Use $PARAMETERS if top module of design has generic or parameters
set elaborate_command "elaborate $TOP_MODULE_NAME -architecture $ARCHITECTURE_NAME -library WORK $PARAMETERS"
eval $elaborate_command

# Use this if you want to remove unconnected ports from the design during optimization
remove_unconnected_ports -blast_buses [find -hierarchy cell {"*"}]

# Always use these two!
link
uniquify

# Please use this to enable power calculation (For now only valid for AMS)
# saif_map -start 

# Please use this in topographical mode of Synopsys Design Compiler (For now only valid for AMS)
# set_power_prediction
