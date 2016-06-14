# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand


def gen_elbdr_checker_top(checker_id):
    name_string = ""
    for i in checker_id:
        name_string += str(i)+"_"
    elbdr_checker_top = open("checker_vhdl/elbdr_checker"+name_string[:len(name_string)-1]+"_top.vhd", 'w')

    elbdr_checker_top.write("library ieee;\n")
    elbdr_checker_top.write("use ieee.std_logic_1164.all;\n")
    elbdr_checker_top.write("use IEEE.STD_LOGIC_ARITH.ALL;\n")
    elbdr_checker_top.write("use IEEE.STD_LOGIC_UNSIGNED.ALL;\n")
    elbdr_checker_top.write("use IEEE.NUMERIC_STD.all;\n")
    elbdr_checker_top.write("use IEEE.MATH_REAL.ALL;\n")
    elbdr_checker_top.write("\n")
    elbdr_checker_top.write("entity ELBDR_with_checkers_top is\n")
    elbdr_checker_top.write("	generic (\n")
    elbdr_checker_top.write("        cur_addr_rst: integer := 5;\n")
    elbdr_checker_top.write("        Rxy_rst: integer := 60;\n")
    elbdr_checker_top.write("        Cx_rst: integer := 15;\n")
    elbdr_checker_top.write("        NoC_size: integer := 4\n")
    elbdr_checker_top.write("    );\n")
    elbdr_checker_top.write("    port (  empty: in  std_logic;\n")
    elbdr_checker_top.write("            flit_type: in std_logic_vector(2 downto 0);\n")
    elbdr_checker_top.write("            dst_addr: in std_logic_vector(NoC_size-1 downto 0);\n")
    elbdr_checker_top.write("            Req_N_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;\n")
    elbdr_checker_top.write("            \n")
    elbdr_checker_top.write("            -- ELBDR outputs\n")
    elbdr_checker_top.write("            Req_N_in, Req_W_in, Req_S_in, Req_L_in: out std_logic;\n")
    elbdr_checker_top.write("\n")
    elbdr_checker_top.write("            -- Checker outputs\n")
    string_to_write = ""

    if '1' in checker_id:
        string_to_write += "err_LBDR_Req_onehot,"
    if '2' in checker_id:
        string_to_write += "err_LBDR_dst_addr_checker,"
    if '3' in checker_id:
        string_to_write += "err_LBDR_Req_tail_allzero,"
    if '4' in checker_id:
        string_to_write += "err_LBDR_Req_allzero,"

    elbdr_checker_top.write(string_to_write[:len(string_to_write)-1]+": out std_logic -- , err_LBDR_Req_not_Local : out std_logic\n")
    elbdr_checker_top.write("            );\n")
    elbdr_checker_top.write("end ELBDR_with_checkers_top;\n")
    elbdr_checker_top.write("\n")
    elbdr_checker_top.write("architecture behavior of ELBDR_with_checkers_top is\n")
    elbdr_checker_top.write("\n")
    elbdr_checker_top.write("component ELBDR_pseudo is\n")
    elbdr_checker_top.write("	generic (\n")
    elbdr_checker_top.write("        cur_addr_rst: integer := 5;\n")
    elbdr_checker_top.write("        Rxy_rst: integer := 60;\n")
    elbdr_checker_top.write("        Cx_rst: integer := 15;\n")
    elbdr_checker_top.write("        NoC_size: integer := 4\n")
    elbdr_checker_top.write("    );\n")
    elbdr_checker_top.write("    port (  empty: in  std_logic;\n")
    elbdr_checker_top.write("            flit_type: in std_logic_vector(2 downto 0);\n")
    elbdr_checker_top.write("            dst_addr: in std_logic_vector(NoC_size-1 downto 0);\n")
    elbdr_checker_top.write("            Req_N_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;\n")
    elbdr_checker_top.write("\n")
    elbdr_checker_top.write("            Req_N_in, Req_W_in, Req_S_in, Req_L_in: out std_logic\n")
    elbdr_checker_top.write("            );\n")
    elbdr_checker_top.write("end component;\n")
    elbdr_checker_top.write("\n")
    elbdr_checker_top.write("component ELBDR_checkers is\n")
    elbdr_checker_top.write("    generic (\n")
    elbdr_checker_top.write("        cur_addr_rst: integer := 5;\n")
    elbdr_checker_top.write("        NoC_size: integer := 4\n")
    elbdr_checker_top.write("    );\n")
    elbdr_checker_top.write("    port (  empty: in  std_logic;\n")
    elbdr_checker_top.write("            flit_type: in std_logic_vector(2 downto 0);\n")
    elbdr_checker_top.write("            Req_N_in, Req_W_in, Req_S_in, Req_L_in: in std_logic;\n")
    elbdr_checker_top.write("            dst_addr: in std_logic_vector(NoC_size-1 downto 0);\n")
    elbdr_checker_top.write("\n")
    elbdr_checker_top.write("            -- Checker outputs\n")

    string_to_write = ""
    if '1' in checker_id:
        string_to_write += "err_LBDR_Req_onehot,"
    if '2' in checker_id:
        string_to_write += "err_LBDR_dst_addr_checker,"
    if '3' in checker_id:
        string_to_write += "err_LBDR_Req_tail_allzero,"
    if '4' in checker_id:
        string_to_write += "err_LBDR_Req_allzero,"

    elbdr_checker_top.write(string_to_write[:len(string_to_write)-1]+": out std_logic -- , err_LBDR_Req_not_Local : out std_logic\n")

    elbdr_checker_top.write("            );\n")
    elbdr_checker_top.write("end component;\n")
    elbdr_checker_top.write("\n")
    elbdr_checker_top.write("signal Req_N_sig, Req_W_sig, Req_S_sig, Req_L_sig: std_logic;\n")
    elbdr_checker_top.write("\n")
    elbdr_checker_top.write("begin \n")
    elbdr_checker_top.write("\n")
    elbdr_checker_top.write("Req_N_in <= Req_N_sig;\n")
    elbdr_checker_top.write("Req_W_in <= Req_W_sig;\n")
    elbdr_checker_top.write("Req_S_in <= Req_S_sig;\n")
    elbdr_checker_top.write("Req_L_in <= Req_L_sig;\n")
    elbdr_checker_top.write("\n")
    elbdr_checker_top.write("\n")
    elbdr_checker_top.write("-- ELBDR instantiation\n")
    elbdr_checker_top.write("ELBDR: ELBDR_pseudo generic map (cur_addr_rst => 5, Rxy_rst => 60, Cx_rst => 15, NoC_size => 4)\n")
    elbdr_checker_top.write(" 				    port map (empty=>empty, flit_type=>flit_type, dst_addr=>dst_addr, \n")
    elbdr_checker_top.write("							Req_N_FF=>Req_N_FF, Req_W_FF=>Req_W_FF, Req_S_FF=>Req_S_FF, Req_L_FF=>Req_L_FF,\n")
    elbdr_checker_top.write(" 							Req_N_in=>Req_N_sig, Req_W_in=>Req_W_sig, Req_S_in=>Req_S_sig, Req_L_in=>Req_L_sig);\n")
    elbdr_checker_top.write("\n")
    elbdr_checker_top.write("-- Checkers instantiation\n")
    elbdr_checker_top.write("CHECKERS: ELBDR_checkers generic map (cur_addr_rst => 5, NoC_size => 4)\n")
    elbdr_checker_top.write("                         port map (empty=>empty, flit_type=>flit_type, \n")
    elbdr_checker_top.write("								  Req_N_in=>Req_N_sig, Req_W_in=>Req_W_sig, Req_S_in=>Req_S_sig, Req_L_in=>Req_L_sig, dst_addr => dst_addr,\n")
    string_to_write = ""
    if '1' in checker_id:
        string_to_write += "err_LBDR_Req_onehot => err_LBDR_Req_onehot,"
    if '2' in checker_id:
        string_to_write += "err_LBDR_dst_addr_checker => err_LBDR_dst_addr_checker,"
    if '3' in checker_id:
        string_to_write += "err_LBDR_Req_tail_allzero => err_LBDR_Req_tail_allzero,"
    if '4' in checker_id:
        string_to_write += "err_LBDR_Req_allzero => err_LBDR_Req_allzero,"

    elbdr_checker_top.write(string_to_write[:len(string_to_write)-1]+");\n")

    elbdr_checker_top.write("                                  -- err_LBDR_Req_not_Local => err_LBDR_Req_not_Local);\n")
    elbdr_checker_top.write("\n")
    elbdr_checker_top.write("end behavior;\n")
    
    elbdr_checker_top.close()

