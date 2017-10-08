set IMPLEMENTATION_NAME "pparch"
set MODULE_INSTANCE_NAME "U1"


compile_ultra -no_seq_output_inversion -no_autoungroup
# compile -exact_map

# Use this if you want to remove unconnected ports from the design during optimization
remove_unconnected_ports -blast_buses [find -hierarchy cell {"*"}]
compile -incr

check_design

# Use to change implementation of a specific module (for example adder or multiplier from DesignWare Library)
# set_implementation $IMPLEMENTATION_NAME $MODULE_INSTANCE_NAME
# compile -incr

# Shows implementation details for the module(s)
report_resources

# Use to break the hierarchy and make the design flat (only including gates)
# compile -exact_map -ungroup_all