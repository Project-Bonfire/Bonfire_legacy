# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
import package_file
from file_generator import generate_specific_file
from area_coverage_calc import calculate_area

def check_feasibility(current_selected_list, chosen_item):
    # in thus function we should check if the area of
    # the checkers goes over the limit
    area = 0
    general_list = current_selected_list + [chosen_item]

    if len(general_list) == 1:     # there is only one item in the list, so it should be already calculated!
        if general_list[0] not in package_file.list_of_candidates.keys():
            raise ValueError("Why are we here?!!")
    elif len(general_list) > 1:    # more than one item is in the list we have to check!
        new_key = ""
        for i in sorted(general_list):
            new_key += i + "_"
        new_key = new_key[:len(new_key) - 1]
        print "checking the feasibility for the following key:", new_key
        if new_key not in package_file.list_of_candidates.keys():      # this item has not been processed before!
            # generate the files!
            generate_specific_file(general_list)
            area = calculate_area(general_list)
            package_file.list_of_candidates[new_key] = [None, area]

        else:   # has been processed before!
            if package_file.list_of_candidates[new_key][1] is None:     # the area has not been calculated before!
                # generate the files!
                generate_specific_file(general_list)
                area = calculate_area(general_list)
                package_file.list_of_candidates[new_key][1] = area

            else:   # we have the area! no need for re-calculation!
                area = package_file.list_of_candidates[new_key][1]

    if area > package_file.size_max:
        return False
    return True
