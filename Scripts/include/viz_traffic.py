# Copyright (C) 2016 Siavoosh Payandeh Azad
import package
import os
import re
import random

import numpy as np
from matplotlib import pyplot as plt
from matplotlib import animation
import matplotlib.patches as patches

def find_events():
    end_of_sim = 0
    dictionary_of_all = {}
    traffic_dic = {}
    for f in os.listdir(package.TRACE_DIR): 
        if f.endswith('.txt'):
            traffic_dic = {}
            file = open(package.TRACE_DIR+"/"+str(f), 'r')
            line = file.readline()
            while line != '': 
                split_line = line.split()
                flit_type = split_line[0]
                time_stamp = float(split_line[3])/1000
                if flit_type == "H":
                    source = split_line[6]
                    destination = split_line[8]
                    length = split_line[11]
                    packet_id = split_line[13]
                if time_stamp > end_of_sim:
                    end_of_sim = time_stamp

                packet_identifier = source+destination+packet_id
                #print packet_identifier, "\t", flit_type, time_stamp, length
                traffic_dic[time_stamp] =  packet_identifier
                 
                line = file.readline()
            if len(traffic_dic.keys())>0:
                dictionary_of_all[f] = traffic_dic
    del traffic_dic
    # for item in dictionary_of_all.keys():
    #     print "-------------------------------------------"
    #     print "file name:", int(re.search(r'\d+', item).group()), item[-5]
    #     keylist = dictionary_of_all[item].keys()
    #     keylist.sort()
    #     for time in keylist:
    #         print time,  dictionary_of_all[item][time]
    # print "-------------------------------------------"
    time_dic = {}
    packet_dic = {}
    print "end of simulation:", end_of_sim 
    i = 0
    while i < end_of_sim:
        #print "-----"
        #print i
        time_dic[i] = []
        
        for item in dictionary_of_all.keys():
            if i in dictionary_of_all[item].keys():
                time_dic[i].append([int(re.search(r'\d+', item).group()), item[-5], dictionary_of_all[item][i]])
                if dictionary_of_all[item][i] in packet_dic.keys():
                    packet_dic[dictionary_of_all[item][i]].append([int(re.search(r'\d+', item).group()), item[-5], i])
                else:
                    packet_dic[dictionary_of_all[item][i]] = [[int(re.search(r'\d+', item).group()), item[-5], i]]
        #print time_dic[i]
        i += 0.5
    del dictionary_of_all
    print "sorted all the events... returning!"
    return time_dic, packet_dic, end_of_sim


def init(noc_size):
    global time_stamp_view
    # setting up the background!
    for item in range(0, noc_size**2):
        x = item%noc_size
        y = item/noc_size
        circle1 = plt.Circle((x, y), radius=0.1, color='#8ABDFF', fill=False, lw=2)
        circle2 = plt.Circle((x-0.2, y-0.2), radius=0.05, color='#8ABDFF', fill=False, lw=2)
        plt.gca().add_patch(circle1)
        plt.gca().add_patch(circle2)
        plt.gca().add_patch(patches.Arrow(x-0.09, y-0.05, -0.1, -0.1, width=0.05, color = "gray"))
        plt.gca().add_patch(patches.Arrow(x-0.15, y-0.17, 0.09, 0.09, width=0.05, color = "gray"))

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
    time_stamp_view = plt.text(-0.35, -0.35, str(0), fontsize=10)
    return None

# animation function.  This is called sequentially
def func(i):
    global events, flits, time_stamp_view, death_times

    time = i/10.0
    x={}
    y={}
    step = (time-int(time))

    if time%0.5 == 0:
        time = int(time)
    else:
        time = int(time) + 0.5
    # print time

    if time in events.keys():
        for event in events[time]:
            #print time, event[0], event[1], event[2]
            if death_times[event[2]] > time:
                current_x = event[0]%2
                current_y = event[0]/2
                if event[1] == "N":
                    current_x -= 0.03
                    current_y -= 0.12 +0.8-step*0.8
                if event[1] == "E":
                    current_x += 0.12+0.8-step*0.8
                    current_y -= 0.03
                if event[1] == "W":
                    current_x -= 0.12+0.8-step*0.8
                    current_y += 0.03
                if event[1] == "S":
                    current_x += 0.03
                    current_y += 0.12 +0.8-step*0.8
                if event[1] == "L":
                    current_x -= 0.08 + 0.08 -step*0.08
                    current_y -= 0.1 + 0.1 -step*0.1
                if event[2] not in x.keys():
                    x[event[2]] = [current_x]
                    y[event[2]] = [current_y]
                else:
                    x[event[2]].append(current_x)
                    y[event[2]].append(current_y)
            else:
                x[event[2]] = []
                y[event[2]] = []

    if time in events.keys():
        for event in events[time]:
            flits[event[2]].set_data(x[event[2]], y[event[2]], )
            #print event[2], colors[int(event[2])%len(colors)]

    time_stamp_view.remove()
    time_stamp_view = plt.text(-0.35, -0.35, "time:\t"+str(time)+"\tns", fontsize=10)
    return flits,

def viz_traffic(noc_size):

    global flits, events, death_times
    events, packet_dic, end_of_sim = find_events() 
    # print events  
    fig = plt.figure()

    ax = fig.add_subplot(111, aspect='equal', autoscale_on=False,
                         xlim=(-0.5, (noc_size-1)+0.5), ylim=(-0.5, (noc_size-1)+0.5))
    
    ax.get_xaxis().set_visible(False)
    ax.get_yaxis().set_visible(False)
    
    #print packet_dic
    flits = {}
    colors =['red', 'green', 'blue']
    death_times = {}
    for item in packet_dic:
        death_times[item] = 0
        for packet in packet_dic[item]:
            if packet[2] > death_times[item]:
                death_times[item] = packet[2]
        
    for item in packet_dic:
        flits[item], = ax.plot([], [], 'bo', ms=10)

        r = lambda: random.randint(0,255)
        #flits[item].set_color(colors[int(item)%len(colors)]) 
        flits[item].set_color('#%02X%02X%02X' % (r(),r(),r())) 

    ani = animation.FuncAnimation(fig, func, frames=int(end_of_sim)*10, 
                                  interval=1, blit=False, init_func=init(noc_size))
    plt.show()
    

viz_traffic(2)