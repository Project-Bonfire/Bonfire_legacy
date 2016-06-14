# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand

import package_file
import os
import os.path

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
    for i in sorted(list_of_selected_checkers):
        name_string += str(i)+"_"
    name_string = name_string[:len(name_string)-1]
    # print "here", name_string

    if package_file.test_mode:
        return package_file.area_coverage_results[name_string][0]

    checkers_file_name = package_file.unit_under_test.lower()+"_checker"+name_string+".vhd"
    top_file_name = package_file.unit_under_test.lower()+"_checker"+name_string+"_top.vhd"
    script_file_name = package_file.unit_under_test+"_with_checkers_"+name_string+"_synthesis.script"

    if package_file.debug:
        print "-----------------------"
        print "calling the synthesis script with the following parameters:"
        print "$1: module name:", package_file.module_file_name
        print "$2: checkers file name", checkers_file_name
        print "$3: top file name", top_file_name
        print "$4: script file name", script_file_name
        print "$5: name string:", name_string

    os.system("sh ./synthesis_script.sh" + " " + package_file.module_file_name + " " + checkers_file_name + " " +
              top_file_name + " " + script_file_name + " " + name_string + " " + package_file.unit_under_test)

    if os.path.isfile("temp/area"+name_string+".txt"):
        return parse_area_report("temp/area"+name_string+".txt")
    else:
        raise ValueError("area"+name_string+".txt not found")


def parse_area_report(file_name):
    area = 0
    area_report_file = open(file_name, 'r')
    line = area_report_file.readline()
    while line != "":
        line = area_report_file.readline()
        if "Combinational area:" in line:
            split = line.split(' ')
            if package_file.debug:
                print "-----------------------"
                print "Parsing the line:", line
                print "split line:", split
                print "extracted area:", float(split[-1][:len(split[-1])-2])
            area = float(split[-1][:len(split[-1])-2])
    return area


def parse_coverage_report(file_name):
    coverage = 0
    coverage_report_file = open(file_name, 'r')
    line = coverage_report_file.readline()
    while line != "":
        line = coverage_report_file.readline()
        if "CeI:" in line and "%" in line:
            if package_file.debug:
                print "-----------------------"
                print "Parsing the line:", line
                print "split line:", line.split()
                print "extracted coverage:", float(line.split()[1])
            coverage = float(line.split()[1])
    return coverage


def calculate_coverage(list_of_selected_checkers):
    name_string = ""
    for i in sorted(list_of_selected_checkers):
        name_string += str(i)+"_"
    name_string = name_string[:len(name_string)-1]

    if package_file.test_mode:
        return package_file.area_coverage_results[name_string][1]

    # todo: here we have to synthesise it, and calculate the coverage
    return parse_coverage_report("coverage_results/fstat"+str(name_string))
