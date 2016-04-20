
network_dime = 4

def rxy_rst_calculator(node_id):
  rxy_rst = 60
  return rxy_rst

def cx_rst_calculator(node_id):
  cx_rst = 0
  node_x = i % network_dime
  node_y = i / network_dime
  c_n = 1
  c_e = 1
  c_w = 1
  c_s = 1 
  if node_y == 0 : 
    c_n = 0
  if node_y == network_dime-1 : 
    c_s = 0
  if node_x == 0:
    c_w = 0
  if node_x == network_dime-1: 
    c_e = 0
  return c_s*8+c_w*4+c_e*2+c_n


def gen_router_component(router_type, noc_file):
	if router_type == "":
		noc_file.write("component router_full is\n")
	else:
		noc_file.write("component router_"+str(router_type)+" is\n")
	noc_file.write(" generic (\n")
	noc_file.write("        DATA_WIDTH: integer := 32;\n")
	noc_file.write("        current_address : integer := 5;\n")
	noc_file.write("        Rxy_rst : integer := 60;\n")
	noc_file.write("        Cx_rst : integer := 15\n")
	noc_file.write("    );\n")
	noc_file.write("    port (\n")
	noc_file.write("    reset, clk: in std_logic;\n")
	noc_file.write("    ") 
	for port in ["N", "E", "W", "S", "L"]:
		if port not in router_type:
			if port == "L": 
				noc_file.write("DCTS_"+str(port)) 
			else:
				noc_file.write("DCTS_"+str(port)+",") 
	noc_file.write(": in std_logic;\n")

	noc_file.write("    ") 
	for port in ["N", "E", "W", "S", "L"]:
		if port not in router_type:
			if port == "L": 
				noc_file.write("DRTS_"+str(port)) 
			else:
				noc_file.write("DRTS_"+str(port)+",") 
	noc_file.write(": in std_logic;\n")

	noc_file.write("    ") 
	for port in ["N", "E", "W", "S", "L"]:
		if port not in router_type:
			if port == "L": 
				noc_file.write("RX_"+str(port)) 	
			else:
				noc_file.write("RX_"+str(port)+",") 
	noc_file.write(": in std_logic_vector (DATA_WIDTH-1 downto 0);\n")

 	noc_file.write("    ") 
	for port in ["N", "E", "W", "S", "L"]:
		if port not in router_type:
			if port == "L": 
				noc_file.write("RTS_"+str(port)) 
			else:
				noc_file.write("RTS_"+str(port)+",") 
	noc_file.write(": out std_logic;\n")

 	noc_file.write("    ") 
	for port in ["N", "E", "W", "S", "L"]:
		if port not in router_type:
			if port == "L": 
				noc_file.write("CTS_"+str(port)) 
			else:
				noc_file.write("CTS_"+str(port)+",") 
	noc_file.write(": out std_logic;\n")

 	noc_file.write("    ") 
	for port in ["N", "E", "W", "S", "L"]:
		if port not in router_type:
			if port == "L": 
				noc_file.write("TX_"+str(port)) 
			else:
				noc_file.write("TX_"+str(port)+",") 
	noc_file.write(": out std_logic_vector (DATA_WIDTH-1 downto 0));\n")
	noc_file.write("end component; \n")
	noc_file.write("\n")
	return None

def generate_mapping_signals(node_number, router_type, noc_file):
	if router_type == "":
		router_name = "router_full"
	else:	
		router_name = "router_"+router_type
	noc_file.write("R_"+str(i)+": "+str(router_name)+" generic map (DATA_WIDTH  => DATA_WIDTH, " +
                    "current_address=>"+str(i)+", Rxy_rst => "+str(rxy_rst_calculator(i))+", " + 
                    "Cx_rst => "+str(cx_rst_calculator(i))+")\n")
  	noc_file.write("PORT MAP (reset, clk, \n")
	noc_file.write("\t")
	for port in ["N", "E", "W", "S", "L"]:
		if port not in router_type:
			noc_file.write("DCTS_"+str(port)+"_"+str(node_number)+",")
	noc_file.write("\n")
	noc_file.write("\t")
	for port in ["N", "E", "W", "S", "L"]:
		if port not in router_type:
			noc_file.write("DRTS_"+str(port)+"_"+str(node_number)+",")
	noc_file.write("\n")
	noc_file.write("\t")
	for port in ["N", "E", "W", "S", "L"]:
		if port not in router_type:
			noc_file.write("RX_"+str(port)+"_"+str(node_number)+",")
	noc_file.write("\n")
	noc_file.write("\t")
	for port in ["N", "E", "W", "S", "L"]:
		if port not in router_type:
			noc_file.write("RTS_"+str(port)+"_"+str(node_number)+",")
	noc_file.write("\n")
	noc_file.write("\t")
	for port in ["N", "E", "W", "S", "L"]:
		if port not in router_type:
			noc_file.write("CTS_"+str(port)+"_"+str(node_number)+",")
	noc_file.write("\n")
	noc_file.write("\t")
	for port in ["N", "E", "W", "S", "L"]:
		if port not in router_type:
			if port == "L":
				noc_file.write("TX_"+str(port)+"_"+str(node_number))
			else:
				noc_file.write("TX_"+str(port)+"_"+str(node_number)+",")
	noc_file.write(");")
	noc_file.write("\n\n")
	return None

def component_declaration(noc_file):
	gen_router_component("", noc_file)
	gen_router_component("NE", noc_file)
	gen_router_component("NW", noc_file)
	gen_router_component("SW", noc_file)
	gen_router_component("SE", noc_file)
	if network_dime >2:
		gen_router_component("N", noc_file)
		gen_router_component("E", noc_file)
		gen_router_component("W", noc_file)
		gen_router_component("S", noc_file)

	return None

def instantiate_routers(node_number, noc_file):
	node_x = i % network_dime
  	node_y = i / network_dime  	
  	if node_x == 0: 	
  		if node_y == 0:		# NW
  			generate_mapping_signals(node_number, "NW", noc_file)
  		elif node_y == network_dime-1: 
  			generate_mapping_signals(node_number, "SW", noc_file)
  		else:
  			generate_mapping_signals(node_number, "W", noc_file)
  	elif node_x == network_dime-1:
  		if node_y == 0:
  			generate_mapping_signals(node_number, "NE", noc_file)
  		elif node_y == network_dime-1:
  			generate_mapping_signals(node_number, "SE", noc_file)
  		else:
  			generate_mapping_signals(node_number, "E", noc_file)
  	else:
  		if node_y == 0:
  			generate_mapping_signals(node_number, "N", noc_file)
  		elif node_y == network_dime-1:
  			generate_mapping_signals(node_number, "S", noc_file)
  		else:
  			generate_mapping_signals(node_number, "", noc_file)
	return None

def gen_signal_for_node(router_type, node_number, noc_file):
	last_port = None
	port_list = ["N", "E", "W", "S"]
	for i in range(0, len(port_list)):
		if port_list[i] not in router_type:
			last_port = port_list[i]	

	noc_file.write("\tsignal ")
	for port in ["N", "E", "W", "S"]:
		if port not in router_type:
			if port == last_port:
				noc_file.write("DCTS_"+str(port)+"_"+str(node_number))
			else:
				noc_file.write("DCTS_"+str(port)+"_"+str(node_number)+",")
	noc_file.write(": std_logic;\n")

	noc_file.write("\tsignal ")
	for port in ["N", "E", "W", "S"]:
		if port not in router_type:
			if port == last_port:
				noc_file.write("DRTS_"+str(port)+"_"+str(node_number)) 
			else:
				noc_file.write("DRTS_"+str(port)+"_"+str(node_number)+",")
	noc_file.write(": std_logic;\n")
	
	noc_file.write("\tsignal ")
	for port in ["N", "E", "W", "S"]:
		if port not in router_type:
			if port == last_port:
				noc_file.write("RX_"+str(port)+"_"+str(node_number)) 
			else:
				noc_file.write("RX_"+str(port)+"_"+str(node_number)+",")
	noc_file.write(": std_logic_vector (DATA_WIDTH-1 downto 0);\n")
	
	noc_file.write("\tsignal ")
	for port in ["N", "E", "W", "S"]:
		if port not in router_type:
			if port == last_port:
				noc_file.write("CTS_"+str(port)+"_"+str(node_number))
			else:
				noc_file.write("CTS_"+str(port)+"_"+str(node_number)+",")
	noc_file.write(": std_logic;\n")
	
	noc_file.write("\tsignal ")
	for port in ["N", "E", "W", "S"]:
		if port not in router_type:
			if port == last_port:
				noc_file.write("RTS_"+str(port)+"_"+str(node_number))
			else:
				noc_file.write("RTS_"+str(port)+"_"+str(node_number)+",")
	noc_file.write(": std_logic;\n")
	
	noc_file.write("\tsignal ")
	for port in ["N", "E", "W", "S"]:
		if port not in router_type:
			if port == last_port:
				 noc_file.write("TX_"+str(port)+"_"+str(node_number))
			else:
				noc_file.write("TX_"+str(port)+"_"+str(node_number)+",")
	noc_file.write(": std_logic_vector (DATA_WIDTH-1 downto 0);\n\n")
	return None

def gen_bulk_signal(node_number, noc_file):
	node_x = i % network_dime
  	node_y = i / network_dime  	
  	if node_x == 0: 	
  		if node_y == 0:		# NW
  			gen_signal_for_node("NW", node_number, noc_file)
  		elif node_y == network_dime-1: 
  			gen_signal_for_node("SW", node_number, noc_file)
  		else:
  			gen_signal_for_node("W", node_number, noc_file)
  	elif node_x == network_dime-1:
  		if node_y == 0:
  			gen_signal_for_node("NE", node_number,noc_file)
  		elif node_y == network_dime-1:
  			gen_signal_for_node("SE", node_number, noc_file)
  		else:
  			gen_signal_for_node("E", node_number, noc_file)
  	else:
  		if node_y == 0:
  			gen_signal_for_node("N", node_number, noc_file)
  		elif node_y == network_dime-1:
  			gen_signal_for_node("S", node_number, noc_file)
  		else:
  			gen_signal_for_node("", node_number, noc_file)
	return None



noc_file = open('network_'+str(network_dime)+"x"+str(network_dime)+'_customized.vhd', 'w')


noc_file.write("--Copyright (C) 2016 Siavoosh Payandeh Azad\n")
noc_file.write("------------------------------------------------------------\n")
noc_file.write("-- This file is automatically generated!\n")
noc_file.write("-- Here are the parameters:\n")
noc_file.write("-- \t network size x:"+str(network_dime)+"\n")
noc_file.write("-- \t network size y:"+str(network_dime)+"\n")
noc_file.write("------------------------------------------------------------\n\n")

noc_file.write("library ieee;\n")
noc_file.write("use ieee.std_logic_1164.all;\n")
noc_file.write("use IEEE.STD_LOGIC_ARITH.ALL;\n")
noc_file.write("use IEEE.STD_LOGIC_UNSIGNED.ALL;\n\n")
 
noc_file.write("entity network_"+str(network_dime)+"x"+str(network_dime)+" is\n")
noc_file.write(" generic (DATA_WIDTH: integer := 32);\n")
noc_file.write("port (reset: in  std_logic; \n")
noc_file.write("\tclk: in  std_logic; \n")
for i in range(network_dime*network_dime):
  noc_file.write("\t--------------\n")
  noc_file.write("\tRX_L_"+str(i)+": in std_logic_vector (DATA_WIDTH-1 downto 0);\n")
  noc_file.write("\tRTS_L_"+str(i)+", CTS_L_"+str(i)+": out std_logic;\n")
  noc_file.write("\tDRTS_L_"+str(i)+", DCTS_L_"+str(i)+": in std_logic;\n")
  if i == network_dime*network_dime-1:
    noc_file.write("\tTX_L_"+str(i)+": out std_logic_vector (DATA_WIDTH-1 downto 0)\n")
  else:
    noc_file.write("\tTX_L_"+str(i)+": out std_logic_vector (DATA_WIDTH-1 downto 0);\n")
noc_file.write("            ); \n")
noc_file.write("end network_"+str(network_dime)+"x"+str(network_dime)+"; \n")

noc_file.write("\n\n")
noc_file.write("architecture behavior of network_"+str(network_dime)+"x"+str(network_dime)+" is\n\n")
noc_file.write("-- Declaring router component\n")

component_declaration(noc_file)

noc_file.write("-- generating bulk signals. not all of them are used in the design...\n")
for i in range(0, network_dime*network_dime):
  	gen_bulk_signal(i, noc_file)

noc_file.write("begin\n\n")

noc_file.write("\n\n")
noc_file.write("--        organizaiton of the network:\n")
noc_file.write("--     x --------------->\n")
for j in range(0, network_dime):
    if j == 0:  
      noc_file.write("--  y  ")
    else:
      noc_file.write("--  |  ")
    for i in range(0, network_dime):
      noc_file.write("       ----")
    noc_file.write("\n")
    noc_file.write("--  |   ")
    for i in range(0, network_dime):
      if (i+network_dime*j)>=10:
        noc_file.write("     | "+str(i+network_dime*j)+" |")
      else:
        noc_file.write("     | "+str(i+network_dime*j)+"  |")
    noc_file.write("\n")
    if j == network_dime-1:
      noc_file.write("--  v  ")
    else:
      noc_file.write("--  |  ")
    for i in range(0, network_dime):
      noc_file.write("       ----")
    noc_file.write("\n")
noc_file.write("\n")
noc_file.write("-- instantiating the routers\n")
for i in range(0, network_dime*network_dime):
	instantiate_routers(i, noc_file)

noc_file.write("-- binding the routers together\n")
noc_file.write("-- vertical ins/outs\n")
for i in range(0, network_dime*network_dime):
  node_x = i % network_dime
  node_y = i / network_dime
  if node_y != network_dime-1:
      noc_file.write("-- connecting router: "+str(i)+ " to router: "+str(i+network_dime)+" and vice versa\n")
      noc_file.write("RX_N_"+str(i+network_dime)+"<= TX_S_"+str(i)+";\n")
      noc_file.write("RX_S_"+str(i)+"<= TX_N_"+str(i+network_dime)+";\n")

      noc_file.write("DRTS_N_"+str(i+network_dime)+" <= RTS_S_"+str(i)+";\n")
      noc_file.write("DCTS_S_"+str(i)+" <= CTS_N_"+str(i+network_dime)+";\n")

      noc_file.write("DRTS_S_"+str(i)+" <= RTS_N_"+str(i+network_dime)+";\n")
      noc_file.write("DCTS_N_"+str(i+network_dime)+" <= CTS_S_"+str(i)+";\n")
      noc_file.write("-------------------\n") 
noc_file.write("\n")      
noc_file.write("-- horizontal ins/outs\n")
for i in range(0, network_dime*network_dime):
  node_x = i % network_dime
  node_y = i / network_dime
  if node_x != network_dime -1 :
      noc_file.write("-- connecting router: "+str(i)+ " to router: "+str(i+1)+" and vice versa\n")
      noc_file.write("RX_E_"+str(i)+" <= TX_W_"+str(i+1)+";\n")
      noc_file.write("RX_W_"+str(i+1)+" <= TX_E_"+str(i)+";\n")

      noc_file.write("DRTS_E_"+str(i)+" <= RTS_W_"+str(i+1)+";\n")
      noc_file.write("DCTS_W_"+str(i+1)+" <= CTS_E_"+str(i)+";\n")

      noc_file.write("DRTS_W_"+str(i+1)+" <= RTS_E_"+str(i)+";\n")
      noc_file.write("DCTS_E_"+str(i)+" <= CTS_W_"+str(i+1)+";\n")
      noc_file.write("-------------------\n") 
noc_file.write("end;\n")
noc_file.close()

