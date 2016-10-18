# Copyright (C) 2016 Siavoosh Payandeh Azad

from math import ceil
import random 

import sys

if '--help' in sys.argv[1:]:
  print "\t-S [path to file]: path to file containing all the sent packets."
  print "\t                   **note: the sent packet's file format should be as follows:"
  print "\t                           Packet generated at 9500 ps From 0 to 2 with length: 6 with id: 1"
  print "\t-R [path to file]: path to file containing all the recieved packets."
  print "\t                   **note: the recieved packet's file format should be as follows:"
  print "\t                           Packet received at 34500 ps From: 0 to: 2 length: 6 id: 1"
  sys.exit()

if '-S'  in sys.argv[1:]: 
  sent_file_path = sys.argv[sys.argv.index('-S')+1]
  if ".txt" not in sent_file_path:
      raise ValueError("wrong file extention. only .txt files are accepted!")
else:
  raise ValueError("please provide a sent packets file")

if '-R'  in sys.argv[1:]: 
  recieved_file_path = sys.argv[sys.argv.index('-R')+1]
  if ".txt" not in recieved_file_path:
      raise ValueError("wrong file extention. only .txt files are accepted!")
else:
  raise ValueError("please provide a recieved packets file")

recieved_packets_dict={}
recieved_file = open(recieved_file_path, 'r')
line = recieved_file.readline()
while line != '':
  line = line.rstrip()
  recieved_packet = line.split()

  sender = recieved_packet[recieved_packet.index('From:')+1]
  reciver = recieved_packet[recieved_packet.index('to:')+1]
  packet_id = recieved_packet[recieved_packet.index('id:')+1]
  if int(packet_id) > 256:
    raise ValueError("something is worong! an identifier bigger than 256!")
  identifier = sender + "_" + reciver+ "_" + packet_id
  packet_time = recieved_packet[recieved_packet.index('at')+1]
  if identifier in recieved_packets_dict.keys():
    identifier = sender + "_" + reciver+ "_" + str(int(packet_id)+256)
  recieved_packets_dict[identifier] = packet_time
  # print identifier, packet_time
  line = recieved_file.readline()
recieved_file.close()

sent_packets_dict={}
sent_file = open(sent_file_path, 'r')
line = sent_file.readline()
while line != '':
  line = line.rstrip()
  sent_packet = line.split()
  sender = sent_packet[sent_packet.index('From')+1]
  reciver = sent_packet[sent_packet.index('to')+1]
  packet_id = sent_packet[sent_packet.index('id:')+1]
  identifier = sender + "_" + reciver+ "_" + packet_id
  if int(packet_id) > 256:
    raise ValueError("something is worong! an identifier bigger than 256!")
 
  packet_time = sent_packet[sent_packet.index('at')+1]
  if identifier in sent_packets_dict.keys():
    identifier = sender + "_" + reciver+ "_" + str(int(packet_id)+256)
  sent_packets_dict[identifier] = packet_time
  # print identifier, packet_time
  line = sent_file.readline()
sent_file.close()

if len(sent_packets_dict.keys()) != len(recieved_packets_dict.keys()):
  raise ValueError("something is wrong! the number of sent packets are not equal to the number of recieved packets.")

delay_list = []
for identifier in sent_packets_dict:
  packet_sent_time = float(sent_packets_dict[identifier])
  if identifier in recieved_packets_dict.keys():
    packet_recieved_time  = float(recieved_packets_dict[identifier])
    delay = packet_recieved_time - packet_sent_time
    delay_list.append(delay)
  else:
    print identifier
    raise ValueError("something is worong! an identifier is missing from the recieved file")

# print "delay_list:", delay_list
print "number of processed packets:", len(delay_list)
print "average delay:", sum(delay_list)/(len(delay_list)*1000), "ns!"




