# Copyright (C) 2016 Siavoosh Payandeh Azad


def generate_entity(noc_file, network_dime, add_SHMU):
    """
    noc_file:       string  : path to the network file
    network_dime:   integer : network size
    add_SHMU:       boolean : if SHMU is included in the network
    """

    string_to_print = ""
    noc_file.write("entity network_"+str(network_dime)+"x"+str(network_dime)+" is\n")

    noc_file.write(" generic (DATA_WIDTH: integer := 32; DATA_WIDTH_LV: integer := 11);\n")
    noc_file.write("port (reset: in  std_logic; \n")
    noc_file.write("\tclk: in  std_logic; \n")
    noc_file.write("\t--------------\n")
    if not add_SHMU:
        noc_file.write("\tRxy_reconf: in  std_logic_vector(7 downto 0);\n")
        noc_file.write("\tReconfig : in std_logic;\n")
    for i in range(network_dime**2):
        noc_file.write("\t--------------\n")
        noc_file.write("\tRX_L_"+str(i)+": in std_logic_vector (DATA_WIDTH-1 downto 0);\n")
        noc_file.write("\tcredit_out_L_"+str(i)+", valid_out_L_"+str(i)+": out std_logic;\n")
        noc_file.write("\tcredit_in_L_"+str(i)+", valid_in_L_"+str(i)+": in std_logic;\n")
        if i == network_dime**2-1 and add_SHMU== False:
            noc_file.write("\tTX_L_"+str(i)+": out std_logic_vector (DATA_WIDTH-1 downto 0)\n")
        else:
            noc_file.write("\tTX_L_"+str(i)+": out std_logic_vector (DATA_WIDTH-1 downto 0);\n")

    if add_SHMU:
        for i in range(0, network_dime**2):
            string_to_print +="\t--------------\n"
            string_to_print +="    link_faults_"+str(i) +": out std_logic_vector(4 downto 0);\n"
            string_to_print +="    turn_faults_"+str(i) +": out std_logic_vector(19 downto 0);\n"
            string_to_print +="    Rxy_reconf_PE_"+str(i) +": in  std_logic_vector(7 downto 0);\n"
            string_to_print +="    Cx_reconf_PE_"+str(i) +": in  std_logic_vector(3 downto 0);\n"
            string_to_print +="    Reconfig_command_"+str(i) +" : in std_logic;\n\n"

    noc_file.write(string_to_print[:len(string_to_print)-3])
    noc_file.write("\n            ); \n")
    noc_file.write("end network_"+str(network_dime)+"x"+str(network_dime)+"; \n")
