# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand

import package_file
from file_generator import generate_specific_file

def calculate_cost(current_selected_list):
    # this cost would be the fault coverage of a set of checkers
    cost = 0
    generate_specific_file(current_selected_list)
    # todo: here we have to synthesise it, and calculate the coverage
    for item in current_selected_list:
        cost += package_file.list_of_candidates[item][0]
    print "Cost:", cost
    return cost
