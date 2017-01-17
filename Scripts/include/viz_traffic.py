# Copyright (C) 2017 Siavoosh Payandeh Azad

# you can run it for example with the following:
# python -c 'from viz_traffic import *; viz_traffic(2)'
# this should be added later to the simulate.py script

# there are some things you should be carefull with:
# 		- if you have different packets with the same source, destination, and packet id
# 		  in your files, it will badly mess up the vizualization. Since the packet_id in 
# 		  our system is 8 bits, after sending 256 packets from one node, you will face
# 		  this problem. At the moment i dont have a solution for it! just reduce your
#		  packet injection rate or reduce the simulation time (so you inject less packets!)

import package
import os
import re
import random
import matplotlib
#matplotlib.use("Agg")
#import numpy as np
from matplotlib import pyplot as plt
from matplotlib import animation
import matplotlib.patches as patches


def find_events():
    """
    goes through all the files in trace folder and generates info dictionaries 
    returns time_dic, packet_dic, end_of_sim
    time dic: dictionary with time as key and list of flit info as value
    packet_dic: dictionary with packet identifier (source,destination,id) as key and list of flit info as value
    end_of_sim: largest time stamp found in the files
    """
    print "starting reading the files and sorting the events"
    end_of_sim = 0
    dictionary_of_all = {}
    traffic_dic = {}
    print "parsing file: "
    for f in os.listdir(package.TRACE_DIR):
        if f.endswith('.txt'):
            print "\t", f 
            counter = 0
            traffic_dic = {}
            file = open(package.TRACE_DIR+"/"+str(f), 'r')
            line = file.readline()
            while line != '': 
                split_line = line.split()
                flit_type = split_line[0]
                time_stamp = float(split_line[3])/1000
                if flit_type == "H":
                    counter = 0
                    source = split_line[6]
                    destination = split_line[8]
                    length = split_line[11]
                    packet_id = split_line[13]
                if time_stamp > end_of_sim:
                    end_of_sim = time_stamp
                if "FAULTY" in split_line:
                    health = "F_"+str(counter)
                    counter += 1
                else:
                    health = "H"

                packet_identifier = source+"_"+destination+"_"+packet_id+"_"+health
                traffic_dic[time_stamp] =  packet_identifier

                line = file.readline()
            if len(traffic_dic.keys())>0:
                dictionary_of_all[f] = traffic_dic
    del traffic_dic
    print "finished parsing the files... starting organizing the events..."
    time_dic = {}
    packet_dic = {}
    i = 0
    while i < end_of_sim+1:
        for item in dictionary_of_all.keys():
            if i in dictionary_of_all[item].keys():

                if i in time_dic.keys():
                    time_dic[i].append([int(re.search(r'\d+', item).group()), item[-5], dictionary_of_all[item][i]])
                else:
                    time_dic[i] = [[int(re.search(r'\d+', item).group()), item[-5], dictionary_of_all[item][i]]]
        i += 0.5

    print "calculating the life-span of each packet..."
    i = 0
    while i < end_of_sim+1:
        if i in time_dic.keys():
            for item in time_dic[i]:
                if item[2] in packet_dic.keys():
                    if i < packet_dic[item[2]][0]:
                        packet_dic[item[2]][0] = i
                    if i > packet_dic[item[2]][1]:
                        packet_dic[item[2]][1] = i
                else:
                    packet_dic[item[2]] = [i, i]
        i += 0.5

    del dictionary_of_all

    print "number of Events: ", len(time_dic)
    print "number of packets: ", len(packet_dic)
    print "end of simulation:", end_of_sim 
    print "sorted all the events... returning!"
    print "-----------------------------------"
    return time_dic, packet_dic, end_of_sim


def init():
    global time_stamp_view, noc_size
    # setting up the background!
    print "setting up the background..."
    for item in range(0, noc_size**2):
        x = item%noc_size
        y = (noc_size-1) - item/noc_size
        circle1 = plt.Circle((x, y), radius=0.1, color='#8ABDFF', fill=False, lw=2)
        circle2 = plt.Circle((x-0.2, y-0.2), radius=0.05, color='#8ABDFF', fill=False, lw=2)
        plt.gca().add_patch(circle1)
        plt.gca().add_patch(circle2)
        plt.gca().add_patch(patches.Arrow(x-0.09, y-0.05, -0.1, -0.1, width=0.05, color = "gray"))
        plt.gca().add_patch(patches.Arrow(x-0.15, y-0.17, 0.09, 0.09, width=0.05, color = "gray"))

        plt.gca().add_patch(patches.Arrow(-0.4, (noc_size-1)+0.2, 0.5, 0, width=0.03, color = "black"))
        plt.gca().add_patch(patches.Arrow(-0.4, (noc_size-1)+0.2, 0, -0.5, width=0.03, color = "black"))
        plt.text(0.13, (noc_size-1)+0.2, "x", fontsize=10)
        plt.text(-0.4, (noc_size-1) -0.4, "y", fontsize=10)

        if item < 10:
            plt.text(x-0.03, y-0.03, str(item), fontsize=10)
        else:
            plt.text(x-0.07, y-0.03, str(item), fontsize=10)
        if x != noc_size-1:
            plt.gca().add_patch(patches.Arrow(x+0.1, y+0.03, 0.8, 0, width=0.05, color = "gray"))
        if x != 0:
            plt.gca().add_patch(patches.Arrow(x-0.1, y-0.03, -0.8, 0, width=0.05, color = "gray"))
    
        if y != 0:
            plt.gca().add_patch(patches.Arrow(x+0.03, y-0.1, 0, -0.8, width=0.05, color = "gray"))
    
        if y != noc_size-1:
            plt.gca().add_patch(patches.Arrow(x-0.03, y+0.1, 0, 0.8, width=0.05, color = "gray"))
    time_stamp_view = plt.text(-0.35, (noc_size-1)+0.24, "time: 0 ns", fontsize=10)
    return None 


def func(i):
    """
    Updates the positions of the packets...
    """
    global events, packets, time_stamp_view, packet_dic, noc_size
    
    time = i/10.0
    x={}
    y={}
    # step is used for moving the flits along the lines
    step = (time-int(time))

    # here we stay in one time stamp for longer period
    if time%0.5 == 0:
        time = int(time)
    else:
        time = int(time) + 0.5

    events_to_be_removed = []
    #processed_packets = []
    if time in events.keys():
        for event in events[time]:
            current_x = event[0]%noc_size
            current_y = (noc_size-1)-(event[0]/noc_size)
            if event[1] == "S":
                current_x -= 0.03
                current_y -= 0.12 +0.8-step*0.8
            if event[1] == "E":
                current_x += 0.12+0.8-step*0.8
                current_y -= 0.03
            if event[1] == "W":
                current_x -= 0.12+0.8-step*0.8
                current_y += 0.03
            if event[1] == "N":
                current_x += 0.03
                current_y += 0.12 +0.8-step*0.8
            if event[1] == "L":
                current_x -= 0.08 + 0.08 -step*0.08
                current_y -= 0.1 + 0.1 -step*0.1
            if event[1] == "T":
                current_x -= 0.02 + 0.08 +step*0.08
                current_y -= 0.14 - 0.1 + step*0.1
            if event[2] not in x.keys():
                x[event[2]] = [current_x]
                y[event[2]] = [current_y]
            else:
                x[event[2]].append(current_x)
                y[event[2]].append(current_y) 
            
            #processed_packets.append(event[2])
    for event in x.keys():
        if event not in packets.keys():
            packets[event], = ax.plot([], [], 'bo', ms=10)
            if "F" in event:
                packets[event].set_color('red')
            else:
                r = lambda: random.randint(0,255)
                packets[event].set_color('#%02X%02X%02X' % (0,r(),r())) 
        packets[event].set_data(x[event], y[event], )
            
    if time-1 in events.keys():
        del events[time-1]
        print "removing all events of time:", time-1, "events left:", len(events)

    packets_to_be_removed = []
    for packet in packets.keys():
        if time > packet_dic[packet][1]+1:
            packets[packet].set_data([], [], )
            packets_to_be_removed.append(packet)
        #if packet_dic[packet][1] >  time+100:
        #    raise ValueError("time:"+str(time)+"  "+str(packet)+" has a wrong end time:"+str(packet_dic[packet][1]))
        if time < packet_dic[packet][0]-1:
            packets[packet].set_data([], [], )

    for packet in packets_to_be_removed:
            print "removing packet with id:", packet
            del packets[packet]
            del packet_dic[packet]
            print "time:", time, "packets left:", len(packet_dic)

    time_stamp_view.remove()
    time_stamp_view = plt.text(-0.35, (noc_size-1)+0.24, "time: "+str(i/10.0)+" ns", fontsize=10)
    return packets,


def viz_traffic(network_size):

    global packets, ax, events, packet_dic, noc_size

    events, packet_dic, end_of_sim = find_events()  
    
    noc_size  = network_size
    print "generating the figure and axis for a "+str(noc_size)+" by "+str(noc_size)+ " network!"

    #Writer = animation.writers['ffmpeg']
    #writer = Writer(fps=15, metadata=dict(artist='Me'), bitrate=1800)

    fig = plt.figure()
    ax = fig.add_subplot(111, aspect='equal', autoscale_on=False,
                         xlim=(-0.5, (noc_size-1)+0.5), ylim=(-0.5, (noc_size-1)+0.5))
    
    ax.get_xaxis().set_visible(False)
    ax.get_yaxis().set_visible(False)

    packets = {}
    

    ani = animation.FuncAnimation(fig, func, frames=int(end_of_sim+5)*10, 
                                  interval=1, blit=False, init_func=init())
 
    plt.show()
    #ani.save(package.TMP_DIR+'/im.mp4', writer=writer)
