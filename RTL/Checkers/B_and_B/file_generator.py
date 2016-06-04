__author__ = 'siavoosh'
import os
import package_file
from vhdl_generators import gen_lbdr_cheker_files, gen_elbdr_cheker_files

def make_folders():
    checkers_vhdl_directory = "checker_vhdl"
    if not os.path.isdir(checkers_vhdl_directory):
        os.makedirs(checkers_vhdl_directory)

    file_list = [vhd_file for vhd_file in os.listdir(checkers_vhdl_directory) if vhd_file.endswith(".vhd")]
    for vhd_file in file_list:
        os.remove(checkers_vhdl_directory+'/'+vhd_file)

def generate_initial_files():
    if package_file.unit_under_test == "LBDR":
        for i in range(1, 5):
            list_of_checkers = [i]
            gen_lbdr_cheker_files.gen_lbdr_checkers(list_of_checkers)

    elif package_file.unit_under_test == "ELBDR":
        for i in range(1, 5):
            list_of_checkers = [i]
            gen_elbdr_cheker_files.gen_elbdr_checkers(list_of_checkers)