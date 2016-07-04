# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
from misc import name_string_generator

def gen_lbdr_checkers(checker_id):
    name_string = name_string_generator(checker_id)

    lbdr_checker_vhd = open("checker_vhdl/lbdr_checker" + name_string + ".vhd", 'w')

    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("library ieee;\n")
    lbdr_checker_vhd.write("use ieee.std_logic_1164.all;\n")
    lbdr_checker_vhd.write("use IEEE.STD_LOGIC_ARITH.ALL;\n")
    lbdr_checker_vhd.write("use IEEE.STD_LOGIC_UNSIGNED.ALL;\n")
    lbdr_checker_vhd.write("use IEEE.NUMERIC_STD.all;\n")
    lbdr_checker_vhd.write("use IEEE.MATH_REAL.ALL;\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("entity LBDR_checkers is\n")
    lbdr_checker_vhd.write("	generic (\n")
    lbdr_checker_vhd.write("        cur_addr_rst: integer := 5;\n")
    lbdr_checker_vhd.write("        NoC_size: integer := 4\n")
    lbdr_checker_vhd.write("    );\n")
    lbdr_checker_vhd.write("    port (  empty: in  std_logic;\n")
    lbdr_checker_vhd.write("            flit_type: in std_logic_vector(2 downto 0);\n")
    lbdr_checker_vhd.write("            Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;\n")
    lbdr_checker_vhd.write("            Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: in std_logic;\n")
    lbdr_checker_vhd.write("            N1_out, E1_out, W1_out, S1_out: in std_logic;\n")
    lbdr_checker_vhd.write("            dst_addr: in std_logic_vector(NoC_size-1 downto 0);\n")
    lbdr_checker_vhd.write("\n")

    lbdr_checker_vhd.write("            -- Checker outputs\n")

    string_to_write = ""
    if '1' in checker_id:
        string_to_write += "err_header_not_empty_Requests_in_onehot,\n"
    if '2' in checker_id:
        string_to_write += "err_header_empty_Requests_FF_Requests_in,\n"
    if '3' in checker_id:
        string_to_write += "err_tail_Requests_in_all_zero,\n"
    if '4' in checker_id:
        string_to_write += "err_header_tail_Requests_FF_Requests_in,\n"
    if '5' in checker_id:
        string_to_write += "err_dst_addr_cur_addr_N1,\n"
    if '6' in checker_id:
        string_to_write += "err_dst_addr_cur_addr_not_N1,\n"
    if '7' in checker_id:
        string_to_write += "err_dst_addr_cur_addr_E1,\n"
    if '8' in checker_id:
        string_to_write += "err_dst_addr_cur_addr_not_E1,\n"
    if '9' in checker_id:
        string_to_write += "err_dst_addr_cur_addr_W1,\n"
    if '10' in checker_id:
        string_to_write += "err_dst_addr_cur_addr_not_W1,\n"
    if '11' in checker_id:
        string_to_write += "err_dst_addr_cur_addr_S1,\n"
    if '12' in checker_id:
        string_to_write += "err_dst_addr_cur_addr_not_S1,\n"
    if '13' in checker_id:
        string_to_write += "err_dst_addr_cur_addr_not_Req_L_in,\n"
    if '14' in checker_id:
        string_to_write += "err_dst_addr_cur_addr_Req_L_in,\n"
    if '15' in checker_id:
        string_to_write += "err_header_not_empty_Req_N_in,\n"
    if '16' in checker_id:
        string_to_write += "err_header_not_empty_Req_E_in,\n"
    if '17' in checker_id:
        string_to_write += "err_header_not_empty_Req_W_in,\n"
    if '18' in checker_id:
        string_to_write += "err_header_not_empty_Req_S_in,\n"

    string_to_write = string_to_write[:len(string_to_write)-2]
    string_to_write += " : out std_logic\n"

    lbdr_checker_vhd.write(string_to_write)

    lbdr_checker_vhd.write("            );\n")
    lbdr_checker_vhd.write("end LBDR_checkers;\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("architecture behavior of LBDR_checkers is\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("signal cur_addr:  std_logic_vector(NoC_size-1 downto 0);  \n")
    lbdr_checker_vhd.write("signal Requests_FF: std_logic_vector(4 downto 0);\n")
    lbdr_checker_vhd.write("signal Requests_in: std_logic_vector(4 downto 0);\n")
    lbdr_checker_vhd.write("\n")

    lbdr_checker_vhd.write("begin \n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("  cur_addr <= std_logic_vector(to_unsigned(cur_addr_rst, cur_addr'length));\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("  Requests_FF <= Req_N_FF & Req_E_FF & Req_W_FF & Req_S_FF & Req_L_FF;\n")
    lbdr_checker_vhd.write("  Requests_in <= Req_N_in & Req_E_in & Req_W_in & Req_S_in & Req_L_in;\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("-- Implementing checkers in form of concurrent assignments (combinational assertions)\n")
    lbdr_checker_vhd.write(" \n")

    if '1' in checker_id:
        lbdr_checker_vhd.write("process (flit_type, empty, Requests_in) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if (flit_type = \"001\" and empty = '0' and Requests_in /= \"00001\" and Requests_in /= \"00010\" and Requests_in /= \"00100\" and \n")
        lbdr_checker_vhd.write("        Requests_in /= \"01000\" and Requests_in /= \"10000\") then \n")
        lbdr_checker_vhd.write("        err_header_not_empty_Requests_in_onehot <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_header_not_empty_Requests_in_onehot <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    if '2' in checker_id:
        lbdr_checker_vhd.write("process (flit_type, empty, Requests_FF, Requests_in) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if (flit_type = \"001\" and empty = '1' and Requests_FF /= Requests_in) then \n")
        lbdr_checker_vhd.write("        err_header_empty_Requests_FF_Requests_in <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_header_empty_Requests_FF_Requests_in <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    if '3' in checker_id:
        lbdr_checker_vhd.write("process (flit_type, Requests_in) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if (flit_type = \"100\" and Requests_in /= \"00000\") then \n")
        lbdr_checker_vhd.write("        err_tail_Requests_in_all_zero <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_tail_Requests_in_all_zero <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    if '4' in checker_id:
        lbdr_checker_vhd.write("process (flit_type, Requests_FF, Requests_in) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if (flit_type /= \"001\" and flit_type /= \"100\" and Requests_FF /= Requests_in) then \n")
        lbdr_checker_vhd.write("        err_header_tail_Requests_FF_Requests_in <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_header_tail_Requests_FF_Requests_in <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    if '5' in checker_id:
        lbdr_checker_vhd.write("process (cur_addr, dst_addr, N1_out) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if ( dst_addr(NoC_size-1 downto NoC_size/2) < cur_addr(NoC_size-1 downto NoC_size/2) and N1_out = '0') then \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_N1 <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_N1 <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    if '6' in checker_id:
        lbdr_checker_vhd.write("process (cur_addr, dst_addr, N1_out) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if ( dst_addr(NoC_size-1 downto NoC_size/2) >= cur_addr(NoC_size-1 downto NoC_size/2) and N1_out = '1') then \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_not_N1 <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_not_N1 <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    if '7' in checker_id:
        lbdr_checker_vhd.write("process (cur_addr, dst_addr, E1_out) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if ( cur_addr((NoC_size/2)-1 downto 0) < dst_addr((NoC_size/2)-1 downto 0) and E1_out = '0') then \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_E1 <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_E1 <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    if '8' in checker_id:
        lbdr_checker_vhd.write("process (cur_addr, dst_addr, E1_out) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if ( cur_addr((NoC_size/2)-1 downto 0) >= dst_addr((NoC_size/2)-1 downto 0) and E1_out = '1') then \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_not_E1 <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_not_E1 <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    if '9' in checker_id:
        lbdr_checker_vhd.write("process (cur_addr, dst_addr, W1_out) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if ( dst_addr((NoC_size/2)-1 downto 0) < cur_addr((NoC_size/2)-1 downto 0) and W1_out = '0') then \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_W1 <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_W1 <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    if '10' in checker_id:
        lbdr_checker_vhd.write("process (cur_addr, dst_addr, W1_out) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if ( dst_addr((NoC_size/2)-1 downto 0) >= cur_addr((NoC_size/2)-1 downto 0) and W1_out = '1') then \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_not_W1 <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_not_W1 <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    if '11' in checker_id:
        lbdr_checker_vhd.write("process (cur_addr, dst_addr, S1_out) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if ( cur_addr(NoC_size-1 downto NoC_size/2) < dst_addr(NoC_size-1 downto NoC_size/2) and S1_out = '0') then \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_S1 <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_S1 <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    if '12' in checker_id:
        lbdr_checker_vhd.write("process (cur_addr, dst_addr, S1_out) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if ( cur_addr(NoC_size-1 downto NoC_size/2) >= dst_addr(NoC_size-1 downto NoC_size/2) and S1_out = '1') then \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_not_S1 <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_not_S1 <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    if '13' in checker_id:
        lbdr_checker_vhd.write("process (flit_type, empty, N1_out, E1_out, W1_out, S1_out, Req_L_in) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if ( flit_type = \"001\" and empty = '0' and Req_L_in /= (not N1_out and not E1_out and not W1_out and not S1_out) ) then \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_not_Req_L_in <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_not_Req_L_in <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    if '14' in checker_id:
        lbdr_checker_vhd.write("process (flit_type, empty, cur_addr, dst_addr, Req_L_in) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if ( flit_type = \"001\" and empty = '0' and cur_addr /= dst_addr and Req_L_in = '1') then \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_Req_L_in <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_dst_addr_cur_addr_Req_L_in <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    if '15' in checker_id:
        lbdr_checker_vhd.write("process (flit_type, empty, Req_N_in, N1_out, E1_out, W1_out) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if ( flit_type = \"001\" and empty = '0' and Req_N_in /= (N1_out and not E1_out and not W1_out) ) then \n")
        lbdr_checker_vhd.write("        err_header_not_empty_Req_N_in <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_header_not_empty_Req_N_in <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    if '16' in checker_id:
        lbdr_checker_vhd.write("process (flit_type, empty, Req_E_in, N1_out, E1_out, S1_out) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if ( flit_type = \"001\" and empty = '0' and Req_E_in /= ((E1_out and not N1_out and not S1_out) or  \n")
        lbdr_checker_vhd.write("         (E1_out and N1_out) or (E1_out and S1_out)) ) then \n")
        lbdr_checker_vhd.write("        err_header_not_empty_Req_E_in <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_header_not_empty_Req_E_in <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    if '17' in checker_id:
        lbdr_checker_vhd.write("process (flit_type, empty, Req_W_in, N1_out, W1_out, S1_out) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if ( flit_type = \"001\" and empty = '0' and Req_W_in /= ((W1_out and not N1_out and not S1_out) or  \n")
        lbdr_checker_vhd.write("         (W1_out and N1_out) or (W1_out and S1_out)) ) then \n")
        lbdr_checker_vhd.write("        err_header_not_empty_Req_W_in <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_header_not_empty_Req_W_in <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    if '18' in checker_id:
        lbdr_checker_vhd.write("process (flit_type, empty, Req_S_in, E1_out, W1_out, S1_out) \n")
        lbdr_checker_vhd.write("begin \n")
        lbdr_checker_vhd.write("    if ( flit_type = \"001\" and empty = '0' and Req_S_in /= (S1_out and not E1_out and not W1_out) ) then \n")
        lbdr_checker_vhd.write("        err_header_not_empty_Req_S_in <= '1'; \n")
        lbdr_checker_vhd.write("    else  \n")
        lbdr_checker_vhd.write("        err_header_not_empty_Req_S_in <= '0'; \n")
        lbdr_checker_vhd.write("    end if; \n")
        lbdr_checker_vhd.write("end process; \n")
        lbdr_checker_vhd.write(" \n")

    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("end behavior;\n")
    lbdr_checker_vhd.write("\n")

    lbdr_checker_vhd.close()