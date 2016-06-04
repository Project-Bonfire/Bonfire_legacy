# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
import package_file
from file_generator import generate_specific_file


def check_feasibility(current_selected_list, chosen_item):
    # in thus function we should check if the area of
    # the checkers goes over the limit
    size = 0

    generate_specific_file(current_selected_list)
    # todo: here we have to synthesise it, and calculate the area

    for item in current_selected_list:
        size += package_file.list_of_candidates[item][1]
    size += package_file.list_of_candidates[chosen_item][1]
    if size > package_file.size_max:
        return False
    return True
