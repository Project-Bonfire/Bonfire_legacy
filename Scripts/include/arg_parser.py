from helper_func import *
from Help_note import print_help
import sys

def arg_parser(argv, program_argv, logging):
    """
    Arguments parser
        argv:           List of program arguments (sys.argv)
        program_argv:   Dictionary consisting of network configuration variables
        logging:        logging object
    """

    logging.info("starting parsing the progam arguments...")
    logging.debug("program_argv list is following:")
    logging.debug(argv[1:])

    if '--help' in argv[1:] or len(argv) == 1:
        logging.info("printing manual...")
        print_help(argv, program_argv)
        logging.info("exiting the program!")
        sys.exit()

    program_argv['credit_based_FC'] = True
    program_argv['network_dime'] = 4
    program_argv['add_parity'] = False
    program_argv['add_checkers'] = False
    program_argv['NI_Test'] = False
    program_argv['add_FI'] = False
    program_argv['add_FC'] = False
    program_argv['packet_drop'] = False
    program_argv['packet_saving'] = False
    program_argv['lat'] = False
    program_argv['debug'] = False
    program_argv['trace'] = False

    if '-D'	in argv[1:]:
        program_argv['network_dime'] = int(argv[argv.index('-D')+1])
        if program_argv['network_dime'] < 2:
            raise ValueError("You cannot build a network with " + str(program_argv['network_dime']) + " node(s)!")
        if program_argv['network_dime'] % 2 != 0:
            raise ValueError("Wrong network size. Please choose multiples of 2. For example 4!")

    if '-P' in argv[1:]:
        program_argv['add_parity'] = True

    if '-checkers' in argv[1:]:
        program_argv['add_checkers'] = True

    if '-NI_Test' in argv[1:]:
        program_argv['NI_Test'] = True

    if '-NI' in argv[1:]:
        if argv[argv.index('-NI')+1].isdigit():
            program_argv['add_NI'] = int(argv[argv.index('-NI')+1])
        else:
            program_argv['add_NI'] = True
        if program_argv['add_NI'] < 0:
            raise ValueError("Network interface's depth cannot be negative!")

    if '-FI' in argv[1:]:
        program_argv['add_FI'] = True

    if '-FC' in argv[1:]:
        program_argv['add_FC'] = True

    if '-packet_drop' in argv[1:]:
        program_argv['packet_drop'] = True

    if '-packet_saving' in argv[1:]:
        program_argv['packet_saving'] = True

    if '-lat' in argv[1:]:
        program_argv['lat'] = True

    if '-SHMU' in argv[1:]:
        program_argv['add_SHMU'] = True

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

    if '--trace' in argv[1:]:
        program_argv['trace'] = True

    if '-verilog' in argv[1:]:
        program_argv['verilog'] = True

    if '-c' in argv[1:]:
        program_argv['command-line'] = True

    logging.info("Finished parsing program arguments")
    logging.info("Command line parameters:")
    for i in program_argv:
        logging.info("\t" + str(i) + ": " + str(program_argv[i]))

    return program_argv

def report_parogram_arguments(program_argv, DEBUG):
    """
    Gets program arguments and Debug and if Debug is True, prints the program
    arguments to the console!
    """
    if DEBUG:
        print_msg(MSG_DEBUG,  "Command line parameters:")
        for i in program_argv:
            print "\t" + i + ": " + str(program_argv[i])
        print
