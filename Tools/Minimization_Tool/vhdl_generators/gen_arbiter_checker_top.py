# copyright 2016 Siavoosh Payandeh Azad and Behrad Niazmand
from misc import name_string_generator


def gen_arbiter_checker_top(checker_id):
    name_string = name_string_generator(checker_id)

    arbiter_checker_top = open("checker_vhdl/arbiter_checker"+name_string+"_top.vhd", 'w')

    arbiter_checker_top.write("library ieee; \n")
    arbiter_checker_top.write("use ieee.std_logic_1164.all; \n")
    arbiter_checker_top.write("use IEEE.STD_LOGIC_ARITH.ALL; \n")
    arbiter_checker_top.write("use IEEE.STD_LOGIC_UNSIGNED.ALL; \n")
    arbiter_checker_top.write("use IEEE.NUMERIC_STD.all; \n")
    arbiter_checker_top.write("use IEEE.MATH_REAL.ALL; \n")
    arbiter_checker_top.write(" \n")
    arbiter_checker_top.write("entity Arbiter_with_checkers_top is \n")
    arbiter_checker_top.write("    port  ( Req_N, Req_E, Req_W, Req_S, Req_L:in std_logic; -- From LBDR modules \n")
    arbiter_checker_top.write("            DCTS: in std_logic; -- Getting the CTS signal from the input FIFO of "
                              "the next router/NI (for hand-shaking) \n")
    arbiter_checker_top.write("            RTS_FF: in std_logic; \n")
    arbiter_checker_top.write("            state: in std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM \n")
    arbiter_checker_top.write("             \n")
    arbiter_checker_top.write("            -- Arbiter outputs \n")
    arbiter_checker_top.write("            Grant_N, Grant_E, Grant_W, Grant_S, Grant_L:out std_logic; -- Grants "
                              "given to LBDR requests (encoded as one-hot) \n")
    arbiter_checker_top.write("            Xbar_sel : out std_logic_vector(4 downto 0); -- select lines for XBAR \n")
    arbiter_checker_top.write("            RTS_FF_in: out std_logic; -- Valid output which is sent to the next "
                              "router/NI to specify that the data on the output port is valid  \n")
    arbiter_checker_top.write("            state_in: out std_logic_vector (5 downto 0); -- 6 states for "
                              "Arbiter's FSM \n")
    arbiter_checker_top.write("            next_state_out: out std_logic_vector (5 downto 0); -- 6 states for "
                              "Arbiter's FSM \n")
    arbiter_checker_top.write(" \n")
    arbiter_checker_top.write("            -- Checker outputs \n")
    arbiter_checker_top.write(" \n")

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

    string_to_write = string_to_write[:len(string_to_write)-2]
    string_to_write += " : out std_logic\n"

    arbiter_checker_top.write(string_to_write)

    arbiter_checker_top.write("          ); \n")

    arbiter_checker_top.write("end Arbiter_with_checkers_top; \n")
    arbiter_checker_top.write(" \n")
    arbiter_checker_top.write("architecture behavior of Arbiter_with_checkers_top is \n")
    arbiter_checker_top.write(" \n")
    arbiter_checker_top.write("component Arbiter_pseudo is \n")
    arbiter_checker_top.write("    port (   \n")
    arbiter_checker_top.write("            Req_N, Req_E, Req_W, Req_S, Req_L:in std_logic; -- From LBDR modules \n")
    arbiter_checker_top.write("            DCTS: in std_logic; -- Getting the CTS signal from the input FIFO of the "
                              "next router/NI (for hand-shaking)\n")
    arbiter_checker_top.write("            RTS_FF: in std_logic; \n")
    arbiter_checker_top.write("            state: in std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM \n")
    arbiter_checker_top.write("\n")
    arbiter_checker_top.write("            Grant_N, Grant_E, Grant_W, Grant_S, Grant_L:out std_logic; -- Grants given "
                              "to LBDR requests (encoded as one-hot) \n")
    arbiter_checker_top.write("            Xbar_sel : out std_logic_vector (4 downto 0); -- select lines for XBAR \n")
    arbiter_checker_top.write("            RTS_FF_in: out std_logic; -- Valid output which is sent to the next "
                              "router/NI to specify that the data on the output port is valid \n")
    arbiter_checker_top.write("            state_in: out std_logic_vector (5 downto 0); -- 6 states for "
                              "Arbiter's FSM \n")
    arbiter_checker_top.write("            next_state_out: out std_logic_vector (5 downto 0) -- 6 states for "
                              "Arbiter's FSM \n")
    arbiter_checker_top.write("            ); \n")
    arbiter_checker_top.write("end component; \n")
    arbiter_checker_top.write(" \n")
    arbiter_checker_top.write("component Arbiter_checkers is \n")
    arbiter_checker_top.write("    port (   \n")
    arbiter_checker_top.write("            Req_N, Req_E, Req_W, Req_S, Req_L:in std_logic; \n")
    arbiter_checker_top.write("            DCTS: in std_logic;  \n")
    arbiter_checker_top.write("            Grant_N, Grant_E, Grant_W, Grant_S, Grant_L: in std_logic; \n")
    arbiter_checker_top.write("            Xbar_sel : in std_logic_vector(4 downto 0); \n")
    arbiter_checker_top.write("            state: in std_logic_vector (5 downto 0); \n")
    arbiter_checker_top.write("            state_in: in std_logic_vector (5 downto 0); \n")
    arbiter_checker_top.write("            next_state_out: in std_logic_vector (5 downto 0); \n")
    arbiter_checker_top.write("            RTS_FF: in std_logic; \n")
    arbiter_checker_top.write("            RTS_FF_in: in std_logic; \n")
    arbiter_checker_top.write(" \n")
    arbiter_checker_top.write("            -- Checker outputs \n")
    arbiter_checker_top.write(" \n")

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
    string_to_write += " : out std_logic \n"

    arbiter_checker_top.write(string_to_write)

    arbiter_checker_top.write("            ); \n")
    arbiter_checker_top.write("end component; \n")
    arbiter_checker_top.write(" \n")
    arbiter_checker_top.write("signal Grant_N_sig, Grant_E_sig, Grant_W_sig, Grant_S_sig, Grant_L_sig: std_logic; \n")
    arbiter_checker_top.write("signal Xbar_sel_sig: std_logic_vector(4 downto 0); \n")
    arbiter_checker_top.write("signal state_in_sig: std_logic_vector (5 downto 0); \n")
    arbiter_checker_top.write("signal next_state_out_sig: std_logic_vector (5 downto 0); \n")
    arbiter_checker_top.write("signal RTS_FF_in_sig: std_logic; \n")
    arbiter_checker_top.write(" \n")
    arbiter_checker_top.write("begin  \n")
    arbiter_checker_top.write(" \n")
    arbiter_checker_top.write("Grant_N <= Grant_N_sig; \n")
    arbiter_checker_top.write("Grant_E <= Grant_E_sig; \n")
    arbiter_checker_top.write("Grant_W <= Grant_W_sig; \n")
    arbiter_checker_top.write("Grant_S <= Grant_S_sig; \n")
    arbiter_checker_top.write("Grant_L <= Grant_L_sig; \n")
    arbiter_checker_top.write("Xbar_sel <= Xbar_sel_sig; \n")
    arbiter_checker_top.write("state_in <= state_in_sig; \n")
    arbiter_checker_top.write("RTS_FF_in <= RTS_FF_in_sig; \n")
    arbiter_checker_top.write("next_state_out <= next_state_out_sig; \n")
    arbiter_checker_top.write(" \n")

    arbiter_checker_top.write("-- Arbiter instantiation \n")
    arbiter_checker_top.write("ARBITER: Arbiter_pseudo port map   ( \n")
    arbiter_checker_top.write("                                    Req_N=>Req_N,  \n")
    arbiter_checker_top.write("                                    Req_E=>Req_E,  \n")
    arbiter_checker_top.write("                                    Req_W=>Req_W,  \n")
    arbiter_checker_top.write("                                    Req_S=>Req_S,  \n")
    arbiter_checker_top.write("                                    Req_L=>Req_L, \n")
    arbiter_checker_top.write("						                        DCTS => DCTS,  \n")
    arbiter_checker_top.write("                                    RTS_FF => RTS_FF, \n")
    arbiter_checker_top.write(" 						                        state=>state, \n")
    arbiter_checker_top.write(" \n")
    arbiter_checker_top.write("                                    Grant_N => Grant_N,  \n")
    arbiter_checker_top.write("                                    Grant_E => Grant_E,  \n")
    arbiter_checker_top.write("                                    Grant_W => Grant_W,  \n")
    arbiter_checker_top.write("                                    Grant_S => Grant_S,  \n")
    arbiter_checker_top.write("                                    Grant_L => Grant_L, \n")
    arbiter_checker_top.write("                                    Xbar_sel => Xbar_sel_sig,  \n")
    arbiter_checker_top.write("                                    RTS_FF_in => RTS_FF_in,  \n")
    arbiter_checker_top.write("                                    state_in => state_in_sig,  \n")
    arbiter_checker_top.write("                                    next_state_out => next_state_out_sig \n")
    arbiter_checker_top.write("                                    ); \n")
    arbiter_checker_top.write(" \n")
    arbiter_checker_top.write("-- Checkers instantiation \n")
    arbiter_checker_top.write("CHECKERS: Arbiter_checkers port map ( \n")
    arbiter_checker_top.write("                                      Req_N => Req_N,  \n")
    arbiter_checker_top.write("                                      Req_E => Req_E,  \n")
    arbiter_checker_top.write("                                      Req_W => Req_W,  \n")
    arbiter_checker_top.write("                                      Req_S=>Req_S,  \n")
    arbiter_checker_top.write("                                      Req_L => Req_L, \n")
    arbiter_checker_top.write("                                      DCTS => DCTS,  \n")
    arbiter_checker_top.write("                                      RTS_FF => RTS_FF, \n")
    arbiter_checker_top.write("                                      state => state,  \n")
    arbiter_checker_top.write(" \n")
    arbiter_checker_top.write("                                      Grant_N => Grant_N_sig,  \n")
    arbiter_checker_top.write("                                      Grant_E => Grant_E_sig,  \n")
    arbiter_checker_top.write("                                      Grant_W => Grant_W_sig,  \n")
    arbiter_checker_top.write("                                      Grant_S => Grant_S_sig,  \n")
    arbiter_checker_top.write("                                      Grant_L => Grant_L_sig,  \n")
    arbiter_checker_top.write("								         Xbar_sel=>Xbar_sel_sig, \n")
    arbiter_checker_top.write("								         state_in => state_in_sig, \n")
    arbiter_checker_top.write("                                      next_state_out => next_state_out_sig, \n")
    arbiter_checker_top.write("                                      RTS_FF_in => RTS_FF_in_sig,  \n")
    arbiter_checker_top.write(" \n")

    string_to_write = ""

    if '1' in checker_id:
        string_to_write += "err_state_IDLE_xbar => err_state_IDLE_xbar,\n"
    if '2' in checker_id:
        string_to_write += "err_state_not_IDLE_xbar => err_state_not_IDLE_xbar,\n"
    if '3' in checker_id:
        string_to_write += "err_state_IDLE_RTS_FF_in => err_state_IDLE_RTS_FF_in,\n"
    if '4' in checker_id:
        string_to_write += "err_state_not_IDLE_RTS_FF_RTS_FF_in => err_state_not_IDLE_RTS_FF_RTS_FF_in,\n"
    if '5' in checker_id:
        string_to_write += "err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in => err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in,\n"
    if '6' in checker_id:
        string_to_write += "err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in => err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in,\n"
    if '7' in checker_id:
        string_to_write += "err_RTS_FF_not_DCTS_state_state_in => err_RTS_FF_not_DCTS_state_state_in,\n"
    if '8' in checker_id:
        string_to_write += "err_not_RTS_FF_state_in_next_state => err_not_RTS_FF_state_in_next_state,\n"
    if '9' in checker_id:
        string_to_write += "err_RTS_FF_DCTS_state_in_next_state => err_RTS_FF_DCTS_state_in_next_state,\n"
    if '10' in checker_id:
        string_to_write += "err_not_DCTS_Grants => err_not_DCTS_Grants,\n"
    if '11' in checker_id:
        string_to_write += "err_DCTS_not_RTS_FF_Grants => err_DCTS_not_RTS_FF_Grants,\n"
    if '12' in checker_id:
        string_to_write += "err_DCTS_RTS_FF_IDLE_Grants => err_DCTS_RTS_FF_IDLE_Grants,\n"
    if '13' in checker_id:
        string_to_write += "err_DCTS_RTS_FF_not_IDLE_Grants_onehot => err_DCTS_RTS_FF_not_IDLE_Grants_onehot,\n"
    if '14' in checker_id:
        string_to_write += "err_Requests_next_state_IDLE => err_Requests_next_state_IDLE,\n"
    if '15' in checker_id:
        string_to_write += "err_IDLE_Req_L => err_IDLE_Req_L,\n"
    if '16' in checker_id:
        string_to_write += "err_Local_Req_L => err_Local_Req_L,\n"
    if '17' in checker_id:
        string_to_write += "err_North_Req_N => err_North_Req_N,\n"
    if '18' in checker_id:
        string_to_write += "err_East_Req_E => err_East_Req_E,\n"
    if '19' in checker_id:
        string_to_write += "err_West_Req_W => err_West_Req_W,\n"
    if '20' in checker_id:
        string_to_write += "err_South_Req_S => err_South_Req_S,\n"
    if '21' in checker_id:
        string_to_write += "err_IDLE_Req_N => err_IDLE_Req_N,\n"
    if '22' in checker_id:
        string_to_write += "err_Local_Req_N => err_Local_Req_N,\n"
    if '23' in checker_id:
        string_to_write += "err_North_Req_E => err_North_Req_E,\n"
    if '24' in checker_id:
        string_to_write += "err_East_Req_W => err_East_Req_W,\n"
    if '25' in checker_id:
        string_to_write += "err_West_Req_S => err_West_Req_S,\n"
    if '26' in checker_id:
        string_to_write += "err_South_Req_L => err_South_Req_L,\n"
    if '27' in checker_id:
        string_to_write += "err_IDLE_Req_E => err_IDLE_Req_E,\n"
    if '28' in checker_id:
        string_to_write += "err_Local_Req_E => err_Local_Req_E,\n"
    if '29' in checker_id:
        string_to_write += "err_North_Req_W => err_North_Req_W,\n"
    if '30' in checker_id:
        string_to_write += "err_East_Req_S => err_East_Req_S,\n"
    if '31' in checker_id:
        string_to_write += "err_West_Req_L => err_West_Req_L,\n"
    if '32' in checker_id:
        string_to_write += "err_South_Req_N => err_South_Req_N,\n"
    if '33' in checker_id:
        string_to_write += "err_IDLE_Req_W => err_IDLE_Req_W,\n"
    if '34' in checker_id:
        string_to_write += "err_Local_Req_W => err_Local_Req_W,\n"
    if '35' in checker_id:
        string_to_write += "err_North_Req_S => err_North_Req_S,\n"
    if '36' in checker_id:
        string_to_write += "err_East_Req_L => err_East_Req_L,\n"
    if '37' in checker_id:
        string_to_write += "err_West_Req_N => err_West_Req_N,\n"
    if '38' in checker_id:
        string_to_write += "err_South_Req_E => err_South_Req_E,\n"
    if '39' in checker_id:
        string_to_write += "err_IDLE_Req_S => err_IDLE_Req_S,\n"
    if '40' in checker_id:
        string_to_write += "err_Local_Req_S => err_Local_Req_S,\n"
    if '41' in checker_id:
        string_to_write += "err_North_Req_L => err_North_Req_L,\n"
    if '42' in checker_id:
        string_to_write += "err_East_Req_N => err_East_Req_N,\n"
    if '43' in checker_id:
        string_to_write += "err_West_Req_E => err_West_Req_E,\n"
    if '44' in checker_id:
        string_to_write += "err_South_Req_W => err_South_Req_W,\n"
    if '45' in checker_id:
        string_to_write += "err_next_state_onehot => err_next_state_onehot,\n"
    if '46' in checker_id:
        string_to_write += "err_state_in_onehot => err_state_in_onehot,\n"
    if '47' in checker_id:
        string_to_write += "err_DCTS_RTS_FF_state_Grant_L => err_DCTS_RTS_FF_state_Grant_L,\n"
    if '48' in checker_id:
        string_to_write += "err_DCTS_RTS_FF_state_Grant_N => err_DCTS_RTS_FF_state_Grant_N,\n"
    if '49' in checker_id:
        string_to_write += "err_DCTS_RTS_FF_state_Grant_E => err_DCTS_RTS_FF_state_Grant_E,\n"
    if '50' in checker_id:
        string_to_write += "err_DCTS_RTS_FF_state_Grant_W => err_DCTS_RTS_FF_state_Grant_W,\n"
    if '51' in checker_id:
        string_to_write += "err_DCTS_RTS_FF_state_Grant_S => err_DCTS_RTS_FF_state_Grant_S,\n"
    if '52' in checker_id:
        string_to_write += "err_state_north_xbar_sel => err_state_north_xbar_sel,\n"
    if '53' in checker_id:
        string_to_write += "err_state_east_xbar_sel => err_state_east_xbar_sel,\n"
    if '54' in checker_id:
        string_to_write += "err_state_west_xbar_sel => err_state_west_xbar_sel,\n"
    if '55' in checker_id:
        string_to_write += "err_state_south_xbar_sel => err_state_south_xbar_sel,\n"
    if '56' in checker_id:
        string_to_write += "err_state_local_xbar_sel => err_state_local_xbar_sel,\n"

    string_to_write = string_to_write[:len(string_to_write)-2]+");\n"

    arbiter_checker_top.write(string_to_write)

    arbiter_checker_top.write("	\n")
    arbiter_checker_top.write("end behavior; \n")
    arbiter_checker_top.write(" \n")

    arbiter_checker_top.close()
