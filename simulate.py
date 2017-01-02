#!/usr/bin/python
# Copyright (C) 2016 Karl Janson, Siavoosh Payandeh Azad, Behrad Niazmand

import os
import sys
import shutil
from math import ceil

from Scripts.include.helper_func import *
from Scripts.include.file_lists import *
from Scripts.include.Help_note import print_help
from Scripts.include.write_do_file import write_do_file
from Scripts.include.package import *
from Scripts.include.arg_parser import arg_parser
from Scripts.include.stats import statistics


"""
Main program
"""
def main(argv):


    # Default simulation configuration
    program_argv = {
        'network_dime': 4,
        'credit_based_FC': False,
        'add_parity':      False,
        'add_checkers':    False,
        'packet_drop':     False,
        'add_NI':          -1,
        'add_FI':          False,
        'add_FC':          False,
        'add_FO':          False,
        'add_LV':          False,
        'lv_port':         4,
        'add_SHMU':        False,
        'rand':            -1,
        'BR':              -1,
        'PS':              [3,8],
        'sim':             -1,
        'end':             -1,
        'lat':             False,
        'debug':           False
    }

    # Parse the arguments given to the system
    try:
        program_argv = arg_parser(argv, program_argv);
    except ValueError as e:
        print_msg(MSG_ERROR, str(e))
        sys.exit(1)

    DEBUG = program_argv['debug']

    if DEBUG:
        print_msg(MSG_DEBUG,  "Command line parameters:")
        for i in program_argv:
            print "\t" + i + ": " + str(program_argv[i])
        print

    # Check if the temporary folder exists. If it does, clear it, if not, create it.
    if os.path.exists(SIMUL_DIR):
        try:
            shutil.rmtree(SIMUL_DIR)
        except OSError as e:
            print_msg(MSG_ERROR, "Error " + str(e[0]) + ": " + e[1])
            sys.exit(1)

    try:
        os.makedirs(SIMUL_DIR)
    except OSError as e:
        print_msg(MSG_ERROR, "Error " + str(e[0]) + ": " + e[1])
        sys.exit(1)

    if program_argv['credit_based_FC']:
        flow_control_type = CREDIT_BASED_SUFFIX
    else:
        flow_control_type = HANDSHAKING_SUFFIX

    # Generated network file name
    net_file_name = "network_" \
        + str(program_argv['network_dime']) + "x" + str(program_argv['network_dime']) \
        + ("_parity" if program_argv['add_parity'] else "") \
        + ("_NI" if program_argv['add_NI'] != -1 else "") \
        + ("_FI" if program_argv['add_FI'] else "") \
        + ("_packet_drop" if program_argv['packet_drop'] else "") \
        + ("_FO" if program_argv['add_FO'] else "") \
        + ("_SHMU" if program_argv['add_SHMU'] else "") \
        + ("_LV" if program_argv['add_LV'] else "") \
        + ("_credit_based" if program_argv['credit_based_FC'] else "_handshaking") \
        + ("_with_checkers" if program_argv['add_checkers'] else "") \
        + ".vhd"

    # Command to run for network generation
    net_gen_command = "python " + SCRIPTS_DIR + "/" + flow_control_type \
        + "/" + NET_GEN_SCRIPT + "_" + flow_control_type + ".py" \
        + " -D " + str(program_argv['network_dime']) \
        + (" -P" if program_argv['add_parity'] else "") \
        + (" -PD" if program_argv['packet_drop'] else "") \
        + (" -NI" if program_argv['add_NI'] != -1 else "") \
        + (" -FI" if program_argv['add_FI'] else "") \
        + (" -FO" if program_argv['add_FO'] else "") \
        + (" -FC" if program_argv['add_FC'] else "") \
        + (" -SHMU" if program_argv['add_SHMU'] else "") \
        + (" -LV " + str(program_argv['lv_port']) if program_argv['add_LV'] else "") \
        + " -o " + SIMUL_DIR + "/" + net_file_name

    if DEBUG: print_msg(MSG_DEBUG, "Running network generator:\n\t" + net_gen_command)

    return_value = os.system(net_gen_command)
    if return_value != 0:
        print_msg(MSG_ERROR, "Error while running network generation script")
        sys.exit(1)

    # Generate testbench
    net_tb_file_name = "network_" + str(program_argv['network_dime']) + "x" + str(program_argv['network_dime']) \
        + ("_parity" if program_argv['add_parity'] == True else "") \
        + ("_NI" if program_argv['add_NI'] != -1 else "") \
        + ("_FI" if program_argv['add_FI'] == True else "") \
        + ("_packet_drop" if program_argv['packet_drop'] == True else "") \
        + ("_Rand" if program_argv['rand'] != -1 else "") \
        + ("_BR" if program_argv['BR'] != -1 else "") \
        + ("_credit_based" if program_argv['credit_based_FC'] else "_handshaking") \
        + ("_with_checkers" if program_argv['add_checkers'] else "") \
        + "_tb.vhd"

    NI_status = ""
    if program_argv['add_NI'] != -1:
        if program_argv['credit_based_FC']:
            NI_status = " -PE"
        else:
            NI_status = " -NI " + str(program_argv['add_NI'])

    net_tb_gen_command = "python " + SCRIPTS_DIR + "/" + flow_control_type \
        + "/" + NET_TB_GEN_SCRIPT + "_" + flow_control_type + ".py" \
        + " -D " + str(program_argv['network_dime']) \
        + (" -P" if program_argv['add_parity'] == True else "") \
        + str(NI_status) \
        + (" -FI" if program_argv['add_FI'] == True else "") \
        + (" -LV" if program_argv['add_LV'] == True else "") \
        + (" -Rand " + str(program_argv['rand']) if program_argv['rand'] != -1 else "") \
        + (" -BR " + str(program_argv['BR']) if program_argv['BR'] != -1 else "") \
        + (" -PS " + str(program_argv['PS'][0]) + " " + str(program_argv['PS'][1])) \
        + (" -sim " + str(program_argv['sim']) if program_argv['sim'] != -1 else "") \
        + " -o " + SIMUL_DIR + "/" + net_tb_file_name



    if DEBUG: print_msg(MSG_DEBUG, "Running TB generator:\n\t" + net_tb_gen_command)

    return_value = os.system(net_tb_gen_command)
    if return_value != 0:
        print_msg(MSG_ERROR, "Error while running network testbench generation script")
        sys.exit(1)

    # Generate wave.do
    wave_do_file_name = "wave_" \
    + (str(program_argv['network_dime']) + "x" + str(program_argv['network_dime'])) \
    + ("_LV" if program_argv['add_LV'] else "") \
    + (".do")

    wave_do_gen_command = "python " + SCRIPTS_DIR + "/" + flow_control_type + "/" \
        + WAVE_DO_GEN_SCRIPT + "_" + flow_control_type + ".py" \
        + (" -D " + str(program_argv['network_dime'])) \
        + (" -LV " if program_argv['add_LV'] == True else "") \
        + (" -FI " if program_argv['add_FI'] == True else "") \
        + (" -o " + SIMUL_DIR + "/" + wave_do_file_name)


    if DEBUG: print_msg(MSG_DEBUG, "Running wave.do generator:\n\t" + wave_do_gen_command)

    return_value = os.system(wave_do_gen_command)
    if return_value != 0:
        print_msg(MSG_ERROR, "Error while running wave configuration generation script")
        sys.exit(1)

    # Generate simulate.do
    if DEBUG: print_msg(MSG_DEBUG, "Generating simulation.do")

    try:
        write_do_file(program_argv, net_file_name, net_tb_file_name, wave_do_file_name)
    except IOError as e:
        print_msg(MSG_ERROR, "Generate simulate.do file: Error " + str(e[0]) + ": " + e[1])
        sys.exit(1)


    # Running modelsim
    if DEBUG: print_msg(MSG_DEBUG, "Running Modelsim...")

    os.chdir(SIMUL_DIR)
    if program_argv['lat']:
        return_value = os.system("vsim -c -do " + SIMUL_DO_SCRIPT)
    else:
        return_value = os.system("vsim -do " + SIMUL_DO_SCRIPT)

    if return_value != 0:
        print_msg(MSG_ERROR, "Error while running Modelsim")
        sys.exit(1)

    # Latency calculation
    if program_argv['lat']:

        # Read sent packets
        statistics(True)

        # Run latency calculation script
        latency_command = "python " + SCRIPTS_DIR + "/include/" + LATENCY_CALCULATION_PATH + " -S " + SENT_TXT_PATH + " -R " + RECEIVED_TXT_PATH

        if program_argv['add_FI'] == False:
            if DEBUG: print_msg(MSG_DEBUG, "Running latency calculator script:\n\t" + latency_command)

            return_value = os.system(latency_command)
            if return_value != 0:
                print_msg(MSG_ERROR, "Error while running latency calculation script")
                sys.exit(1)
        else:
            print_msg(MSG_INFO, "Latency calculation is not possible because fault injection switch is on!")
    else:
        statistics(False)

if __name__ == "__main__":
    main(sys.argv)
