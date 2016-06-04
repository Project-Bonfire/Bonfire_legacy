# copyright 2016 siavoosh payanceh azad

import package_file


def check_feasibility(current_selected_list, chosen_item):
    # in thus function we should check if the area of
    # the checkers goes over the limit
    # todo: at the moment this is naive. we need to actually run the synthesis for this
    size = 0
    for item in current_selected_list:
        size += package_file.list_of_candidates[item][1]
    size += package_file.list_of_candidates[chosen_item][1]
    if size > package_file.size_max:
        return False
    return True
