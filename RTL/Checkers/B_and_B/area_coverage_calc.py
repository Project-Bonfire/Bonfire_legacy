# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand

import package_file
import os


def calculate_area(list_of_selected_checkers):
    if len(list_of_selected_checkers) == 1:
        if list_of_selected_checkers[0] not in package_file.list_of_candidates.keys():
            return run_synthesis_script_and_report_area(list_of_selected_checkers[0])
        else:
            if package_file.list_of_candidates[list_of_selected_checkers[0]][1] is None:
                return run_synthesis_script_and_report_area(list_of_selected_checkers[0])
    else:
        return run_synthesis_script_and_report_area(list_of_selected_checkers)


def run_synthesis_script_and_report_area(list_of_selected_checkers):
    name_string = ""
    for i in list_of_selected_checkers:
        name_string += str(i)+"_"
    name_string = name_string[:len(name_string)-1]

    checkers_file_name = package_file.unit_under_test.lower()+"_checker"+name_string+".vhd"
    top_file_name = package_file.unit_under_test.lower()+"_checker"+name_string+"_top.vhd"
    script_file_name = package_file.unit_under_test+"_with_checkers_"+name_string+"_synthesis.script"

    os.system("sh ./synthesis_script.sh" + " " + package_file.module_file_name + " " + checkers_file_name + " " +
              top_file_name + " " + script_file_name + " " + name_string)
    return parse_area_report("temp/area"+name_string+".txt")


def parse_area_report(file_name):
    area = 0
    area_report_file = open(file_name, 'r')
    line = area_report_file.readline()
    while line != "":
        line = area_report_file.readline()
        if "Combinational area:" in line:
            area = float(line[:len(line)-2].split('         ', 1)[1])
    return area


def parse_coverage_report(file_name):
    coverage = 0
    coverage_report_file = open(file_name, 'r')
    line = coverage_report_file.readline()
    while line != "":
        line = coverage_report_file.readline()
        if "CeI:" in line and "%" in line:
            coverage = float(line.split()[1])
    return coverage


def calculate_coverage(list_of_selected_checkers):
    name_string = ""
    for i in list_of_selected_checkers:
        name_string += str(i)+"_"
    name_string = name_string[:len(name_string)-1]
    # todo: here we have to synthesise it, and calculate the coverage
    return parse_coverage_report("coverage_results/fstat"+str(name_string))
