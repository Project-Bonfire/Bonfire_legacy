# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
import package_file
from area_coverage_calc import calculate_area, calculate_coverage

def find_problematic_checkers():
    problematic_checker_detected = False
    checked_checkers = []
    for item_1 in range(0, package_file.number_of_checkers):
        calculate_area([item_1])
        initial_coverage = calculate_coverage([item_1])
        for item_2 in range(0, package_file.number_of_checkers):
                if item_1 != item_2:
                    if (item_1, item_2) not in checked_checkers:
                        if (item_2, item_1) not in checked_checkers:
                            checked_checkers.append((item_1, item_2))
                            calculate_area([item_1, item_2])
                            new_coverage = calculate_coverage([item_1, item_2])
                            if new_coverage == initial_coverage:
                                print "PROBLEMATIC SET OF CHECKERS DETECTED:", item_2," IS DOMINATED BY", item_1
                                problematic_checker_detected = True
    return problematic_checker_detected

