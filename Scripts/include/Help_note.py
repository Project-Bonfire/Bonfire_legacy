from Scripts.include.helper_func import *

def print_help(argv, program_argv):
    """
    Gets the program arguments and prints manual for the program.
    """
    print BOLD + "Usage:" + ENDC
    print
    print BOLD + OKBLUE + "  Network parameters:" + ENDC
    print
    print BOLD + "  -plasma_with_fpu:" + ENDC
    print "\tUse Plasma with FPU, instead of normal Plasma "# + str(program_argv['plasma_with_fpu']) + "."
    print
    print BOLD + "  -D [size]:" + ENDC
    print "\tMake a network of [size]X[size]. Size can be only multiples of two. " \
        + "Default value is " + str(program_argv['network_dime']) + "."
    print
    print BOLD + "  -P:" + ENDC
    print "\tAdd parity to each router input. " \
        + "Default is " + str(program_argv['add_parity']) + "."
    print
    print BOLD + "  -checkers:" + ENDC
    print "\tAdd control part checkers to the router (for FIFO, Arbiter and LBDR). Checker outputs are not taken to the output interface. " \
        + "Default is " + str(program_argv['add_checkers']) + "."
    print
    print BOLD + "  -NI [depth]:" + ENDC
    print "\tAdd a network interface with size [depth] to each router's local port. " \
        + "Default is " + str(program_argv['add_NI']) + "."
    print BOLD + "  -NI_Test" + ENDC
    print "\tAdds a network interface with size to each router's local port and connects a traffic generator to it instead of a PE. " \
        + "Default is " + str(program_argv['NI_Test']) + "."\
        +"should be used with -SHMU"
    print
    print BOLD + "  -FI:" + ENDC
    print "\tAdd fault injector units to all the links (except the local) in the network. " \
        + "Default is " + str(program_argv['add_FI']) + "."
    print
    print BOLD + "  -FC:" + ENDC
    print "\tAdd fault classifier units to all the links (except the local) in the network. " \
        + "Default is " + str(program_argv['add_FC']) + "."
    print
    print BOLD + "  -packet_drop:" + ENDC
    print "\tAdd packet dropping capability to FIFO in case of fault injection. " \
        + "Default is " + str(program_argv['packet_drop']) + "."
    print BOLD + "  -packet_saving:" + ENDC
    print "\tAdd advance packet dropping capability to FIFO in case of fault injection." \
        + "Default is " + str(program_argv['packet_drop']) + "."
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
    print BOLD + "  --trace:" + ENDC
    print "\tadds packet tracing."
    print
    print
    print BOLD + OKBLUE + "  Examples:" + ENDC
    print BOLD + "  Example 1:" + ENDC
    print "\t " + argv[0] + " -D 4 -credit_based_FC -FC -FI -Rand 0.1 -PS 8 8 -sim 10000 -end 11000"
    print "\t\tSimulates a 4X4 network "
    print "\t\tflow control mechanism is credit-based with fault classfiers support"
    print "\t\twith Fault Injection(40-60 clock cycle injection, i.e approx. 16 million faults per second) "
    print "\t\talso generates a testbench which uses random traffic pattern generator with Packet Injection Rate of 0.1"
    print "\t\tand fixed packet size of 8 and sends packets until 10000 ns and ends simulation at 11000 ns"
    print BOLD + "  Example 2:" + ENDC
    print "\t " + argv[0] + " -D 2 -credit_based_FC -packet_drop -FC -NI_Test -SHMU -Rand 0.01 -PS 8 8 -sim 10000 -end 11000"
    print "\t\tSimulates a 2X2 network "
    print "\t\tflow control mechanism is credit-based with packet_drop based FIFO and LBDR and fault classfiers support"
    print "\t\tAlso uses NI testers which mimic the behaviour of plasma but are much faster!"
    print "\t\tIt will also have SHMU capabilities handled by the NI tester procedure"
