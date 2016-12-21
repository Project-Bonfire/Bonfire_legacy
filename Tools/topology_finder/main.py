
import networkx
import itertools
import sys

number_of_ports = 3
starting_number_of_links = 8

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
max_dic = {}
all_edge_lists = {}
for index in range(1, 5):
	max_dic[index] = [0, []]

if len(list_of_edges) < starting_number_of_links:
	raise ValueError("starting_number_of_links is bigger than the maximum available links!")

print "starting from ", starting_number_of_links, "links in the network"
#for i in range(starting_number_of_links, starting_number_of_links+1): 
for i in range(starting_number_of_links, len(list_of_edges)): 
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

					if max_dic[degree][0] < reachability:
						print "found solution with better reachability:", reachability
						max_dic[degree] = [reachability, edge_list]
						all_edge_lists[degree] = [edge_list]

					if max_dic[degree][0] == reachability :
						all_edge_lists[degree].append(edge_list)

			del ag 
	for i in max_dic.keys():
		if i == number_of_ports:
			print "port number:", i, "with reachability:", max_dic[i][0] 

print "-------------------------------------------------------------------"
print "list of best solutios:"
for i in max_dic.keys():
	print "port number:", i, "with reachability:", max_dic[i][0], "list of links:", max_dic[i][1] 

print "*************"
print "all_edge_list:"
for item in all_edge_lists:
	print "number of ports:", item
	for sub_item in all_edge_lists[item]:
		print sub_item
