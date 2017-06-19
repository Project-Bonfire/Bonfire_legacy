import sys
from Scripts.include.package import *
from Scripts.include.helper_func import *


def statistics(verbal):
    """ 
        Calculates the amount of packets sent and recieved and prints statistics 
        about flit and packet loss percentages!
    """
    print
    if verbal:
        if DEBUG: print_msg(MSG_DEBUG, "Opening " + SENT_TXT_PATH)
        print_msg(MSG_INFO, "Packets sent:")
    try:
        packets_sent_fp = open(SENT_TXT_PATH, 'r')
        flits_sent = 0
        num_packets_sent = 0
        for line in packets_sent_fp:
            if verbal:
                print "\t" + line.split('\n')[0]
            num_packets_sent += 1
            flits_sent += int(line.split(' ')[11])

        packets_sent_fp.close()
    except IOError as e:
        print_msg(MSG_ERROR, "Open sent.txt: Error " + str(e[0]) + ": " + e[1])
        sys.exit(1)

    # Read received packets
    print
    if verbal:
        if DEBUG: print_msg(MSG_DEBUG, "Opening " + RECEIVED_TXT_PATH)
        print_msg(MSG_INFO, "Packets received:")
    try:
        packets_recv_fp = open(RECEIVED_TXT_PATH, 'r')
        flits_recieved = 0
        num_packets_recv = 0
        for line in packets_recv_fp:
            if verbal:
                print "\t" + line.split('\n')[0]
            num_packets_recv += 1
            flits_recieved += int(line.split(' ')[13])

        packets_recv_fp.close()
    except IOError as e:
        print_msg(MSG_ERROR, "Open received.txt: Error " + str(e[0]) + ": " + e[1])
        sys.exit(1)

    # Display statistics
    print "===================================================================="
    print_msg(MSG_INFO, "Statistics:")
    print "\tPackets sent:\t\t" + str(num_packets_sent)+"\tflits sent:\t" + str(flits_sent)
    print "\tPackets received:\t" + str(num_packets_recv)+"\tflits recieved:\t" + str(flits_recieved)
    print "\tPackets lost: \t\t" + str(num_packets_sent - num_packets_recv)+"\tflits lost:\t" + str(flits_sent-flits_recieved)
    print "\tPacket loss:\t" + "%.2f" %(100 - (num_packets_recv * 100.0 / num_packets_sent)) + "%"
    print "\tFlit loss:\t" + "%.2f" %(100 - (flits_recieved * 100.0 / flits_sent)) + "%"

    f = open(SIMUL_DIR+"/"+'stats.txt', 'w')
    
    f.write("\tPackets sent:\t\t" + str(num_packets_sent)+"\tflits sent:\t" + str(flits_sent)+"\n")
    f.write("\tPackets received:\t" + str(num_packets_recv)+"\tflits recieved:\t" + str(flits_recieved)+"\n")
    f.write("\tPackets lost: \t\t" + str(num_packets_sent - num_packets_recv)+"\tflits lost:\t" + str(flits_sent-flits_recieved)+"\n")
    f.write("\tPacket loss:\t" + "%.2f" %(100 - (num_packets_recv * 100.0 / num_packets_sent)) + "%"+"\n")
    f.write("\tFlit loss:\t" + "%.2f" %(100 - (flits_recieved * 100.0 / flits_sent)) + "%"+"\n")
    f.close()
    return None
