# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand


def gen_lbdr_checkers(checker_id):
    name_string = ""
    for i in checker_id:
        name_string += str(i)
    lbdr_checker_vhd = open("checker_vhdl/lbdr_checker"+name_string+".vhd", 'w')

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
    lbdr_checker_vhd.write("            Req_N, Req_E, Req_W, Req_S, Req_L: in std_logic;\n")
    lbdr_checker_vhd.write("            dst_addr: in std_logic_vector(NoC_size-1 downto 0);\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("            -- Checker outputs\n")

    lbdr_checker_vhd.write("            ")
    string_to_be_written = ""
    if 1 in checker_id:
        string_to_be_written += "err_LBDR_Req_onehot,"
    if 2 in checker_id:
        string_to_be_written += "err_LBDR_Req_allzero,"
    if 3 in checker_id:
        string_to_be_written += "err_LBDR_dst_addr_checker,"
    if 4 in checker_id:
        string_to_be_written += "err_LBDR_Req_Local,"

    lbdr_checker_vhd.write(string_to_be_written[:len(string_to_be_written)-1]+": out std_logic\n")
    lbdr_checker_vhd.write("            );\n")

    lbdr_checker_vhd.write("end LBDR_checkers;\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("architecture behavior of LBDR_checkers is\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("signal cur_addr:  std_logic_vector(NoC_size-1 downto 0);\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("begin\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("  cur_addr <= std_logic_vector(to_unsigned(cur_addr_rst, cur_addr'length));\n")
    lbdr_checker_vhd.write("\n")
    lbdr_checker_vhd.write("-- Implementing checkers in form of concurrent assignments (combinational assertions)\n")
    lbdr_checker_vhd.write("\n")

    if 1 in checker_id:
        lbdr_checker_vhd.write("-- If empty is zero (If FIFO is not empty), Request outputs of LBDR must be one-hot\n")
        lbdr_checker_vhd.write("process(flit_type, empty, Req_N, Req_E, Req_W, Req_S, Req_L)begin\n")
        lbdr_checker_vhd.write("if (flit_type = \"010\" or flit_type = \"001\") then\n")
        lbdr_checker_vhd.write("	err_LBDR_Req_onehot <= not ( empty or (\n")
        lbdr_checker_vhd.write("\t((	  Req_N) and (not Req_E) and (not Req_W) and (not Req_S) and (not Req_L)) or\n")
        lbdr_checker_vhd.write("\t((not Req_N) and (    Req_E) and (not Req_W) and (not Req_S) and (not Req_L)) or\n")
        lbdr_checker_vhd.write("\t((not Req_N) and (not Req_E) and (    Req_W) and (not Req_S) and (not Req_L)) or\n")
        lbdr_checker_vhd.write("\t((not Req_N) and (not Req_E) and (not Req_W) and (    Req_S) and (not Req_L)) or\n")
        lbdr_checker_vhd.write("\t((not Req_N) and (not Req_E) and (not Req_W) and (not Req_S) and (    Req_L))));\n")
        lbdr_checker_vhd.write("else\n")
        lbdr_checker_vhd.write("	err_LBDR_Req_onehot <= '0';\n")
        lbdr_checker_vhd.write("end if;\n")
        lbdr_checker_vhd.write("end process;\n")
        lbdr_checker_vhd.write("\n")

    if 2 in checker_id:
        lbdr_checker_vhd.write("-- If empty is one (If FIFO is empty), all the Request outputs of LBDR must be zero\n")
        lbdr_checker_vhd.write("err_LBDR_Req_allzero <= empty and (Req_N or Req_E or Req_W or Req_S or Req_L);\n")
        lbdr_checker_vhd.write("\n")

    if 3 in checker_id:
        lbdr_checker_vhd.write("-- Checking destination address (Depending on the location of the destination node "
                               "with respect to the current node, if wrong requests from LBDR\n")
        lbdr_checker_vhd.write("-- go active, there is a fault!)\n")
        lbdr_checker_vhd.write("process (dst_addr, Req_N, Req_E, Req_W, cur_addr, empty, flit_type)\n")
        lbdr_checker_vhd.write("begin\n")
        lbdr_checker_vhd.write("	-- North\n")
        lbdr_checker_vhd.write("	if (empty = '0') and (flit_type = \"001\") and (dst_addr(3 downto 2) < cur_addr(3 downto 2)) and (Req_N = '0' and Req_E = '0' and Req_W = '0') then\n")
        lbdr_checker_vhd.write("		err_LBDR_dst_addr_checker <= '1';\n")
        lbdr_checker_vhd.write("	-- East\n")
        lbdr_checker_vhd.write("	elsif (empty = '0') and (flit_type = \"001\") and (cur_addr((4/2)-1 downto 0) < dst_addr((4/2)-1 downto 0)) and (Req_E = '0') then\n")
        lbdr_checker_vhd.write("		err_LBDR_dst_addr_checker <= '1';\n")
        lbdr_checker_vhd.write("	-- West\n")
        lbdr_checker_vhd.write("	elsif (empty = '0') and (flit_type = \"001\") and (dst_addr((4/2)-1 downto 0) < cur_addr((4/2)-1 downto 0)) and (Req_W = '0') then\n")
        lbdr_checker_vhd.write("		err_LBDR_dst_addr_checker <= '1';\n")
        lbdr_checker_vhd.write("	-- South\n")
        lbdr_checker_vhd.write("	elsif (empty = '0') and (flit_type = \"001\") and (cur_addr(4-1 downto 4/2) < dst_addr(4-1 downto 4/2)) and (Req_S = '0' and Req_E = '0' and Req_W = '0') then\n")
        lbdr_checker_vhd.write("		err_LBDR_dst_addr_checker <= '1';\n")
        lbdr_checker_vhd.write("	else\n")
        lbdr_checker_vhd.write("		err_LBDR_dst_addr_checker <= '0';\n")
        lbdr_checker_vhd.write("	end if;\n")
        lbdr_checker_vhd.write("end process;\n")
        lbdr_checker_vhd.write("\n")

    if 4 in checker_id:
        lbdr_checker_vhd.write("-- If the header flit has reached its destination node, the L output "
                                "request of LBDR must go active and others must be zero!\n")
        lbdr_checker_vhd.write("process (dst_addr, Req_N, Req_E, Req_W, cur_addr, empty, flit_type, empty)\n")
        lbdr_checker_vhd.write("begin\n")
        lbdr_checker_vhd.write("	if ( (empty = '0') and (flit_type = \"001\") and "
                               "(dst_addr = cur_addr) and (Req_L = '0') ) then\n")
        lbdr_checker_vhd.write("		err_LBDR_Req_Local <= '1';\n")
        lbdr_checker_vhd.write("	else\n")
        lbdr_checker_vhd.write("		err_LBDR_Req_Local <= '0';\n")
        lbdr_checker_vhd.write("	end if;\n")
        lbdr_checker_vhd.write("end process;\n")
        lbdr_checker_vhd.write("\n")

    lbdr_checker_vhd.write("end behavior;\n")