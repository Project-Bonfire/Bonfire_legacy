from helper_func import *
from package import *
import sys
import os

def gen_network_and_tb(program_argv, flow_control_type):
    """
    Gets program arguments and flow control type and generates the Network and Testbench files 
    by generating the correct name and then calling the related script
    """

    # Generated network file name
    net_file_name = "network_" \
        + str(program_argv['network_dime']) + "x" + str(program_argv['network_dime']) \
        + ("_parity" if program_argv['add_parity'] else "") \
        + ("_NI" if program_argv['add_NI'] != -1 else "") \
        + ("_packet_drop" if program_argv['packet_drop'] else "") \
        + ("_SHMU" if program_argv['add_SHMU'] else "") \
        + "_credit_based" \
        + ("_with_checkers" if program_argv['add_checkers'] else "") \
        + ".vhd"

    # Command to run for network generation
    net_gen_command = "python " + SCRIPTS_DIR + "/" + flow_control_type \
        + "/" + NET_GEN_SCRIPT + "_" + flow_control_type + ".py" \
        + " -D " + str(program_argv['network_dime']) \
        + (" -P" if program_argv['add_parity'] else "") \
        + (" -PD" if program_argv['packet_drop'] else "") \
        + (" -NI" if program_argv['add_NI'] != -1 else "") \
        + (" -FC" if program_argv['add_FC'] else "") \
        + (" -SHMU" if program_argv['add_SHMU'] else "") \
        + (" -trace" if program_argv['trace'] else "") \
        + " -o " + SIMUL_DIR + "/" + net_file_name

    if DEBUG: print_msg(MSG_DEBUG, "Running network generator:\n\t" + net_gen_command)

    return_value = os.system(net_gen_command)
    if return_value != 0:
        print_msg(MSG_ERROR, "Error while running network generation script")
        sys.exit(1)

    # Generate testbench
    net_tb_file_name = "network_" + str(program_argv['network_dime']) + "x" + str(program_argv['network_dime']) \
        + ("_parity" if program_argv['add_parity'] else "") \
        + ("_NI" if program_argv['add_NI'] != -1 else "") \
        + ("_NI_Test" if program_argv['NI_Test'] != -1 else "") \
        + ("_packet_drop" if program_argv['packet_drop'] else "") \
        + ("_Rand" if program_argv['rand'] != -1 else "") \
        + ("_SHMU" if program_argv['add_SHMU'] else "") \
        + ("_BR" if program_argv['BR'] != -1 else "") \
        + "_credit_based" \
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
        + (" -P" if program_argv['add_parity'] else "") \
        + str(NI_status) \
        + (" -SHMU" if program_argv['add_SHMU']  else "") \
        + (" -NI_Test" if program_argv['NI_Test']  else "") \
        + (" -trace" if program_argv['trace'] else "") \
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

    return net_file_name, net_tb_file_name


def gen_wave_do(program_argv, flow_control_type):
    """
    Gets program arguments and flow-control type and generates the wave.do file
    by calling the related script
    """
    wave_do_file_name = "wave_" \
    + (str(program_argv['network_dime']) + "x" + str(program_argv['network_dime'])) \
    + (".do")

    wave_do_gen_command = "python " + SCRIPTS_DIR + "/" + flow_control_type + "/" \
        + WAVE_DO_GEN_SCRIPT + "_" + flow_control_type + ".py" \
        + (" -D " + str(program_argv['network_dime'])) \
        + (" -o " + SIMUL_DIR + "/" + wave_do_file_name)


    if DEBUG: print_msg(MSG_DEBUG, "Running wave.do generator:\n\t" + wave_do_gen_command)

    return_value = os.system(wave_do_gen_command)
    if return_value != 0:
        print_msg(MSG_ERROR, "Error while running wave configuration generation script")
        sys.exit(1)
    return wave_do_file_name
