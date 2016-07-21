# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand

import sys
from file_generator import make_folders
from build_list_of_candidates import build_list_of_candidates
import logger
from find_problematic_checkers import find_problematic_checkers
import package_file
from b_and_b import b_and_b
from reports import report_config
from greedy_search import greedy_search

if '--help' in sys.argv[1:]:
    print "           ===================================================             "
    print "                   \033[32m _        .__   _     .__  _       \033[0m"
    print "                  \033[32m//  |   |  |    /  | / |   | )\033[0m              "
    print "           ======\033[32m||   |\033[91m===\033[32m|  |\033[91m==\033[32m |   |/  |\033[91m==\033[32m " \
          "|\\ \033[0m  ==========="
    print "                  \033[32m\\\\_ |   |  |__  \\_ |\\_ |__ | \\ \033[91m  Opt. tool\033[0m "
    print "           ===================================================             "
    print "welcome to one of the the darkest corners of this project. This tool is designed to " \
          "apply optimization \nmethods on checkers. This tool contains three main parts:\n" \
          "\t- Greedy heuristics: sorts the checkers based on your criteria and tries to pick them one by one \n" \
          "\t- Branch and bound: its classic branch and bound, dont try it on units with more than 15 checkers \n" \
          "\t- Checker Evaluation: it identifies the checkers that are dominating the other ones.\n" \
          "now to run it, you need to change the configuration in the package file! you can find more\n" \
          "documentation inside this file.\n"

    print "===================================================             "
    print " ==>\033[32m Adding new checkers or modules to the tool\033[0m <=="
    print "In order to try new checkers, you need to follow these steps:"
    print "\t1. add a script that generates VHDL files for your checkers and top module "
    print "\t2. copy the module's pseudo combinational VHDL file in the folder"
    print "\t3. change the package_file parameters according to your design"
    print "\t\t- set the number_of_checkers to the number of checkers you have implemented"
    print "\t\t- set size_max to maximum size you can afford for the checkers+pseudo combinational"
    print "\t\t- set unit_under_test and module_file_name, follow instructions inside the file"
    print "\t\t- if you need more info, set debug to True"
    print "\t4. copy analyze tool into the B&B folder"
    print "\t5. set up your synthesis tool environment. and run b_and_b.py"
    print "\t6. be patient, it will take a while..."
    print "\t7. if you got an error, find Siavoosh!"
    print "===================================================             "
    print " ==> \033[32m notes\033[0m <=="
    print "every time you run the old synthesis tool, it takes 3-5 mins to start, keep that in mind when"
    print "you starting some new experiment. please do some calculation before running the tool."
    print "remember that branch and bound in the worst case scenario searches the whole binary tree, "
    print "and in each step it runs the synthesis tool runs twice. this means that for each evaluation,"
    print "you need 6-10 minutes. multiply it to the size of the binary tree and you get some idea!"
    print "===================================================             "
    print "\n and as final word, good luck, you're gonna need it!\n"
    sys.exit()

report_config()

for i in range(1, package_file.number_of_checkers+1):
    package_file.list_of_checkers.append(str(i))

make_folders()
# we need to prepare a dictionary of all the single checker's info
# The dictionary format is the following     checker number:  [coverage,  area]
build_list_of_candidates()

# Just for getting a copy of the current console
sys.stdout = logger.Logger()

if package_file.find_problematic_checkers:
    find_problematic_checkers()
    print "Finished checking problematic checkers..."
    sys.exit()

if package_file.optimization_method == "greedy":
    greedy_search()
if package_file.optimization_method == "b_and_b":
    b_and_b()