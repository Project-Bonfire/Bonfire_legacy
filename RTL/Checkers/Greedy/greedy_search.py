# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand

import copy
from build_list_of_candidates import build_list_of_candidates
from check_feasibility import check_feasibility
from area_coverage_calc import calculate_area
from area_coverage_calc import calculate_coverage
from cost_function import calculate_coverage_cost, calculate_value_density
import package_file
from file_generator import make_folders
from reports import report_detection_tables
from essential_checker_extraction import find_essential_checker
import sys
import logger
from for_testing import gen_dummy_dict, initialize_LBDR

if '--help' in sys.argv[1:]:
    print "there is no help in the world!\n"
    sys.exit()

for i in range(1, package_file.number_of_checkers + 1):
    package_file.list_of_checkers.append(str(i))

make_folders()
# we need to prepare a dictionary of all the single checker's info
# The dictionary format is the following     checker number:  [coverage,  area]
build_list_of_candidates()

# Just for getting a copy of the current console
sys.stdout = logger.Logger()


print "\033[32m* NOTE::\033[0m starting greedy optimization!"

if package_file.test_mode:
    package_file.area_coverage_results = copy.deepcopy(gen_dummy_dict())
    sorted_coverage = initialize_LBDR()
else:

    for item in package_file.list_of_checkers:
        area = calculate_area([item])
        package_file.list_of_candidates[item] = [None, area]
        if package_file.cost_function_type == "cov":
            package_file.list_of_candidates[item] = [calculate_coverage_cost([item]), area]
        elif package_file.cost_function_type == "val_density":
            package_file.list_of_candidates[item] = [calculate_value_density([item]), area]
    # sorting the dictionary based on the coverage
    sorted_coverage = sorted(package_file.list_of_candidates.items(), key=lambda e: e[1][0], reverse=True)

report_detection_tables()
print "sorted list of checkers:", sorted_coverage


if package_file.extract_essential_checkers:
    current_list, checkers_for_optimization = copy.deepcopy(find_essential_checker())
else:
    current_list = []
    checkers_for_optimization = copy.deepcopy(package_file.list_of_checkers)

print "------------------------------"
print "starting optimization with ", current_list, "checkers already chosen"
print "and running greedy algorithm on ", checkers_for_optimization

if len(current_list) > 0:
    if check_feasibility(current_list[1:], current_list[0]):
        print "starting sequence is feasible...  going further..."
        coverage = calculate_coverage(current_list)
        print "starting coverage:", coverage
    else:
        print "starting sequence is not feasible... breaking"
        sys.exit()
else:
    coverage = 0
    print "starting coverage:", coverage

# the area of the best solution
best_coverage = coverage
for item in sorted_coverage:
    if item[0] in checkers_for_optimization:
        print "------------------------------"
        print "Trying picking item:", item[0]
        if item not in current_list:
            if check_feasibility(current_list, item[0]):
                list_for_coverage_check = current_list + [item[0]]
                coverage = calculate_coverage(list_for_coverage_check)
                print "coverage:", coverage
                if coverage > best_coverage:
                    current_list.append(item[0])
                    best_coverage = coverage
                    print "coverage improved to:", coverage
                else:
                    print "\033[91m* NOTE::\033[0m No improvement is made. ignoring the item..."
                if coverage == 100:
                    print "100% coverage reached! ending the search!"
                    break

print "------------------------------"
print "\033[32m* NOTE::\033[0m best solution:", current_list
print "\033[32m* NOTE::\033[0m coverage:", calculate_coverage(current_list)
