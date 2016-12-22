import matplotlib.pyplot as plt
import networkx
import math

def return_node_location(node_number):
    node_x = node_number % 4
    node_y = (node_number / 4) % 4
    node_z = node_number / (4 * 4)
    return node_x, node_y, node_z


def draw_ag(ag, file_name):

    position = {}
    

    number_of_layers = 1
    largest_number = 15
    node_size = math.log10(largest_number)*15
    # print "Node Size", node_size

    node_distance_x = 0.05 * (number_of_layers+1)
    node_distance_y = 0.05 * (number_of_layers+1)

    offset_x = 0.05
    offset_y = 0.05

    plt.figure(num=None, figsize=(3, 3), dpi=100)

    for Node in ag.nodes():
        x, y, z = return_node_location(Node)
        position[Node] = [(x*node_distance_x)+(z*offset_x), (y*node_distance_y)+(z*offset_y)]
  
    # POS = networkx.spring_layout(AG)

    networkx.draw(ag, pos=position, with_labels=True, node_size=node_size, arrows=False,
                   font_size=7, linewidths=1)
    plt.savefig("GraphDrawings/"+file_name+".png")
    plt.close()
    plt.clf()
    return None

def draw_test_ag():
	ag = networkx.DiGraph()
	link_list = [(1, 2), (2, 3), (3, 7), (4, 5), (5, 6), (6, 7), (8, 9), (13, 14)]
	for link in link_list:
		ag.add_edge(link[0], link[1])
		ag.add_edge(link[1], link[0])
	draw_ag(ag, "top_test_")
	del ag

