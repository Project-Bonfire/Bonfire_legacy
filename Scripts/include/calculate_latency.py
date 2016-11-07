# Copyright (C) 2016 Siavoosh Payandeh Azad

from math import ceil
import random

import sys

if '--help' in sys.argv[1:]:
    print "\t-S [path to file]: path to file containing all the sent packets."
    print "\t                                     **note: the sent packet's file format should be as follows:"
    print "\t                                                     Packet generated at 9500 ps From 0 to 2 with length: 6 with id: 1"
    print "\t-R [path to file]: path to file containing all the recieved packets."
    print "\t                                     **note: the recieved packet's file format should be as follows:"
    print "\t                                                     Packet received at 34500 ps From: 0 to: 2 length: 6 id: 1"
    sys.exit()

if '-S'    in sys.argv[1:]:
    sent_file_path = sys.argv[sys.argv.index('-S')+1]
    if ".txt" not in sent_file_path:
            raise ValueError("Wrong file extention. only .txt files are accepted!")
else:
    raise ValueError("Please provide a sent packets file")

if '-R'    in sys.argv[1:]:
    received_file_path = sys.argv[sys.argv.index('-R')+1]
    if ".txt" not in received_file_path:
            raise ValueError("Wrong file extention. Only .txt files are accepted!")
else:
    raise ValueError("Please provide a recieved packets file")

received_packets_dict={}
received_file = open(received_file_path, 'r')
line = received_file.readline()
while line != '':
    line = line.rstrip()
    received_packet = line.split()

    sender = received_packet[received_packet.index('From:')+1]
    receiver = received_packet[received_packet.index('to:')+1]
    packet_id = received_packet[received_packet.index('id:')+1]
    if int(packet_id) > 256:
        raise ValueError("Something is wrong! An identifier bigger than 256 in received packets file!")
    identifier = sender + "_" + receiver+ "_" + packet_id
    packet_time = received_packet[received_packet.index('at')+1]
    if identifier in received_packets_dict.keys():
        identifier = sender + "_" + receiver+ "_" + str(int(packet_id)+256)
    received_packets_dict[identifier] = packet_time
    # print identifier, packet_time
    line = received_file.readline()
received_file.close()

sent_packets_dict={}
sent_file = open(sent_file_path, 'r')
line = sent_file.readline()
while line != '':
    line = line.rstrip()
    sent_packet = line.split()
    sender = sent_packet[sent_packet.index('From')+1]
    receiver = sent_packet[sent_packet.index('to')+1]
    packet_id = sent_packet[sent_packet.index('id:')+1]
    identifier = sender + "_" + receiver+ "_" + packet_id
    if int(packet_id) > 256:
        raise ValueError("Something is wrong! An identifier bigger than 256 in sent packets file!")

    packet_time = sent_packet[sent_packet.index('at')+1]
    if identifier in sent_packets_dict.keys():
        identifier = sender + "_" + receiver + "_" + str(int(packet_id)+256)
    sent_packets_dict[identifier] = packet_time
    # print identifier, packet_time
    line = sent_file.readline()
sent_file.close()

if len(sent_packets_dict.keys()) != len(received_packets_dict.keys()):
    raise ValueError("Something is wrong! The number of sent packets are not equal to the number of recieved packets.")

delay_list = []
for identifier in sent_packets_dict:
    packet_sent_time = float(sent_packets_dict[identifier])
    if identifier in received_packets_dict.keys():
        packet_recieved_time    = float(received_packets_dict[identifier])
        delay = packet_recieved_time - packet_sent_time
        delay_list.append(delay)
    else:
        print identifier
        raise ValueError("Something is worong! An identifier is missing from the recieved file")

# print "delay_list:", delay_list
print "number of processed packets:", len(delay_list)
print "maximum packet latency:", max(delay_list)/1000.0 , "ns"
print "minimmum packet latency:", min(delay_list)/1000.0 , "ns"
print "average packet latency:", "%.2f" % float(sum(delay_list)/(len(delay_list)*1000)), "ns!"
