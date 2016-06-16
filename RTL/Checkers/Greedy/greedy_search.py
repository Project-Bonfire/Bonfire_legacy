# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand

import copy
from build_list_of_candidates import build_list_of_candidates
from check_feasibility import check_feasibility
from area_coverage_calc import calculate_area
from area_coverage_calc import calculate_coverage
from cost_function import calculate_coverage_cost, calculate_value_density
import package_file
from file_generator import make_folders
from essential_checker_extraction import find_essential_checker
import sys
import logger


if '--help' in sys.argv[1:]:
    print "there is no help in the world!\n"
    sys.exit()

for i in range(1, package_file.number_of_checkers+1):
    package_file.list_of_checkers.append(str(i))

make_folders()
# we need to prepare a dictionary of all the single checker's info
# The dictionary format is the following     checker number:  [coverage,  area]
build_list_of_candidates()

# Just for getting a copy of the current console
sys.stdout = logger.Logger()

# the area of the best solution
best_cost = 0

print "\033[32m* NOTE::\033[0m starting greedy optimization!"

for item in package_file.list_of_checkers:
    area = calculate_area([item])
    package_file.list_of_candidates[item] = [None, area]
    if package_file.cost_function_type == "cov":
        package_file.list_of_candidates[item] = [calculate_coverage_cost([item]), area]
    elif package_file.cost_function_type == "val_density":
        package_file.list_of_candidates[item] = [calculate_value_density([item]), area]


# sorting the dictionary based on the coverage
sorted_coverage = sorted(package_file.list_of_candidates.items(),  key=lambda e: e[1][0], reverse=True)

print "sorted list of checkers:", sorted_coverage

if package_file.debug:
    print "------------------------------"
    print "printing the checkers detection tables"
    print "stuck at 0:"
    for item in package_file.list_of_true_misses_sa0:
        print item,
        for node in range(0, len(package_file.list_of_true_misses_sa0[item])):
            print package_file.list_of_true_misses_sa0[item][node],
        print ""
    print "------------------------------"
    print "printing the checkers detection tables"
    print "stuck at 1:"
    for item in package_file.list_of_true_misses_sa1:
        print item,
        for node in range(0, len(package_file.list_of_true_misses_sa1[item])):
            print package_file.list_of_true_misses_sa1[item][node],
        print ""
    print "------------------------------"

if package_file.extract_essential_checkers:
    current_list, checkers_for_optimization = copy.deepcopy(find_essential_checker())
else:
    current_list = []
    checkers_for_optimization = copy.deepcopy(package_file.list_of_checkers)

print "------------------------------"
print "starting optimization with ", current_list, "checkers already chosen"
print "and running greedy algorithm on ", checkers_for_optimization


for item in sorted_coverage:
    if item in checkers_for_optimization:
        print "------------------------------"
        print "Picking item:", item[0]
        if item not in current_list:
            if check_feasibility(current_list, item[0]):
                current_list.append(item[0])
                coverage = calculate_coverage(current_list)
                print "coverage:", coverage
                if coverage == 100:
                    break

print "------------------------------"
print "\033[32m* NOTE::\033[0m best solution:", current_list
print "\033[32m* NOTE::\033[0m coverage:", calculate_coverage(current_list)
