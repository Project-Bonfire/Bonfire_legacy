# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
from file_generator import generate_initial_files
import package_file


def build_list_of_candidates():
    """
    This function should basically synthesise the checkers individually and
    calculate the coverage, build and return the list of candidates.
    :return: dictionary of all the candidates as keys and pair of [coverage, area] as the valye
    """
    generate_initial_files()
    print "initializing the list of candidates"
    """
    for item in package_file.list_of_checkers:
       print "calculating area for item:", item
       list_of_initial_candidates = [item]
       area = calculate_area([item])
       package_file.list_of_candidates[item] = [None, area]
       print "area:", area
       print "calculating coverage for item:", item
       calculate_cost(list_of_initial_candidates)
       print "\033[32m* NOTE::\033[0m current result for list of candidates: ", package_file.list_of_candidates
       print "------------------------------"
    """
    for item in package_file.list_of_checkers:
        package_file.list_of_candidates[item] = [None, None]

    if not check_list_of_candidates_format(package_file.list_of_candidates):
        raise ValueError("list_of_candidates is corrupt!")

    # package_file.list_of_candidates = list_of_candidates
    # print "\033[32m* NOTE::\033[0m results for list of candidates:"
    # print package_file.list_of_candidates
    print "------------------------------"
    return None


def check_list_of_candidates_format(list_of_candidates):
    if not type(list_of_candidates) == dict:
        return False
    for item in list_of_candidates:
        if not type(list_of_candidates[item]) == list:
            return False
    return True