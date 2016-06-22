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
	arbiter_checker_top.write("            DCTS: in std_logic; -- Getting the CTS signal from the input FIFO of the next router/NI (for hand-shaking) \n")
	arbiter_checker_top.write("            RTS_FF: in std_logic; \n")
	arbiter_checker_top.write("            state: in std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM \n")
	arbiter_checker_top.write("             \n")
	arbiter_checker_top.write("            -- Arbiter outputs \n")
	arbiter_checker_top.write("            Grant_N, Grant_E, Grant_W, Grant_S, Grant_L:out std_logic; -- Grants given to LBDR requests (encoded as one-hot) \n")
	arbiter_checker_top.write("            Xbar_sel : out std_logic_vector(4 downto 0); -- select lines for XBAR \n")
	arbiter_checker_top.write("            RTS_FF_in: out std_logic; -- Valid output which is sent to the next router/NI to specify that the data on the output port is valid  \n")
	arbiter_checker_top.write("            state_in: out std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM \n")
	arbiter_checker_top.write("            next_state_out: out std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM \n")
	arbiter_checker_top.write(" \n")
	arbiter_checker_top.write("            -- Checker outputs \n")
	arbiter_checker_top.write(" \n")

    string_to_write = ""

    if '1' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_onehot,"
    if '2' in checker_id:
        string_to_write += "err_Arbiter_no_req_Grant,"
    if '3' in checker_id:
        string_to_write += "err_Arbiter_DCTS_RTS,"
    if '4' in checker_id:
        string_to_write += "err_Arbiter_DCTS_RTS1,"
    if '5' in checker_id:
        string_to_write += "err_Arbiter_DCTS_RTS2,"
    if '6' in checker_id:
        string_to_write += "err_Arbiter_DCTS_RTS3,"
    if '7' in checker_id:
        string_to_write += "err_Arbiter_state_and_grants_onehot,"
    if '8' in checker_id:
        string_to_write += "err_Arbiter_state_and_grants_onehot1,"
    if '9' in checker_id:
        string_to_write += "err_Arbiter_no_req_state_change,"
    if '10' in checker_id:
        string_to_write += "err_Arbiter_valid_state,"
    if '11' in checker_id:
        string_to_write += "err_Arbiter_switchgrantN,"
    if '12' in checker_id:
        string_to_write += "err_Arbiter_switchgrantE,"
    if '13' in checker_id:
        string_to_write += "err_Arbiter_switchgrantW,"
    if '14' in checker_id:
        string_to_write += "err_Arbiter_switchgrantS,"
    if '15' in checker_id:
        string_to_write += "err_Arbiter_switchgrantL,"
    if '16' in checker_id:
        string_to_write += "err_Arbiter_state_update,"
    if '17' in checker_id:
        string_to_write += "err_Arbiter_state_RTS_FF_in,"
    if '18' in checker_id:
        string_to_write += "err_Arbiter_switchgrantN_not_active,"
    if '19' in checker_id:
        string_to_write += "err_Arbiter_switchgrantE_not_active,"
    if '20' in checker_id:
        string_to_write += "err_Arbiter_switchgrantW_not_active,"
    if '21' in checker_id:
        string_to_write += "err_Arbiter_switchgrantS_not_active,"
    if '22' in checker_id:
        string_to_write += "err_Arbiter_switchgrantL_not_active,"
    if '23' in checker_id:
        string_to_write += "err_Arbiter_switchgrantN_not_active1,"
    if '24' in checker_id:
        string_to_write += "err_Arbiter_switchgrantE_not_active1,"
    if '25' in checker_id:
        string_to_write += "err_Arbiter_switchgrantW_not_active1,"
    if '26' in checker_id:
        string_to_write += "err_Arbiter_switchgrantS_not_active1,"
    if '27' in checker_id:
        string_to_write += "err_Arbiter_switchgrantL_not_active1,"
    if '28' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_IDLE,"
    if '29' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_North,"
    if '30' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_East,"
    if '31' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_West,"
    if '32' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_South,"
    if '33' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_Local,"
    if '34' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_North1,"
    if '35' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_East1,"
    if '36' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_West1,"
    if '37' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_South1,"
    if '38' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_Local1,"
    if '39' in checker_id:
        string_to_write += "err_Arbiter_priorityIDLE3,"
    if '40' in checker_id:
        string_to_write += "err_Arbiter_priorityL3,"
    if '41' in checker_id:
        string_to_write += "err_Arbiter_priorityN3,"
    if '42' in checker_id:
        string_to_write += "err_Arbiter_priorityE3,"
    if '43' in checker_id:
        string_to_write += "err_Arbiter_priorityW3,"
    if '44' in checker_id:
        string_to_write += "err_Arbiter_priorityS3,"
    if '45' in checker_id:
        string_to_write += "err_Arbiter_switchgrantN1,"
    if '46' in checker_id:
        string_to_write += "err_Arbiter_switchgrantE1,"
    if '47' in checker_id:
        string_to_write += "err_Arbiter_switchgrantW1,"
    if '48' in checker_id:
        string_to_write += "err_Arbiter_switchgrantS1,"
    if '49' in checker_id:
        string_to_write += "err_Arbiter_switchgrantL1,"
    if '50' in checker_id:
        string_to_write += "err_Arbiter_state_not_update,"
    if '51' in checker_id:
        string_to_write += "err_Arbiter_no_Grant,"

    string_to_write = string_to_write[:len(string_to_write)-1]
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
	arbiter_checker_top.write("            DCTS: in std_logic; -- Getting the CTS signal from the input FIFO of the next router/NI (for hand-shaking)
	arbiter_checker_top.write("            RTS_FF: in std_logic; \n")
	arbiter_checker_top.write("            state: in std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM \n")
	arbiter_checker_top.write("
	arbiter_checker_top.write("            Grant_N, Grant_E, Grant_W, Grant_S, Grant_L:out std_logic; -- Grants given to LBDR requests (encoded as one-hot) \n")
	arbiter_checker_top.write("            Xbar_sel : out std_logic_vector (4 downto 0); -- select lines for XBAR \n")
	arbiter_checker_top.write("            RTS_FF_in: out std_logic; -- Valid output which is sent to the next router/NI to specify that the data on the output port is valid \n")
	arbiter_checker_top.write("            state_in: out std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM \n")
	arbiter_checker_top.write("            next_state_out: out std_logic_vector (5 downto 0) -- 6 states for Arbiter's FSM \n")
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
        string_to_write += "err_Arbiter_Xbar_sel_onehot,"
    if '2' in checker_id:
        string_to_write += "err_Arbiter_no_req_Grant,"
    if '3' in checker_id:
        string_to_write += "err_Arbiter_DCTS_RTS,"
    if '4' in checker_id:
        string_to_write += "err_Arbiter_DCTS_RTS1,"
    if '5' in checker_id:
        string_to_write += "err_Arbiter_DCTS_RTS2,"
    if '6' in checker_id:
        string_to_write += "err_Arbiter_DCTS_RTS3,"
    if '7' in checker_id:
        string_to_write += "err_Arbiter_state_and_grants_onehot,"
    if '8' in checker_id:
        string_to_write += "err_Arbiter_state_and_grants_onehot1,"
    if '9' in checker_id:
        string_to_write += "err_Arbiter_no_req_state_change,"
    if '10' in checker_id:
        string_to_write += "err_Arbiter_valid_state,"
    if '11' in checker_id:
        string_to_write += "err_Arbiter_switchgrantN,"
    if '12' in checker_id:
        string_to_write += "err_Arbiter_switchgrantE,"
    if '13' in checker_id:
        string_to_write += "err_Arbiter_switchgrantW,"
    if '14' in checker_id:
        string_to_write += "err_Arbiter_switchgrantS,"
    if '15' in checker_id:
        string_to_write += "err_Arbiter_switchgrantL,"
    if '16' in checker_id:
        string_to_write += "err_Arbiter_state_update,"
    if '17' in checker_id:
        string_to_write += "err_Arbiter_state_RTS_FF_in,"
    if '18' in checker_id:
        string_to_write += "err_Arbiter_switchgrantN_not_active,"
    if '19' in checker_id:
        string_to_write += "err_Arbiter_switchgrantE_not_active,"
    if '20' in checker_id:
        string_to_write += "err_Arbiter_switchgrantW_not_active,"
    if '21' in checker_id:
        string_to_write += "err_Arbiter_switchgrantS_not_active,"
    if '22' in checker_id:
        string_to_write += "err_Arbiter_switchgrantL_not_active,"
    if '23' in checker_id:
        string_to_write += "err_Arbiter_switchgrantN_not_active1,"
    if '24' in checker_id:
        string_to_write += "err_Arbiter_switchgrantE_not_active1,"
    if '25' in checker_id:
        string_to_write += "err_Arbiter_switchgrantW_not_active1,"
    if '26' in checker_id:
        string_to_write += "err_Arbiter_switchgrantS_not_active1,"
    if '27' in checker_id:
        string_to_write += "err_Arbiter_switchgrantL_not_active1,"
    if '28' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_IDLE,"
    if '29' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_North,"
    if '30' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_East,"
    if '31' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_West,"
    if '32' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_South,"
    if '33' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_Local,"
    if '34' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_North1,"
    if '35' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_East1,"
    if '36' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_West1,"
    if '37' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_South1,"
    if '38' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_Local1,"
    if '39' in checker_id:
        string_to_write += "err_Arbiter_priorityIDLE3,"
    if '40' in checker_id:
        string_to_write += "err_Arbiter_priorityL3,"
    if '41' in checker_id:
        string_to_write += "err_Arbiter_priorityN3,"
    if '42' in checker_id:
        string_to_write += "err_Arbiter_priorityE3,"
    if '43' in checker_id:
        string_to_write += "err_Arbiter_priorityW3,"
    if '44' in checker_id:
        string_to_write += "err_Arbiter_priorityS3,"
    if '45' in checker_id:
        string_to_write += "err_Arbiter_switchgrantN1,"
    if '46' in checker_id:
        string_to_write += "err_Arbiter_switchgrantE1,"
    if '47' in checker_id:
        string_to_write += "err_Arbiter_switchgrantW1,"
    if '48' in checker_id:
        string_to_write += "err_Arbiter_switchgrantS1,"
    if '49' in checker_id:
        string_to_write += "err_Arbiter_switchgrantL1,"
    if '50' in checker_id:
        string_to_write += "err_Arbiter_state_not_update,"
    if '51' in checker_id:
        string_to_write += "err_Arbiter_no_Grant,"

    string_to_write = string_to_write[:len(string_to_write) - 1]
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
	arbiter_checker_top.write("-- Arbiter instantiation \n") \n")
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
	arbiter_checker_top.write("								                      Xbar_sel=>Xbar_sel_sig, \n")
	arbiter_checker_top.write("								                      state_in => state_in_sig, \n")
	arbiter_checker_top.write("                                      next_state_out => next_state_out_sig, \n")
	arbiter_checker_top.write("                                      RTS_FF_in => RTS_FF_in_sig,  \n")
	arbiter_checker_top.write(" \n")

    string_to_write = ""

    if '1' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_onehot => err_Arbiter_Xbar_sel_onehot,"
    if '2' in checker_id:
        string_to_write += "err_Arbiter_no_req_Grant => err_Arbiter_no_req_Grant,"
    if '3' in checker_id:
        string_to_write += "err_Arbiter_DCTS_RTS => err_Arbiter_DCTS_RTS,"
    if '4' in checker_id:
        string_to_write += "err_Arbiter_DCTS_RTS1 => err_Arbiter_DCTS_RTS1,"
    if '5' in checker_id:
        string_to_write += "err_Arbiter_DCTS_RTS2 => err_Arbiter_DCTS_RTS2,"
    if '6' in checker_id:
        string_to_write += "err_Arbiter_DCTS_RTS3 => err_Arbiter_DCTS_RTS3,"
    if '7' in checker_id:
        string_to_write += "err_Arbiter_state_and_grants_onehot => err_Arbiter_state_and_grants_onehot,"
    if '8' in checker_id:
        string_to_write += "err_Arbiter_state_and_grants_onehot1 => err_Arbiter_state_and_grants_onehot1,"
    if '9' in checker_id:
        string_to_write += "err_Arbiter_no_req_state_change => err_Arbiter_no_req_state_change,"
    if '10' in checker_id:
        string_to_write += "err_Arbiter_valid_state => err_Arbiter_valid_state,"
    if '11' in checker_id:
        string_to_write += "err_Arbiter_switchgrantN => err_Arbiter_switchgrantN,"
    if '12' in checker_id:
        string_to_write += "err_Arbiter_switchgrantE => err_Arbiter_switchgrantE,"
    if '13' in checker_id:
        string_to_write += "err_Arbiter_switchgrantW => err_Arbiter_switchgrantW,"
    if '14' in checker_id:
        string_to_write += "err_Arbiter_switchgrantS => err_Arbiter_switchgrantS,"
    if '15' in checker_id:
        string_to_write += "err_Arbiter_switchgrantL => err_Arbiter_switchgrantL,"
    if '16' in checker_id:
        string_to_write += "err_Arbiter_state_update => err_Arbiter_state_update,"
    if '17' in checker_id:
        string_to_write += "err_Arbiter_state_RTS_FF_in => err_Arbiter_state_RTS_FF_in,"
    if '18' in checker_id:
        string_to_write += "err_Arbiter_switchgrantN_not_active => err_Arbiter_switchgrantN_not_active,"
    if '19' in checker_id:
        string_to_write += "err_Arbiter_switchgrantE_not_active => err_Arbiter_switchgrantE_not_active,"
    if '20' in checker_id:
        string_to_write += "err_Arbiter_switchgrantW_not_active => err_Arbiter_switchgrantW_not_active,"
    if '21' in checker_id:
        string_to_write += "err_Arbiter_switchgrantS_not_active => err_Arbiter_switchgrantS_not_active,"
    if '22' in checker_id:
        string_to_write += "err_Arbiter_switchgrantL_not_active => err_Arbiter_switchgrantL_not_active,"
    if '23' in checker_id:
        string_to_write += "err_Arbiter_switchgrantN_not_active1 => err_Arbiter_switchgrantN_not_active1,"
    if '24' in checker_id:
        string_to_write += "err_Arbiter_switchgrantE_not_active1 => err_Arbiter_switchgrantE_not_active1,"
    if '25' in checker_id:
        string_to_write += "err_Arbiter_switchgrantW_not_active1 => err_Arbiter_switchgrantW_not_active1,"
    if '26' in checker_id:
        string_to_write += "err_Arbiter_switchgrantS_not_active1 => err_Arbiter_switchgrantS_not_active1,"
    if '27' in checker_id:
        string_to_write += "err_Arbiter_switchgrantL_not_active1 => err_Arbiter_switchgrantL_not_active1,"
    if '28' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_IDLE => err_Arbiter_Xbar_sel_invalid_IDLE,"
    if '29' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_North => err_Arbiter_Xbar_sel_invalid_North,"
    if '30' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_East => err_Arbiter_Xbar_sel_invalid_East,"
    if '31' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_West => err_Arbiter_Xbar_sel_invalid_West,"
    if '32' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_South => err_Arbiter_Xbar_sel_invalid_South,"
    if '33' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_Local => err_Arbiter_Xbar_sel_invalid_Local,"
    if '34' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_North1 => err_Arbiter_Xbar_sel_invalid_North1,"
    if '35' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_East1 => err_Arbiter_Xbar_sel_invalid_East1,"
    if '36' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_West1 => err_Arbiter_Xbar_sel_invalid_West1,"
    if '37' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_South1 => err_Arbiter_Xbar_sel_invalid_South1,"
    if '38' in checker_id:
        string_to_write += "err_Arbiter_Xbar_sel_invalid_Local1 =>err_Arbiter_Xbar_sel_invalid_Local1
    if '39' in checker_id:
        string_to_write += "err_Arbiter_priorityIDLE3 => err_Arbiter_priorityIDLE3,"
    if '40' in checker_id:
        string_to_write += "err_Arbiter_priorityL3 => err_Arbiter_priorityL3,"
    if '41' in checker_id:
        string_to_write += "err_Arbiter_priorityN3 => err_Arbiter_priorityN3,"
    if '42' in checker_id:
        string_to_write += "err_Arbiter_priorityE3 => err_Arbiter_priorityE3,"
    if '43' in checker_id:
        string_to_write += "err_Arbiter_priorityW3 => err_Arbiter_priorityW3,"
    if '44' in checker_id:
        string_to_write += "err_Arbiter_priorityS3 => err_Arbiter_priorityS3,"
    if '45' in checker_id:
        string_to_write += "err_Arbiter_switchgrantN1 => err_Arbiter_switchgrantN1,"
    if '46' in checker_id:
        string_to_write += "err_Arbiter_switchgrantE1 => err_Arbiter_switchgrantE1,"
    if '47' in checker_id:
        string_to_write += "err_Arbiter_switchgrantW1 => err_Arbiter_switchgrantW1,"
    if '48' in checker_id:
        string_to_write += "err_Arbiter_switchgrantS1 => err_Arbiter_switchgrantS1,"
    if '49' in checker_id:
        string_to_write += "err_Arbiter_switchgrantL1 => err_Arbiter_switchgrantL1,"
    if '50' in checker_id:
        string_to_write += "err_Arbiter_state_not_update => err_Arbiter_state_not_update,"
    if '51' in checker_id:
        string_to_write += "err_Arbiter_no_Grant => err_Arbiter_no_Grant,"

	string_to_write = string_to_write[:len(string_to_write)-1]+");\n"

	arbiter_checker_top.write(string_to_write)

	arbiter_checker_top.write("	\n")
	arbiter_checker_top.write("end behavior; \n")
	arbiter_checker_top.write(" \n")

    arbiter_checker_top.close()
