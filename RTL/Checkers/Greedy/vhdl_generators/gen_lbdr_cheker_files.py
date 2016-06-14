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
    lbdr_checker_vhd.write("            dst_addr: in std_logic_vector(NoC_size-1 downto 0);\n")
    lbdr_checker_vhd.write("\n")

    lbdr_checker_vhd.write("            -- Checker outputs\n")

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

    lbdr_checker_vhd.write(string_to_write)

    lbdr_checker_vhd.write("            );\n")
    lbdr_checker_vhd.write("end LBDR_checkers;\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("architecture behavior of LBDR_checkers is\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("signal cur_addr:  std_logic_vector(NoC_size-1 downto 0);  \n")
    lbdr_checker_vhd.write("signal Requests_FF: std_logic_vector(4 downto 0);\n")
    lbdr_checker_vhd.write("signal Requests: std_logic_vector(4 downto 0);\n")
    lbdr_checker_vhd.write("\n")

    lbdr_checker_vhd.write("begin \n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("  cur_addr <= std_logic_vector(to_unsigned(cur_addr_rst, cur_addr'length));\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("  Requests_FF <= Req_N_FF & Req_E_FF & Req_W_FF & Req_S_FF & Req_L_FF;\n")
    lbdr_checker_vhd.write("  Requests <= Req_N_in & Req_E_in & Req_W_in & Req_S_in & Req_L_in;\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("-- Implementing checkers in form of concurrent assignments (combinational assertions)\n")
    lbdr_checker_vhd.write("\n")

    if '1' in checker_id:
        lbdr_checker_vhd.write("-- If empty is zero (If FIFO is not empty), Request outputs of LBDR must be one-hot\n")
        lbdr_checker_vhd.write("process(flit_type, empty, Requests)begin\n")
        lbdr_checker_vhd.write("if (flit_type = \"001\" and empty = '0' and Requests /= \"10000\" and "
                               "Requests /= \"01000\" and "
                               "Requests /= \"00100\" and Requests /= \"00010\" and Requests /= \"00001\") then\n")
        lbdr_checker_vhd.write("    err_LBDR_Req_onehot <= '1';\n")
        lbdr_checker_vhd.write("else\n")
        lbdr_checker_vhd.write("    err_LBDR_Req_onehot <= '0';\n")
        lbdr_checker_vhd.write("end if;\n")
        lbdr_checker_vhd.write("end process;\n")
        lbdr_checker_vhd.write("\n")

    if '2' in checker_id:
        lbdr_checker_vhd.write("-- Body flit\n")
        lbdr_checker_vhd.write("process(flit_type, Requests)begin\n")
        lbdr_checker_vhd.write("if (flit_type = \"010\" and Requests /= \"10000\" and Requests /= \"01000\" and "
                               "Requests /= \"00100\" and Requests /= \"00010\" and Requests /= \"00001\") then\n")
        lbdr_checker_vhd.write("    err_LBDR_Req_onehot1 <= '1';\n")
        lbdr_checker_vhd.write("else\n")
        lbdr_checker_vhd.write("    err_LBDR_Req_onehot1 <= '0';\n")
        lbdr_checker_vhd.write("end if;\n")
        lbdr_checker_vhd.write("end process;\n")
        lbdr_checker_vhd.write("\n")

    if '10' in checker_id:
        lbdr_checker_vhd.write("-- For tail flit, all output requests of LBDR must be zero!\n")
        lbdr_checker_vhd.write("process(flit_type, Requests)begin\n")
        lbdr_checker_vhd.write("    if (flit_type = \"100\" and Requests /= \"00000\" ) then\n")
        lbdr_checker_vhd.write("        err_LBDR_Req_tail_allzero <= '1';\n")
        lbdr_checker_vhd.write("    else \n")
        lbdr_checker_vhd.write("        err_LBDR_Req_tail_allzero <= '0';\n")
        lbdr_checker_vhd.write("    end if;\n")
        lbdr_checker_vhd.write("end process;\n")
        lbdr_checker_vhd.write("\n")

    if '3' in checker_id:
        lbdr_checker_vhd.write("-- Checking destination address (Depending on the location of the destination node "
                               "with respect to the current node, if wrong requests from LBDR\n")
        lbdr_checker_vhd.write("-- go active, there is a fault!)\n")
        lbdr_checker_vhd.write("process (empty, flit_type, dst_addr, cur_addr, Req_N_in, "
                               "Req_E_in, Req_W_in, Req_S_in)\n")
        lbdr_checker_vhd.write("begin\n")
        lbdr_checker_vhd.write("    -- North-East\n")
        lbdr_checker_vhd.write("    if (empty = '0' and flit_type = \"001\" and "
                               "(dst_addr(3 downto 2) < cur_addr(3 downto 2)) and "
                               "(cur_addr((4/2)-1 downto 0) < dst_addr((4/2)-1 downto 0)) and Req_E_in = '0') then \n")
        lbdr_checker_vhd.write("        err_LBDR_dst_addr_checker <= '1';\n")
        lbdr_checker_vhd.write("\n")
        lbdr_checker_vhd.write("    -- North-West\n")
        lbdr_checker_vhd.write("    elsif (empty = '0' and flit_type = \"001\" and "
                               "(dst_addr(3 downto 2) < cur_addr(3 downto 2)) and "
                               "(dst_addr((4/2)-1 downto 0) < cur_addr((4/2)-1 downto 0)) and Req_W_in = '0') then \n")
        lbdr_checker_vhd.write("        err_LBDR_dst_addr_checker <= '1';\n")
        lbdr_checker_vhd.write("\n")
        lbdr_checker_vhd.write("    -- South-East\n")
        lbdr_checker_vhd.write("    elsif (empty = '0' and flit_type = \"001\" and "
                               "(cur_addr(4-1 downto 4/2) < dst_addr(4-1 downto 4/2)) and "
                               "(cur_addr((4/2)-1 downto 0) < dst_addr((4/2)-1 downto 0)) and Req_E_in = '0') then \n")
        lbdr_checker_vhd.write("        err_LBDR_dst_addr_checker <= '1';\n")
        lbdr_checker_vhd.write("\n")
        lbdr_checker_vhd.write("    -- South-West\n")
        lbdr_checker_vhd.write("    elsif (empty = '0' and flit_type = \"001\" and "
                               "(cur_addr(4-1 downto 4/2) < dst_addr(4-1 downto 4/2)) and "
                               "(dst_addr((4/2)-1 downto 0) < cur_addr((4/2)-1 downto 0)) and Req_W_in = '0') then \n")
        lbdr_checker_vhd.write("        err_LBDR_dst_addr_checker <= '1';\n")
        lbdr_checker_vhd.write("\n")
        lbdr_checker_vhd.write("    -- North\n")
        lbdr_checker_vhd.write("    elsif (empty = '0' and flit_type = \"001\" and "
                               "(dst_addr(3 downto 2) < cur_addr(3 downto 2)) and "
                               "(cur_addr((4/2)-1 downto 0) = dst_addr((4/2)-1 downto 0)) and Req_N_in = '0') then \n")
        lbdr_checker_vhd.write("        err_LBDR_dst_addr_checker <= '1';\n")
        lbdr_checker_vhd.write("\n")
        lbdr_checker_vhd.write("    -- East\n")
        lbdr_checker_vhd.write("    elsif (empty = '0' and flit_type = \"001\" and "
                               "(cur_addr((4/2)-1 downto 0) < dst_addr((4/2)-1 downto 0)) and "
                               "(cur_addr(4-1 downto 4/2) = dst_addr(4-1 downto 4/2)) and Req_E_in = '0') then \n")
        lbdr_checker_vhd.write("        err_LBDR_dst_addr_checker <= '1';\n")
        lbdr_checker_vhd.write("\n")
        lbdr_checker_vhd.write("    -- West\n")
        lbdr_checker_vhd.write("    elsif (empty = '0' and flit_type = \"001\" and "
                               "(dst_addr((4/2)-1 downto 0) < cur_addr((4/2)-1 downto 0)) and "
                               "(cur_addr(4-1 downto 4/2) = dst_addr(4-1 downto 4/2)) and Req_W_in = '0') then \n")
        lbdr_checker_vhd.write("        err_LBDR_dst_addr_checker <= '1';\n")
        lbdr_checker_vhd.write("\n")
        lbdr_checker_vhd.write("    -- South\n")
        lbdr_checker_vhd.write("    elsif (empty = '0' and flit_type = \"001\" and "
                               "(cur_addr(4-1 downto 4/2) < dst_addr(4-1 downto 4/2)) and "
                               "(cur_addr((4/2)-1 downto 0) = dst_addr((4/2)-1 downto 0)) and Req_S_in = '0') then \n")
        lbdr_checker_vhd.write("        err_LBDR_dst_addr_checker <= '1';\n")
        lbdr_checker_vhd.write("\n")
        lbdr_checker_vhd.write("    else\n")
        lbdr_checker_vhd.write("        err_LBDR_dst_addr_checker <= '0';\n")
        lbdr_checker_vhd.write("    end if;\n")
        lbdr_checker_vhd.write("\n")
        lbdr_checker_vhd.write("end process;\n")
        lbdr_checker_vhd.write("\n")

    if '11' in checker_id:
        lbdr_checker_vhd.write(
            "-- If the header flit has reached its destination node, the L output request of "
            "LBDR must go active and others must be zero!\n")
        lbdr_checker_vhd.write("process (empty, flit_type, Req_L_FF, dst_addr, cur_addr, Req_L_in)\n")
        lbdr_checker_vhd.write("begin\n")
        lbdr_checker_vhd.write("    if ( ( (empty = '0' and flit_type = \"001\") or "
                               "(flit_type = \"010\" and Req_L_FF = '1')) and "
                               "(dst_addr = cur_addr) and (Req_L_in = '0') ) then\n")
        lbdr_checker_vhd.write("        err_LBDR_Req_Local <= '1';\n")
        lbdr_checker_vhd.write("    else\n")
        lbdr_checker_vhd.write("        err_LBDR_Req_Local <= '0';      \n")
        lbdr_checker_vhd.write("    end if;\n")
        lbdr_checker_vhd.write("end process;\n")
        lbdr_checker_vhd.write("\n")

    if '12' in checker_id:
        lbdr_checker_vhd.write("process (empty, flit_type, Req_L_FF, dst_addr, cur_addr, Req_L_in)\n")
        lbdr_checker_vhd.write("begin\n")
        lbdr_checker_vhd.write("    if ( ( (empty = '0' and flit_type = \"001\") or (flit_type /= \"001\" and "
                               "flit_type /= \"100\" and Req_L_FF = '0')) and (dst_addr /= cur_addr) and "
                               "(Req_L_in = '1') ) then\n")
        lbdr_checker_vhd.write("        err_LBDR_Req_Local1 <= '1';\n")
        lbdr_checker_vhd.write("    else\n")
        lbdr_checker_vhd.write("        err_LBDR_Req_Local1 <= '0';      \n")
        lbdr_checker_vhd.write("    end if;\n")
        lbdr_checker_vhd.write("end process;\n")
        lbdr_checker_vhd.write("\n")

    if '4' in checker_id:
        lbdr_checker_vhd.write("process (empty, flit_type, Requests)\n")
        lbdr_checker_vhd.write("begin\n")
        lbdr_checker_vhd.write("    if ( (Requests = \"00001\" or Requests = \"00010\" or Requests = \"00100\" or "
                               "Requests = \"01000\" or Requests = \"10000\") and flit_type /= \"001\" and "
                               "flit_type /= \"010\") then\n")
        lbdr_checker_vhd.write("        err_LBDR_valid_flit_type <= '1';\n")
        lbdr_checker_vhd.write("    else \n")
        lbdr_checker_vhd.write("        err_LBDR_valid_flit_type <= '0';\n")
        lbdr_checker_vhd.write("    end if;\n")
        lbdr_checker_vhd.write("end process;\n")
        lbdr_checker_vhd.write("\n")
    if '5' in checker_id:
        lbdr_checker_vhd.write("process (flit_type, Requests)\n")
        lbdr_checker_vhd.write("begin\n")
        lbdr_checker_vhd.write("    if ( Requests = \"00000\" and flit_type /= \"100\") then\n")
        lbdr_checker_vhd.write("        err_LBDR_valid_flit_type1 <= '1';\n")
        lbdr_checker_vhd.write("    else \n")
        lbdr_checker_vhd.write("        err_LBDR_valid_flit_type1 <= '0';\n")
        lbdr_checker_vhd.write("    end if;\n")
        lbdr_checker_vhd.write("end process;\n")
        lbdr_checker_vhd.write("\n")
    if '6' in checker_id:
        lbdr_checker_vhd.write("process (empty, Requests)\n")
        lbdr_checker_vhd.write("begin\n")
        lbdr_checker_vhd.write("    if (empty = '1' and Requests /= \"00000\" and Requests /= \"00001\" and "
                               "Requests /= \"00010\" and Requests /= \"00100\" and Requests /= \"01000\" and "
                               "Requests /= \"10000\") then\n")
        lbdr_checker_vhd.write("        err_LBDR_valid_flit_type2 <= '1';\n")
        lbdr_checker_vhd.write("    else \n")
        lbdr_checker_vhd.write("        err_LBDR_valid_flit_type2 <= '0';\n")
        lbdr_checker_vhd.write("    end if;\n")
        lbdr_checker_vhd.write("end process;\n")
        lbdr_checker_vhd.write("\n")

    if '7' in checker_id:
        lbdr_checker_vhd.write("process (empty, flit_type, Requests)\n")
        lbdr_checker_vhd.write("begin\n")
        lbdr_checker_vhd.write("    if ( empty = '0' and flit_type = \"001\" and Requests /= \"00001\" and "
                               "Requests /= \"00010\" and Requests /= \"00100\" and Requests /= \"01000\" and "
                               "Requests /= \"10000\" ) then\n")
        lbdr_checker_vhd.write("        err_LBDR_valid_flit_type3 <= '1';\n")
        lbdr_checker_vhd.write("    else \n")
        lbdr_checker_vhd.write("        err_LBDR_valid_flit_type3 <= '0';\n")
        lbdr_checker_vhd.write("    end if;\n")
        lbdr_checker_vhd.write("end process;\n")
        lbdr_checker_vhd.write("\n")

    if '8' in checker_id:
        lbdr_checker_vhd.write("process (empty, flit_type, Requests)\n")
        lbdr_checker_vhd.write("begin\n")
        lbdr_checker_vhd.write("    if ( (empty = '1' or flit_type /= \"001\") and Requests /= \"00000\" and "
                               "Requests /= \"00001\" and Requests /= \"00010\" and Requests /= \"00100\" and "
                               "Requests /= \"01000\" and Requests /= \"10000\" ) then\n")
        lbdr_checker_vhd.write("        err_LBDR_valid_flit_type4 <= '1';\n")
        lbdr_checker_vhd.write("    else \n")
        lbdr_checker_vhd.write("        err_LBDR_valid_flit_type4 <= '0';\n")
        lbdr_checker_vhd.write("    end if;\n")
        lbdr_checker_vhd.write("end process;\n")
        lbdr_checker_vhd.write("\n")

    if '9' in checker_id:
        lbdr_checker_vhd.write("process (empty, flit_type, Requests)\n")
        lbdr_checker_vhd.write("begin\n")
        lbdr_checker_vhd.write(
            "    if ( ( (empty = '1' and flit_type /= \"001\") or flit_type = \"010\") and "
            "Requests /= Requests_FF) then\n")
        lbdr_checker_vhd.write("        err_LBDR_valid_flit_type5 <= '1';\n")
        lbdr_checker_vhd.write("    else \n")
        lbdr_checker_vhd.write("        err_LBDR_valid_flit_type5 <= '0';\n")
        lbdr_checker_vhd.write("    end if;\n")
        lbdr_checker_vhd.write("end process;\n")

    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("end behavior;\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("\n")

    lbdr_checker_vhd.close()