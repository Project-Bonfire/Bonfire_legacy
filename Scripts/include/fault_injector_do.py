import random


def generate_links_dictionary(network_size):

	links = {"RX_L_2": 32,  "RX_L_3": 32, "RX_L_1": 32}

	return links


def generate_fault_injection_do(file_path, sim_time, FPS, links):
	"""
	sim_time: integer : How long do you want to run the simulation in ns
	FPS: integer : faults per second
	list_of_links: list: list of links for injection
	"""
	list_of_links = links.keys()
	delay = 1000000000/FPS
	deviation = int(delay/100)
	fault_inject_file = open(file_path+'/fault_inject.do', 'w')
	for i in range(0, sim_time/delay):
		random.shuffle(list_of_links) 
		sum_skew = 0
		for item in list_of_links:
			bit_width = links[item]
			random_position = random.randint(0, bit_width-1)
			string = "force -drive sim/:tb_network_2x2:"+item+"("+str(random_position)+")"+" "
			string +=  str(random.choice(["0", "1"]))
			string +=  " 0 -cancel 1ns"

			fault_inject_file.write(string+"\n")
			skew = random.randint(1, deviation)
			fault_inject_file.write( "run "+str(skew)+"ns"+"\n")
			sum_skew += skew
		fault_inject_file.write("run "+str(delay-sum_skew)+"ns"+"\n") 
	fault_inject_file.write("stop")
	fault_inject_file.close()