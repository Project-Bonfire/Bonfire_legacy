# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
from misc import name_string_generator


def gen_fifo_checker_top(checker_id):
    name_string = name_string_generator(checker_id)
    
    fifo_checker_top = open("checker_vhdl/fifo_checker"+name_string+"_top.vhd", 'w')

    fifo_checker_top.write("library ieee;\n")
    fifo_checker_top.write("use ieee.std_logic_1164.all;\n")
    fifo_checker_top.write("use IEEE.STD_LOGIC_ARITH.ALL;\n")
    fifo_checker_top.write("use IEEE.STD_LOGIC_UNSIGNED.ALL;\n")
    fifo_checker_top.write("use IEEE.NUMERIC_STD.all;\n")
    fifo_checker_top.write("use IEEE.MATH_REAL.ALL;\n")
    fifo_checker_top.write("\n")
    fifo_checker_top.write("entity FIFO_control_part_with_checkers_top is\n")
    fifo_checker_top.write("    port (  DRTS: in std_logic;  \n")
    fifo_checker_top.write("            read_en_N : in std_logic;\n")
    fifo_checker_top.write("            read_en_E : in std_logic;                        \n")
    fifo_checker_top.write("            read_en_W : in std_logic;\n")
    fifo_checker_top.write("            read_en_S : in std_logic;\n")
    fifo_checker_top.write("            read_en_L : in std_logic;\n")
    fifo_checker_top.write("            read_pointer: in std_logic_vector(3 downto 0);\n")
    fifo_checker_top.write("            write_pointer: in std_logic_vector(3 downto 0);\n")
    fifo_checker_top.write("            CTS_out: in std_logic;\n")
    fifo_checker_top.write("            HS_state_out: in std_logic_vector(1 downto 0);\n")
    fifo_checker_top.write("\n")
    fifo_checker_top.write("            CTS_in: out std_logic; \n")
    fifo_checker_top.write("            empty_out: out std_logic; \n")
    fifo_checker_top.write("            full_out: out std_logic;\n")
    fifo_checker_top.write("            read_pointer_in: out std_logic_vector(3 downto 0); \n")
    fifo_checker_top.write("            write_pointer_in: out std_logic_vector(3 downto 0);\n")
    fifo_checker_top.write("            read_en_out: out std_logic;\n")
    fifo_checker_top.write("            write_en_out: out std_logic; \n")
    fifo_checker_top.write("            HS_state_in: out std_logic_vector(1 downto 0);\n")
    fifo_checker_top.write("\n")
    fifo_checker_top.write("            -- Checker outputs\n")

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
    fifo_checker_top.write(string_to_write)

    fifo_checker_top.write("    );\n")
    fifo_checker_top.write("end FIFO_control_part_with_checkers_top;\n")
    fifo_checker_top.write("\n")
    fifo_checker_top.write("architecture behavior of FIFO_control_part_with_checkers_top is\n")
    fifo_checker_top.write("\n")
    fifo_checker_top.write("component FIFO_control_part_pseudo is\n")
    fifo_checker_top.write("    port (  DRTS: in std_logic;  \n")
    fifo_checker_top.write("            read_en_N : in std_logic;\n")
    fifo_checker_top.write("            read_en_E : in std_logic;                        \n")
    fifo_checker_top.write("            read_en_W : in std_logic;\n")
    fifo_checker_top.write("            read_en_S : in std_logic;\n")
    fifo_checker_top.write("            read_en_L : in std_logic;\n")
    fifo_checker_top.write("            read_pointer: in std_logic_vector(3 downto 0);\n")
    fifo_checker_top.write("            write_pointer: in std_logic_vector(3 downto 0);\n")
    fifo_checker_top.write("            CTS_out: in std_logic;\n")
    fifo_checker_top.write("            HS_state_out: in std_logic_vector(1 downto 0);\n")
    fifo_checker_top.write("\n")
    fifo_checker_top.write("            CTS_in: out std_logic; \n")
    fifo_checker_top.write("            empty_out: out std_logic; \n")
    fifo_checker_top.write("            full_out: out std_logic;\n")
    fifo_checker_top.write("            read_pointer_in: out std_logic_vector(3 downto 0); \n")
    fifo_checker_top.write("            write_pointer_in: out std_logic_vector(3 downto 0);\n")
    fifo_checker_top.write("            read_en_out: out std_logic;\n")
    fifo_checker_top.write("            write_en_out: out std_logic; \n")
    fifo_checker_top.write("            HS_state_in: out std_logic_vector(1 downto 0)\n")
    fifo_checker_top.write("    );\n")
    fifo_checker_top.write("end component;\n")
    fifo_checker_top.write("\n")
    fifo_checker_top.write("component FIFO_control_part_checkers is\n")
    fifo_checker_top.write("    port (  DRTS: in std_logic;\n")
    fifo_checker_top.write("            CTS_out: in std_logic;\n")
    fifo_checker_top.write("            CTS_in: in std_logic;\n")
    fifo_checker_top.write("            read_en_N : in std_logic;\n")
    fifo_checker_top.write("            read_en_E : in std_logic;                        \n")
    fifo_checker_top.write("            read_en_W : in std_logic;\n")
    fifo_checker_top.write("            read_en_S : in std_logic;\n")
    fifo_checker_top.write("            read_en_L : in std_logic;\n")
    fifo_checker_top.write("            read_pointer: in std_logic_vector(3 downto 0);\n")
    fifo_checker_top.write("            read_pointer_in: in std_logic_vector(3 downto 0);\n")
    fifo_checker_top.write("            write_pointer: in std_logic_vector(3 downto 0); \n")
    fifo_checker_top.write("            write_pointer_in: in std_logic_vector(3 downto 0); \n")
    fifo_checker_top.write("            empty_out: in std_logic;\n")
    fifo_checker_top.write("            full_out: in std_logic;\n")
    fifo_checker_top.write("            read_en_out: in std_logic;\n")
    fifo_checker_top.write("            write_en_out: in std_logic; \n")
    fifo_checker_top.write("            HS_state_in: in std_logic_vector(1 downto 0);         \n")
    fifo_checker_top.write("\n")
    fifo_checker_top.write("            -- Checker outputs\n")

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
    fifo_checker_top.write(string_to_write)

    fifo_checker_top.write("            );\n")
    fifo_checker_top.write("end component;\n")
    fifo_checker_top.write("\n")
    fifo_checker_top.write("signal CTS_in_sig, empty_out_sig, full_out_sig, read_en_out_sig, write_en_out_sig: std_logic;\n")
    fifo_checker_top.write("signal read_pointer_in_sig, write_pointer_in_sig: std_logic_vector(3 downto 0);\n")
    fifo_checker_top.write("signal HS_state_in_sig : std_logic_vector(1 downto 0);\n")
    fifo_checker_top.write("\n")
    fifo_checker_top.write("begin \n")
    fifo_checker_top.write("\n")
    fifo_checker_top.write("CTS_in <= CTS_in_sig;\n")
    fifo_checker_top.write("read_pointer_in <= read_pointer_in_sig;\n")
    fifo_checker_top.write("write_pointer_in <= write_pointer_in_sig;\n")
    fifo_checker_top.write("empty_out <= empty_out_sig;\n")
    fifo_checker_top.write("full_out <= full_out_sig;\n")
    fifo_checker_top.write("read_en_out <= read_en_out_sig;\n")
    fifo_checker_top.write("write_en_out <= write_en_out_sig;\n")
    fifo_checker_top.write("HS_state_in <= HS_state_in_sig;\n")
    fifo_checker_top.write("\n")
    fifo_checker_top.write("-- FEIFO Control Part instantiation\n")
    fifo_checker_top.write("FIFO_CONTROL_PART: FIFO_control_part_pseudo port map (DRTS => DRTS, \n")
    fifo_checker_top.write("                                                      read_en_N => read_en_N, read_en_E => read_en_E, read_en_W => read_en_W, read_en_S => read_en_S, read_en_L => read_en_L,\n")
    fifo_checker_top.write("                                                      CTS_out => CTS_out,\n")
    fifo_checker_top.write("                                                      read_pointer => read_pointer, write_pointer => write_pointer, \n")
    fifo_checker_top.write("                                                      HS_state_out => HS_state_out,\n")
    fifo_checker_top.write("\n")
    fifo_checker_top.write("                                                      CTS_in => CTS_in_sig, read_pointer_in => read_pointer_in_sig, write_pointer_in => write_pointer_in_sig,\n")
    fifo_checker_top.write("                                                      empty_out => empty_out_sig, full_out => full_out_sig, \n")
    fifo_checker_top.write("                                                      read_en_out => read_en_out_sig, write_en_out => write_en_out_sig, \n")
    fifo_checker_top.write("                                                      HS_state_in => HS_state_in_sig\n")
    fifo_checker_top.write("						                                          );\n")
    fifo_checker_top.write("                                  \n")
    fifo_checker_top.write("-- Checkers instantiation\n")
    fifo_checker_top.write("CHECKERS: FIFO_control_part_checkers port map (DRTS => DRTS,\n")
    fifo_checker_top.write("                                               CTS_in => CTS_in_sig, CTS_out => CTS_out,\n")
    fifo_checker_top.write("                                               read_en_N => read_en_N, read_en_E => read_en_E, read_en_W => read_en_W, read_en_S => read_en_S, read_en_L => read_en_L,\n")
    fifo_checker_top.write("                                               read_pointer => read_pointer, read_pointer_in => read_pointer_in_sig, write_pointer => write_pointer, write_pointer_in => write_pointer_in_sig,\n")
    fifo_checker_top.write("                                               empty_out => empty_out_sig, full_out => full_out_sig, \n")
    fifo_checker_top.write("                                               read_en_out => read_en_out_sig, write_en_out => write_en_out_sig,\n")
    fifo_checker_top.write("                                               HS_state_in => HS_state_in_sig,\n")
    fifo_checker_top.write("\n")

    string_to_write = ""
    if '1' in checker_id:
        string_to_write += "err_FIFO_control_part_DRTS_CTS => err_FIFO_control_part_DRTS_CTS,"
    if '2' in checker_id:
        string_to_write += "err_FIFO_write_pointer_update => err_FIFO_write_pointer_update,"
    if '3' in checker_id:
        string_to_write += "err_FIFO_read_pointer_not_update => err_FIFO_read_pointer_not_update,"
    if '4' in checker_id:
        string_to_write += "err_FIFO_write_pointer_not_update => err_FIFO_write_pointer_not_update,"
    if '5' in checker_id:
        string_to_write += "err_FIFO_full_empty => err_FIFO_full_empty,"
    if '6' in checker_id:
        string_to_write += "err_FIFO_empty => err_FIFO_empty,"
    if '7' in checker_id:
        string_to_write += "err_FIFO_empty1 => err_FIFO_empty1,"
    if '8' in checker_id:
        string_to_write += "err_FIFO_full => err_FIFO_full,"
    if '9' in checker_id:
        string_to_write += "err_FIFO_read_pointer_onehot => err_FIFO_read_pointer_onehot,"
    if '10' in checker_id:
        string_to_write += "err_FIFO_write_pointer_onehot => err_FIFO_write_pointer_onehot,"
    if '11' in checker_id:
        string_to_write += "err_FIFO_HS_state_onehot => err_FIFO_HS_state_onehot,"
    if '12' in checker_id:
        string_to_write += "err_FIFO_read_en_onehot => err_FIFO_read_en_onehot,"
    if '13' in checker_id:
        string_to_write += "err_FIFO_read_from_empty_FIFO => err_FIFO_read_from_empty_FIFO,"
    if '14' in checker_id:
        string_to_write += "err_FIFO_write_to_full_FIFO => err_FIFO_write_to_full_FIFO,"
    if '15' in checker_id:
        string_to_write += "err_FIFO_control_part_CTS_in_CTS_out => err_FIFO_control_part_CTS_in_CTS_out,"
    if '16' in checker_id:
        string_to_write += "err_FIFO_read_en_empty => err_FIFO_read_en_empty,"
    if '17' in checker_id:
        string_to_write += "err_FIFO_read_en_empty1 => err_FIFO_read_en_empty1,"

    string_to_write = string_to_write[:len(string_to_write)-1]
    fifo_checker_top.write(string_to_write)

    fifo_checker_top.write("                       );\n")
    fifo_checker_top.write("\n")
    fifo_checker_top.write("end behavior;\n")
 
    fifo_checker_top.close()
