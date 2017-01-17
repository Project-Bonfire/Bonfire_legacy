import random
import sys

class fault:
	location = None
	bitwidth = None
	Type = None

	def __init__(self, loc, width, fault_type):
		random_position = random.randint(0, width-1)
		self.location = loc+"("+str(random_position)+")"
		self.bitwidth = width
		self.type = fault_type

	def report(self):
		print "Location: ", self.location, "\twidth: ", self.bitwidth,  "\tfault_type: ", self.type

def report_faults(fault_list):
	print "---------------------------------------"
	print "fault injection points:"
	for fault in fault_list:
		fault.report()
	print "---------------------------------------"

def generate_links_dictionary(network_size):
	list_of_ports = []

	for i in range(0, network_size*2):
		list_of_ports.append("tb_network_2x2:NoC:R_"+str(i)+":RX_L")
		if i/network_size != 0:
			list_of_ports.append("tb_network_2x2:NoC:R_"+str(i)+":RX_N")
		if i/network_size != network_size-1:
			list_of_ports.append("tb_network_2x2:NoC:R_"+str(i)+":RX_S")
		if i%network_size != 0:
			list_of_ports.append("tb_network_2x2:NoC:R_"+str(i)+":RX_E")
		if i%network_size != network_size-1:
			list_of_ports.append("tb_network_2x2:NoC:R_"+str(i)+":RX_W")
	random.seed(1000)
	fault_list = []
	for item in list_of_ports:
		fault_type = random.choice(["T", "P"])
		new_fault = fault(item, 32, fault_type)
		fault_list.append(new_fault)

	report_faults(fault_list)

	return fault_list


def generate_fault_injection_do(file_path, sim_time, FPS, fault_list):
	"""
	sim_time: integer : How long do you want to run the simulation in ns
	FPS: integer : faults per second
	fault_list: list: list of fault objects for injection
	"""
	list_of_links = fault_list
	delay = 1000000000/FPS
	deviation = int(delay/10)
	if deviation == 0:
		deviation = 1
	fault_inject_file = open(file_path+'/fault_inject.do', 'w')

	fault_inject_file.write("#################################\n")
	fault_inject_file.write("#           Permanent \n")
	fault_inject_file.write("#             Faults \n")
	fault_inject_file.write("#################################\n")
	for item in list_of_links:
		fault_type = item.type
		if fault_type == "P":
			location = item.location
			random_start = random.randint(int(sim_time*0.1), int(sim_time*0.9))
			string = "force -drive sim/:"+location+" U "+str(random_start)+"ns "
			fault_inject_file.write(string+"\n")

	fault_inject_file.write("#################################\n")
	fault_inject_file.write("#            Transient \n")
	fault_inject_file.write("#             Faults \n")
	fault_inject_file.write("#################################\n")
	for i in range(0, sim_time/delay):
		random.shuffle(list_of_links) 
		for item in list_of_links:
			fault_type = item.type
			if fault_type == "T": 
				location = item.location
				string = "force -drive sim/:"+location+" " + str(random.choice(["0", "1"]))
				random_start = random.randint(0, deviation)
				string +=  " "+str(random_start)+"ns -cancel 1ns"
				fault_inject_file.write(string+"\n")
		fault_inject_file.write("run "+str(delay)+"ns"+"\n") 
	fault_inject_file.write("stop")
	fault_inject_file.close()