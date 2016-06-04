# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand

import copy
from build_list_of_candidates import build_list_of_candidates
from cost_function import calculate_cost
from check_feasibility import check_feasibility
import package_file

# we need to prepare a dictionary of all the single checker's info
# The dictionary format is the following     checker number:  [coverage,  area]
package_file.list_of_candidates = build_list_of_candidates()

# best solution keeps a list of all the selected checkers which are used in the best solution
best_solution = None
# the area of the best solution
best_cost = 0

# this is the maximum possible coverage that sum of the checkers can get
optimistic_guess = 100


def branch(candidates_list, selected_list, excluded_list):
    global best_cost, best_solution

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
        print "\033[91m* NOTE::\033[0m Non feasible solution!... aborting!"
    else:
        current_selected_list.append(item)
        if item in current_excluded_list:
            print "we should not get here!"
            current_excluded_list.remove(item)
        cost = calculate_cost(current_selected_list)
        if cost > best_cost:
            print "\033[32m* NOTE::\033[0m found better solution with cost:", cost
            best_cost = cost
            best_solution = copy.deepcopy(current_selected_list)

        if len(current_candidate_list) > 0:
            optimistic_value = bound(current_excluded_list)
            if optimistic_value < best_cost:
                print "bounded"
                return
            branch(current_candidate_list, current_selected_list, current_excluded_list)

    # if we dont pick the item
    print "------------------------------"
    print "selected list at start:", selected_list
    print "excluded list at start:", excluded_list
    print "Item to be branched:", item
    print "not picking the item", item
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
            print "bounded"
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
    global optimistic_guess
    optimistic_value = 0
    for item in package_file.list_of_candidates:
        if item not in excluded_items:
            optimistic_value += package_file.list_of_candidates[item][0]

    # the point here is that in some cases the things that checkers, check, might overlap and that
    # can result in optimistic_value to be over 100% which doesnt make sense!
    if optimistic_value > optimistic_guess:
        optimistic_value = optimistic_guess
    print "optimistic value:", optimistic_value
    return optimistic_value


branch(package_file.list_of_candidates, [], [])
print "------------------------------"
print "\033[32m* NOTE::\033[0m best solution:", best_solution
print "\033[32m* NOTE::\033[0m cost:", best_cost
