__author__ = 'siavoosh'
import package_file

def calculate_area(list_of_selected_checkers):
    # todo: here we have to synthesise the files, and calculate the area
    area = 0
    if len(list_of_selected_checkers) == 1:
        if list_of_selected_checkers[0] not in package_file.list_of_candidates.keys():
            area = 1
            return area
        else:
            if package_file.list_of_candidates[list_of_selected_checkers[0]][1] is None:
                area = 1
                return area
    for item in list_of_selected_checkers:
        area += package_file.list_of_candidates[item][1]
    return area


def calculate_coverage(list_of_selected_checkers):
    # todo: here we have to synthesise it, and calculate the coverage
    coverage = 0

    if len(list_of_selected_checkers) == 1:
        if list_of_selected_checkers[0] not in package_file.list_of_candidates.keys():
            coverage = 1
            return coverage
        else:
            if package_file.list_of_candidates[list_of_selected_checkers[0]][0] is None:
                coverage = 1
                return coverage

    for item in list_of_selected_checkers:
        coverage += package_file.list_of_candidates[item][0]
    return coverage