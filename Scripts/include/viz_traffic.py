# Copyright (C) 2016 Siavoosh Payandeh Azad
import package
import os
import re

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
    print "end of simulation:", end_of_sim 
    i = 0
    while i < end_of_sim:
        #print "-----"
        #print i
        time_dic[i] = []
        for item in dictionary_of_all.keys():
            if i in dictionary_of_all[item].keys():
                time_dic[i].append([int(re.search(r'\d+', item).group()), item[-5], dictionary_of_all[item][i]])
        #print time_dic[i]
        i += 0.5
    del dictionary_of_all
    print "sorted all the events... returning!"
    return time_dic, end_of_sim


def init():
    particles.set_data([], [], )
    return particles,

# animation function.  This is called sequentially
def animate(i):
    global events
    x = []
    y = []
    time = i+0.5
    # print time
    if time in events.keys():
        
        for event in events[time]:
            # print time, event[0], event[1]
            current_x = event[0]%2
            current_y = event[0]/2
            if event[1] == "N":
                current_y -= 0.2
            if event[1] == "E":
                current_x += 0.2
            if event[1] == "W":
                current_x -= 0.2
            if event[1] == "S":
                current_y += 0.2
            if event[1] == "L":
                current_x -= 0.1
                current_y -= 0.1
            x.append(current_x)
            y.append(current_y)
    particles.set_data(x, y, )
    particles.set_color("red") 
    return particles,

def viz_traffic(noc_size):
    global particles, events
    events, end_of_sim = find_events()   
    fig = plt.figure()

    ax = fig.add_subplot(111, aspect='equal', autoscale_on=False,
                         xlim=(-0.5, (noc_size-1)+0.5), ylim=(-0.5, (noc_size-1)+0.5))
    
    ax.get_xaxis().set_visible(False)
    ax.get_yaxis().set_visible(False)
    
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
    
    particles, = ax.plot([], [], 'bo', ms=15)
    
    
    ani = animation.FuncAnimation(fig, animate, frames=int(end_of_sim), 
                                  interval=10, blit=False, init_func=init)
    plt.show()

viz_traffic(2)