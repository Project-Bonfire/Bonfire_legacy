# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
from misc import name_string_generator

def gen_fifo_checkers(checker_id):
    name_string = name_string_generator(checker_id)

    fifo_checker_vhd = open("checker_vhdl/fifo_control_part_checker" + name_string + ".vhd", 'w')
    
    fifo_checker_vhd.write("library ieee;\n")
    fifo_checker_vhd.write("use ieee.std_logic_1164.all;\n")
    fifo_checker_vhd.write("use IEEE.STD_LOGIC_ARITH.ALL;\n")
    fifo_checker_vhd.write("use IEEE.STD_LOGIC_UNSIGNED.ALL;\n")
    fifo_checker_vhd.write("use IEEE.NUMERIC_STD.all;\n")
    fifo_checker_vhd.write("use IEEE.MATH_REAL.ALL;\n")
    fifo_checker_vhd.write("\n")
    fifo_checker_vhd.write("entity FIFO_control_part_checkers is\n")
    fifo_checker_vhd.write("    port (  DRTS: in std_logic;\n")
    fifo_checker_vhd.write("            CTS_out: in std_logic;\n")
    fifo_checker_vhd.write("            CTS_in: in std_logic;\n")
    fifo_checker_vhd.write("            read_en_N : in std_logic;\n")
    fifo_checker_vhd.write("            read_en_E : in std_logic;            \n")
    fifo_checker_vhd.write("            read_en_W : in std_logic;\n")
    fifo_checker_vhd.write("            read_en_S : in std_logic;\n")
    fifo_checker_vhd.write("            read_en_L : in std_logic;\n")
    fifo_checker_vhd.write("            read_pointer: in std_logic_vector(3 downto 0);\n")
    fifo_checker_vhd.write("            read_pointer_in: in std_logic_vector(3 downto 0);\n")
    fifo_checker_vhd.write("            write_pointer: in std_logic_vector(3 downto 0); \n")
    fifo_checker_vhd.write("            write_pointer_in: in std_logic_vector(3 downto 0); \n")
    fifo_checker_vhd.write("            empty_out: in std_logic;\n")
    fifo_checker_vhd.write("            full_out: in std_logic;\n")
    fifo_checker_vhd.write("            read_en_out: in std_logic;\n")
    fifo_checker_vhd.write("            write_en_out: in std_logic; \n")
    fifo_checker_vhd.write("\n")
    fifo_checker_vhd.write("            -- Checker outputs\n")

    string_to_write = ""
    if '1' in checker_id:
        string_to_write += "err_write_en_write_pointer,\n"
    if '2' in checker_id:
        string_to_write += "err_not_write_en_write_pointer,\n"
    if '3' in checker_id:
        string_to_write += "err_read_pointer_write_pointer_not_empty,\n"
    if '4' in checker_id:
        string_to_write += "err_read_pointer_write_pointer_empty,\n"
    if '5' in checker_id:
        string_to_write += "err_read_pointer_write_pointer_not_full,\n"
    if '6' in checker_id:
        string_to_write += "err_read_pointer_write_pointer_full,\n"
    if '7' in checker_id:
        string_to_write += "err_read_pointer_increment,\n"
    if '8' in checker_id:
        string_to_write += "err_read_pointer_not_increment,\n"
    if '9' in checker_id:
        string_to_write += "err_CTS_in,\n"
    if '10' in checker_id:
        string_to_write += "err_write_en,\n"
    if '11' in checker_id:
        string_to_write += "err_not_CTS_in,\n"
    if '12' in checker_id:
        string_to_write += "err_not_write_en,\n"
    if '13' in checker_id:
        string_to_write += "err_read_en_mismatch,\n"

    string_to_write = string_to_write[:len(string_to_write)-2]
    string_to_write += " : out std_logic\n"
    fifo_checker_vhd.write(string_to_write)

    fifo_checker_vhd.write("            );\n")
    fifo_checker_vhd.write("end FIFO_control_part_checkers;\n")
    fifo_checker_vhd.write("\n")
    fifo_checker_vhd.write("architecture behavior of FIFO_control_part_checkers is\n")
    fifo_checker_vhd.write("\n")
    fifo_checker_vhd.write("signal read_en_signal: std_logic; \n")
    fifo_checker_vhd.write("\n")
    fifo_checker_vhd.write("begin \n")
    fifo_checker_vhd.write("\n")    
    fifo_checker_vhd.write("read_en_signal <= (read_en_N or read_en_E or read_en_W or read_en_S or read_en_L) and not empty_out; \n")
    fifo_checker_vhd.write("\n")
    fifo_checker_vhd.write("-- Checkers\n")
    fifo_checker_vhd.write("\n")

    if '1' in checker_id:
        fifo_checker_vhd.write("process (write_en_out, write_pointer_in, write_pointer)\n")
        fifo_checker_vhd.write("begin\n")
        fifo_checker_vhd.write("    if (write_en_out = '1' and write_pointer_in /= (write_pointer(2 downto 0) & write_pointer(3)) ) then\n")
        fifo_checker_vhd.write("        err_write_en_write_pointer <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("        err_write_en_write_pointer <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '2' in checker_id:
        fifo_checker_vhd.write("process (write_en_out, write_pointer_in, write_pointer)\n")
        fifo_checker_vhd.write("begin\n")
        fifo_checker_vhd.write("    if (write_en_out = '0' and write_pointer_in /= write_pointer ) then\n")
        fifo_checker_vhd.write("        err_not_write_en_write_pointer <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("        err_not_write_en_write_pointer <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '3' in checker_id:
        fifo_checker_vhd.write("process (read_pointer, write_pointer, empty_out)\n")
        fifo_checker_vhd.write("begin\n")
        fifo_checker_vhd.write("    if (read_pointer = write_pointer and empty_out = '0' ) then\n")
        fifo_checker_vhd.write("        err_read_pointer_write_pointer_not_empty <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("        err_read_pointer_write_pointer_not_empty <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '4' in checker_id:
        fifo_checker_vhd.write("process (read_pointer, write_pointer, empty_out)\n")
        fifo_checker_vhd.write("begin\n")
        fifo_checker_vhd.write("    if (read_pointer /= write_pointer and empty_out = '1' ) then\n")
        fifo_checker_vhd.write("        err_read_pointer_write_pointer_empty <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("        err_read_pointer_write_pointer_empty <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '5' in checker_id:
        fifo_checker_vhd.write("process (write_pointer, read_pointer, full_out)\n")
        fifo_checker_vhd.write("begin\n")
        fifo_checker_vhd.write("    if (write_pointer = (read_pointer(0)&read_pointer(3 downto 1)) and full_out = '0' ) then\n")
        fifo_checker_vhd.write("        err_read_pointer_write_pointer_not_full <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("        err_read_pointer_write_pointer_not_full <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '6' in checker_id:
        fifo_checker_vhd.write("process (write_pointer, read_pointer, full_out)\n")
        fifo_checker_vhd.write("begin\n")
        fifo_checker_vhd.write("    if (write_pointer /= (read_pointer(0)&read_pointer(3 downto 1)) and full_out = '1' ) then\n")
        fifo_checker_vhd.write("        err_read_pointer_write_pointer_full <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("        err_read_pointer_write_pointer_full <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '7' in checker_id:
        fifo_checker_vhd.write("process (read_en_out, empty_out, read_pointer_in, read_pointer)\n")
        fifo_checker_vhd.write("begin\n")
        fifo_checker_vhd.write("    if (read_en_out = '1' and empty_out = '0' and read_pointer_in /= (read_pointer(2 downto 0)&read_pointer(3)) ) then\n")
        fifo_checker_vhd.write("         err_read_pointer_increment <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("         err_read_pointer_increment <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '8' in checker_id:
        fifo_checker_vhd.write("process (read_en_out, empty_out, read_pointer_in, read_pointer)\n")
        fifo_checker_vhd.write("begin\n")
        fifo_checker_vhd.write("    if ( (read_en_out = '0' or (read_en_out = '1' and empty_out = '1') ) and read_pointer_in /= read_pointer ) then\n")
        fifo_checker_vhd.write("         err_read_pointer_not_increment <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("         err_read_pointer_not_increment <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '9' in checker_id:
        fifo_checker_vhd.write("process (CTS_out, DRTS, full_out, CTS_in)\n")
        fifo_checker_vhd.write("begin\n")
        fifo_checker_vhd.write("    if (CTS_out = '0' and DRTS = '1' and full_out = '0' and CTS_in = '0') then\n")
        fifo_checker_vhd.write("         err_CTS_in <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("         err_CTS_in <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '10' in checker_id:
        fifo_checker_vhd.write("process (CTS_out, DRTS, full_out, write_en_out)\n")
        fifo_checker_vhd.write("begin\n")
        fifo_checker_vhd.write("    if (CTS_out = '0' and DRTS = '1' and full_out = '0' and write_en_out = '0') then\n")
        fifo_checker_vhd.write("         err_write_en <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("         err_write_en <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '11' in checker_id:
        fifo_checker_vhd.write("process (CTS_out, DRTS, full_out, CTS_in)\n")
        fifo_checker_vhd.write("begin\n")
        fifo_checker_vhd.write("    if ( (CTS_out = '1' or (CTS_out = '0' and DRTS = '0') or (CTS_out = '0' and DRTS = '1' and full_out = '1')) and CTS_in = '1') then\n")
        fifo_checker_vhd.write("         err_not_CTS_in <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("         err_not_CTS_in <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '12' in checker_id:
        fifo_checker_vhd.write("process (CTS_out, DRTS, full_out, write_en_out)\n")
        fifo_checker_vhd.write("begin\n")
        fifo_checker_vhd.write("    if ( (CTS_out = '1' or (CTS_out = '0' and DRTS = '0') or (CTS_out = '0' and DRTS = '1' and full_out = '1')) and write_en_out = '1') then\n")
        fifo_checker_vhd.write("         err_not_write_en <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("         err_not_write_en <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '13' in checker_id:
        fifo_checker_vhd.write("process (read_en_out, read_en_signal)\n")
        fifo_checker_vhd.write("begin\n")
        fifo_checker_vhd.write("    if (read_en_out /= read_en_signal) then\n")
        fifo_checker_vhd.write("         err_read_en_mismatch <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("         err_read_en_mismatch <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    fifo_checker_vhd.write("\n")
    fifo_checker_vhd.write("end behavior;\n")

    fifo_checker_vhd.close()