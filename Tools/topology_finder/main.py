
import networkx
import itertools
import sys
from display_topology import draw_ag

number_of_ports = 2
starting_number_of_links = 15

def calculate_reachability(ag):
	reachability_counter = 0
	for source_node in ag.nodes():
	    for destination_node in ag.nodes():
	    	if source_node != destination_node:
				if networkx.has_path(ag,source_node, destination_node):
					reachability_counter += 1
					#print source_node, "is connected to: ", destination_node
	return reachability_counter

def are_nodes_neighbour(node_1, node_2):
	node_1_x = node_1 % 4
	node_1_y = node_1 / 4

	node_2_x = node_2 % 4
	node_2_y = node_2 / 4

	if node_1_x == node_2_x and ((node_2_y == node_1_y +1) or (node_2_y == node_1_y -1)):
		return True
 	if node_1_y == node_2_y and ((node_2_x == node_1_x +1) or (node_2_x == node_1_x -1)):
		return True
	return False


ag = networkx.DiGraph()

for i in range(0, 16):
	ag.add_node(i)

print "generated architecture graph with nodes:", ag.nodes()

list_of_edges = []
for item in list(itertools.combinations(ag.nodes(), 2)):
	if are_nodes_neighbour(item[0], item[1]):
		list_of_edges.append(item)

print "list of all available edges in  a mesh topology:", list_of_edges


if len(list_of_edges) < starting_number_of_links:
	raise ValueError("starting_number_of_links is bigger than the maximum available links!")

print "starting from ", starting_number_of_links, "links in the network"
counter = 0

for i in range(len(list_of_edges)-1 , starting_number_of_links-1, -1):
	print "-------------------------------------------------------------------------------------"
	print "starting to check lists with", i, "bi-directional links out of ",  len(list_of_edges)
	chosen_edges = itertools.combinations(list_of_edges, i)
	for edge_list in chosen_edges:
		#print edge_list
		if len(edge_list)>0:

			ag = networkx.DiGraph()
			trying = True
			for link in edge_list:
				ag.add_edge(link[0], link[1])
				ag.add_edge(link[1], link[0])
				if  (ag.degree(link[1])/2 > number_of_ports) or (ag.degree(link[0])/2 > number_of_ports):
					trying = False
					# print ag.degree(link[0])/2, ag.degree(link[1])/2
					break

			if trying:
				degree_sequence=sorted(networkx.degree(ag).values(),reverse=True)
				degree = max(degree_sequence)/2
				if number_of_ports == degree:
					reachability = calculate_reachability(ag)

					if reachability == 240:
						draw_ag(ag, "top_"+str(number_of_ports)+"_"+str(len(edge_list))+"_port_"+str(counter))
						print "port number:", degree, "with reachability: 240 list of links:", edge_list
						counter += 1

			del ag


