import random
import sys
import numpy
from Scripts.include.package import *

#----------------------------------------------------------------------------------------------
#
#											Fault Class
#
#----------------------------------------------------------------------------------------------

class fault:
	location = None
	bitwidth = None
	Type = None
	mean_time = None
	std_dev = None
	shut_down_time = None

	def __init__(self, loc, width, fault_type, mean_time, std_dev, shut_down_time):

		if width > 1:
			random_position = random.randint(0, width-1)
			self.location = loc+"("+str(random_position)+")"
		else:
			self.location = loc
		self.bitwidth = width
		self.Type = fault_type
		self.mean_time = mean_time
		self.std_dev = std_dev
		self.shut_down_time = shut_down_time

	def report(self):
		"""
		The fault reports its location, signal width, type, MTBF, STD_Dev and shutdown time!
		"""
		print "Location: ", self.location, "\twidth: ", self.bitwidth,  "\tfault_type: ", '%5s' %self.Type,\
			  "\tMTBF: ", self.mean_time, "\tstd deviation: ", self.std_dev , "\tshutdown time", \
			  self.shut_down_time

#----------------------------------------------------------------------------------------------
#
#											Other functions
#
#----------------------------------------------------------------------------------------------
def report_faults(fault_list):
	"""
	Reports all the faults in the fault list
	"""
	print "---------------------------------------"
	print "fault injection points:"
	for fault in fault_list:
		fault.report()
	print "---------------------------------------"

#----------------------------------------------------------------------------------------------
# Generating signals for different modules
# for this purpose we only consider fault injection points marked with X:
#
#                       .-------------.
#                .----> |  Checkers   | <---.
#                |      |   Module    |     |
#                |      '-------------'     |
#                |             ^            |
#                |             |            |
#                |             X            |
#                |      .-------------.     |
#                |      |   Module    |     |
#           -----o----->|    under    |--X--o------->
#                       |    check    |
#                       '-------------'
#
#----------------------------------------------------------------------------------------------
def list_all_the_links(network_size):
	"""
	takes the network size and returns a list of all the RX signals in the network
	"""
	list_of_ports = []
	list_of_widths = []
	for i in range(0, network_size*network_size):
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":RX_L")
		list_of_widths.append(32)
		if i/network_size != 0:
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":RX_N")
			list_of_widths.append(32)
		if i/network_size != network_size-1:
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":RX_S")
			list_of_widths.append(32)
		if i%network_size != 0:
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":RX_W")
			list_of_widths.append(32)
		if i%network_size != network_size-1:
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":RX_E")
			list_of_widths.append(32)

	return list_of_ports, list_of_widths

def list_all_the_lbdr_signals(network_size):
	"""
	takes the network size and returns a list of all the relevant LBDR signals in the network
	"""
	list_of_ports = []
	list_of_widths = []

	# Every router has the Local port
	for i in range(0, network_size*network_size):
		# internal signals of LBDR with packet drop
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_L:N1")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_L:E1")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_L:W1")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_L:S1")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_L:Req_N_in")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_L:Req_E_in")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_L:Req_W_in")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_L:Req_S_in")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_L:Req_L_in")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_L:grants")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_L:packet_drop_in")
		# output signal(s) of LBDR with packet drop
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_L:packet_drop_order")
		list_of_widths += [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

	# for i in range(0, network_size*2):
		if i/network_size != 0:	# has port N
			# internal signals of LBDR with packet drop
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_N:N1")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_N:E1")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_N:W1")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_N:S1")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_N:Req_N_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_N:Req_E_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_N:Req_W_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_N:Req_S_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_N:Req_L_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_N:grants")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_N:packet_drop_in")
			# output signal(s) of LBDR with packet drop
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_N:packet_drop_order")
			list_of_widths += [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

		if i/network_size != network_size-1: # has port S
			# internal signals of LBDR with packet drop
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_S:N1")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_S:E1")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_S:W1")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_S:S1")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_S:Req_N_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_S:Req_E_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_S:Req_W_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_S:Req_S_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_S:Req_L_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_S:grants")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_S:packet_drop_in")
			# output signal(s) of LBDR with packet drop
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_S:packet_drop_order")
			list_of_widths += [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

		if i%network_size != 0: # has port W
			# internal signals of LBDR with packet drop
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_W:N1")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_W:E1")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_W:W1")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_W:S1")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_W:Req_N_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_W:Req_E_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_W:Req_W_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_W:Req_S_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_W:Req_L_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_W:grants")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_W:packet_drop_in")
			# output signal(s) of LBDR with packet drop
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_W:packet_drop_order")
			list_of_widths += [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

		if i%network_size != network_size-1: # has port E
			# internal signals of LBDR with packet drop
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_E:N1")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_E:E1")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_E:W1")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_E:S1")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_E:Req_N_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_E:Req_E_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_E:Req_W_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_E:Req_S_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_E:Req_L_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_E:grants")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_E:packet_drop_in")
			# output signal(s) of LBDR with packet drop
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":LBDR_E:packet_drop_order")
			list_of_widths += [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

	return list_of_ports, list_of_widths

def list_all_the_arbiter_signals(network_size):
	"""
	takes the network size and returns a list of all the relevant arbiter signals in the network
	"""
	list_of_ports = []
	list_of_widths = []

	# Every router has the Local port
	for i in range(0, network_size*network_size):
		# Output signals of Allocator related to output N
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:valid_L")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_L_N") # The _signal should have fault injected or the main one ? i.e. grant_N_N or grant_N_N_signal ?! Because checker is checking grant_N_N_sig.
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_L_E")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_L_W")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_L_S")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_L_L")

		# Internal signals of Allocator related to output N
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:credit_counter_L_in")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:credit_counter_L_out")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_L")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_N_L")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_E_L") # Input E requesting Output L ?!
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_W_L")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_S_L")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_L_L")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_L_N_sig") # ??
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_L_E_sig")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_L_W_sig")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_L_S_sig")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_L_L_sig")

		list_of_widths += [1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

	# for i in range(0, network_size*2):
		if i/network_size != 0: # has port N

			# Output signals of Allocator related to output N
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:valid_N")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_N_N") # The _signal should have fault injected or the main one ? i.e. grant_N_N or grant_N_N_signal ?! Because checker is checking grant_N_N_sig.
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_N_E")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_N_W")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_N_S")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_N_L")

			# Internal signals of Allocator related to output N
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:credit_counter_N_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:credit_counter_N_out")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_N")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_N_N")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_E_N") # Input E requesting Output N ?!
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_W_N")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_S_N")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_L_N")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_N_N_sig") # ??
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_N_E_sig")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_N_W_sig")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_N_S_sig")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_N_L_sig")

			list_of_widths += [1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

		if i/network_size != network_size-1: # has port S
			# Output signals of Allocator related to output S
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:valid_S")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_S_N") # The _signal should have fault injected or the main one ? i.e. grant_N_N or grant_N_N_signal ?! Because checker is checking grant_N_N_sig.
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_S_E")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_S_W")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_S_S")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_S_L")

			# # Internal signals of Allocator related to output S
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:credit_counter_S_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:credit_counter_S_out")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_N")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_N_S")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_E_S") # Input E requesting Output S ?!
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_W_S")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_S_S")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_L_S")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_S_N_sig") # ??
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_S_E_sig")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_S_W_sig")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_S_S_sig")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_S_L_sig")

			list_of_widths += [1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

		if i%network_size != 0: # has port W
			# Output signals of Allocator related to output W
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:valid_W")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_W_N") # The _signal should have fault injected or the main one ? i.e. grant_N_N or grant_N_N_signal ?! Because checker is checking grant_N_N_sig.
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_W_E")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_W_W")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_W_S")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_W_L")

			# # Internal signals of Allocator related to output W
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:credit_counter_W_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:credit_counter_W_out")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_W")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_N_W")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_E_W") # Input E requesting Output W ?!
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_W_W")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_S_W")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_L_W")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_W_N_sig") # ??
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_W_E_sig")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_W_W_sig")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_W_S_sig")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_W_L_sig")

			list_of_widths += [1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

		if i%network_size != network_size-1: # has port E
			# Output signals of Allocator related to output E
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:valid_E")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_E_N") # The _signal should have fault injected or the main one ? i.e. grant_N_N or grant_N_N_signal ?! Because checker is checking grant_N_N_sig.
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_E_E")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_E_W")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_E_S")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_E_L")

			# # Internal signals of Allocator related to output E
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:credit_counter_E_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:credit_counter_E_out")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_E")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_N_E")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_E_E")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_W_E") # Input W requesting Output E ?!
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_S_E")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:X_L_E")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_E_N_sig") # ??
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_E_E_sig")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_E_W_sig")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_E_S_sig")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":allocator_unit:grant_E_L_sig")

			list_of_widths += [1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

	return list_of_ports, list_of_widths

def list_all_the_fifo_signals(network_size):
	"""
	takes the network size and returns a list of all the relevant FIFO signals in the network
	"""
	list_of_ports = []
	list_of_widths = []

	# Every router has the Local port
	for i in range(0, network_size*network_size):
		# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:FIFO_MEM_1")
		# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:FIFO_MEM_2")
		# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:FIFO_MEM_3")
		# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:FIFO_MEM_4")

		# Internal signals of FIFO
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:read_pointer")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:read_pointer_in")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:write_pointer")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:write_pointer_in")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:credit_in")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:empty")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:full")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:read_en")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:write_en")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:fake_credit")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:fake_credit_counter")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:fake_credit_counter_in")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:state_out")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:state_in")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:fault_info_out")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:fault_info_in")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:faulty_packet_out")
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:faulty_packet_in")
		# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:flit_type") -- flit_type is an alias
		list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_L:write_fake_flit")

		list_of_widths += [4, 4, 4, 4, 1, 1, 1, 1, 1, 1, 2, 2, 5, 5, 1, 1, 1, 1, 1]

	# for i in range(0, network_size*2):
		if i/network_size != 0: # has port N
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:FIFO_MEM_1")
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:FIFO_MEM_2")
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:FIFO_MEM_3")
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:FIFO_MEM_4")

			# Internal signals of FIFO
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:read_pointer")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:read_pointer_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:write_pointer")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:write_pointer_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:credit_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:empty")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:full")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:read_en")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:write_en")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:fake_credit")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:fake_credit_counter")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:fake_credit_counter_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:state_out")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:state_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:fault_info_out")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:fault_info_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:faulty_packet_out")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:faulty_packet_in")
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:flit_type") -- flit_type is an alias
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_N:write_fake_flit")

			list_of_widths += [4, 4, 4, 4, 1, 1, 1, 1, 1, 1, 2, 2, 5, 5, 1, 1, 1, 1, 1]

		if i/network_size != network_size-1: # has port S
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:FIFO_MEM_1")
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:FIFO_MEM_2")
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:FIFO_MEM_3")
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:FIFO_MEM_4")

			# Internal signals of FIFO
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:read_pointer")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:read_pointer_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:write_pointer")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:write_pointer_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:credit_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:empty")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:full")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:read_en")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:write_en")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:fake_credit")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:fake_credit_counter")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:fake_credit_counter_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:state_out")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:state_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:fault_info_out")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:fault_info_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:faulty_packet_out")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:faulty_packet_in")
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:flit_type") -- flit_type is an alias
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_S:write_fake_flit")

			list_of_widths += [4, 4, 4, 4, 1, 1, 1, 1, 1, 1, 2, 2, 5, 5, 1, 1, 1, 1, 1]

		if i%network_size != 0: # has port W
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:FIFO_MEM_1")
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:FIFO_MEM_2")
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:FIFO_MEM_3")
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:FIFO_MEM_4")

			# Internal signals of FIFO
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:read_pointer")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:read_pointer_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:write_pointer")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:write_pointer_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:credit_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:empty")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:full")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:read_en")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:write_en")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:fake_credit")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:fake_credit_counter")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:fake_credit_counter_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:state_out")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:state_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:fault_info_out")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:fault_info_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:faulty_packet_out")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:faulty_packet_in")
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:flit_type") -- flit_type is an alias
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_W:write_fake_flit")

			list_of_widths += [4, 4, 4, 4, 1, 1, 1, 1, 1, 1, 2, 2, 5, 5, 1, 1, 1, 1, 1]

		if i%network_size != network_size-1: # has port E
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:FIFO_MEM_1")
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:FIFO_MEM_2")
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:FIFO_MEM_3")
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:FIFO_MEM_4")

			# Internal signals of FIFO
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:read_pointer")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:read_pointer_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:write_pointer")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:write_pointer_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:credit_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:empty")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:full")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:read_en")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:write_en")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:fake_credit")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:fake_credit_counter")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:fake_credit_counter_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:state_out")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:state_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:fault_info_out")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:fault_info_in")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:faulty_packet_out")
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:faulty_packet_in")
			# list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:flit_type") -- flit_type is an alias
			list_of_ports.append("tb_network_"+str(network_size)+"x"+str(network_size)+":NoC:R_"+str(i)+":FIFO_E:write_fake_flit")

			list_of_widths += [4, 4, 4, 4, 1, 1, 1, 1, 1, 1, 2, 2, 5, 5, 1, 1, 1, 1, 1]

	return list_of_ports, list_of_widths

def generate_links_dictionary(network_size, sim_time):
	"""
	This function generates random faults on all RX signals of the network
	"""

	list_of_ports = []
	list_of_widths = []

	ports, widths = list_all_the_links(network_size)
	list_of_ports += ports
	list_of_widths += widths

	# ports, widths = list_all_the_lbdr_signals(network_size)
	# list_of_ports += ports
	# list_of_widths += widths

	# ports, widths = list_all_the_fifo_signals(network_size)
	# list_of_ports += ports
	# list_of_widths += widths

	# ports, widths = list_all_the_arbiter_signals(network_size)
	# list_of_ports += ports
	# list_of_widths += widths

	random.seed(FAULT_RANDOM_SEED)
	fault_list = []
	for item in list_of_ports:
		item_index = list_of_ports.index(item)
		width = list_of_widths[item_index]
		# fault_type = random.choice(["T", "P", "I", "T->P", "T->I"])
		fault_type = random.choice(["T"])

		shut_down_time = None
		std_dev = None
		if fault_type == "T":		# Transient fault
			frequency = random.choice(["H", "M", "L"])
			if frequency == "H":
				mean_time = int((1000000000/Fault_Per_Second)/HIGH_FAULT_RATE)
			elif frequency == "M":
				mean_time = int((1000000000/Fault_Per_Second)/LOW_FAULT_RATE)
			else:
				mean_time = int((1000000000/Fault_Per_Second)/MEDIUM_FAULT_RATE)
			std_dev = int(mean_time*0.1+1)

		elif fault_type == "I" or fault_type == "T->I": 	# Intermittent fault or transient to intermittent
			mean_time = int(MTB_INTERMITTENT_BURST)
			std_dev = int(mean_time*0.1+1)

		elif fault_type == "P":		# its Permentent fault
			mean_time = None
			std_dev = None
			shut_down_time = random.randint(int(sim_time*0.1), int(sim_time*0.9))

		elif fault_type == "T->P":	# Transient goes to Intermittent and then to Permanent
			mean_time = int(1000000000/Fault_Per_Second)
			shut_down_time = random.randint(int(sim_time*0.1), int(sim_time*0.9))
			std_dev = int(mean_time*0.1+1)

		new_fault = fault(item, width, fault_type, mean_time, std_dev, shut_down_time)
		fault_list.append(new_fault)

	report_faults(fault_list)
	return fault_list

def parse_fault_info_file(file_path):
	"""
	If you want to feed the fault info from a file...
	the file lines should be organized like this:

	fault_location:	signal_width  fault_type  MTBF  std_deviation  shutdown_time

	fault_location: the signal bit that you want to inject the fault on.
	signal_width: 	The width of the signal that you intend to inject the bit-flip in
	fault_type: 	should be chosen from the follwoing list:
							* T : Transient
							* I : Intermittent
							* P : Permanent
							* T->P : Transient to Intermittent to permanent
							* T->I : Transient to Intermittent
	MTBF: 			Mean time between the faults
	std_deviation:	Standard deviation used for generating faults
	shutdown_time:	Time in ns when the signal would be permanently faulty only used when
					you need permanent fault. otherwise "None".

	Example:
			tb_network_2x2:NoC:R_0:RX_L(21) 	32 	I 	1000 	101		None
	"""

	fault_list = []
	fault_info_file = open(file_path, 'r')
	line = fault_info_file.readline()
	while line != "":
		split_line =  line.split()
		fault_location = split_line[0]
		signal_width = int(split_line[1])
		fault_type = split_line[2]
		fault_MTBF = split_line[3]
		fault_STD = split_line[4]
		shut_down_time = split_line[5]

		new_fault = fault(fault_location, signal_width, fault_type, fault_MTBF, fault_STD, shut_down_time)
		fault_list.append(new_fault)
		line = fault_info_file.readline()

	return fault_list

#----------------------------------------------------------------------------------------------
#
#									 Generating the actual do file.
#
#----------------------------------------------------------------------------------------------
def generate_fault_injection_do(file_path, sim_time, sim_end, fault_list):
	"""
	Generates a do file for modelsim for injecting the faults
	fault_path:	string	: path to the fault_inject.do
	sim_time: integer 	: How long do you want to inject faults in the simulation ns
	sim_end:  integer 	: end of simulation
	fault_list: list  	: list of fault objects for injection


	the generated faults would look like these:
	*T: 	___|____________|____________|____________|____________|____________|____________|____________|

		Transient faults happen periodically with a normal distribution with mean time between faults and a
		standard deviation

	*I:     ____________________________||||||||||______________________________________||||||||||_________

		Intermittent faults happen in bursts periodically with a normal distribution with mean time between
		faults and a standard deviation. each burst injects 10 stuck at faults.

	*P:     __________________________________________________|''''''''''''''''''''''''''''''''''''''''''''

		Permanent faults happen right after the specified shutdown time.

	*T->I:  ___|____________|____________|____________||||||||||____________________________||||||||||_____

		first it behaves as Transient, then becomes intermittent. For transient MTBF and Std_Dev it uses the
		specified values in the fault object. for intermittent faults it uses the values specified in package
		file.

	*T->P:  ___|____________|____________|____________||||||||||______________________|''''''''''''''''''''

		First it behaves as transient, then turns into intermittent and then permanent. For transient MTBF and
		Std_Dev it uses the specified values in the fault object. for intermittent faults it uses the values
		specified in package file. for becomming permanent, it uses the shutdown time specified in the fault
		object.
	"""
	list_of_links = fault_list
	delay = 1000000000/Fault_Per_Second
	deviation = int(delay/10)
	if deviation == 0:
		deviation = 1
	fault_inject_file = open(file_path+'/fault_inject.do', 'w')

	permanently_faulty_locations = []
	temp_dict = {}
	for item in list_of_links:
		if item.Type == "T":
			fault_time = 0
			time_until_next_fault = numpy.random.normal(item.mean_time, item.std_dev)
			fault_time += time_until_next_fault
			while fault_time < sim_time:
				if int(fault_time) in temp_dict.keys():
					temp_dict[int(fault_time)].append(item)
				else:
					temp_dict[int(fault_time)] = [item]
				time_until_next_fault = numpy.random.normal(item.mean_time, item.std_dev)
				fault_time += time_until_next_fault

		if item.Type == "I":
			fault_time = 0
			time_until_next_fault = numpy.random.normal(item.mean_time, item.std_dev)
			fault_time += time_until_next_fault
			while fault_time < sim_time:
				for event in range(0, EVENTS_PER_BURST):
					if int(fault_time+event) in temp_dict.keys():
						temp_dict[int(fault_time+event)].append(item)
					else:
						temp_dict[int(fault_time+event)] = [item]
				time_until_next_fault = numpy.random.normal(item.mean_time, item.std_dev)
				fault_time += time_until_next_fault

		if item.Type == "T->I":
			permanently_faulty_locations.append(item)
			fault_time = 0
			time_until_next_fault = numpy.random.normal(item.mean_time, item.std_dev)
			fault_time += time_until_next_fault
			while fault_time < int(sim_time*0.5):
				if int(fault_time) in temp_dict.keys():
					temp_dict[int(fault_time)].append(item)
				else:
					temp_dict[int(fault_time)] = [item]
				time_until_next_fault = numpy.random.normal(item.mean_time, item.std_dev)
				fault_time += time_until_next_fault

			time_until_next_fault = numpy.random.normal(int(MTB_INTERMITTENT_BURST), \
														int(MTB_INTERMITTENT_BURST*0.1+1))
			fault_time += time_until_next_fault
			while fault_time+EVENTS_PER_BURST < int(sim_time):
				for event in range(0, EVENTS_PER_BURST):
					if int(fault_time+event) in temp_dict.keys():
						temp_dict[int(fault_time+event)].append(item)
					else:
						temp_dict[int(fault_time+event)] = [item]
				time_until_next_fault = numpy.random.normal(int(MTB_INTERMITTENT_BURST), \
															int(MTB_INTERMITTENT_BURST*0.1+1))
				fault_time += time_until_next_fault

		if item.Type == "P":
			permanently_faulty_locations.append(item)

		if item.Type == "T->P":
			permanently_faulty_locations.append(item)
			fault_time = 0
			time_until_next_fault = numpy.random.normal(item.mean_time, item.std_dev)
			fault_time += time_until_next_fault
			while fault_time < int(item.shut_down_time*0.5):
				if int(fault_time) in temp_dict.keys():
					temp_dict[int(fault_time)].append(item)
				else:
					temp_dict[int(fault_time)] = [item]
				time_until_next_fault = numpy.random.normal(item.mean_time, item.std_dev)
				fault_time += time_until_next_fault
			time_until_next_fault = numpy.random.normal(int(MTB_INTERMITTENT_BURST), \
														int(MTB_INTERMITTENT_BURST*0.1+1))
			fault_time += time_until_next_fault
			while fault_time+EVENTS_PER_BURST < int(item.shut_down_time):
				for event in range(0, EVENTS_PER_BURST):
					if int(fault_time+event) in temp_dict.keys():
						temp_dict[int(fault_time+event)].append(item)
					else:
						temp_dict[int(fault_time+event)] = [item]
				time_until_next_fault = numpy.random.normal(int(MTB_INTERMITTENT_BURST), \
															int(MTB_INTERMITTENT_BURST*0.1+1))
				fault_time += time_until_next_fault


	fault_inject_file.write("#################################\n")
	current_time = 0
	for i in range(0, sim_time):
		for permanent_fault_location in permanently_faulty_locations:
			if i == permanent_fault_location.shut_down_time:
				location  = permanent_fault_location.location
				fault_inject_file.write("# ###################################################\n")
				fault_inject_file.write("# Shutting down signal: "+location+" for good!\n")
				fault_inject_file.write("force -drive sim/:"+location+" U 1ns\n")
				fault_inject_file.write("# ###################################################\n")
		if i in temp_dict.keys():
			last_time = current_time
			current_time = i
			fault_inject_file.write("run "+str(current_time-last_time)+"ns\n")
			for item in temp_dict[i]:
				location = item.location
				if item.Type == "I" or item.Type == "T->I" or item.Type == "T->P":
					string = "force -drive sim/:"+location+" " + str(random.choice(["0", "1"]))
					string +=  " 0 ns -cancel 1ns"
				else:
					string = "force -drive sim/:"+location+" " + str(random.choice(["0", "1"]))
					random_start = random.randint(0, deviation)
					string +=  " "+str(random_start)+"ns -cancel "+str(random_start+1)+"ns"
				fault_inject_file.write(string+"\n")

	fault_inject_file.write("run "+str(sim_end-sim_time)+"ns\n")
	fault_inject_file.write("stop")
	fault_inject_file.close()
