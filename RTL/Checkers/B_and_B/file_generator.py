# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand

import os
import package_file
from vhdl_generators import gen_lbdr_cheker_files, gen_elbdr_cheker_files, gen_elbdr_checker_top
from script_generators import gen_elbdr_synth_script


def make_folders():
    synth_script_folder = "synthesis_scripts"
    if not os.path.isdir(synth_script_folder):
        os.makedirs(synth_script_folder)

    file_list = [script_file for script_file in os.listdir(synth_script_folder) if script_file.endswith(".script")]
    for script_file in file_list:
        os.remove(synth_script_folder+'/'+script_file)

    checkers_vhdl_directory = "checker_vhdl"
    if not os.path.isdir(checkers_vhdl_directory):
        os.makedirs(checkers_vhdl_directory)

    file_list = [vhd_file for vhd_file in os.listdir(checkers_vhdl_directory) if vhd_file.endswith(".vhd")]
    for vhd_file in file_list:
        os.remove(checkers_vhdl_directory+'/'+vhd_file)


def generate_specific_file(current_selected_list):
    if len(current_selected_list) == 0:
        return None
    
    if package_file.unit_under_test == "LBDR":
        gen_lbdr_cheker_files.gen_lbdr_checkers(current_selected_list)

    elif package_file.unit_under_test == "ELBDR":
        gen_elbdr_cheker_files.gen_elbdr_checkers(current_selected_list)
        gen_elbdr_checker_top.gen_elbdr_checker_top(current_selected_list)
        gen_elbdr_synth_script.gen_elbdr_checker_top(current_selected_list)


def generate_initial_files():
    if package_file.unit_under_test == "LBDR":
        for i in range(1, 5):
            list_of_checkers = [i]
            gen_lbdr_cheker_files.gen_lbdr_checkers(list_of_checkers)

    elif package_file.unit_under_test == "ELBDR":
        for i in range(1, 5):
            list_of_checkers = [i]
            gen_elbdr_cheker_files.gen_elbdr_checkers(list_of_checkers)
            gen_elbdr_checker_top.gen_elbdr_checker_top(list_of_checkers)
            gen_elbdr_synth_script.gen_elbdr_checker_top(list_of_checkers)