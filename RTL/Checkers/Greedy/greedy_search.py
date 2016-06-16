# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand



import copy
from build_list_of_candidates import build_list_of_candidates
from check_feasibility import check_feasibility
from area_coverage_calc import calculate_area
from area_coverage_calc import calculate_coverage
from cost_function import calculate_coverage_cost, calculate_value_density
import package_file
from file_generator import make_folders
from essential_checker_extraction import find_essential_checker, find_dominant_checker, cleanup_checker_selection
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

if package_file.keep_dominant_checkers:
    package_file.list_of_detection_info_sa0={'11': ['0', '4', '0', '0', '0', '0', '5', '0', '0', '0', '2', '5', '0', '0', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'], '10': ['0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '16', '0', '0', '0', '8', '0', '0', '0', '0', '16', '0', '0', '0', '0', '0', '8', '0', '0'], '12': ['0', '15', '0', '0', '5', '0', '0', '0', '0', '0', '0', '0', '5', '39', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'], '1': ['0', '0', '0', '0', '20', '0', '20', '0', '0', '0', '0', '0', '20', '20', '0', '0', '30', '10', '0', '0', '15', '5', '5', '0', '0', '0', '40', '0', '0', '5', '5', '15', '0', '0'], '3': ['0', '60', '0', '0', '0', '0', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '40', '0', '0', '0', '0', '0', '0', '0'], '2': ['0', '0', '0', '0', '0', '32', '0', '0', '0', '0', '160', '32', '0', '0', '32', '32', '64', '0', '32', '32', '32', '0', '0', '32', '32', '64', '0', '32', '32', '0', '0', '32', '32', '32'], '5': ['0', '0', '0', '0', '0', '0', '20', '0', '0', '0', '160', '0', '0', '0', '32', '32', '0', '10', '32', '32', '0', '0', '0', '32', '32', '0', '40', '32', '32', '5', '0', '0', '32', '32'], '4': ['0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '16', '0', '0', '0', '8', '0', '0', '0', '0', '16', '0', '0', '0', '0', '0', '8', '0', '0'], '7': ['0', '0', '0', '0', '20', '0', '20', '0', '0', '0', '0', '0', '20', '20', '0', '0', '30', '10', '0', '0', '15', '5', '5', '0', '0', '0', '40', '0', '0', '5', '5', '15', '0', '0'], '6': ['0', '0', '0', '0', '0', '16', '0', '0', '0', '0', '0', '16', '0', '0', '0', '0', '32', '0', '0', '0', '16', '0', '0', '0', '0', '32', '0', '0', '0', '0', '0', '16', '0', '0'], '9': ['0', '0', '0', '0', '0', '36', '0', '0', '0', '0', '160', '36', '0', '0', '32', '32', '72', '0', '32', '32', '36', '0', '0', '32', '32', '72', '0', '32', '32', '0', '0', '36', '32', '32'], '8': ['0', '0', '0', '0', '0', '32', '0', '0', '0', '0', '0', '32', '0', '0', '0', '0', '64', '0', '0', '0', '32', '0', '0', '0', '0', '64', '0', '0', '0', '0', '0', '32', '0', '0']}
    package_file.list_of_detection_info_sa1={'11': ['4', '0', '4', '4', '5', '5', '0', '0', '0', '0', '0', '0', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'], '10': ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'], '12': ['15', '0', '15', '15', '0', '0', '5', '0', '0', '0', '15', '5', '0', '0', '120', '15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'], '1': ['0', '0', '0', '0', '20', '20', '20', '0', '0', '0', '64', '20', '20', '20', '0', '12', '10', '10', '0', '14', '5', '5', '5', '0', '15', '40', '40', '0', '8', '5', '5', '5', '0', '15'], '3': ['60', '0', '60', '60', '15', '15', '0', '0', '0', '0', '0', '20', '20', '20', '0', '0', '10', '0', '0', '0', '5', '5', '5', '0', '0', '40', '0', '0', '0', '0', '0', '0', '0', '0'], '2': ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '128', '0', '0', '0', '128', '0', '0', '0', '0', '128', '0', '0', '0', '128', '0', '0', '0', '0', '128', '0'], '5': ['0', '0', '0', '0', '20', '20', '0', '0', '0', '0', '0', '20', '20', '20', '0', '0', '10', '0', '0', '0', '5', '5', '5', '0', '0', '40', '0', '0', '0', '0', '5', '5', '0', '0'], '4': ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'], '7': ['0', '0', '0', '0', '20', '20', '20', '0', '0', '0', '64', '20', '20', '20', '0', '12', '10', '10', '0', '14', '5', '5', '5', '0', '15', '40', '40', '0', '8', '5', '5', '5', '0', '15'], '6': ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '64', '0', '0', '0', '64', '0', '0', '0', '0', '64', '0', '0', '0', '64', '0', '0', '0', '0', '64', '0'], '9': ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '128', '0', '0', '0', '128', '0', '0', '0', '0', '128', '0', '0', '0', '128', '0', '0', '0', '0', '128', '0'], '8': ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '128', '0', '0', '0', '128', '0', '0', '0', '0', '128', '0', '0', '0', '128', '0', '0', '0', '0', '128', '0']}
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

    if package_file.delete_dominated_checkers:
        candidates_for_deletion = find_dominant_checker()
    else:
        candidates_for_deletion = []
        print "------------------------------"
        chosen_checkers, checkers_for_opt = cleanup_checker_selection()
        for item in package_file.list_of_checkers:
            if item not in chosen_checkers:
                if item not in checkers_for_opt:
                    candidates_for_deletion.append(item)

        if len(chosen_checkers) == 0:
            current_list = []
        elif len(chosen_checkers) == 1:
            if check_feasibility([], chosen_checkers[0]):
                current_list = copy.deepcopy(chosen_checkers)
        elif len(chosen_checkers) > 1:
            if check_feasibility(chosen_checkers[1:], chosen_checkers[0]):
                current_list = copy.deepcopy(chosen_checkers)
            else:
                raise ValueError("List of chosen checkers are not feasible...")
else:
    current_list = []
    candidates_for_deletion = []

for item in sorted_coverage:
    print "------------------------------"
    print "Picking item:", item[0]
    if item[0] in candidates_for_deletion:
        print "will not pick item since it is in candidates_for_deletion list"
    else:
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

