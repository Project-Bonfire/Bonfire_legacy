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
from cost_function import calculate_cost
from check_feasibility import check_feasibility
from area_coverage_calc import calculate_area
from area_coverage_calc import calculate_coverage
import package_file
from misc import name_string_generator
from file_generator import generate_specific_file
from for_testing import gen_dummy_dict


# the area of the best solution
best_cost = 0
# best solution keeps a list of all the selected checkers which are used in the best solution
best_solution = None
best_area = package_file.size_max


def branch(candidates_list, selected_list, excluded_list):
    global best_cost, best_solution, best_area

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

    print "trying picking the item", item
    # the reason we check if the item is already there or not is the fact that we can have essential
    # checkers being fed into the tool and it messes up the entire thing if we don't take care of it...
    if item in selected_list:
        print "item already in the selected list! skipping..."
    # if we pick the item
    elif not check_feasibility(current_selected_list, item):
        # this is where it becomes infeasible!
        pass
    else:
        # so we have a new item that is actually feasible to pick
        current_selected_list.append(item)
        if item in current_excluded_list:
            print "we should not get here!"
            current_excluded_list.remove(item)
        cost = calculate_cost(current_selected_list)

        if cost > best_cost:
            item_number = name_string_generator(current_selected_list)
            print "\033[32m* NOTE::\033[0m found better solution with cost:", cost, "and area:", \
                  package_file.list_of_candidates[item_number][1]
            best_cost = cost
            best_area = package_file.list_of_candidates[item_number][1]
            best_solution = copy.deepcopy(current_selected_list)
        if cost == best_cost:
            item_number = name_string_generator(current_selected_list)
            if package_file.list_of_candidates[item_number][1] < best_area:
                item_number = name_string_generator(current_selected_list)
                print "\033[32m* NOTE::\033[0m found better solution with same cost:", cost, "and better area:", \
                      package_file.list_of_candidates[item_number][1]
                best_cost = cost
                best_area = package_file.list_of_candidates[item_number][1]
                best_solution = copy.deepcopy(current_selected_list)

        if len(current_candidate_list) > 0:
            optimistic_value = bound(current_excluded_list)
            # print "here",current_candidate_list, current_selected_list, current_excluded_list
            if optimistic_value < best_cost:
                print "\033[91m* NOTE::\033[0m bounded!"

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
        item_number = name_string_generator(current_selected_list)
        print "\033[32m* NOTE::\033[0m found better solution with cost:", cost, "and area:", \
              package_file.list_of_candidates[item_number][1]
        best_cost = cost
        best_area = package_file.list_of_candidates[item_number][1]
        best_solution = copy.deepcopy(current_selected_list)

    if cost == best_cost:
        item_number = name_string_generator(current_selected_list)
        if package_file.list_of_candidates[item_number][1] < best_area:
            print "\033[32m* NOTE::\033[0m found better solution with same cost:", cost, "and better area:", \
                package_file.list_of_candidates[item_number][1]
            best_cost = cost
            best_area = package_file.list_of_candidates[item_number][1]
            best_solution = copy.deepcopy(current_selected_list)

    if len(current_candidate_list) > 0:
        current_excluded_list.append(item)
        optimistic_value = bound(current_excluded_list)
        if optimistic_value < best_cost:
            print "\033[91m* NOTE::\033[0m bounded!"

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


def b_and_b():
    global best_cost, best_solution, best_area

    if package_file.test_mode:
        package_file.area_coverage_results = copy.deepcopy(gen_dummy_dict())

    print "\033[32m* NOTE::\033[0m starting branch and bound optimization!"

    if not package_file.use_essential_checkers:
        package_file.essential_checkers = []
    else:
        generate_specific_file(package_file.essential_checkers)
        calculate_area(package_file.essential_checkers)
        calculate_coverage(package_file.essential_checkers)

    print "starting process with the following checkers:", package_file.list_of_candidates.keys()
    print "picking the following checkers as essential:", package_file.essential_checkers

    branch(package_file.list_of_candidates, package_file.essential_checkers, [])
    print "------------------------------"
    print "\033[32m* NOTE::\033[0m best solution:", best_solution
    print "\033[32m* NOTE::\033[0m coverage:", best_cost
    print "\033[32m* NOTE::\033[0m area:", best_area
    # print package_file.list_of_candidates
