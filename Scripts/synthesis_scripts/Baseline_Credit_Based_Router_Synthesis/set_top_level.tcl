# ----------------------
# Library name paramters
# ----------------------

# For AMS
set LIBRARY_NAME "c18_CORELIB_TYP" 
# set LIBRARY_NAME "c18_CORELIB_WC"
# set LIBRARY_NAME "c18_CORELIB_BC"

# For NanGate
# set LIBRARY_NAME "NanGate_15nm_OCL" 

# For Class.lib
# set LIBRARY_NAME "class"

# ----------------------------
# Set Clock related parameters
# ----------------------------

set CLK_PORT [get_ports clk]
set CLK_PERIOD 10 
set CLK_SKEW 0.015

# -----------------------------------
# Set operating conditions parameters
# -----------------------------------

# For AMS 
# Worst case
set WC_OP_CONDS typical
# set WC_OP_CONDS worst 
# set WC_OP_CONDS best

# For Class.lib
# set WC_OP_CONDS WCCOM

# -----------------------------------
# Set Wire Load Model
# -----------------------------------

# For AMS
set WIRELOAD_MODEL "c18_wl_30k" 

# For Class.lib
# set WIRELOAD_MODEL "20x20"

# ----------------------------------------
# Set Input and Output Delay and Max. Area
# ----------------------------------------

set DRIVE_PIN {Y}
set OUTPUT_DELAY 0
set INPUT_DELAY 0

# Set MAX_AREA to zero for best effort in optimization in terms of area
set MAX_AREA 0
# set MAX_AREA 40000000

# ----------------------------------------------------
# Specification of temporal values based on parameters 
# ----------------------------------------------------

# Use this for real clock (if design is sequential and has clock port)
# create_clock -period $CLK_PERIOD -name my_clock $CLK_PORT

# Use this for virtual clock (for example when synthesizing a fully combinational circuit)
create_clock -period $CLK_PERIOD -name my_clock

# set_dont_touch_network my_clock
set_dont_touch_network reset
set_clock_uncertainty $CLK_SKEW [get_clocks my_clock]

set_input_delay $INPUT_DELAY -max -clock my_clock [remove_from_collection [all_inputs] $CLK_PORT]
set_output_delay $OUTPUT_DELAY -max -clock my_clock [all_outputs]

# -----------------
#  Restricting area
# -----------------

set_max_area $MAX_AREA

# ---------------------
# Operating Environment 
# ---------------------

set_operating_conditions -max $WC_OP_CONDS

# ---------------
# Wire Load Model 
# ---------------

set_wire_load_model -name $WIRELOAD_MODEL -library $LIBRARY_NAME [all_designs]
