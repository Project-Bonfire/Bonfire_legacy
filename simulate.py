#!/usr/bin/python
# Copyright (C) 2016 Karl Janson, Siavoosh Payandeh Azad, Behrad Niazmand

import os
import sys
import shutil
from math import ceil
import logging
import time
from Scripts.include.Logger import * 
from Scripts.include.helper_func import *
from Scripts.include.file_lists import *
from Scripts.include.Help_note import print_help
from Scripts.include.write_do_file import write_do_file
from Scripts.include import package
from Scripts.include.arg_parser import arg_parser, report_parogram_arguments
from Scripts.include.stats import statistics

try:
    from Scripts.include.viz_traffic import viz_traffic
    Viz = True
except:
    print_msg(MSG_INFO, "Can not include the visualizer! Some library is missing.")
    Viz = False

from Scripts.include.file_gen import gen_network_and_tb, gen_wave_do

"""
Main program
"""
def main(argv):
 

    print "Project Root:", package.PROJECT_ROOT

    # Check if the temporary folder exists. If it does, clear it, if not, create it.
    if os.path.exists(package.SIMUL_DIR):
        try:
            shutil.rmtree(package.SIMUL_DIR)
        except OSError as e:
            print_msg(MSG_ERROR, "Error " + str(e[0]) + ": " + e[1])
            sys.exit(1)
    try:
        os.makedirs(package.SIMUL_DIR)
        os.makedirs(package.LOG_DIR)
        os.makedirs(package.TRACE_DIR)
    except OSError as e:
        print_msg(MSG_ERROR, "Error " + str(e[0]) + ": " + e[1])
        sys.exit(1)

    # Just for getting a copy of the current console
    sys.stdout = Logger()

    # setup Logging
    logging.basicConfig(filename=LOG_DIR+'/Logging_Log_'+str(time.time())+'.log', level=logging.DEBUG)
    logging.info('Starting logging...')

    # Parse the arguments given to the system
    try:
        package.program_argv = arg_parser(argv, package.program_argv, logging)
    except ValueError as e:
        print_msg(MSG_ERROR, str(e))
        sys.exit(1)

    DEBUG = package.program_argv['debug']
    report_parogram_arguments(package.program_argv, DEBUG)
    
    if package.program_argv['credit_based_FC']:
        flow_control_type = package.CREDIT_BASED_SUFFIX
    else:
        flow_control_type = package.HANDSHAKING_SUFFIX

    net_file_name, net_tb_file_name = gen_network_and_tb(package.program_argv, flow_control_type)

    # Generate wave.do
    wave_do_file_name = gen_wave_do(package.program_argv, flow_control_type)

    # Generate simulate.do
    if DEBUG: print_msg(MSG_DEBUG, "Generating simulation.do")

    try:
        write_do_file(package.program_argv, net_file_name, net_tb_file_name, wave_do_file_name, logging)
    except IOError as e:
        print_msg(MSG_ERROR, "Generate simulate.do file: Error " + str(e[0]) + ": " + e[1])
        sys.exit(1)

    # Running modelsim
    if DEBUG: print_msg(MSG_DEBUG, "Running Modelsim...")

    os.chdir(package.SIMUL_DIR)
    if package.program_argv['lat']:
        return_value = os.system("vsim -c -do " + package.SIMUL_DO_SCRIPT)
    else:
        return_value = os.system("vsim -do " + package.SIMUL_DO_SCRIPT)

    if return_value != 0:
        logging.error("Error while running Modelsim")
        print_msg(MSG_ERROR, "Error while running Modelsim")
        sys.exit(1)

    # Latency calculation
    logging.info('starting latency calculation...')
    if package.program_argv['lat']:
        # Read sent packets
        statistics(True)

        # Run latency calculation script
        latency_command = "python " + SCRIPTS_DIR + "/include/" + LATENCY_CALCULATION_PATH + " -S " + SENT_TXT_PATH + " -R " + RECEIVED_TXT_PATH

        if package.program_argv['add_FI'] == False:
            if DEBUG: print_msg(MSG_DEBUG, "Running latency calculator script:\n\t" + latency_command)

            return_value = os.system(latency_command)
            if return_value != 0:
                print_msg(MSG_ERROR, "Error while running latency calculation script")
                sys.exit(1)
        else:
            print_msg(MSG_INFO, "Latency calculation is not possible because fault injection switch is on!")
    else:
        statistics(False)

    if package.program_argv["trace"] and Viz == True:
        viz_traffic(package.program_argv["network_dime"])

    logging.info('Logging finished...')

if __name__ == "__main__":
    main(sys.argv)
