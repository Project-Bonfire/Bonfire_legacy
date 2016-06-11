# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
# ---------------------------------------------------------
# this is a branch and bound solution for the checker's
# selection problem which actually is a knapsack problem
# we have a bunch of checkers for each module each having
# their specific area and coverage.
# this means that our knapsack problem tries to maximize the
# coverage, while the area is the feasibility constraint.
# ---------------------------------------------------------


import copy
from build_list_of_candidates import build_list_of_candidates
from cost_function import calculate_cost
from check_feasibility import check_feasibility
from area_coverage_calc import calculate_area
from area_coverage_calc import calculate_coverage
import package_file
from file_generator import make_folders, generate_specific_file
import sys
import logger


if '--help' in sys.argv[1:]:
    print " ____  _    ____ "
    print "/  __\/.\  /  __\\"
    print "| | //\ _\_| | //"
    print "| |_\\\\/|/ /| |_\\\\"
    print "\____/\__/\\\\____/"
    print "\n"
    print "Welcome to checker's Branch and Bound (B&B), To use this tool, " \
          "\tyou need to do the following:"
    print "\t1. add a script that generates VHDL files for your checkers and top module "
    print "\t2. copy the module's pseudo combinational VHDL file in the folder"
    print "\t3. change the package_file parameters according to your design"
    print "\t\t- set the number_of_checkers to the number of checkers you have implemented"
    print "\t\t- set size_max to maximum size you can afford for the checkers+pseudo combinational"
    print "\t\t- set unit_under_test and module_file_name, follow instructions inside the file"
    print "\t\t- if you need more info, set debug to True"
    # todo: we have to fix this number 4:
    print "\t4. manually change the module name in synthesis_script.sh (its going to be fixed at some point)"
    print "\t5. copy analyze tool into the B&B folder"
    print "\t6. set up your synthesis tool environment. and run B_and_B.py"
    print "\t7. be patient, it will take a while..."
    print "\t8. if you got an error, find Siavoosh!"
    print "\ngood luck, you're gonna need it!\n"
    sys.exit()


def branch(candidates_list, selected_list, excluded_list):
    global best_cost, best_solution, progress_counter

    # we don't want to change the original values
    current_excluded_list = copy.deepcopy(excluded_list)
    current_selected_list = copy.deepcopy(selected_list)
    current_candidate_list = copy.deepcopy(candidates_list)

    item = sorted(current_candidate_list.keys())[0]
    print "------------------------------"
    print "selected list at start:", selected_list
    print "excluded list at start:", excluded_list
    print "Item to be branched:", item

    current_candidate_list.pop(item)

    # if we pick the item
    print "trying picking the item", item
    if not check_feasibility(current_selected_list, item):
        number_of_remaining_cases = package_file.number_of_checkers-(len(current_selected_list) + 1)
        if number_of_remaining_cases > 0:
            progress_counter += 2**(number_of_remaining_cases+1) - 2
        else:
            progress_counter += 1
        print "progress", float(progress_counter)/(2**(package_file.number_of_checkers+1)-2)*100, "%"
    else:
        current_selected_list.append(item)
        if item in current_excluded_list:
            print "we should not get here!"
            current_excluded_list.remove(item)
        cost = calculate_cost(current_selected_list)

        progress_counter += 1
        print "progress", float(progress_counter)/(2**(package_file.number_of_checkers+1)-2)*100, "%"

        if cost > best_cost:
            print "\033[32m* NOTE::\033[0m found better solution with cost:", cost
            best_cost = cost
            best_solution = copy.deepcopy(current_selected_list)


        if len(current_candidate_list) > 0:
            optimistic_value = bound(current_excluded_list)
            if optimistic_value < best_cost:
                print "\033[91m* NOTE::\033[0m bounded!"

                progress_counter += 2**(len(current_excluded_list)+1) - 2
                print "progress", progress_counter/(2**package_file.number_of_checkers)*100, "%"

                return
            branch(current_candidate_list, current_selected_list, current_excluded_list)

    # if we dont pick the item
    print "------------------------------"
    print "selected list at start:", selected_list
    print "excluded list at start:", excluded_list
    print "Item to be branched:", item
    print "not picking the item", item

    progress_counter += 1
    print "progress", float(progress_counter)/(2**(package_file.number_of_checkers+1)-2)*100, "%"

    if item in current_selected_list:
        current_selected_list.remove(item)
    cost = calculate_cost(current_selected_list)
    if cost > best_cost:
        print "\033[32m* NOTE::\033[0m found better solution with cost:", cost
        best_cost = cost
        best_solution = copy.deepcopy(current_selected_list)

    if len(current_candidate_list) > 0:
        current_excluded_list.append(item)
        optimistic_value = bound(current_excluded_list)
        if optimistic_value < best_cost:
            print "\033[91m* NOTE::\033[0m bounded!"

            progress_counter += 2**(len(current_candidate_list)+1) - 2
            print "progress", float(progress_counter)/(2**(package_file.number_of_checkers+1)-2)*100, "%"

            return
        branch(current_candidate_list, current_selected_list, current_excluded_list)
    return


def bound(excluded_items):
    """
    Bounding is the awesomeness in B&B! it checks how much possibility of improvement
    is available in the most optimistic way. (then we can check later, if we have already
    a better solution than the current solution plus all the remaining optimism, we can
    discard this branch!)
    :param excluded_items:  list of all items that are decided to be left out
    :return: the optimistic guess of the possibility of improvement.
    """
    # optimistic_value = 0
    non_excluded_item = []
    for item in package_file.list_of_checkers:
        if item not in excluded_items:
            non_excluded_item.append(item)
            # optimistic_value += package_file.list_of_candidates[item][0]

    print "non excluded items:", non_excluded_item
    generate_specific_file(non_excluded_item)
    calculate_area(non_excluded_item)
    optimistic_value = calculate_coverage(non_excluded_item)

    print "optimistic value:", optimistic_value
    return optimistic_value



progress_counter = 0
for i in range(1, package_file.number_of_checkers+1):
    package_file.list_of_checkers.append(str(i))

make_folders()
# we need to prepare a dictionary of all the single checker's info
# The dictionary format is the following     checker number:  [coverage,  area]
build_list_of_candidates()

# Just for getting a copy of the current console
sys.stdout = logger.Logger()

# best solution keeps a list of all the selected checkers which are used in the best solution
best_solution = None
# the area of the best solution
best_cost = 0

print "\033[32m* NOTE::\033[0m starting branch and bound optimization!"
branch(package_file.list_of_candidates, [], [])
print "------------------------------"
print "\033[32m* NOTE::\033[0m best solution:", best_solution
print "\033[32m* NOTE::\033[0m coverage:", best_cost
# print package_file.list_of_candidates
