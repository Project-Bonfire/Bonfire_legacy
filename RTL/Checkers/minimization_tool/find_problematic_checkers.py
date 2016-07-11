# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
import package_file
from area_coverage_calc import calculate_area, calculate_coverage
from file_generator import generate_specific_file
import copy
from for_testing import gen_dummy_dict


def find_problematic_checkers():
    if package_file.test_mode:
        package_file.area_coverage_results = copy.deepcopy(gen_dummy_dict())
    print "----------------------------------"
    print "Starting checks for problematic checkers..."
    problematic_checker_detected = False
    checked_checkers = []
    counter = 0
    for item_1 in range(1, package_file.number_of_checkers+1):
        print "starting calculation for item", item_1
        initial_list = [str(item_1)]
        generate_specific_file(initial_list)
        calculate_area(initial_list)
        initial_coverage = calculate_coverage(initial_list)

        for item_2 in range(1, package_file.number_of_checkers+1):
                if item_1 != item_2:
                    if (item_1, item_2) not in checked_checkers:
                        counter += 1
                        new_list = [str(item_1), str(item_2)]
                        print "checking round:", counter
                        checked_checkers.append((item_1, item_2))
                        generate_specific_file(new_list)
                        calculate_area(new_list)
                        new_coverage = calculate_coverage(new_list)

                        if new_coverage == initial_coverage:
                            print "\033[91m* NOTE::\033[0m PROBLEMATIC SET OF CHECKERS DETECTED:", \
                                item_2, " IS DOMINATED BY", item_1
                            problematic_checker_detected = True
    return problematic_checker_detected
