#!/usr/bin/python
# Copyright (C) 2016 Karl Janson, Siavoosh Payandeh Azad, Behrad Niazmand

import os
import sys
import shutil
from math import ceil

from include.helper_func import *

"""
Constant declarations
"""
# Temporary directory for storing simulation files
SIMUL_DIR = "../simul_temp"
SRC_DIR = "../src"

NET_GEN_SCRIPT = SRC_DIR + "/EHA/scripts/network_gen_parameterized.py"
NET_TB_GEN_SCRIPT = SRC_DIR + "/Test/scripts/network_tb_gen_parameterized.py"
WAVE_DO_GEN_SCRIPT = SRC_DIR + "/Test/scripts/wave_do_gen.py"

RECEIVED_TXT_PATH = SIMUL_DIR + "/received.txt"
SENT_TXT_PATH = SIMUL_DIR + "/sent.txt"

SIMUL_DO_SCRIPT = SIMUL_DIR + "/simulate.do"

DEBUG = False

"""
Arguments parser
    argv:           List of program arguments (sys.argv)
    program_argv:   Dictionary consisting of network configuration variables
"""
def arg_parser(argv, program_argv):

    # MAN:
    # you should run this as
    # python network_gen_parameterized.py [options]
    #       -D [size]:  allows you to set the size of the network. it can be powers of two.
    #       -NI: adds NI to network
    #       -P adds parity checker to the network
    #       -FI adds fault injectors
    #       [-Rand/-BR] [PIR] uses random, or bit reversal traffic pattern generator, respectevely, with
    #                           packet injection rate of PIR. By default, repeatative packets being sent from source to same destination
    #       -PS [min packet size] [max packet size]: specifies packet size. default min value is 3 and defualt max value is 8."
    #       -sim: specifies the length of simulation in clock cycles. which at this time the packet generators will stop sending packets."

    if '--help' in argv[1:] or len(argv) == 1:
        print BOLD + "Usage:" + ENDC
        print
        print BOLD + OKBLUE + "  Network parameters:" + ENDC
        print BOLD + "  -D [size]:" + ENDC
        print "\tMake a network of [size]X[size]. Size can be only multiples of two. " \
            + "Default value is " + str(program_argv['network_dime']) + "."
        print
        print BOLD + "  -P:" + ENDC
        print "\tAdd parity to each router input. " \
            + "Default is " + str(program_argv['add_parity']) + "."
        print
        print BOLD + "  -NI [depth]:" + ENDC
        print "\tAdd a network interface with size [depth] to each router's local port. " \
            + "Default is " + str(program_argv['add_NI']) + "."
        print
        print BOLD + "  -FI:" + ENDC
        print "\tAdd fault injector units to all the links (except the local) in the network. " \
            + "Default is " + str(program_argv['add_FI']) + "."
        print
        print
        print BOLD + OKBLUE + "  Simulation parameters:" + ENDC
        print BOLD + "  -Rand [PIR]:" + ENDC
        print "\tUse Random traffic pattern generator with packet injection rate equal to PIR (value between 0 and 1)."
        print "\t\t**Cannot be used togeter with -BR.**"
        print "\t\tIf neither -Rand or -BR is specified, system defaults to repeatative packets being sent from source to same destination."
        print
        print BOLD + "  -BR [PIR]:" + ENDC
        print "\tUse Bit Reversal traffic pattern generator with packet injection rate equal to PIR (value between 0 and 1)."
        print "\t\t**Cannot be used togeter with -Rand.**"
        print "\t\tIf neither -Rand or -BR is specified, system defaults to repeatative packets being sent from source to same destination."
        print
        print BOLD + "  -PS [min] [max]:" + ENDC
        print "\tSpecify packet size range. Default min value is 3 and defualt max value is 8."
        print
        print BOLD + "  -sim [sim_time]:" + ENDC
        print "\tSpecifies the length of simulation in clock cycles. which at this time the packet generators will stop sending packets."
        print
        print BOLD + "  -end [end_time]:" + ENDC
        print "\tSpecifies the length of simulation in nanoseconds. After this time the simulation will be stopped, even if the packet injection is still active."
        print "\tIf this parameter is not specified, but -sim is specified, the default value is 1.5*sim."
        print "\tIf this parameter is not specified and -sim is also not specified, it defaults to 15000 ns."
        print
        print BOLD + "  -lat:" + ENDC
        print "\tCalculate the average packet latency (in terms of clock cycles). Disables Modelsim GUI."
        print
        print
        print BOLD + OKBLUE + "  Other parameters:" + ENDC
        print BOLD + "  --debug:" + ENDC
        print "\tIncrease verbocity of the script. Useful for debugging."
        print
        print
        print BOLD + OKBLUE + "  Examples:" + ENDC
        print BOLD + "  Example 1:" + ENDC
        print "\t " + argv[0] + " -D 2 -NI -P -FI"
        print "\t\tSimulates a 2X2 network that has network interface and parity checker and fault injectors included."
        print "\t\tAlso generates a tesbench that uses non-random traffic patterns with random stop time."
        print
        print BOLD + "  Example 2:" + ENDC
        print "\t " + argv[0] + " -D 4 -NI -P -FI -Rand 0.005 -PS 3 3 -sim 10000"
        print "\t\tSimulates a 4X4 network that has network interface and parity checker and fault injectors included."
        print "\t\talso generates a testbench which uses random traffic pattern generator with PIR of 0.005"
        print "\t\tand fixed packet size of 3 and sends packets until 10000 ns."

        sys.exit()

    if '-D'	in argv[1:]:
        program_argv['network_dime'] = int(argv[argv.index('-D')+1])
        if program_argv['network_dime'] < 2:
            raise ValueError("You cannot build a network with " + str(program_argv['network_dime']) + " node(s)!")
        if program_argv['network_dime'] % 2 != 0:
            raise ValueError("Wrong network size. Please choose multiples of 2. For example 4!")
    else:
        program_argv['network_dime'] = 4

    if '-P' in argv[1:]:
        program_argv['add_parity'] = True
    else:
        program_argv['add_parity'] = False

    if '-NI' in argv[1:]:
        program_argv['add_NI'] = int(argv[argv.index('-NI')+1])
        if program_argv['add_NI'] < 0:
            raise ValueError("Network interface's depth cannot be negative!")


    if '-FI' in argv[1:]:
        program_argv['add_FI'] = True
    else:
        program_argv['add_FI'] = False

    if '-lat' in argv[1:]:
        program_argv['lat'] = True
    else:
        program_argv['lat'] = False

    if '-Rand'	in argv[1:]:
        program_argv['rand'] = float(argv[argv.index('-Rand')+1])
        if program_argv['rand'] < 0 or program_argv['rand'] > 1:
            raise ValueError("Packet injection rate has to be between 0 and 1!")

    if '-BR' in argv[1:]:
        program_argv['BR'] = float(argv[argv.index('-BR')+1])
        if program_argv['BR'] < 0 or program_argv['rand'] > 1:
            raise ValueError("Packet injection rate has to be between 0 and 1!")

    if '-PS' in argv[1:]:
        program_argv['PS'][0] = int(argv[argv.index('-PS')+1])
        program_argv['PS'][1] = int(argv[argv.index('-PS')+2])

    if '-sim' in argv[1:]:
        program_argv['sim'] = int(argv[argv.index('-sim')+1])
        if program_argv['sim'] < 0:
            raise ValueError("Simulation time cannot be negative!")

    if '-end' in argv[1:]:
        program_argv['end'] = int(argv[argv.index('-end')+1])
        if program_argv['end'] < 0:
            raise ValueError("Simulation time cannot be negative!")

    if program_argv['rand'] != -1 and program_argv['BR'] != -1:
        raise ValueError("You cannot specify -Rand and -BR at the same time!")

    if '--debug' in argv[1:]:
        program_argv['debug'] = True
    else:
        program_argv['debug'] = False

    return program_argv

"""
Generates a simulate.do file for running Modelsim.

    netwrok_conf:       directory with program parameters
    net_file_name:      file name for the generated network
    net_tb_file_name:   file name for the generated network
    wave_do_file_name:  file name for the generated wave.do file
"""
def write_do_file(program_argv, net_file_name, net_tb_file_name, wave_do_file_name):

    do_file = open(SIMUL_DO_SCRIPT, 'w')

    do_file.write("#########################################\n")
    do_file.write("# Copyright (C) 2016 Karl Janson        #\n")
    do_file.write("#                                       #\n")
    do_file.write("# This file is automatically generated! #\n")
    do_file.write("#             DO NOT EDIT!              #\n")
    do_file.write("#########################################\n\n")

    do_file.write("vlib work\n\n")

    do_file.write("# Include files and compile them\n")

    # EHA
    do_file.write("vcom \"" + SRC_DIR + "/EHA/RTL/Hand_Shaking_FC/Arbiter.vhd\"\n")
    do_file.write("vcom \"" + SRC_DIR + "/EHA/RTL/Hand_Shaking_FC/FIFO_one_hot.vhd\"\n")
    do_file.write("vcom \"" + SRC_DIR + "/EHA/RTL/Hand_Shaking_FC/LBDR.vhd\"\n")
    do_file.write("vcom \"" + SRC_DIR + "/EHA/RTL/Hand_Shaking_FC/xbar.vhd\"\n")

    if program_argv['add_NI'] != -1:
        do_file.write("vcom \"" + SRC_DIR + "/EHA/RTL/Hand_Shaking_FC/NI.vhd\"\n")
        do_file.write("vcom \"" + SRC_DIR + "/EHA/RTL/Hand_Shaking_FC/NI_channel.vhd\"\n")

    if program_argv['add_FI'] == True:
        do_file.write("vcom \"" + SRC_DIR + "/EHA/RTL/Hand_Shaking_FC/Fault_injector.vhd\"\n")

    if program_argv['add_parity'] == True:
        do_file.write("vcom \"" + SRC_DIR + "/EHA/RTL/Error_Detection_Correction/ParityChecker.vhd\"\n")
        do_file.write("vcom \"" + SRC_DIR + "/EHA/RTL/Hand_Shaking_FC/Router_32_bit_parity.vhd\"\n")
    else:
        do_file.write("vcom \"" + SRC_DIR + "/EHA/RTL/Hand_Shaking_FC/Router_32_bit.vhd\"\n")

    # Test
    do_file.write("vcom \"" + SRC_DIR + "/Test/TB/TB_Package_32_bit.vhd\"\n")

    # Generated
    do_file.write("vcom \"" + net_file_name + "\"\n")
    do_file.write("vcom \"" + net_tb_file_name + "\"\n\n")


    do_file.write("# Start the simulation\n")
    do_file.write("vsim work.tb_network_" \
        + str(program_argv['network_dime']) + "x" + str(program_argv['network_dime']) + "\n\n")

    do_file.write("# Draw waves\n")
    do_file.write("do " + wave_do_file_name + "\n")

    do_file.write("# Run the simulation\n")
    if program_argv['sim'] == -1 and program_argv['end'] == -1:
        do_file.write("run 15000 ns\n")

    elif program_argv['sim'] != -1 and program_argv['end'] == -1:

        do_file.write("run " + str(int(ceil(program_argv['sim'] * 1.5))) + " ns\n")

    else:
        do_file.write("run " + str(program_argv['end']) + " ns\n")

    if program_argv['lat']:
        do_file.write("\n# Exit Modelsim after simulation\n")
        do_file.write("exit\n")

    do_file.close()


"""
Main program
"""
def main(argv):

    global DEBUG

    # Default simulation configuration
    program_argv = {
        'network_dime': 4,
        'add_parity':   False,
        'add_NI':       -1,
        'add_FI':       False,
        'rand':         -1,
        'BR':           -1,
        'PS':           [3,8],
        'sim':          -1,
        'end':          -1,
        'lat':          False,
        'debug':        False
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

    # Generate network
    net_file_name = "network_" \
        + str(program_argv['network_dime']) + "x" + str(program_argv['network_dime']) \
        + ("_parity" if program_argv['add_parity'] == True else "") \
        + ("_NI" if program_argv['add_NI'] != -1 else "") \
        + ("_FI" if program_argv['add_FI'] == True else "") \
        + ".vhd"

    net_gen_command = "python " + NET_GEN_SCRIPT \
        + " -D " + str(program_argv['network_dime']) \
        + (" -P" if program_argv['add_parity'] == True else "") \
        + (" -NI" if program_argv['add_NI'] != -1 else "") \
        + (" -FI" if program_argv['add_FI'] == True else "") \
        + " -o " + SIMUL_DIR + "/" + net_file_name

    if DEBUG: print_msg(MSG_DEBUG, "Running network generator:\n\t" + net_gen_command)

    return_value = os.system(net_gen_command)
    if return_value != 0:
        print_msg(MSG_ERROR, "Error while running network generation script")
        sys.exit(1)

    # Generate testbech

    net_tb_file_name = "network_" + str(program_argv['network_dime']) + "x" + str(program_argv['network_dime']) \
        + ("_parity" if program_argv['add_parity'] == True else "") \
        + ("_NI" if program_argv['add_NI'] != -1 else "") \
        + ("_FI" if program_argv['add_FI'] == True else "") \
        + ("_Rand" if program_argv['rand'] != -1 else "") \
        + ("_BR" if program_argv['BR'] != -1 else "") \
        + "_tb.vhd"

    net_tb_gen_command = "python " + NET_TB_GEN_SCRIPT \
        + " -D " + str(program_argv['network_dime']) \
        + (" -P" if program_argv['add_parity'] == True else "") \
        + (" -NI " + str(program_argv['add_NI']) if program_argv['add_NI'] != -1 else "") \
        + (" -FI" if program_argv['add_FI'] == True else "") \
        + (" -Rand " + str(program_argv['rand']) if program_argv['rand'] != -1 else "") \
        + (" -BR " + str(program_argv['BR']) if program_argv['BR'] != -1 else "") \
        + " -PS " + str(program_argv['PS'][0]) + " " + str(program_argv['PS'][1]) \
        + (" -sim " + str(program_argv['sim']) if program_argv['sim'] != -1 else "") \
        + " -o " + SIMUL_DIR + "/" + net_tb_file_name

    if DEBUG: print_msg(MSG_DEBUG, "Running TB generator:\n\t" + net_tb_gen_command)

    return_value = os.system(net_tb_gen_command)
    if return_value != 0:
        print_msg(MSG_ERROR, "Error while running network testbench generation script")
        sys.exit(1)

    # Generate wave.do
    wave_do_file_name = "wave_" \
    + str(program_argv['network_dime']) + "x" + str(program_argv['network_dime']) \
    + ".do"

    wave_do_gen_command = "python " + WAVE_DO_GEN_SCRIPT \
        + " -D " + str(program_argv['network_dime']) \
        + " -o " + SIMUL_DIR + "/" + wave_do_file_name

    if DEBUG: print_msg(MSG_DEBUG, "Running wave.do generator:\n\t" + wave_do_gen_command)

    return_value = os.system(wave_do_gen_command)
    if return_value != 0:
        print_msg(MSG_ERROR, "Error while running wave configuration generation script")
        sys.exit(1)

    # Write do files
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
        print
        if DEBUG: print_msg(MSG_DEBUG, "Opening" + SENT_TXT_PATH)
        print_msg(MSG_INFO, "Packets sent:")
        try:
            packets_sent_fp = open(SENT_TXT_PATH, 'r')

            num_packets_sent = 0
            for line in packets_sent_fp:
                print "\t" + line.split('\n')[0]
                num_packets_sent += 1

            packets_sent_fp.close()
        except IOError as e:
            print_msg(MSG_ERROR, "Open sent.txt: Error " + str(e[0]) + ": " + e[1])
            sys.exit(1)

        # Read received packets
        print
        if DEBUG: print_msg(MSG_DEBUG, "Opening" + RECEIVED_TXT_PATH)
        print_msg(MSG_INFO, "Packets received:")
        try:
            packets_recv_fp = open(RECEIVED_TXT_PATH, 'r')

            num_packets_recv = 0
            for line in packets_recv_fp:
                print "\t" + line.split('\n')[0]
                num_packets_recv += 1

            packets_recv_fp.close()
        except IOError as e:
            print_msg(MSG_ERROR, "Open received.txt: Error " + str(e[0]) + ": " + e[1])
            sys.exit(1)

        # Display statistics
        print
        print_msg(MSG_INFO, "Statistics:")
        print "\tPackets sent:\t\t" + str(num_packets_sent)
        print "\tPackets received:\t" + str(num_packets_recv)
        print "\tPacket loss:\t\t" + str(100 - (num_packets_recv * 100 / num_packets_sent)) + "%"

        # Run latency calculation script
        latency_command = "python " + SRC_DIR + "/Test/scripts/calculate_latency.py -S " + SENT_TXT_PATH + " -R " + RECEIVED_TXT_PATH


        if DEBUG: print_msg(MSG_DEBUG, "Running latency calculator script:\n\t" + latency_command)

        return_value = os.system(latency_command)
        if return_value != 0:
            print_msg(MSG_ERROR, "Error while running latency calculation script")
            sys.exit(1)

if __name__ == "__main__":
    main(sys.argv)
