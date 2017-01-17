# Copyright (C) 2016 Siavoosh Payandeh Azad


def declare_signals(noc_file, network_dime, add_parity, add_packet_drop, add_FC, add_SHMU):
    noc_file.write("\n\n")
    noc_file.write("-- generating bulk signals. not all of them are used in the design...\n")

    for i in range(0, network_dime**2):
        noc_file.write("\tsignal credit_out_N_"+str(i)+", credit_out_E_"+str(i)+", credit_out_W_"+str(i) +
                       ", credit_out_S_"+str(i) + ": std_logic;\n")
    noc_file.write("\n")
    for i in range(0, network_dime**2):
        noc_file.write("\tsignal credit_in_N_"+str(i)+", credit_in_E_"+str(i)+", credit_in_W_"+str(i) +
                       ", credit_in_S_"+str(i) + ": std_logic;\n")
    noc_file.write("\n")
    for i in range(0, network_dime**2):
        noc_file.write("\tsignal RX_N_"+str(i)+", RX_E_"+str(i)+", RX_W_"+str(i)+", RX_S_"+str(i) +
                       " : std_logic_vector (DATA_WIDTH-1 downto 0);\n")
    noc_file.write("\n")
    for i in range(0, network_dime**2):
        noc_file.write("\tsignal valid_out_N_"+str(i)+", valid_out_E_"+str(i)+", valid_out_W_"+str(i) +
                       ", valid_out_S_"+str(i) + ": std_logic;\n")
    noc_file.write("\n")
    for i in range(0, network_dime**2):
        noc_file.write("\tsignal valid_in_N_"+str(i)+", valid_in_E_"+str(i)+", valid_in_W_"+str(i) +
                       ", valid_in_S_"+str(i) + ": std_logic;\n")
    noc_file.write("\n")
    for i in range(0, network_dime**2):
        noc_file.write("\tsignal TX_N_"+str(i)+", TX_E_"+str(i)+", TX_W_"+str(i)+", TX_S_"+str(i) +
                       " : std_logic_vector (DATA_WIDTH-1 downto 0);\n")

    if add_parity:
        noc_file.write("\n")
        for i in range(0, network_dime**2):
            noc_file.write("\tsignal faulty_packet_N"+str(i)+", faulty_packet_E"+str(i)+", faulty_packet_W"+str(i) +
                           ", faulty_packet_S"+str(i) + ", faulty_packet_L"+str(i)+" : std_logic;\n")

        for i in range(0, network_dime**2):
            noc_file.write("\tsignal healthy_packet_N"+str(i)+", healthy_packet_E"+str(i)+", healthy_packet_W"+str(i) +
                           ", healthy_packet_S"+str(i) + ", healthy_packet_L"+str(i)+" : std_logic;\n")
    
    if add_packet_drop and add_FC:
      for i in range(0, network_dime**2):
 
        string_to_print  = ""

        string_to_print += "\tsignal "
        string_to_print += "Faulty_N_out"+str(i)+","
        string_to_print += "Faulty_E_out"+str(i)+","
        string_to_print += "Faulty_W_out"+str(i)+","
        string_to_print += "Faulty_S_out"+str(i)+","
        string_to_print = string_to_print [: len(string_to_print)-1]  + ": std_logic;\n"
        noc_file.write(string_to_print)

        string_to_print  = ""
        string_to_print += "\tsignal "
 
        string_to_print += "Faulty_N_in"+str(i)+","
        string_to_print += "Faulty_E_in"+str(i)+","
        string_to_print += "Faulty_W_in"+str(i)+","
        string_to_print += "Faulty_S_in"+str(i)+","

        string_to_print = string_to_print [: len(string_to_print)-1] + ": std_logic;\n"
        noc_file.write(string_to_print)

    noc_file.write("\n")
