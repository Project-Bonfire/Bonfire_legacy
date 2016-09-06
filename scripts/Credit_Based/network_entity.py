# Copyright (C) 2016 Siavoosh Payandeh Azad


def generate_entity(noc_file, network_dime, add_FI, fi_addres_width, add_lv, add_FO):
    string_to_print = ""
    noc_file.write("entity network_"+str(network_dime)+"x"+str(network_dime)+" is\n")

    noc_file.write(" generic (DATA_WIDTH: integer := 32; DATA_WIDTH_LV: integer := 11);\n")
    noc_file.write("port (reset: in  std_logic; \n")
    noc_file.write("\tclk: in  std_logic; \n")
    for i in range(network_dime**2):
        noc_file.write("\t--------------\n")
        noc_file.write("\tRX_L_"+str(i)+": in std_logic_vector (DATA_WIDTH-1 downto 0);\n")
        noc_file.write("\tcredit_out_L_"+str(i)+", valid_out_L_"+str(i)+": out std_logic;\n")
        noc_file.write("\tcredit_in_L_"+str(i)+", valid_in_L_"+str(i)+": in std_logic;\n")
        if i == network_dime**2-1 and (add_FI or add_FO or add_lv)== False:
            noc_file.write("\tTX_L_"+str(i)+": out std_logic_vector (DATA_WIDTH-1 downto 0)\n")
        else:
            noc_file.write("\tTX_L_"+str(i)+": out std_logic_vector (DATA_WIDTH-1 downto 0);\n")

    if add_FI:
        string_to_print += "\t--fault injector signals\n"

        for i in range(0, network_dime**2):
            node_x = i % network_dime
            node_y = i / network_dime
            if node_y != network_dime-1:
                string_to_print += "\tFI_Add_"+str(i+network_dime)+"_"+str(i)+", FI_Add_"+str(i) + \
                                   "_"+str(i+network_dime) + ": in std_logic_vector(" + \
                                   str(fi_addres_width-1) + " downto 0);\n"
                string_to_print += "\tsta0_"+str(i)+"_"+str(i+network_dime)+", sta1_"+str(i)+"_"+str(i+network_dime) +\
                                   ", sta0_"+str(i+network_dime)+"_"+str(i)+", sta1_"+str(i+network_dime)+"_"+str(i) +\
                                   ": in std_logic;\n\n"
        for i in range(0, network_dime**2):
            node_x = i % network_dime
            node_y = i / network_dime
            if node_x != network_dime-1:
                string_to_print += "\tFI_Add_"+str(i+1)+"_"+str(i)+", FI_Add_"+str(i)+"_"+str(i+1) +\
                                   ": in std_logic_vector("+str(fi_addres_width-1)+" downto 0);\n"
                string_to_print += "\tsta0_"+str(i)+"_"+str(i+1)+", sta1_"+str(i)+"_"+str(i+1) +\
                                   ", sta0_"+str(i+1)+"_"+str(i)+", sta1_"+str(i+1)+"_"+str(i)+": in std_logic;\n\n"
    if add_FO:
        string_to_print += "\t--fault diagnosis signals\n"
        for i in range(0, network_dime**2):
            string_to_print += "\tfaulty_packet_N"+str(i)+", faulty_packet_E"+str(i)+", faulty_packet_W"+str(i) +\
                               ", faulty_packet_S"+str(i)+", faulty_packet_L"+str(i)+":out std_logic;\n"
            string_to_print += "\thealthy_packet_N"+str(i)+", healthy_packet_E"+str(i)+", healthy_packet_W"+str(i) +\
                               ", healthy_packet_S"+str(i)+", healthy_packet_L"+str(i)+":out std_logic;\n\n"

    if add_lv:
      for i in range(0, network_dime**2):
        string_to_print +="\t--------------\n"
        string_to_print +="    credit_in_LV_"+str(i) +": in std_logic;\n"
        string_to_print +="    valid_out_LV_"+str(i) +" : out std_logic;\n"
        string_to_print +="    TX_LV_"+str(i) +": out std_logic_vector (DATA_WIDTH_LV-1 downto 0);\n\n"

    noc_file.write(string_to_print[:len(string_to_print)-3])
    noc_file.write("\n            ); \n")
    noc_file.write("end network_"+str(network_dime)+"x"+str(network_dime)+"; \n")
