# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
from misc import name_string_generator


def gen_arbiter_checkers(checker_id):
    name_string = name_string_generator(checker_id)
    arbiter_checker_vhd = open("checker_vhdl/arbiter_checker" + name_string + ".vhd", 'w')

    arbiter_checker_vhd.write("\n")

    arbiter_checker_vhd.write("library ieee;\n")
    arbiter_checker_vhd.write("use ieee.std_logic_1164.all;\n")
    arbiter_checker_vhd.write("use IEEE.STD_LOGIC_ARITH.ALL;\n")
    arbiter_checker_vhd.write("use IEEE.STD_LOGIC_UNSIGNED.ALL;\n")
    arbiter_checker_vhd.write("use IEEE.NUMERIC_STD.all;\n")
    arbiter_checker_vhd.write("use IEEE.MATH_REAL.ALL;\n")
    arbiter_checker_vhd.write("\n")

    arbiter_checker_vhd.write("entity Arbiter_checkers is\n")
    arbiter_checker_vhd.write("   port (  \n")
    arbiter_checker_vhd.write("           Req_N, Req_E, Req_W, Req_S, Req_L:in std_logic;\n")
    arbiter_checker_vhd.write("           DCTS: in std_logic; \n")
    arbiter_checker_vhd.write("           Grant_N, Grant_E, Grant_W, Grant_S, Grant_L: in std_logic;\n")
    arbiter_checker_vhd.write("           Xbar_sel : in std_logic_vector(4 downto 0);\n")
    arbiter_checker_vhd.write("           state: in std_logic_vector (5 downto 0);\n")
    arbiter_checker_vhd.write("           state_in: in std_logic_vector (5 downto 0);\n")
    arbiter_checker_vhd.write("           next_state_out: in std_logic_vector (5 downto 0);\n")
    arbiter_checker_vhd.write("           RTS_FF: in std_logic;\n")
    arbiter_checker_vhd.write("           RTS_FF_in: in std_logic;\n")
    arbiter_checker_vhd.write("\n")

    arbiter_checker_vhd.write("           -- Checker outputs \n")

    string_to_write = ""

    if '1' in checker_id:
        string_to_write += "err_state_IDLE_xbar,\n"
    if '2' in checker_id:
        string_to_write += "err_state_not_IDLE_xbar,\n"
    if '3' in checker_id:
        string_to_write += "err_state_IDLE_RTS_FF_in,\n"
    if '4' in checker_id:
        string_to_write += "err_state_not_IDLE_RTS_FF_RTS_FF_in,\n"
    if '5' in checker_id:
        string_to_write += "err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in,\n"
    if '6' in checker_id:
        string_to_write += "err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in,\n"
    if '7' in checker_id:
        string_to_write += "err_RTS_FF_not_DCTS_state_state_in,\n"
    if '8' in checker_id:
        string_to_write += "err_not_RTS_FF_state_in_next_state,\n"
    if '9' in checker_id:
        string_to_write += "err_RTS_FF_DCTS_state_in_next_state,\n"
    if '10' in checker_id:
        string_to_write += "err_not_DCTS_Grants,\n"
    if '11' in checker_id:
        string_to_write += "err_DCTS_not_RTS_FF_Grants,\n"
    if '12' in checker_id:
        string_to_write += "err_DCTS_RTS_FF_IDLE_Grants,\n"
    if '13' in checker_id:
        string_to_write += "err_DCTS_RTS_FF_not_IDLE_Grants_onehot,\n"
    if '14' in checker_id:
        string_to_write += "err_Requests_next_state_IDLE,\n"
    if '15' in checker_id:
        string_to_write += "err_IDLE_Req_L,\n"
    if '16' in checker_id:
        string_to_write += "err_Local_Req_L,\n"
    if '17' in checker_id:
        string_to_write += "err_North_Req_N,\n"
    if '18' in checker_id:
        string_to_write += "err_East_Req_E,\n"
    if '19' in checker_id:
        string_to_write += "err_West_Req_W,\n"
    if '20' in checker_id:
        string_to_write += "err_South_Req_S,\n"
    if '21' in checker_id:
        string_to_write += "err_IDLE_Req_N,\n"
    if '22' in checker_id:
        string_to_write += "err_Local_Req_N,\n"
    if '23' in checker_id:
        string_to_write += "err_North_Req_E,\n"
    if '24' in checker_id:
        string_to_write += "err_East_Req_W,\n"
    if '25' in checker_id:
        string_to_write += "err_West_Req_S,\n"
    if '26' in checker_id:
        string_to_write += "err_South_Req_L,\n"
    if '27' in checker_id:
        string_to_write += "err_IDLE_Req_E,\n"
    if '28' in checker_id:
        string_to_write += "err_Local_Req_E,\n"
    if '29' in checker_id:
        string_to_write += "err_North_Req_W,\n"
    if '30' in checker_id:
        string_to_write += "err_East_Req_S,\n"
    if '31' in checker_id:
        string_to_write += "err_West_Req_L,\n"
    if '32' in checker_id:
        string_to_write += "err_South_Req_N,\n"
    if '33' in checker_id:
        string_to_write += "err_IDLE_Req_W,\n"
    if '34' in checker_id:
        string_to_write += "err_Local_Req_W,\n"
    if '35' in checker_id:
        string_to_write += "err_North_Req_S,\n"
    if '36' in checker_id:
        string_to_write += "err_East_Req_L,\n"
    if '37' in checker_id:
        string_to_write += "err_West_Req_N,\n"
    if '38' in checker_id:
        string_to_write += "err_South_Req_E,\n"
    if '39' in checker_id:
        string_to_write += "err_IDLE_Req_S,\n"
    if '40' in checker_id:
        string_to_write += "err_Local_Req_S,\n"
    if '41' in checker_id:
        string_to_write += "err_North_Req_L,\n"
    if '42' in checker_id:
        string_to_write += "err_East_Req_N,\n"
    if '43' in checker_id:
        string_to_write += "err_West_Req_E,\n"
    if '44' in checker_id:
        string_to_write += "err_South_Req_W,\n"
    if '45' in checker_id:
        string_to_write += "err_next_state_onehot,\n"
    if '46' in checker_id:
        string_to_write += "err_state_in_onehot,\n"
    if '47' in checker_id:
        string_to_write += "err_DCTS_RTS_FF_state_Grant_L,\n"
    if '48' in checker_id:
        string_to_write += "err_DCTS_RTS_FF_state_Grant_N,\n"
    if '49' in checker_id:
        string_to_write += "err_DCTS_RTS_FF_state_Grant_E,\n"
    if '50' in checker_id:
        string_to_write += "err_DCTS_RTS_FF_state_Grant_W,\n"
    if '51' in checker_id:
        string_to_write += "err_DCTS_RTS_FF_state_Grant_S,\n"
    if '52' in checker_id:
        string_to_write += "err_state_north_xbar_sel,\n"
    if '53' in checker_id:
        string_to_write += "err_state_east_xbar_sel,\n"
    if '54' in checker_id:
        string_to_write += "err_state_west_xbar_sel,\n"
    if '55' in checker_id:
        string_to_write += "err_state_south_xbar_sel,\n"
    if '56' in checker_id:
        string_to_write += "err_state_local_xbar_sel,\n"

    string_to_write = string_to_write[:len(string_to_write) - 2]
    string_to_write += " : out std_logic\n"

    arbiter_checker_vhd.write(string_to_write)

    arbiter_checker_vhd.write("                );\n")
    arbiter_checker_vhd.write("end Arbiter_checkers;\n")

    arbiter_checker_vhd.write("\n")
    arbiter_checker_vhd.write("architecture behavior of Arbiter_checkers is\n")

    arbiter_checker_vhd.write("\n")
    arbiter_checker_vhd.write("CONSTANT IDLE: std_logic_vector (5 downto 0) := \"000001\";\n")
    arbiter_checker_vhd.write("CONSTANT Local: std_logic_vector (5 downto 0) := \"000010\";\n")
    arbiter_checker_vhd.write("CONSTANT North: std_logic_vector (5 downto 0) := \"000100\";\n")
    arbiter_checker_vhd.write("CONSTANT East: std_logic_vector (5 downto 0) := \"001000\";\n")
    arbiter_checker_vhd.write("CONSTANT West: std_logic_vector (5 downto 0) := \"010000\";\n")
    arbiter_checker_vhd.write("CONSTANT South: std_logic_vector (5 downto 0) := \"100000\";\n")

    arbiter_checker_vhd.write("\n")

    arbiter_checker_vhd.write("begin \n")
    arbiter_checker_vhd.write("\n")
    arbiter_checker_vhd.write("Requests <= Req_N & Req_E & Req_W & Req_S & Req_L; \n")
    arbiter_checker_vhd.write("Grants   <= Grant_N & Grant_E & Grant_W & Grant_S & Grant_L; \n")
    arbiter_checker_vhd.write("\n")
    arbiter_checker_vhd.write("-- Checkers\n")

    arbiter_checker_vhd.write("\n")

    if '1' in checker_id:
        arbiter_checker_vhd.write("process (Xbar_sel, state) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (state = IDLE and Xbar_sel /= "00000") then \n")
        arbiter_checker_vhd.write("        err_state_IDLE_xbar <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_state_IDLE_xbar <= '0';      \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")
    
    if '2' in checker_id:
        arbiter_checker_vhd.write("process (state, Xbar_sel) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if ( state /= IDLE and  \n")
        arbiter_checker_vhd.write("         Xbar_sel /= "00001" and Xbar_sel /= "00010" and Xbar_sel /= "00100" and Xbar_sel /= "01000" and Xbar_sel /= "10000") then  \n")
        arbiter_checker_vhd.write("        err_state_not_IDLE_xbar <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_state_not_IDLE_xbar <= '0';      \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '3' in checker_id:
        arbiter_checker_vhd.write("process (state, RTS_FF_in) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (state = IDLE and RTS_FF_in = '1') then \n")
        arbiter_checker_vhd.write("        err_state_IDLE_RTS_FF_in <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_state_IDLE_RTS_FF_in <= '0'; \n")
        arbiter_checker_vhd.write("    end if;      \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '4' in checker_id:
        arbiter_checker_vhd.write("process (state, RTS_FF, RTS_FF_in) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if ( (state = North or state = East or state = West or state = South or state = Local) and RTS_FF = '0' and RTS_FF = '0' and RTS_FF_in = '0') then \n")
        arbiter_checker_vhd.write("        err_state_not_IDLE_RTS_FF_RTS_FF_in <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_state_not_IDLE_RTS_FF_RTS_FF_in <= '0';  \n")
        arbiter_checker_vhd.write("    end if;      \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '5' in checker_id:
        arbiter_checker_vhd.write("process (state, DCTS, RTS_FF, RTS_FF_in) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if ( (state = North or state = East or state = West or state = South or state = Local) and RTS_FF = '1' and DCTS = '1' and RTS_FF_in = '1') then \n")
        arbiter_checker_vhd.write("        err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in <= '0'; \n")
        arbiter_checker_vhd.write("    end if;      \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '6' in checker_id:
        arbiter_checker_vhd.write("process (state, DCTS, RTS_FF, RTS_FF_in) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if ( (state = North or state = East or state = West or state = South or state = Local) and RTS_FF = '1' and DCTS = '0' and RTS_FF_in = '0') then \n")
        arbiter_checker_vhd.write("        err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in <= '0'; \n")
        arbiter_checker_vhd.write("    end if;          \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")
    
    if '7' in checker_id:
        arbiter_checker_vhd.write("process (RTS_FF, DCTS, state, state_in) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (RTS_FF = '1' and DCTS = '0' and state /= state_in) then \n")
        arbiter_checker_vhd.write("        err_RTS_FF_not_DCTS_state_state_in <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_RTS_FF_not_DCTS_state_state_in <= '0'; \n")
        arbiter_checker_vhd.write("    end if;   \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '8' in checker_id:
        arbiter_checker_vhd.write("process (RTS_FF, state_in, next_state_out) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (RTS_FF = '0' and state_in /= next_state_out) then \n")
        arbiter_checker_vhd.write("        err_not_RTS_FF_state_in_next_state <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_not_RTS_FF_state_in_next_state <= '0'; \n")
        arbiter_checker_vhd.write("    end if;   \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '9' in checker_id:
        arbiter_checker_vhd.write("process (RTS_FF, DCTS, state_in, next_state_out) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (RTS_FF = '1' and DCTS = '1' and state_in /= next_state_out) then \n")
        arbiter_checker_vhd.write("        err_RTS_FF_DCTS_state_in_next_state <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_RTS_FF_DCTS_state_in_next_state <= '0'; \n")
        arbiter_checker_vhd.write("    end if;   \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '10' in checker_id:
        arbiter_checker_vhd.write("process (RTS_FF, Grants) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (RTS_FF = '0' and Grants /= "00000") then \n")
        arbiter_checker_vhd.write("        err_not_DCTS_Grants <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_not_DCTS_Grants <= '0'; \n")
        arbiter_checker_vhd.write("    end if;   \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '11' in checker_id:
        arbiter_checker_vhd.write("process (DCTS, RTS_FF, Grants) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (RTS_FF = '1' and DCTS = '0' and Grants /= "00000") then \n")
        arbiter_checker_vhd.write("        err_DCTS_not_RTS_FF_Grants <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_DCTS_not_RTS_FF_Grants <= '0'; \n")
        arbiter_checker_vhd.write("    end if;   \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '12' in checker_id:
        arbiter_checker_vhd.write("process (DCTS, RTS_FF, state, Grants) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (DCTS = '1' and RTS_FF = '1' and state = IDLE and Grants /= "00000") then \n")
        arbiter_checker_vhd.write("        err_DCTS_RTS_FF_IDLE_Grants <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_DCTS_RTS_FF_IDLE_Grants <= '0'; \n")
        arbiter_checker_vhd.write("    end if;   \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '13' in checker_id:
        arbiter_checker_vhd.write("process (DCTS, RTS_FF, state, Grants) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (DCTS = '1' and RTS_FF = '1' and state /= IDLE and  \n")
        arbiter_checker_vhd.write("        Grants /= "00001" and Grants /= "00010" and Grants /= "00100" and Grants /= "01000" and Grants /= "10000") then \n")
        arbiter_checker_vhd.write(" \n")
        arbiter_checker_vhd.write("        err_DCTS_RTS_FF_not_IDLE_Grants_onehot <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_DCTS_RTS_FF_not_IDLE_Grants_onehot <= '0'; \n")
        arbiter_checker_vhd.write("    end if;   \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '14' in checker_id:
        arbiter_checker_vhd.write("process (state, Requests, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if ( (state = North or state = East or state = West or state = South or state = Local or state = IDLE) and Requests = "00000" and next_state_out /= IDLE ) then  \n")
        arbiter_checker_vhd.write("        err_Requests_next_state_IDLE <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_Requests_next_state_IDLE <= '0'; \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '15' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_L, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if ( state = IDLE and Req_L = '1' and next_state_out /= Local) then \n")
        arbiter_checker_vhd.write("        err_IDLE_Req_L <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_IDLE_Req_L <= '0';   \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '16' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_L, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if ( state /= IDLE and state /= North and state /=East and state /= West and state /= South and Req_L = '1' and next_state_out /= Local) then \n")
        arbiter_checker_vhd.write("        err_Local_Req_L <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_Local_Req_L <= '0';  \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '17' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_N, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = North and Req_N = '1' and next_state_out /= North) then \n")
        arbiter_checker_vhd.write("        err_North_Req_N <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_North_Req_N <= '0';  \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '18' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_E, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = East and Req_E = '1' and next_state_out /= East) then \n")
        arbiter_checker_vhd.write("        err_East_Req_E <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_East_Req_E <= '0';   \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '19' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_W, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = West and Req_W = '1' and next_state_out /= West) then \n")
        arbiter_checker_vhd.write("        err_West_Req_W <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_West_Req_W <= '0';   \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")
 
    if '20' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_S, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = South and Req_S = '1' and next_state_out /= South) then \n")
        arbiter_checker_vhd.write("        err_South_Req_S <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_South_Req_S <= '0';  \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '21' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_L, Req_N, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if ( state = IDLE and Req_L = '0' and Req_N = '1' and next_state_out /= North) then \n")
        arbiter_checker_vhd.write("        err_IDLE_Req_N <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_IDLE_Req_N <= '0';   \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '22' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_L, Req_N, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if ( state /= IDLE and state /= North and state /=East and state /=West and state /= South and Req_L = '0' and Req_N = '1' and next_state_out /= North) then \n")
        arbiter_checker_vhd.write("        err_Local_Req_N <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_Local_Req_N <= '0';  \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '23' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_N, Req_E, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = North and Req_N = '0' and Req_E = '1' and next_state_out /= East) then \n")
        arbiter_checker_vhd.write("        err_North_Req_E <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_North_Req_E <= '0';  \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '24' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_E, Req_W, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = East and Req_E = '0' and Req_W = '1' and next_state_out /= West) then \n")
        arbiter_checker_vhd.write("        err_East_Req_W <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_East_Req_W <= '0';   \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '25' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_W, Req_S, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = West and Req_W = '0' and Req_S = '1' and next_state_out /= South) then \n")
        arbiter_checker_vhd.write("        err_West_Req_S <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_West_Req_S <= '0';   \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '26' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_S, Req_L, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = South and Req_S = '0' and Req_L = '1' and next_state_out /= Local) then \n")
        arbiter_checker_vhd.write("        err_South_Req_L <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_South_Req_L <= '0';  \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '27' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_L, Req_N, Req_E, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if ( state = IDLE and Req_L = '0' and Req_N = '0' and Req_E = '1' and next_state_out /= East) then \n")
        arbiter_checker_vhd.write("        err_IDLE_Req_E <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_IDLE_Req_E <= '0';   \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '28' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_L, Req_N, Req_E, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if ( state /= IDLE and state /= North and state /=East and state /=West and state /= South and  \n")
        arbiter_checker_vhd.write("         Req_L = '0' and Req_N = '0' and Req_E = '1' and next_state_out /= East) then \n")
        arbiter_checker_vhd.write("        err_Local_Req_E <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_Local_Req_E <= '0';  \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '29' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_N, Req_E, Req_W, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = North and Req_N = '0' and Req_E = '0' and Req_W = '1' and next_state_out /= West) then \n")
        arbiter_checker_vhd.write("        err_North_Req_W <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_North_Req_W <= '0';  \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '30' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_E, Req_W, Req_S, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = East and Req_E = '0' and Req_W = '0' and Req_S = '1' and next_state_out /= South) then \n")
        arbiter_checker_vhd.write("        err_East_Req_S <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_East_Req_S <= '0';   \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '31' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_W, Req_S, Req_L, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = West and Req_W = '0' and Req_S = '0' and Req_L = '1' and next_state_out /= Local) then \n")
        arbiter_checker_vhd.write("        err_West_Req_L <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_West_Req_L <= '0';   \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '32' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_S, Req_L, Req_N, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = South and Req_S = '0' and Req_L = '0' and Req_N = '1' and next_state_out /= North) then \n")
        arbiter_checker_vhd.write("        err_South_Req_N <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_South_Req_N <= '0';  \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '33' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_L, Req_N, Req_E, Req_W, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if ( state = IDLE and Req_L = '0' and Req_N = '0' and Req_E = '0' and Req_W = '1' and next_state_out /= West) then \n")
        arbiter_checker_vhd.write("        err_IDLE_Req_W <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_IDLE_Req_W <= '0';   \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '34' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_L, Req_N, Req_E, Req_W, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if ( state /= IDLE and state /= North and state /=East and state /=West and state /= South and  \n")
        arbiter_checker_vhd.write("         Req_L = '0' and Req_N = '0' and Req_E = '0' and Req_W = '1' and next_state_out /= West) then \n")
        arbiter_checker_vhd.write("        err_Local_Req_W <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_Local_Req_W <= '0';  \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '35' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_N, Req_E, Req_W, Req_S, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = North and Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '1' and next_state_out /= South) then \n")
        arbiter_checker_vhd.write("        err_North_Req_S <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_North_Req_S <= '0';  \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")
 
    if '36' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_E, Req_W, Req_S, Req_L, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = East and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '1' and next_state_out /= Local) then \n")
        arbiter_checker_vhd.write("        err_East_Req_L <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_East_Req_L <= '0';   \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '37' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_W, Req_S, Req_L, Req_N, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = West and Req_W = '0' and Req_S = '0' and Req_L = '0' and Req_N = '1' and next_state_out /= North) then \n")
        arbiter_checker_vhd.write("        err_West_Req_N <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_West_Req_N <= '0';   \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '38' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_S, Req_L, Req_N, Req_E, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = South and Req_S = '0' and Req_L = '0' and Req_N = '0' and Req_E = '1' and next_state_out /= East) then \n")
        arbiter_checker_vhd.write("        err_South_Req_E <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_South_Req_E <= '0';  \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '39' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_L, Req_N, Req_E, Req_W, Req_S, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if ( state = IDLE and Req_L = '0' and Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '1'  \n")
        arbiter_checker_vhd.write("        and next_state_out /= South) then \n")
        arbiter_checker_vhd.write("        err_IDLE_Req_S <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_IDLE_Req_S <= '0';   \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '40' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_L, Req_N, Req_E, Req_W, Req_S, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if ( state /= IDLE and state /= North and state /=East and state /=West and state /= South and  \n")
        arbiter_checker_vhd.write("         Req_L = '0' and Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '1'  \n")
        arbiter_checker_vhd.write("        and next_state_out /= South) then \n")
        arbiter_checker_vhd.write("        err_Local_Req_S <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_Local_Req_S <= '0';  \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '41' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = North and Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '1'  \n")
        arbiter_checker_vhd.write("        and next_state_out /= Local) then \n")
        arbiter_checker_vhd.write("        err_North_Req_L <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_North_Req_L <= '0';  \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '42' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_E, Req_W, Req_S, Req_L, Req_N, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = East and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '0' and Req_N = '1'  \n")
        arbiter_checker_vhd.write("        and next_state_out /= North) then \n")
        arbiter_checker_vhd.write("        err_East_Req_N <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_East_Req_N <= '0';   \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '43' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_W, Req_S, Req_L, Req_N, Req_E, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = West and Req_W = '0' and Req_S = '0' and Req_L = '0' and Req_N = '0' and Req_E = '1'  \n")
        arbiter_checker_vhd.write("        and next_state_out /= East) then \n")
        arbiter_checker_vhd.write("        err_West_Req_E <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_West_Req_E <= '0';   \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '44' in checker_id:
        arbiter_checker_vhd.write("process (state, Req_S, Req_L, Req_N, Req_E, Req_W, next_state_out) \n")
        arbiter_checker_vhd.write("begin  \n")
        arbiter_checker_vhd.write("    if (state = South and Req_S = '0' and Req_L = '0' and Req_N = '0' and Req_E = '0' and Req_W = '1'  \n")
        arbiter_checker_vhd.write("        and next_state_out /= West) then \n")
        arbiter_checker_vhd.write("        err_South_Req_W <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_South_Req_W <= '0';  \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '45' in checker_id:
        arbiter_checker_vhd.write("process (next_state_out) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (next_state_out /= IDLE and next_state_out /= North and next_state_out /= East and next_state_out /= West and  \n")
        arbiter_checker_vhd.write("        next_state_out /= South and next_state_out /= Local) then \n")
        arbiter_checker_vhd.write("        err_next_state_onehot <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_next_state_onehot <= '0';    \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '46' in checker_id:
        arbiter_checker_vhd.write("process (state_in) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (state_in /= IDLE and state_in /= North and state_in /= East and state_in /= West and  \n")
        arbiter_checker_vhd.write("        state_in /= South and state_in /= Local) then \n")
        arbiter_checker_vhd.write("        err_state_in_onehot <= '1'; \n")
        arbiter_checker_vhd.write("    else  \n")
        arbiter_checker_vhd.write("        err_state_in_onehot <= '0'; \n")
        arbiter_checker_vhd.write("    end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '47' in checker_id:
        arbiter_checker_vhd.write("process (DCTS, RTS_FF, state, Grant_L) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (DCTS = '1' and RTS_FF = '1' and state /= IDLE and state /= North and state /=East and state /=West and  \n")
        arbiter_checker_vhd.write("        state /= South and Grant_L = '0' ) then \n")
        arbiter_checker_vhd.write("        err_DCTS_RTS_FF_state_Grant_L <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_DCTS_RTS_FF_state_Grant_L <= '0'; \n")
        arbiter_checker_vhd.write("    end if;   \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")
 
    if '48' in checker_id:
        arbiter_checker_vhd.write("process (DCTS, RTS_FF, state, Grant_N) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (DCTS = '1' and RTS_FF = '1' and state = North and Grant_N = '0' ) then \n")
        arbiter_checker_vhd.write("        err_DCTS_RTS_FF_state_Grant_N <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_DCTS_RTS_FF_state_Grant_N <= '0'; \n")
        arbiter_checker_vhd.write("    end if;   \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '49' in checker_id:
        arbiter_checker_vhd.write("process (DCTS, RTS_FF, state, Grant_E) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (DCTS = '1' and RTS_FF = '1' and state = East and Grant_E = '0' ) then \n")
        arbiter_checker_vhd.write("        err_DCTS_RTS_FF_state_Grant_E <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_DCTS_RTS_FF_state_Grant_E <= '0'; \n")
        arbiter_checker_vhd.write("    end if;   \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '50' in checker_id:
        arbiter_checker_vhd.write("process (DCTS, RTS_FF, state, Grant_W) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (DCTS = '1' and RTS_FF = '1' and state = West and Grant_W = '0' ) then \n")
        arbiter_checker_vhd.write("        err_DCTS_RTS_FF_state_Grant_W <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_DCTS_RTS_FF_state_Grant_W <= '0'; \n")
        arbiter_checker_vhd.write("    end if;   \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '51' in checker_id:
        arbiter_checker_vhd.write("process (DCTS, RTS_FF, state, Grant_S) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (DCTS = '1' and RTS_FF = '1' and state = South and Grant_S = '0' ) then \n")
        arbiter_checker_vhd.write("        err_DCTS_RTS_FF_state_Grant_S <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_DCTS_RTS_FF_state_Grant_S <= '0'; \n")
        arbiter_checker_vhd.write("    end if;   \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '52' in checker_id:
        arbiter_checker_vhd.write("process (state, Xbar_sel) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (state = North and Xbar_sel /= "00001" ) then \n")
        arbiter_checker_vhd.write("        err_state_north_xbar_sel <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_state_north_xbar_sel <= '0'; \n")
        arbiter_checker_vhd.write("    end if;   \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '53' in checker_id:
        arbiter_checker_vhd.write("process (state, Xbar_sel) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (state = East and Xbar_sel /= "00010" ) then \n")
        arbiter_checker_vhd.write("        err_state_east_xbar_sel <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_state_east_xbar_sel <= '0'; \n")
        arbiter_checker_vhd.write("    end if;   \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '54' in checker_id:
        arbiter_checker_vhd.write("process (state, Xbar_sel) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (state = West and Xbar_sel /= "00100" ) then \n")
        arbiter_checker_vhd.write("        err_state_west_xbar_sel <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_state_west_xbar_sel <= '0'; \n")
        arbiter_checker_vhd.write("    end if;   \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '55' in checker_id:
        arbiter_checker_vhd.write("process (state, Xbar_sel) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (state = South and Xbar_sel /= "01000" ) then \n")
        arbiter_checker_vhd.write("        err_state_south_xbar_sel <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_state_south_xbar_sel <= '0'; \n")
        arbiter_checker_vhd.write("    end if;   \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write("  \n")

    if '56' in checker_id:
        arbiter_checker_vhd.write("process (state, Xbar_sel) \n")
        arbiter_checker_vhd.write("begin \n")
        arbiter_checker_vhd.write("    if (state /= IDLE and state /= North and state /= East and state /= West and state /= South and Xbar_sel /= "10000" ) then \n")
        arbiter_checker_vhd.write("        err_state_local_xbar_sel <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("        err_state_local_xbar_sel <= '0'; \n")
        arbiter_checker_vhd.write("    end if;   \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    arbiter_checker_vhd.write("\n")
    arbiter_checker_vhd.write("end behavior;\n")
    arbiter_checker_vhd.write("\n")

    arbiter_checker_vhd.close()
