# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand

def gen_elbdr_checkers(checker_id):
    name_string = ""
    for i in checker_id:
        name_string += str(i)+"_"
    elbdr_checker_vhd = open("checker_vhdl/elbdr_checker"+name_string[:len(name_string)-1]+".vhd", 'w')

    elbdr_checker_vhd.write("library ieee;\n")
    elbdr_checker_vhd.write("use ieee.std_logic_1164.all;\n")
    elbdr_checker_vhd.write("use IEEE.STD_LOGIC_ARITH.ALL;\n")
    elbdr_checker_vhd.write("use IEEE.STD_LOGIC_UNSIGNED.ALL;\n")
    elbdr_checker_vhd.write("use IEEE.NUMERIC_STD.all;\n")
    elbdr_checker_vhd.write("use IEEE.MATH_REAL.ALL;\n")
    elbdr_checker_vhd.write("\n")
    elbdr_checker_vhd.write("entity ELBDR_checkers is\n")
    elbdr_checker_vhd.write("    generic (\n")
    elbdr_checker_vhd.write("        cur_addr_rst: integer := 5;\n")
    elbdr_checker_vhd.write("        NoC_size: integer := 4\n")
    elbdr_checker_vhd.write("    );\n")
    elbdr_checker_vhd.write("    port (  empty: in  std_logic;\n")
    elbdr_checker_vhd.write("            flit_type: in std_logic_vector(2 downto 0);\n")
    elbdr_checker_vhd.write("            Req_N_in, Req_W_in, Req_S_in, Req_L_in: in std_logic;\n")
    elbdr_checker_vhd.write("            dst_addr: in std_logic_vector(NoC_size-1 downto 0);\n")
    elbdr_checker_vhd.write("\n")
    elbdr_checker_vhd.write("            -- Checker outputs\n")

    string_to_write = ""
    if '1' in checker_id:
        string_to_write += "err_LBDR_Req_onehot,"
    if '2' in checker_id:
        string_to_write += "err_LBDR_dst_addr_checker,"
    if '3' in checker_id:
        string_to_write += "err_LBDR_Req_tail_allzero,"
    if '4' in checker_id:
        string_to_write += "err_LBDR_Req_allzero,"    

    elbdr_checker_vhd.write(string_to_write[:len(string_to_write)-1]+": out std_logic -- , err_LBDR_Req_not_Local : out std_logic\n")
    elbdr_checker_vhd.write("            );\n")
    elbdr_checker_vhd.write("end ELBDR_checkers;\n")
    elbdr_checker_vhd.write("\n")
    elbdr_checker_vhd.write("architecture behavior of ELBDR_checkers is\n")
    elbdr_checker_vhd.write("\n")
    elbdr_checker_vhd.write("signal cur_addr:  std_logic_vector(NoC_size-1 downto 0);  \n")
    elbdr_checker_vhd.write("\n")
    elbdr_checker_vhd.write("begin\n") 
    elbdr_checker_vhd.write("\n")
    elbdr_checker_vhd.write("  cur_addr <= std_logic_vector(to_unsigned(cur_addr_rst, cur_addr'length));\n")
    elbdr_checker_vhd.write("\n")
    elbdr_checker_vhd.write("-- Implementing checkers in form of concurrent assignments (combinational assertions)\n")
    elbdr_checker_vhd.write("\n")
    
    if '1' in checker_id:
        elbdr_checker_vhd.write("-- If empty is zero (If FIFO is not empty), Request outputs of LBDR must be one-hot\n")
        elbdr_checker_vhd.write("process(flit_type, empty, Req_N_in, Req_W_in, Req_S_in, Req_L_in)begin\n")
        elbdr_checker_vhd.write("    if (flit_type = \"010\" or flit_type = \"001\") then\n")
        elbdr_checker_vhd.write("         err_LBDR_Req_onehot <= not ( empty or (\n")
        elbdr_checker_vhd.write("                            ((    Req_N_in) and (not Req_W_in) and (not Req_S_in) and (not Req_L_in)) or \n")
        elbdr_checker_vhd.write("                            ((not Req_N_in) and (    Req_W_in) and (not Req_S_in) and (not Req_L_in)) or \n")
        elbdr_checker_vhd.write("                            ((not Req_N_in) and (not Req_W_in) and (    Req_S_in) and (not Req_L_in)) or \n")
        elbdr_checker_vhd.write("                            ((not Req_N_in) and (not Req_W_in) and (not Req_S_in) and (    Req_L_in))));\n")
        elbdr_checker_vhd.write("    else\n")
        elbdr_checker_vhd.write("        err_LBDR_Req_onehot <= '0';\n")
        elbdr_checker_vhd.write("    end if;\n")
        elbdr_checker_vhd.write("end process;\n")
        elbdr_checker_vhd.write("\n")

    if '3' in checker_id:
        elbdr_checker_vhd.write("-- For tail flit, all output requests of LBDR must be zero!\n")
        elbdr_checker_vhd.write("process(flit_type, empty, Req_N_in, Req_W_in, Req_S_in, Req_L_in)begin\n")
        elbdr_checker_vhd.write("    if ( empty = '0' and flit_type = \"100\" and (Req_N_in = '1' or Req_W_in = '1' "
                                "or Req_S_in = '1' or Req_L_in = '1') ) then\n")
        elbdr_checker_vhd.write("        err_LBDR_Req_tail_allzero <= '1';\n")
        elbdr_checker_vhd.write("    else \n")
        elbdr_checker_vhd.write("        err_LBDR_Req_tail_allzero <= '0';\n")
        elbdr_checker_vhd.write("    end if;\n")
        elbdr_checker_vhd.write("end process;\n")
        elbdr_checker_vhd.write("\n")

    if '4' in checker_id:
        elbdr_checker_vhd.write("-- If empty is one (If FIFO is empty), all the Request outputs of LBDR must be zero   \n")
        elbdr_checker_vhd.write("err_LBDR_Req_allzero <= empty and (Req_N_in or Req_W_in or Req_S_in or Req_L_in);\n")
        elbdr_checker_vhd.write("\n")
        elbdr_checker_vhd.write("-- Checking destination address (Depending on the location of the destination node with respect to the current node, if wrong requests from LBDR\n")
        elbdr_checker_vhd.write("-- go active, there is a fault!)\n")

    if '2' in checker_id:
        elbdr_checker_vhd.write("process (empty, flit_type, dst_addr, Req_N_in, Req_W_in, Req_S_in) -- , Req_L_in)\n")
        elbdr_checker_vhd.write("begin\n")
        elbdr_checker_vhd.write("    -- North\n")
        elbdr_checker_vhd.write("    if (empty = '0') and (flit_type = \"001\") and (dst_addr = \"0001\") and (Req_N_in = '0') then \n")
        elbdr_checker_vhd.write("        err_LBDR_dst_addr_checker <= '1';\n")
        elbdr_checker_vhd.write("    -- West\n")
        elbdr_checker_vhd.write("    elsif (empty = '0') and (flit_type = \"001\") and (dst_addr = \"0000\" or "
                                "dst_addr = \"0100\" or dst_addr = \"1000\" or dst_addr = \"1100\") and "
                                "(Req_W_in = '0') then \n")
        elbdr_checker_vhd.write("        err_LBDR_dst_addr_checker <= '1';\n")
        elbdr_checker_vhd.write("    -- South\n")
        elbdr_checker_vhd.write("    elsif (empty = '0') and (flit_type = \"001\") and (dst_addr = \"1001\" or "
                                "dst_addr = \"1101\") and (Req_S_in = '0') then \n")
        elbdr_checker_vhd.write("        err_LBDR_dst_addr_checker <= '1';\n")
        elbdr_checker_vhd.write("    else\n")
        elbdr_checker_vhd.write("        err_LBDR_dst_addr_checker <= '0';\n")
        elbdr_checker_vhd.write("    end if;\n")
        elbdr_checker_vhd.write("end process;\n")
        elbdr_checker_vhd.write("\n")
    elbdr_checker_vhd.write("end behavior;\n")


