# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand


list_of_candidates = {}
list_of_checkers = ["1", "2", "3", "4"]

# size max is the maximum allowed area for the sum of checkers!
size_max = 80

# UUT can be "ELBDR" make sure its capital
unit_under_test = "ELBDR"
module_file_name = "ELBDR_pseudo.vhd"

# ------------------------------
test_mode = False

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