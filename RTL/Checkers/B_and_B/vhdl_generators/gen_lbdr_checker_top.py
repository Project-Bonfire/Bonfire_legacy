# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand


def gen_lbdr_checker_top(checker_id):
    name_string = ""
    for i in checker_id:
        name_string += str(i)+"_"
    lbdr_checker_top = open("checker_vhdl/lbdr_checker"+name_string[:len(name_string)-1]+"_top.vhd", 'w')

    lbdr_checker_top.write("library ieee;\n")
    lbdr_checker_top.write("use ieee.std_logic_1164.all;\n")
    lbdr_checker_top.write("use IEEE.STD_LOGIC_ARITH.ALL;\n")
    lbdr_checker_top.write("use IEEE.STD_LOGIC_UNSIGNED.ALL;\n")
    lbdr_checker_top.write("use IEEE.NUMERIC_STD.all;\n")
    lbdr_checker_top.write("use IEEE.MATH_REAL.ALL;\n")
    lbdr_checker_top.write("\n")
    lbdr_checker_top.write("entity LBDR_with_checkers_top is\n")
    lbdr_checker_top.write("    generic (\n")
    lbdr_checker_top.write("        cur_addr_rst: integer := 5;\n")
    lbdr_checker_top.write("        Rxy_rst: integer := 60;\n")
    lbdr_checker_top.write("        Cx_rst: integer := 15;\n")
    lbdr_checker_top.write("        NoC_size: integer := 4\n")
    lbdr_checker_top.write("    );\n")
    lbdr_checker_top.write("    port (  empty: in  std_logic;\n")
    lbdr_checker_top.write("            flit_type: in std_logic_vector(2 downto 0);\n")
    lbdr_checker_top.write("            dst_addr: in std_logic_vector(NoC_size-1 downto 0);\n")
    lbdr_checker_top.write("            Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;\n")
    lbdr_checker_top.write("            \n")
    lbdr_checker_top.write("            -- LBDR outputs\n")
    lbdr_checker_top.write("            Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: out std_logic;\n")
    lbdr_checker_top.write("\n")
    lbdr_checker_top.write("            -- Checker outputs\n")

    string_to_write = ""
    if '1' in checker_id:
        string_to_write += "err_LBDR_Req_onehot,"
    if '2' in checker_id:
        string_to_write += "err_LBDR_Req_onehot1,"
    if '3' in checker_id:
        string_to_write += "err_LBDR_dst_addr_checker,"
    if '4' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type,"
    if '5' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type1,"
    if '6' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type2,"
    if '7' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type3,"
    if '8' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type4,"
    if '9' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type5,"
    if '10' in checker_id:
        string_to_write += "err_LBDR_Req_tail_allzero,"
    if '11' in checker_id:
        string_to_write += "err_LBDR_Req_Local,"
    if '12' in checker_id:
        string_to_write += "err_LBDR_Req_Local1,"

    string_to_write = string_to_write[:len(string_to_write)-1]
    string_to_write += " : out std_logic\n"

    lbdr_checker_top.write(string_to_write)

    lbdr_checker_top.write("            );\n")
    lbdr_checker_top.write("end LBDR_with_checkers_top;\n")
    lbdr_checker_top.write("\n")
    lbdr_checker_top.write("architecture behavior of LBDR_with_checkers_top is\n")
    lbdr_checker_top.write("\n")
    lbdr_checker_top.write("component LBDR_pseudo is\n")
    lbdr_checker_top.write("    generic (\n")
    lbdr_checker_top.write("        cur_addr_rst: integer := 5;\n")
    lbdr_checker_top.write("        Rxy_rst: integer := 60;\n")
    lbdr_checker_top.write("        Cx_rst: integer := 15;\n")
    lbdr_checker_top.write("        NoC_size: integer := 4\n")
    lbdr_checker_top.write("    );\n")
    lbdr_checker_top.write("    port (  empty: in  std_logic;\n")
    lbdr_checker_top.write("            flit_type: in std_logic_vector(2 downto 0);\n")
    lbdr_checker_top.write("            dst_addr: in std_logic_vector(NoC_size-1 downto 0);\n")
    lbdr_checker_top.write("            Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;\n")
    lbdr_checker_top.write("\n")
    lbdr_checker_top.write("            Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: out std_logic\n")
    lbdr_checker_top.write("            );\n")
    lbdr_checker_top.write("end component;\n")
    lbdr_checker_top.write("\n")
    lbdr_checker_top.write("component LBDR_checkers is\n")
    lbdr_checker_top.write("    generic (\n")
    lbdr_checker_top.write("        cur_addr_rst: integer := 5;\n")
    lbdr_checker_top.write("        NoC_size: integer := 4\n")
    lbdr_checker_top.write("    );\n")
    lbdr_checker_top.write("    port (  empty: in  std_logic;\n")
    lbdr_checker_top.write("            flit_type: in std_logic_vector(2 downto 0);\n")
    lbdr_checker_top.write("            Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;\n")
    lbdr_checker_top.write("            Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: in std_logic;\n")
    lbdr_checker_top.write("            dst_addr: in std_logic_vector(NoC_size-1 downto 0);\n")
    lbdr_checker_top.write("\n")
    lbdr_checker_top.write("            -- Checker outputs\n")

    string_to_write = ""
    if '1' in checker_id:
        string_to_write += "err_LBDR_Req_onehot,"
    if '2' in checker_id:
        string_to_write += "err_LBDR_Req_onehot1,"
    if '3' in checker_id:
        string_to_write += "err_LBDR_dst_addr_checker,"
    if '4' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type,"
    if '5' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type1,"
    if '6' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type2,"
    if '7' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type3,"
    if '8' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type4,"
    if '9' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type5,"
    if '10' in checker_id:
        string_to_write += "err_LBDR_Req_tail_allzero,"
    if '11' in checker_id:
        string_to_write += "err_LBDR_Req_Local,"
    if '12' in checker_id:
        string_to_write += "err_LBDR_Req_Local1,"

    string_to_write = string_to_write[:len(string_to_write)-1]
    string_to_write += " : out std_logic\n"

    lbdr_checker_top.write(string_to_write)
    lbdr_checker_top.write("            );\n")
    lbdr_checker_top.write("end component;\n")
    lbdr_checker_top.write("\n")
    lbdr_checker_top.write("signal Req_N_in_sig, Req_E_in_sig, Req_W_in_sig, Req_S_in_sig, Req_L_in_sig: std_logic;\n")
    lbdr_checker_top.write("\n")
    lbdr_checker_top.write("begin \n")
    lbdr_checker_top.write("\n")
    lbdr_checker_top.write("Req_N_in <= Req_N_in_sig;\n")
    lbdr_checker_top.write("Req_E_in <= Req_E_in_sig;\n")
    lbdr_checker_top.write("Req_W_in <= Req_W_in_sig;\n")
    lbdr_checker_top.write("Req_S_in <= Req_S_in_sig;\n")
    lbdr_checker_top.write("Req_L_in <= Req_L_in_sig;\n")
    lbdr_checker_top.write("\n")
    lbdr_checker_top.write("\n")
    lbdr_checker_top.write("-- LBDR instantiation\n")
    lbdr_checker_top.write("LBDR: LBDR_pseudo generic map (cur_addr_rst => 5, Rxy_rst => 60, "
                           "Cx_rst => 15, NoC_size => 4)\n")
    lbdr_checker_top.write("                     port map (empty=>empty, flit_type=>flit_type, dst_addr=>dst_addr, \n")
    lbdr_checker_top.write("                               Req_N_FF=>Req_N_FF, Req_E_FF=>Req_E_FF, Req_W_FF=>Req_W_FF, "
                           "Req_S_FF=>Req_S_FF, Req_L_FF=>Req_L_FF,\n")
    lbdr_checker_top.write("                               Req_N_in=>Req_N_in_sig, Req_E_in=>Req_E_in_sig, "
                           "Req_W_in=>Req_W_in_sig, Req_S_in=>Req_S_in_sig, Req_L_in=>Req_L_in_sig);\n")
    lbdr_checker_top.write("\n")

    lbdr_checker_top.write("-- Checkers instantiation\n")
    lbdr_checker_top.write("CHECKERS: LBDR_checkers  generic map (cur_addr_rst => 5, NoC_size => 4)\n")
    lbdr_checker_top.write("                         port map (empty=>empty, flit_type=>flit_type,\n")
    lbdr_checker_top.write("                                  Req_N_FF=>Req_N_FF, \n")
    lbdr_checker_top.write("                                  Req_E_FF=>Req_E_FF, \n")
    lbdr_checker_top.write("                                  Req_W_FF=>Req_W_FF, \n")
    lbdr_checker_top.write("                                  Req_S_FF=>Req_S_FF,\n")
    lbdr_checker_top.write("                                  Req_L_FF=>Req_L_FF,\n")
    lbdr_checker_top.write("                                                  Req_N_in=>Req_N_in_sig, \n")
    lbdr_checker_top.write("                                  Req_E_in=>Req_E_in_sig, \n")
    lbdr_checker_top.write("                                  Req_W_in=>Req_W_in_sig, \n")
    lbdr_checker_top.write("                                  Req_S_in=>Req_S_in_sig, \n")
    lbdr_checker_top.write("                                  Req_L_in=>Req_L_in_sig, \n")
    lbdr_checker_top.write("                                  dst_addr => dst_addr,\n")
    lbdr_checker_top.write("\n")

    string_to_write = ""
    if '1' in checker_id:
        string_to_write += "err_LBDR_Req_onehot => err_LBDR_Req_onehot,"
    if '2' in checker_id:
        string_to_write += "err_LBDR_Req_onehot1 => err_LBDR_Req_onehot1,"
    if '3' in checker_id:
        string_to_write += "err_LBDR_dst_addr_checker => err_LBDR_dst_addr_checker,"
    if '4' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type => err_LBDR_valid_flit_type,"
    if '5' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type1 => err_LBDR_valid_flit_type1,"
    if '6' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type2 => err_LBDR_valid_flit_type2,"
    if '7' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type3 => err_LBDR_valid_flit_type3,"
    if '8' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type4 => err_LBDR_valid_flit_type4,"
    if '9' in checker_id:
        string_to_write += "err_LBDR_valid_flit_type5 => err_LBDR_valid_flit_type5,"
    if '10' in checker_id:
        string_to_write += "err_LBDR_Req_tail_allzero => err_LBDR_Req_tail_allzero,"
    if '11' in checker_id:
        string_to_write += "err_LBDR_Req_Local => err_LBDR_Req_Local"
    if '12' in checker_id:
        string_to_write += "err_LBDR_Req_Local1 => err_LBDR_Req_Local1,"

    string_to_write = string_to_write[:len(string_to_write)-1]+");\n"

    lbdr_checker_top.write(string_to_write)
    lbdr_checker_top.write("\n")
    lbdr_checker_top.write("end behavior;\n")
    lbdr_checker_top.write("    \n")
    lbdr_checker_top.close()
