# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
from file_generator import generate_initial_files


def build_list_of_candidates():
    """
    This function should basically synthesise the checkers individually and
    calculate the coverage, build and return the list of candidates.
    :return: dictionary of all the candidates as keys and pair of [coverage, area] as the valye
    """
    list_of_candidates = {1: [45, 5],
                          2: [48, 8],
                          3: [35, 3]}

    generate_initial_files()
    # todo: we need to synthesize and calculate the coverage and area!

    if not check_list_of_candidates_format(list_of_candidates):
        raise ValueError("list_of_candidates is corrupt!")

    return list_of_candidates


def check_list_of_candidates_format(list_of_candidates):
    if not type(list_of_candidates) == dict:
        return False
    for item in list_of_candidates:
        if not type(list_of_candidates[item]) == list:
            return False
    return True