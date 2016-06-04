# copyright 2016 siavoosh payanceh azad

import package_file

def calculate_cost(current_selected_list):
    # this cost would be the fault coverage of a set of checkers
    cost = 0
    for item in current_selected_list:
        cost += package_file.list_of_candidates[item][0]
    print "Cost:", cost
    return cost
