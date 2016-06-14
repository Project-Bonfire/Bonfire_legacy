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
    fifo_checker_vhd.write("            HS_state_in: in std_logic_vector(1 downto 0);         \n")
    fifo_checker_vhd.write("\n")
    fifo_checker_vhd.write("            -- Checker outputs\n")

    string_to_write = ""
    if '1' in checker_id:
        string_to_write += "err_FIFO_control_part_DRTS_CTS,"
    if '2' in checker_id:
        string_to_write += "err_FIFO_write_pointer_update,"
    if '3' in checker_id:
        string_to_write += "err_FIFO_read_pointer_not_update,"
    if '4' in checker_id:
        string_to_write += "err_FIFO_write_pointer_not_update,"
    if '5' in checker_id:
        string_to_write += "err_FIFO_full_empty,"
    if '6' in checker_id:
        string_to_write += "err_FIFO_empty,"
    if '7' in checker_id:
        string_to_write += "err_FIFO_empty1,"
    if '8' in checker_id:
        string_to_write += "err_FIFO_full,"
    if '9' in checker_id:
        string_to_write += "err_FIFO_read_pointer_onehot,"
    if '10' in checker_id:
        string_to_write += "err_FIFO_write_pointer_onehot,"
    if '11' in checker_id:
        string_to_write += "err_FIFO_HS_state_onehot,"
    if '12' in checker_id:
        string_to_write += "err_FIFO_read_en_onehot,"
    if '13' in checker_id:
        string_to_write += "err_FIFO_read_from_empty_FIFO,"
    if '14' in checker_id:
        string_to_write += "err_FIFO_write_to_full_FIFO,"
    if '15' in checker_id:
        string_to_write += "err_FIFO_control_part_CTS_in_CTS_out,"
    if '16' in checker_id:
        string_to_write += "err_FIFO_read_en_empty,"
    if '17' in checker_id:
        string_to_write += "err_FIFO_read_en_empty1,"

    string_to_write = string_to_write[:len(string_to_write)-1]
    string_to_write += " : out std_logic\n"
    fifo_checker_vhd.write(string_to_write)

    fifo_checker_vhd.write("            );\n")
    fifo_checker_vhd.write("end FIFO_control_part_checkers;\n")
    fifo_checker_vhd.write("\n")
    fifo_checker_vhd.write("architecture behavior of FIFO_control_part_checkers is\n")
    fifo_checker_vhd.write("\n")
    fifo_checker_vhd.write("signal read_en_signals: std_logic_vector(4 downto 0);\n")
    fifo_checker_vhd.write("\n")
    fifo_checker_vhd.write("begin \n")
    fifo_checker_vhd.write("\n")
    fifo_checker_vhd.write("-- Checkers\n")
    fifo_checker_vhd.write("\n")

    if '11' in checker_id:
        fifo_checker_vhd.write("-- When FIFO has received a request (and in any case) the "
                               "internal state of the FSM of the FIFO must be one-hot!\n")
        fifo_checker_vhd.write("process( HS_state_in) begin\n")
        fifo_checker_vhd.write("    if (HS_state_in /= \"01\" and HS_state_in /= \"10\") then\n")
        fifo_checker_vhd.write("        err_FIFO_HS_state_onehot <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("        err_FIFO_HS_state_onehot <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '1' in checker_id:
        fifo_checker_vhd.write("-- When FIFO has not received a request, It can not send Clear to Send "
                               "(When DRTS=0, CTS must be 0)!\n")
        fifo_checker_vhd.write("process(DRTS, CTS_out, full_out, CTS_in) begin\n")
        fifo_checker_vhd.write("    if ( ((DRTS = '0' or CTS_out = '1' or full_out ='1') and CTS_in = '1') ) then\n")
        fifo_checker_vhd.write("        err_FIFO_control_part_DRTS_CTS <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("        err_FIFO_control_part_DRTS_CTS <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '15' in checker_id:
        fifo_checker_vhd.write("-- If there is a request to FIFO for writing and CTS_out is zero and the FIFO "
                               "is not full, CTS_in must also be zero!\n")
        fifo_checker_vhd.write("process(CTS_out, DRTS, full_out, CTS_in) begin\n")
        fifo_checker_vhd.write("    if (CTS_out = '0' and DRTS = '1' and full_out ='0' and CTS_in = '0') then\n")
        fifo_checker_vhd.write("        err_FIFO_control_part_CTS_in_CTS_out <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("        err_FIFO_control_part_CTS_in_CTS_out <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    fifo_checker_vhd.write("read_en_signals <= read_en_N & read_en_E & read_en_W & read_en_S & read_en_L;\n")
    fifo_checker_vhd.write("\n")

    if '12' in checker_id:
        fifo_checker_vhd.write("-- Read_en from Arbiters can either be all zeros or must be one-hot!\n")
        fifo_checker_vhd.write("process(read_en_out, empty_out, read_en_signals) begin\n")
        fifo_checker_vhd.write("    if ( (read_en_out = '1' and empty_out = '0' and "
                               "read_en_signals /= \"10000\" and read_en_signals /= \"01000\" and "
                               "read_en_signals /= \"00100\" and read_en_signals /= \"00010\" and "
                               "read_en_signals /= \"00001\") or (read_en_out = '0' and empty_out = '0' and "
                               "read_en_signals /=\"00000\" ) ) then\n")
        fifo_checker_vhd.write("        err_FIFO_read_en_onehot <= '1';\n")
        fifo_checker_vhd.write("    else \n")
        fifo_checker_vhd.write("        err_FIFO_read_en_onehot <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '16' in checker_id:
        fifo_checker_vhd.write("process(read_en_signals, empty_out, read_en_out) begin\n")
        fifo_checker_vhd.write("    if ( (read_en_signals = \"00000\" or empty_out = '1') and "
                               "read_en_out = '1' ) then\n")
        fifo_checker_vhd.write("        err_FIFO_read_en_empty <= '1';\n")
        fifo_checker_vhd.write("    else \n")
        fifo_checker_vhd.write("        err_FIFO_read_en_empty <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '17' in checker_id:
        fifo_checker_vhd.write("process(read_en_N, read_en_W, read_en_S, read_en_L, empty_out) begin\n")
        fifo_checker_vhd.write("    if ( (read_en_N = '1' or read_en_E = '1' or read_en_W = '1' or "
                               "read_en_S = '1' or read_en_L = '1') and empty_out = '0' and read_en_out = '0' ) then\n")
        fifo_checker_vhd.write("        err_FIFO_read_en_empty1 <= '1';\n")
        fifo_checker_vhd.write("    else \n")
        fifo_checker_vhd.write("        err_FIFO_read_en_empty1 <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '3' in checker_id:
        fifo_checker_vhd.write("-- If there is no request for reading from the FIFO or the FIFO is empty, read pointer "
                               "must not be updated (it must remain the previous value)!\n")
        fifo_checker_vhd.write("process(read_en_out, empty_out, read_pointer, read_pointer_in) begin\n")
        fifo_checker_vhd.write("    if ( ((read_en_out = '0') or (empty_out = '1')) and "
                               "(read_pointer_in /= read_pointer)) then\n")
        fifo_checker_vhd.write("        err_FIFO_read_pointer_not_update <= '1';\n")
        fifo_checker_vhd.write("    else \n")
        fifo_checker_vhd.write("        err_FIFO_read_pointer_not_update <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '2' in checker_id:
        fifo_checker_vhd.write("-- If there is a request for writing to the FIFO and the FIFO is "
                               "not full, write pointer must be updated!\n")
        fifo_checker_vhd.write("process(write_en_out, full_out, write_pointer, write_pointer_in) begin\n")
        fifo_checker_vhd.write("    if ( (write_en_out = '1') and (full_out = '0') and "
                               "(write_pointer_in = write_pointer)) then\n")
        fifo_checker_vhd.write("        err_FIFO_write_pointer_update <= '1';\n")
        fifo_checker_vhd.write("    else \n")
        fifo_checker_vhd.write("        err_FIFO_write_pointer_update <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '4' in checker_id:
        fifo_checker_vhd.write("-- If there is no request for writing to the FIFO or the FIFO is full, "
                               "write pointer must not be updated (it must remain the previous value)!\n")
        fifo_checker_vhd.write("process(write_en_out, full_out, write_pointer, write_pointer_in) begin\n")
        fifo_checker_vhd.write("    if ( ((write_en_out = '0') or (full_out = '1')) and "
                               "(write_pointer_in /= write_pointer)) then\n")
        fifo_checker_vhd.write("        err_FIFO_write_pointer_not_update <= '1';\n")
        fifo_checker_vhd.write("    else \n")
        fifo_checker_vhd.write("        err_FIFO_write_pointer_not_update <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '5' in checker_id:
        fifo_checker_vhd.write("-- The FIFO cannot be full and empty at the same time\n")
        fifo_checker_vhd.write("process(DRTS, full_out, empty_out) begin\n")
        fifo_checker_vhd.write("    if (DRTS = '1' and full_out = '1' and  empty_out = '1') then\n")
        fifo_checker_vhd.write("        err_FIFO_full_empty <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("        err_FIFO_full_empty <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '6' in checker_id:
        fifo_checker_vhd.write("-- if read_pointer and write_pointer are pointing to the same location, "
                               "empty must be high (active) !\n")
        fifo_checker_vhd.write("process(read_pointer, write_pointer, empty_out) begin\n")
        fifo_checker_vhd.write("    if ((read_pointer = write_pointer) and empty_out = '0') then\n")
        fifo_checker_vhd.write("        err_FIFO_empty <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("        err_FIFO_empty <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '7' in checker_id:
        fifo_checker_vhd.write("process(read_pointer, write_pointer, empty_out) begin\n")
        fifo_checker_vhd.write("    if ((read_pointer /= write_pointer) and empty_out = '1') then\n")
        fifo_checker_vhd.write("        err_FIFO_empty1 <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("        err_FIFO_empty1 <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '8' in checker_id:
        fifo_checker_vhd.write("-- if read_pointer is pointing to one location after write_pointer "
                               "(in a circular manner), "
                               "full must be high (active) !\n")
        fifo_checker_vhd.write("process(read_pointer, read_pointer_in, write_pointer, "
                               "write_pointer_in, full_out) begin\n")
        fifo_checker_vhd.write("    if ((write_pointer = read_pointer(0)&read_pointer(3 downto 1) ) "
                               "and full_out = '0') then\n")
        fifo_checker_vhd.write("        err_FIFO_full <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("        err_FIFO_full <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '13' in checker_id:
        fifo_checker_vhd.write("-- Reading from an empty FIFO is not possible!\n")
        fifo_checker_vhd.write("process(read_en_out, empty_out) begin\n")
        fifo_checker_vhd.write("    if (read_en_out = '1' and empty_out = '1') then\n")
        fifo_checker_vhd.write("        err_FIFO_read_from_empty_FIFO <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("        err_FIFO_read_from_empty_FIFO <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '14' in checker_id:
        fifo_checker_vhd.write("-- Writing to a full FIFO is not possible!\n")
        fifo_checker_vhd.write("process(write_en_out, full_out) begin\n")
        fifo_checker_vhd.write("    if (write_en_out = '1' and full_out = '1') then\n")
        fifo_checker_vhd.write("        err_FIFO_write_to_full_FIFO <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("        err_FIFO_write_to_full_FIFO <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '9' in checker_id:
        fifo_checker_vhd.write("process(read_pointer, read_pointer_in) begin\n")
        fifo_checker_vhd.write("    if ((read_pointer /= \"00001\" and read_pointer /= \"00010\" and "
                               "read_pointer /= \"00100\" and read_pointer /= \"01000\" and read_pointer /= \"10000\") "
                               "or (read_pointer_in /= \"00001\" and read_pointer_in /= \"00010\" and "
                               "read_pointer_in /= \"00100\" and read_pointer_in /= \"01000\" and "
                               "read_pointer_in /= \"10000\")) then\n")
        fifo_checker_vhd.write("        err_FIFO_read_pointer_onehot <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("        err_FIFO_read_pointer_onehot <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    if '10' in checker_id:
        fifo_checker_vhd.write("process(write_pointer, write_pointer_in) begin\n")
        fifo_checker_vhd.write("    if ((write_pointer /= \"00001\" and write_pointer /= \"00010\" and "
                               "write_pointer /= \"00100\" and write_pointer /= \"01000\" and "
                               "write_pointer /= \"10000\")or"
                               "(write_pointer_in /= \"00001\" and write_pointer_in /= \"00010\" and "
                               "write_pointer_in /= \"00100\" and write_pointer_in /= \"01000\" and "
                               "write_pointer_in /= \"10000\")) then\n")
        fifo_checker_vhd.write("        err_FIFO_write_pointer_onehot <= '1';\n")
        fifo_checker_vhd.write("    else\n")
        fifo_checker_vhd.write("        err_FIFO_write_pointer_onehot <= '0';\n")
        fifo_checker_vhd.write("    end if;\n")
        fifo_checker_vhd.write("end process;\n")
        fifo_checker_vhd.write("\n")

    fifo_checker_vhd.write("\n")
    fifo_checker_vhd.write("end behavior;\n")

    fifo_checker_vhd.close()