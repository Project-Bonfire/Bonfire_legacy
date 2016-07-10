# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand


# optimization_method can be "greedy" or "b_and_b"
optimization_method = "b_and_b"

number_of_checkers = 11
# size max is the maximum allowed area for the sum of checkers!
# this would be the size of pseudo combinatorial + maximum size you want to allow for checkers!
# todo: we can also make this a bit better by separating pseudo combinational size and checker constraint!
size_max = 154

# this is the name of the unit that you are using in your work.
# UUT can be "ELBDR", "LBDR", "Arbiter", "FIFO_control_part" make sure its capital
unit_under_test = "LBDR"
# module file name points to the vhdl file of the pseudo combinational module you are working on
module_file_name = "LBDR_pseudo.vhd"

debug = True
# cost function can be "cov" or "val_density"
cost_function_type = "val_density"
extract_essential_checkers = True

# if set to one, finds the checkers that dominate other checkers, In case a checker dominates the other one,
# you probably want to know it before hand. but the problem is that this process checks all the combinations of
# 2 out of N checkers: N*(N-1). since you want to check case of C1 dominating C2 and also C2 dominating C1.
# cool thing is that if C1 dominates C2, and C2 dominates C1, then one of them should be thrown out for sure.
find_problematic_checkers = False


essential_checkers = ['9', '3', '11']
use_essential_checkers = False
# --------------------------------------------
#                Anything bellow
#       This is  internal use, do not touch!
# --------------------------------------------

list_of_candidates = {}
list_of_checkers = []
log_folder = "logs"
list_of_detection_info_sa0 = {}
list_of_detection_info_sa1 = {}

list_of_true_misses_sa0 = {}
list_of_true_misses_sa1 = {}
# --------------------------------------------
#                Anything bellow
#       This is for testing... do not touch!
# --------------------------------------------
test_mode = True

# here i assume that the area of the module is 40
area_coverage_results = {"1": [50, 40],    # 10
                         "2": [51, 50],  # 11
                         "3": [52, 50],  # 12
                         "4": [53, 43],  # 14
                         "1_2": [61, 68],
                         "1_3": [62, 65],
                         "1_4": [63, 63],
                         "2_3": [63, 67],
                         "2_4": [64, 69],
                         "3_4": [65, 70],
                         "1_2_3": [73, 84],
                         "2_3_4": [77, 85],
                         "1_3_4": [76, 89],
                         "1_2_4": [75, 80],
                         "1_2_3_4": [87, 100],
                         }