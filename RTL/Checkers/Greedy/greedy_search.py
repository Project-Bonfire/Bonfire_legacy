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
print "------------------------------"
print "printing the checkers detection tables"
print "stuck at 0:"
for item in package_file.list_of_detection_info_sa0:
    print item, package_file.list_of_detection_info_sa0[item]
print "------------------------------"
print "printing the checkers detection tables"
print "stuck at 1:"
for item in package_file.list_of_detection_info_sa1:
    print item, package_file.list_of_detection_info_sa1[item]

print "------------------------------"
list_of_essential_checkers=find_essential_checker()
print "list of essential checkers:", list_of_essential_checkers

current_list = []
for item in sorted_coverage:
    print "------------------------------"
    print "Picking item:", item[0]
    if check_feasibility(current_list, item[0]):
        current_list.append(item[0])
        coverage = calculate_coverage(current_list)
        print "coverage:", coverage
        if coverage == 100:
            break

print "------------------------------"
print "\033[32m* NOTE::\033[0m best solution:", current_list
print "\033[32m* NOTE::\033[0m coverage:", calculate_coverage(current_list)

