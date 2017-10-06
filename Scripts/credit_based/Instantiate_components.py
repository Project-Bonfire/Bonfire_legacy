# Copyright (C) 2016 Siavoosh Payandeh Azad
from CB_functions import rxy_rst_calculator, cx_rst_calculator
import math



def instantiate_routers(noc_file, network_dime, add_parity, add_packet_drop, add_FC, add_SHMU,
                        healthy_counter_threshold, faulty_counter_threshold, counter_depth):
    """
    Instantiates the different routers based on the specified configuration!
    noc_file:      string   : destination file
    network_dime:  integer  : network size
    add_parity, add_packet_drop, add_FC, add_SHMU: boolean: configuration of the system!
    healthy_counter_threshold, faulty_counter_threshold, counter_depth: integer:  for setting up counter-threshold unit
    """

    if add_packet_drop and add_FC and not add_SHMU:
        for i in range(0, network_dime**2):
            string_to_print = ""
            string_to_print += "R_"+str(i)+": router_credit_based_PD_C \n"
            string_to_print += "    generic map (DATA_WIDTH =>DATA_WIDTH, "
            string_to_print += "        current_address => "+str(i)+",\n"
            string_to_print += "        Cx_rst =>  "+str(cx_rst_calculator(i, network_dime)) +\
                               ", NoC_size => "+str(int(math.log(network_dime*network_dime, 2)))+", healthy_counter_threshold => "+str(healthy_counter_threshold) +\
                               ", faulty_counter_threshold => "+str(faulty_counter_threshold) +\
                               ", counter_depth => "+str(counter_depth)+")\n"
            string_to_print += "    port map(\n"
            string_to_print += "    reset, clk,\n"
            string_to_print += "    Rxy_reconf, Reconfig,\n"
            string_to_print += "\tRX_N_"+str(i)+", RX_E_"+str(i)+", RX_W_"+str(i)+", RX_S_"+str(i)+", RX_L_"+str(i)+",\n"
            string_to_print += "\tcredit_in_N_"+str(i)+", credit_in_E_"+str(i)+", credit_in_W_"+str(i) + \
                               ", credit_in_S_"+str(i)+", credit_in_L_"+str(i)+",\n"
            string_to_print += "\tvalid_in_N_"+str(i)+", valid_in_E_"+str(i)+", valid_in_W_"+str(i) + \
                               ", valid_in_S_"+str(i)+", valid_in_L_"+str(i)+",\n"
            string_to_print += "\tvalid_out_N_"+str(i)+", valid_out_E_"+str(i)+", valid_out_W_"+str(i) + \
                               ", valid_out_S_"+str(i)+", valid_out_L_"+str(i)+",\n"
            string_to_print += "\tcredit_out_N_"+str(i)+", credit_out_E_"+str(i)+", credit_out_W_"+str(i) + \
                               ", credit_out_S_"+str(i)+", credit_out_L_"+str(i)+",\n"
            string_to_print += "\tTX_N_"+str(i)+", TX_E_"+str(i)+", TX_W_"+str(i)+", TX_S_"+str(i)+", TX_L_"+str(i)+",\n"

            north_node = i - network_dime
            south_node = i + network_dime
            west_node = i - 1
            east_node = i + 1

            string_to_print += "\t"
            string_to_print += "Faulty_N_in"+str(i)+","
            string_to_print += "Faulty_E_in"+str(i)+","
            string_to_print += "Faulty_W_in"+str(i)+","
            string_to_print += "Faulty_S_in"+str(i)+","
            string_to_print += "\n"

            string_to_print += "\t"
            string_to_print += "Faulty_N_out"+str(i)+","
            string_to_print += "Faulty_E_out"+str(i)+","
            string_to_print += "Faulty_W_out"+str(i)+","
            string_to_print += "Faulty_S_out"+str(i)
            string_to_print += " ); \n"
            noc_file.write(string_to_print)

    elif add_SHMU:
        for i in range(0, network_dime**2):
            string_to_print = ""
            string_to_print += "R_"+str(i)+": router_credit_based_PD_C_SHMU \n"
            string_to_print += "    generic map (DATA_WIDTH =>DATA_WIDTH, "
            string_to_print += "        current_address => "+str(i)+", Rxy_rst => " + str(rxy_rst_calculator(i))+",\n"
            string_to_print += "        Cx_rst =>  "+str(cx_rst_calculator(i, network_dime)) +\
                               ", NoC_size => "+str(int(math.log(network_dime*network_dime, 2)))+", healthy_counter_threshold => "+str(healthy_counter_threshold) +\
                               ", faulty_counter_threshold => "+str(faulty_counter_threshold) +\
                               ", counter_depth => "+str(counter_depth)+")\n"
            string_to_print += "    port map(\n"
            string_to_print += "    reset, clk,\n"
            string_to_print += "\tRX_N_"+str(i)+", RX_E_"+str(i)+", RX_W_"+str(i)+", RX_S_"+str(i)+", RX_L_"+str(i)+",\n"
            string_to_print += "\tcredit_in_N_"+str(i)+", credit_in_E_"+str(i)+", credit_in_W_"+str(i) + \
                               ", credit_in_S_"+str(i)+", credit_in_L_"+str(i)+",\n"
            string_to_print += "\tvalid_in_N_"+str(i)+", valid_in_E_"+str(i)+", valid_in_W_"+str(i) + \
                               ", valid_in_S_"+str(i)+", valid_in_L_"+str(i)+",\n"
            string_to_print += "\tvalid_out_N_"+str(i)+", valid_out_E_"+str(i)+", valid_out_W_"+str(i) + \
                               ", valid_out_S_"+str(i)+", valid_out_L_"+str(i)+",\n"
            string_to_print += "\tcredit_out_N_"+str(i)+", credit_out_E_"+str(i)+", credit_out_W_"+str(i) + \
                               ", credit_out_S_"+str(i)+", credit_out_L_"+str(i)+",\n"
            string_to_print += "\tTX_N_"+str(i)+", TX_E_"+str(i)+", TX_W_"+str(i)+", TX_S_"+str(i)+", TX_L_"+str(i)+",\n"

            string_to_print += "\t"
            string_to_print += "Faulty_N_in"+str(i)+","
            string_to_print += "Faulty_E_in"+str(i)+","
            string_to_print += "Faulty_W_in"+str(i)+","
            string_to_print += "Faulty_S_in"+str(i)+","
            string_to_print += "\n"

            string_to_print += "\t"
            string_to_print += "Faulty_N_out"+str(i)+","
            string_to_print += "Faulty_E_out"+str(i)+","
            string_to_print += "Faulty_W_out"+str(i)+","
            string_to_print += "Faulty_S_out"+str(i)+","
            string_to_print += "\n"

            string_to_print += "\t-- should be connected to NI\n"
            string_to_print += "\tlink_faults_"+str(i)+", turn_faults_"+str(i)+",\n"
            string_to_print += "\tRxy_reconf_PE_"+str(i)+", Cx_reconf_PE_"+str(i)+", Reconfig_command_"+str(i)+"\n"
            string_to_print += " ); \n"
            noc_file.write(string_to_print)
    else:
        noc_file.write("-- instantiating the routers\n")
        for i in range(0, network_dime**2):
            if add_parity:
                noc_file.write("R_"+str(i)+": router_credit_based_parity generic map (DATA_WIDTH  => DATA_WIDTH, ")
            else:
                noc_file.write("R_"+str(i)+": router_credit_based generic map (DATA_WIDTH  => DATA_WIDTH, ")

            noc_file.write("current_address=>"+str(i)+", " +
                           "Cx_rst => "+str(cx_rst_calculator(i, network_dime))+", NoC_size=>"+str(int(math.log(network_dime*network_dime, 2)))+")\n")
            noc_file.write("PORT MAP (reset, clk, \n")
            noc_file.write("    Rxy_reconf, Reconfig,\n")
            noc_file.write("\tRX_N_"+str(i)+", RX_E_"+str(i)+", RX_W_"+str(i)+", RX_S_"+str(i)+", RX_L_"+str(i)+",\n")
            noc_file.write("\tcredit_in_N_"+str(i)+", credit_in_E_"+str(i)+", credit_in_W_"+str(i) +
                           ", credit_in_S_"+str(i)+", credit_in_L_"+str(i)+",\n")
            noc_file.write("\tvalid_in_N_"+str(i)+", valid_in_E_"+str(i)+", valid_in_W_"+str(i) +
                           ", valid_in_S_"+str(i)+", valid_in_L_"+str(i)+",\n")
            noc_file.write("\tvalid_out_N_"+str(i)+", valid_out_E_"+str(i)+", valid_out_W_"+str(i) +
                           ", valid_out_S_"+str(i)+", valid_out_L_"+str(i)+",\n")
            noc_file.write("\tcredit_out_N_"+str(i)+", credit_out_E_"+str(i)+", credit_out_W_"+str(i) +
                           ", credit_out_S_"+str(i)+", credit_out_L_"+str(i)+",\n")
            if add_parity:
                noc_file.write("\tTX_N_"+str(i)+", TX_E_"+str(i)+", TX_W_"+str(i)+", TX_S_"+str(i)+", TX_L_"+str(i)+",\n")
                noc_file.write("\tfaulty_packet_N"+str(i)+", faulty_packet_E"+str(i)+", faulty_packet_W"+str(i) +
                               ", faulty_packet_S"+str(i)+", faulty_packet_L"+str(i)+",\n")
                noc_file.write("\thealthy_packet_N"+str(i)+", healthy_packet_E"+str(i)+", healthy_packet_W"+str(i) +
                               ", healthy_packet_S"+str(i)+", healthy_packet_L"+str(i)+"\n")
            else:
                noc_file.write("\tTX_N_"+str(i)+", TX_E_"+str(i)+", TX_W_"+str(i)+", TX_S_"+str(i)+", TX_L_"+str(i))
            noc_file.write("); \n\n")
    noc_file.write("\n")
