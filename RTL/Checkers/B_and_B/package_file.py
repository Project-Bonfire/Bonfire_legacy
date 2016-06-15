# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand



number_of_checkers = 4
# size max is the maximum allowed area for the sum of checkers!
size_max = 80

# UUT can be "ELBDR", "LBDR", "FIFO_control_part" make sure its capital
unit_under_test = "LBDR"
# module file name points to the vhdl file of the pseudo combinational module you are working on
module_file_name = "LBDR_pseudo.vhd"

debug = False
# --------------------------------------------
#                Anything bellow
#       This is  internal use, do not touch!
# --------------------------------------------

list_of_candidates = {}
list_of_checkers = []
log_folder = "logs"

# --------------------------------------------
#                Anything bellow
#       This is for testing... do not touch!
# --------------------------------------------
test_mode = True
