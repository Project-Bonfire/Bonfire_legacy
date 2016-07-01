# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
import package_file
from area_coverage_calc import calculate_area, calculate_coverage
from file_generator import generate_specific_file

def find_problematic_checkers():
    problematic_checker_detected = False
    checked_checkers = []
    counter = 0
    for item_1 in range(1, package_file.number_of_checkers+1):
        print "starting calculation for item", item_1
        generate_specific_file([item_1])
        calculate_area([item_1])
        initial_coverage = calculate_coverage([item_1])

        for item_2 in range(1, package_file.number_of_checkers+1):
                if item_1 != item_2:
                    if (item_1, item_2) not in checked_checkers:
                        counter += 1
                        print "checking round:", counter
                        checked_checkers.append((item_1, item_2))
                        generate_specific_file([item_1])
                        calculate_area([item_1, item_2])
                        new_coverage = calculate_coverage([item_1, item_2])
                        if new_coverage == initial_coverage:
                            print "\033[91m* NOTE::\033[0m PROBLEMATIC SET OF CHECKERS DETECTED:", item_2," IS DOMINATED BY", item_1
                            problematic_checker_detected = True
    return problematic_checker_detected

