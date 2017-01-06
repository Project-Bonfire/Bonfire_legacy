# Copyright (C) 2016 Siavoosh Payandeh Azad
import package
import os
import re

import numpy as np
from matplotlib import pyplot as plt
from matplotlib import animation

def find_events():
    end_of_sim = 0
    dictionary_of_all = {}
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


events, end_of_sim = find_events()   
fig = plt.figure()
 
ax = fig.add_subplot(111, aspect='equal', autoscale_on=False,
                     xlim=(-0.5, 1.5), ylim=(-0.5, 1.5))
for item in range(0, 4):
    circle1 = plt.Circle((item%2, item/2), radius=0.1, color='#8ABDFF', fill=False, lw=2)
    circle2 = plt.Circle((item%2-0.2, item/2-0.2), radius=0.05, color='#8ABDFF', fill=False, lw=2)
    plt.gca().add_patch(circle1)
    plt.gca().add_patch(circle2)

particles, = ax.plot([], [], 'bo', ms=15)


ani = animation.FuncAnimation(fig, animate, frames=int(end_of_sim), 
                              interval=150, blit=True, init_func=init)

plt.show()