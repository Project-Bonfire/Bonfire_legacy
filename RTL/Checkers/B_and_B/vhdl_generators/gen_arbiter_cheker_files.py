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

    arbiter_checker_vhd.write("           -- Checker outputs")

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
    arbiter_checker_vhd.write("-- Checkers\n")

    arbiter_checker_vhd.write("\n")

    if '1' in checker_id:
        arbiter_checker_vhd.write("-- Arbiter select lines for Crossbar Switch must be one-hot!\n")
        arbiter_checker_vhd.write("process(Xbar_sel) begin\n")
        arbiter_checker_vhd.write("--	if (DCTS = '1' and RTS_FF = '1' and (Req_N = '1' or Req_E = '1' or "
                                  "Req_W = '1' or Req_L = '1') and Xbar_sel /= \"0001\" and Xbar_sel /= \"0010\" "
                                  "and Xbar_sel /= \"0100\" and Xbar_sel /= \"1000\" ) then\n")
        arbiter_checker_vhd.write("	if (Xbar_sel /= \"00000\" and Xbar_sel /= \"00001\" and Xbar_sel /= \"00010\" "
                                  "and Xbar_sel /= \"00100\" and Xbar_sel /= \"01000\" and Xbar_sel /= \"10000\") "
                                  "then \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_onehot <= '1';		\n")
        arbiter_checker_vhd.write("	else\n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_onehot <= '0';\n")
        arbiter_checker_vhd.write("	end if;\n")
        arbiter_checker_vhd.write("end process;\n")
        arbiter_checker_vhd.write("\n")

    if '2' in checker_id:
        arbiter_checker_vhd.write("-- If there is no request for arbitration and the next router/NI is also not ready "
                                  "to receive any flits, the arbiter must not active any Grant signals in its "
                                  "output!\n")
        arbiter_checker_vhd.write("process(Req_N, Req_E, Req_W, Req_S, Req_L, DCTS, RTS_FF_in, Grant_N, Grant_E, "
                                  "Grant_W, Grant_S, Grant_L) begin\n")
        arbiter_checker_vhd.write("	if ( (Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '0') "
                                  "and (Grant_N = '1' or Grant_E = '1' or Grant_W = '1' or Grant_S = '1' or "
                                  "Grant_L = '1') ) then\n")
        arbiter_checker_vhd.write("		err_Arbiter_no_req_Grant <= '1';\n")
        arbiter_checker_vhd.write("	else \n")
        arbiter_checker_vhd.write("		err_Arbiter_no_req_Grant <= '0';\n")
        arbiter_checker_vhd.write("	end if;	\n")
        arbiter_checker_vhd.write("end process;\n")
        arbiter_checker_vhd.write("\n")

    if '3' in checker_id:
        arbiter_checker_vhd.write("process(state, RTS_FF, DCTS, RTS_FF_in) begin\n")
        arbiter_checker_vhd.write("	if ( (state = North or state = East or state = West or state = South or "
                                  "state = Local) and  RTS_FF = '1' and DCTS = '1' and RTS_FF_in = '1') then \n")
        arbiter_checker_vhd.write("		err_Arbiter_DCTS_RTS <= '1'; \n")
        arbiter_checker_vhd.write("	else\n")
        arbiter_checker_vhd.write("		err_Arbiter_DCTS_RTS <= '0';\n")
        arbiter_checker_vhd.write("	end if;\n")
        arbiter_checker_vhd.write("end process;\n")
        arbiter_checker_vhd.write("\n")

    if '4' in checker_id:
        arbiter_checker_vhd.write("process(state, RTS_FF, DCTS, RTS_FF_in) begin\n")
        arbiter_checker_vhd.write("	if ( (state = North or state = East or state = West or state = South or "
                                  "state = Local) and  RTS_FF = '0' and DCTS = '0' and RTS_FF_in = '0') then \n")
        arbiter_checker_vhd.write("		err_Arbiter_DCTS_RTS1 <= '1'; \n")
        arbiter_checker_vhd.write("	else\n")
        arbiter_checker_vhd.write("		err_Arbiter_DCTS_RTS1 <= '0';\n")
        arbiter_checker_vhd.write("	end if;\n")
        arbiter_checker_vhd.write("end process;\n")
        arbiter_checker_vhd.write("\n")

    if '5' in checker_id:
        arbiter_checker_vhd.write("process(RTS_FF, DCTS, state, RTS_FF_in) begin\n")
        arbiter_checker_vhd.write("	if ( RTS_FF = '1' and DCTS = '0' and state /= IDLE and RTS_FF_in = '0') then\n")
        arbiter_checker_vhd.write("		err_Arbiter_DCTS_RTS2 <= '1';		\n")
        arbiter_checker_vhd.write("	else\n")
        arbiter_checker_vhd.write("		err_Arbiter_DCTS_RTS2 <= '0';\n")
        arbiter_checker_vhd.write("	end if;\n")
        arbiter_checker_vhd.write("end process;\n")
        arbiter_checker_vhd.write("\n")

    if '6' in checker_id:
        arbiter_checker_vhd.write("process(RTS_FF, DCTS, state, RTS_FF_in) begin\n")
        arbiter_checker_vhd.write("	if ( RTS_FF = '0' and DCTS = '1' and state /= IDLE and RTS_FF_in = '0') then\n")
        arbiter_checker_vhd.write("		err_Arbiter_DCTS_RTS3 <= '1';		\n")
        arbiter_checker_vhd.write("	else\n")
        arbiter_checker_vhd.write("		err_Arbiter_DCTS_RTS3 <= '0';\n")
        arbiter_checker_vhd.write("	end if;\n")
        arbiter_checker_vhd.write("end process;\n")
        arbiter_checker_vhd.write("\n")

    if '7' in checker_id:
        arbiter_checker_vhd.write("-- Arbiter Grants and state variable must be one-hot!\n")
        arbiter_checker_vhd.write("process (DCTS, RTS_FF, Req_N, Req_E, Req_W, Req_S, Req_L, state_in, Grant_N, "
                                  "Grant_E, Grant_W, Grant_S, Grant_L) begin\n")
        arbiter_checker_vhd.write("if (DCTS = '1' and RTS_FF = '1' and (Req_N = '1' or Req_E = '1' or Req_W = '1' or "
                                  "Req_S = '1' or Req_L = '1') and ((state_in /= North and state_in /= East and "
                                  "state_in /= West and state_in /= South and state_in /= Local) or (Grant_N = '0' and "
                                  "Grant_E = '0' and Grant_W = '0' and Grant_S = '0' and Grant_L = '0') )) then  \n")
        arbiter_checker_vhd.write("	err_Arbiter_state_and_grants_onehot <= '1';\n")
        arbiter_checker_vhd.write("else \n")
        arbiter_checker_vhd.write("	err_Arbiter_state_and_grants_onehot <= '0';\n")
        arbiter_checker_vhd.write("end if;	\n")
        arbiter_checker_vhd.write("end process;\n")
        arbiter_checker_vhd.write("\n")

    if '8' in checker_id:
        arbiter_checker_vhd.write("-- Arbiter Grants and state variable must be one-hot!\n")
        arbiter_checker_vhd.write("process (Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin\n")
        arbiter_checker_vhd.write("if ( (Req_N = '1' or Req_E = '1' or Req_W = '1' or Req_S = '1' or Req_L = '1') "
                                  "and next_state_out /= North and next_state_out /= East and next_state_out /= West "
                                  "and next_state_out /= South and next_state_out /= Local) then \n")
        arbiter_checker_vhd.write("	err_Arbiter_state_and_grants_onehot1 <= '1';\n")
        arbiter_checker_vhd.write("else \n")
        arbiter_checker_vhd.write("	err_Arbiter_state_and_grants_onehot1 <= '0';\n")
        arbiter_checker_vhd.write("end if;	\n")
        arbiter_checker_vhd.write("end process;\n")
        arbiter_checker_vhd.write("\n")

    if '9' in checker_id:
        arbiter_checker_vhd.write("-- If there is no request for arbitration, the arbiter's next state must be IDLE!\n")
        arbiter_checker_vhd.write("process(Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin\n")
        arbiter_checker_vhd.write("	if ( (Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '0') "
                                  "and next_state_out /= IDLE) then\n")
        arbiter_checker_vhd.write("		err_Arbiter_no_req_state_change <= '1';\n")
        arbiter_checker_vhd.write("	else\n")
        arbiter_checker_vhd.write("		err_Arbiter_no_req_state_change <= '0';		\n")
        arbiter_checker_vhd.write("	end if;	\n")
        arbiter_checker_vhd.write("end process;\n")
        arbiter_checker_vhd.write("\n")

    if '10' in checker_id:
        arbiter_checker_vhd.write("process (state_in) begin \n")
        arbiter_checker_vhd.write("if (state_in /= IDLE and state_in /= North and state_in /= East and "
                                  "state_in /= West and state_in /= South and state_in /= Local ) then \n")
        arbiter_checker_vhd.write("	err_Arbiter_valid_state <= '1';\n")
        arbiter_checker_vhd.write("else\n")
        arbiter_checker_vhd.write("	err_Arbiter_valid_state <= '0';\n")
        arbiter_checker_vhd.write("end if;\n")
        arbiter_checker_vhd.write("end process;\n")
        arbiter_checker_vhd.write("\n")

    if '11' in checker_id:
        arbiter_checker_vhd.write("process(RTS_FF, DCTS, Req_N, Req_E, Req_W, Req_S, Req_L, state_in) begin \n")
        arbiter_checker_vhd.write("	if ( (Req_N = '1' and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '0') "
                                  "and RTS_FF = '1' and DCTS = '1' and state_in /= North) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantN <= '1';\n")
        arbiter_checker_vhd.write("	else \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantN <= '0';\n")
        arbiter_checker_vhd.write("	end if;\n")
        arbiter_checker_vhd.write("end process;\n")
        arbiter_checker_vhd.write("\n")

    if '12' in checker_id:
        arbiter_checker_vhd.write("process(RTS_FF, DCTS, Req_N, Req_E, Req_W, Req_S, Req_L, state_in) begin \n")
        arbiter_checker_vhd.write("	if ( (Req_N = '0' and Req_E = '1' and Req_W = '0' and Req_S = '0' and Req_L = '0') "
                                  "and RTS_FF = '1' and DCTS = '1' and state_in /= East) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantE <= '1';\n")
        arbiter_checker_vhd.write("	else \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantE <= '0';\n")
        arbiter_checker_vhd.write("	end if;		\n")
        arbiter_checker_vhd.write("end process;\n")
        arbiter_checker_vhd.write("\n")

    if '13' in checker_id:
        arbiter_checker_vhd.write("process(RTS_FF, DCTS, Req_N, Req_E, Req_W, Req_S, Req_L, state_in) begin \n")
        arbiter_checker_vhd.write("	if ( (Req_N = '0' and Req_E = '0' and Req_W = '1' and Req_S = '0' and Req_L = '0') "
                                  "and RTS_FF = '1' and DCTS = '1' and state_in /= West) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantW <= '1';\n")
        arbiter_checker_vhd.write("	else \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantW <= '0';\n")
        arbiter_checker_vhd.write("	end if;		\n")
        arbiter_checker_vhd.write("end process;\n")
        arbiter_checker_vhd.write("\n")

    if '14' in checker_id:
        arbiter_checker_vhd.write("process(RTS_FF, DCTS, Req_N, Req_E, Req_W, Req_S, Req_L, state_in) begin \n")
        arbiter_checker_vhd.write("	if ( (Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '1' and Req_L = '0') "
                                  "and RTS_FF = '1' and DCTS = '1' and state_in /= South) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantS <= '1';\n")
        arbiter_checker_vhd.write("	else \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantS <= '0';\n")
        arbiter_checker_vhd.write("	end if;		\n")
        arbiter_checker_vhd.write("end process;\n")
        arbiter_checker_vhd.write("\n")

    if '15' in checker_id:
        arbiter_checker_vhd.write("process(RTS_FF, DCTS, Req_N, Req_E, Req_W, Req_S, Req_L, state_in) begin \n")
        arbiter_checker_vhd.write("	if ( (Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '1')"
                                  " and RTS_FF = '1' and DCTS = '1' and state_in /= Local) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantL <= '1';\n")
        arbiter_checker_vhd.write("	else \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantL <= '0';\n")
        arbiter_checker_vhd.write("	end if;		\n")
        arbiter_checker_vhd.write("end process;\n")
        arbiter_checker_vhd.write("\n")

    if '16' in checker_id:
        arbiter_checker_vhd.write("-- If there is a request from Arbiter to next router/NI, but the FIFO of the next "
                                  "router is full (not ready), previous state must be stored in state_in! \n")
        arbiter_checker_vhd.write("process (RTS_FF, DCTS, state, state_in) begin \n")
        arbiter_checker_vhd.write("    if (RTS_FF = '1' and DCTS = '0' and state_in /= state) then \n")
        arbiter_checker_vhd.write("        err_Arbiter_state_update <= '1';\n")
        arbiter_checker_vhd.write("    else\n")
        arbiter_checker_vhd.write("   	   err_Arbiter_state_update <= '0';\n")
        arbiter_checker_vhd.write("   	end if;\n")
        arbiter_checker_vhd.write("end process;\n")
        arbiter_checker_vhd.write(" \n")

    if '17' in checker_id:
        arbiter_checker_vhd.write("process (state, RTS_FF_in) begin \n")
        arbiter_checker_vhd.write("    if (state = IDLE and RTS_FF_in = '1') then  \n")
        arbiter_checker_vhd.write("        err_Arbiter_state_RTS_FF_in <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("   		err_Arbiter_state_RTS_FF_in <= '0'; \n")
        arbiter_checker_vhd.write("   	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '18' in checker_id:
        arbiter_checker_vhd.write("process(state, RTS_FF, DCTS, Grant_N, RTS_FF_in) begin \n")
        arbiter_checker_vhd.write(
                "	if ( (state = North) and RTS_FF = '1' and DCTS = '1' and (Grant_N = '0' or "
                "RTS_FF_in = '1') ) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantN_not_active <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantN_not_active <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '19' in checker_id:
        arbiter_checker_vhd.write("process(state, RTS_FF, DCTS, Grant_E, RTS_FF_in) begin \n")
        arbiter_checker_vhd.write(
                "	if ( (state = East) and RTS_FF = '1' and DCTS = '1' and (Grant_E = '0' or "
                "RTS_FF_in = '1') ) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantE_not_active <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantE_not_active <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '20' in checker_id:
        arbiter_checker_vhd.write("process(state, RTS_FF, DCTS, Grant_W, RTS_FF_in) begin \n")
        arbiter_checker_vhd.write(
                "	if ( (state = West) and RTS_FF = '1' and DCTS = '1' and (Grant_W = '0' or RTS_FF_in = '1') ) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantW_not_active <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantW_not_active <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '21' in checker_id:
        arbiter_checker_vhd.write("process(state, RTS_FF, DCTS, Grant_S, RTS_FF_in) begin \n")
        arbiter_checker_vhd.write(
                "	if ( state = South and RTS_FF = '1' and DCTS = '1' and (Grant_S = '0' or RTS_FF_in = '1') ) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantS_not_active <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantS_not_active <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '22' in checker_id:
        arbiter_checker_vhd.write("process(state, RTS_FF, DCTS, Grant_L, RTS_FF_in) begin \n")
        arbiter_checker_vhd.write(
                "	if ( state = Local and RTS_FF = '1' and DCTS = '1' and (Grant_L = '0' or RTS_FF_in = '1') ) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantL_not_active <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantL_not_active <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '23' in checker_id:
        arbiter_checker_vhd.write("process(state, RTS_FF, DCTS, Grant_N) begin \n")
        arbiter_checker_vhd.write("	if ((state = North) and (RTS_FF = '0' or DCTS = '0') and Grant_N = '1') then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantN_not_active1 <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantN_not_active1 <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '24' in checker_id:
        arbiter_checker_vhd.write("process(state, RTS_FF, DCTS, Grant_E) begin \n")
        arbiter_checker_vhd.write("	if ((state = East) and (RTS_FF = '0' or DCTS = '0') and Grant_E = '1') then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantE_not_active1 <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantE_not_active1 <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '25' in checker_id:
        arbiter_checker_vhd.write("process(state, RTS_FF, DCTS, Grant_W) begin \n")
        arbiter_checker_vhd.write("	if ((state = West) and (RTS_FF = '0' or DCTS = '0') and Grant_W = '1') then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantW_not_active1 <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantW_not_active1 <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '26' in checker_id:
        arbiter_checker_vhd.write("process(state, RTS_FF, DCTS, Grant_S) begin \n")
        arbiter_checker_vhd.write("	if ((state = South) and (RTS_FF = '0' or DCTS = '0') and Grant_S = '1') then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantS_not_active1 <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantS_not_active1 <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '27' in checker_id:
        arbiter_checker_vhd.write("process(state, RTS_FF, DCTS, Grant_L) begin \n")
        arbiter_checker_vhd.write("	if ((state = Local) and (RTS_FF = '0' or DCTS = '0') and Grant_L = '1') then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantL_not_active1 <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantL_not_active1 <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '28' in checker_id:
        arbiter_checker_vhd.write("process(state, Xbar_sel) begin \n")
        arbiter_checker_vhd.write("	if (state = IDLE and Xbar_sel /= \"00000\") then \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_IDLE <= '1';		 \n")
        arbiter_checker_vhd.write("	else \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_IDLE <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '29' in checker_id:
        arbiter_checker_vhd.write("process(state, Xbar_sel) begin \n")
        arbiter_checker_vhd.write("	if (state = North and Xbar_sel /= \"00001\") then \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_North <= '1';		 \n")
        arbiter_checker_vhd.write("	else \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_North <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '30' in checker_id:
        arbiter_checker_vhd.write("process(state, Xbar_sel) begin \n")
        arbiter_checker_vhd.write("	if (state = East and Xbar_sel /= \"00010\") then \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_East <= '1';		 \n")
        arbiter_checker_vhd.write("	else \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_East <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '31' in checker_id:
        arbiter_checker_vhd.write("process(state, Xbar_sel) begin \n")
        arbiter_checker_vhd.write("	if (state = West and Xbar_sel /= \"00100\") then \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_West <= '1';		 \n")
        arbiter_checker_vhd.write("	else \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_West <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '32' in checker_id:
        arbiter_checker_vhd.write("process(state, Xbar_sel) begin \n")
        arbiter_checker_vhd.write("	if (state = South and Xbar_sel /= \"01000\") then \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_South <= '1';		 \n")
        arbiter_checker_vhd.write("	else \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_South <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '33' in checker_id:
        arbiter_checker_vhd.write("process(state, Xbar_sel) begin \n")
        arbiter_checker_vhd.write("	if (state = Local and Xbar_sel /= \"10000\") then \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_Local <= '1';		 \n")
        arbiter_checker_vhd.write("	else \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_Local <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '34' in checker_id:
        arbiter_checker_vhd.write("process(state, DCTS, RTS_FF, Grant_N, Xbar_sel) begin \n")
        arbiter_checker_vhd.write(
                "	if (state /= North and RTS_FF = '1' and DCTS = '1' and (Grant_N = '1' or "
                "Xbar_sel = \"00001\") ) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_North1 <= '1';		 \n")
        arbiter_checker_vhd.write("	else \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_North1 <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '35' in checker_id:
        arbiter_checker_vhd.write("process(state, DCTS, RTS_FF, Grant_E, Xbar_sel) begin \n")
        arbiter_checker_vhd.write(
                "	if (state /= East and RTS_FF = '1' and DCTS = '1' and (Grant_E = '1' or "
                "Xbar_sel = \"00010\") ) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_East1 <= '1';		 \n")
        arbiter_checker_vhd.write("	else \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_East1 <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '36' in checker_id:
        arbiter_checker_vhd.write("process(state, DCTS, RTS_FF, Grant_W, Xbar_sel) begin \n")
        arbiter_checker_vhd.write(
                "	if (state /= West and RTS_FF = '1' and DCTS = '1' and (Grant_W = '1' or "
                "Xbar_sel = \"00100\") ) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_West1 <= '1';		 \n")
        arbiter_checker_vhd.write("	else \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_West1 <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '37' in checker_id:
        arbiter_checker_vhd.write("process(state, DCTS, RTS_FF, Grant_S, Xbar_sel) begin \n")
        arbiter_checker_vhd.write(
                "	if (state /= South and RTS_FF = '1' and DCTS = '1' and (Grant_S = '1' or Xbar_sel = \"01000\") ) "
                "then \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_South1 <= '1';		 \n")
        arbiter_checker_vhd.write("	else \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_South1 <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '38' in checker_id:
        arbiter_checker_vhd.write("process(state, DCTS, RTS_FF, Grant_L, Xbar_sel) begin \n")
        arbiter_checker_vhd.write(
                "	if (state /= Local and RTS_FF = '1' and DCTS = '1' and (Grant_L = '1' or Xbar_sel = \"10000\") ) "
                "then \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_Local1 <= '1';		 \n")
        arbiter_checker_vhd.write("	else \n")
        arbiter_checker_vhd.write("		err_Arbiter_Xbar_sel_invalid_Local1 <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '39' in checker_id:
        arbiter_checker_vhd.write("process(state, Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin \n")
        arbiter_checker_vhd.write(
                "	if ( state = IDLE and (Req_L = '0' and Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '1') "
                "and next_state_out /= South) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_priorityIDLE3 <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_priorityIDLE3 <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '40' in checker_id:
        arbiter_checker_vhd.write("process(state, Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin \n")
        arbiter_checker_vhd.write(
                "	if ( state = Local and (Req_L = '0' and Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '1') "
                "and next_state_out /= South) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_priorityL3 <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_priorityL3 <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '41' in checker_id:
        arbiter_checker_vhd.write("process(state, Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin \n")
        arbiter_checker_vhd.write(
                "	if ( state = North and (Req_L = '1' and Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '0') "
                "and next_state_out /= Local) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_priorityN3 <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_priorityN3 <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '42' in checker_id:
        arbiter_checker_vhd.write("process(state, Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin \n")
        arbiter_checker_vhd.write(
                "	if ( state = East and (Req_L = '0' and Req_N = '1' and Req_E = '0' and Req_W = '0' and Req_S = '0') "
                "and next_state_out /= North) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_priorityE3 <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_priorityE3 <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '43' in checker_id:
        arbiter_checker_vhd.write("process(state, Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin \n")
        arbiter_checker_vhd.write(
                "	if ( state = West and (Req_L = '0' and Req_N = '0' and Req_E = '1' and Req_W = '0' and Req_S = '0') "
                "and next_state_out /= East) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_priorityW3 <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_priorityW3 <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '44' in checker_id:
        arbiter_checker_vhd.write("process(state, Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin \n")
        arbiter_checker_vhd.write(
                "	if ( state = South and (Req_L = '0' and Req_N = '0' and Req_E = '0' and Req_W = '1' and Req_S = '0') "
                "and next_state_out /= West) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_priorityS3 <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_priorityS3 <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '45' in checker_id:
        arbiter_checker_vhd.write("process(Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin \n")
        arbiter_checker_vhd.write(
                "	if ( (Req_N = '1' and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '0') and "
                "next_state_out /= North) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantN1 <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantN1 <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '46' in checker_id:
        arbiter_checker_vhd.write("process(Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin \n")
        arbiter_checker_vhd.write(
                "	if ( (Req_N = '0' and Req_E = '1' and Req_W = '0' and Req_S = '0' and Req_L = '0') and "
                "next_state_out /= East) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantE1 <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantE1 <= '0'; \n")
        arbiter_checker_vhd.write("	end if;		 \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '47' in checker_id:
        arbiter_checker_vhd.write("process(Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin \n")
        arbiter_checker_vhd.write(
                "	if ( (Req_N = '0' and Req_E = '0' and Req_W = '1' and Req_S = '0' and Req_L = '0') "
                "and next_state_out /= West) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantW1 <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantW1 <= '0'; \n")
        arbiter_checker_vhd.write("	end if;		 \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '48' in checker_id:
        arbiter_checker_vhd.write("process(Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin \n")
        arbiter_checker_vhd.write(
                "	if ( (Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '1' and Req_L = '0') "
                "and next_state_out /= South) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantS1 <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantS1 <= '0'; \n")
        arbiter_checker_vhd.write("	end if;		 \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '49' in checker_id:
        arbiter_checker_vhd.write("process(Req_N, Req_E, Req_W, Req_S, Req_L, next_state_out) begin \n")
        arbiter_checker_vhd.write(
                "	if ( (Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '1') and "
                "next_state_out /= Local) then \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantL1 <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_switchgrantL1 <= '0'; \n")
        arbiter_checker_vhd.write("	end if;		 \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '50' in checker_id:
        arbiter_checker_vhd.write("process (RTS_FF, DCTS, next_state_out, state_in) begin \n")
        arbiter_checker_vhd.write("    if ((RTS_FF = '0' or DCTS = '1') and state_in /= next_state_out) then  \n")
        arbiter_checker_vhd.write("        err_Arbiter_state_not_update <= '1'; \n")
        arbiter_checker_vhd.write("    else \n")
        arbiter_checker_vhd.write("   		err_Arbiter_state_not_update <= '0'; \n")
        arbiter_checker_vhd.write("   	end if; \n")
        arbiter_checker_vhd.write("end process; \n")
        arbiter_checker_vhd.write(" \n")

    if '51' in checker_id:
        arbiter_checker_vhd.write("process(state, RTS_FF, DCTS, Grant_N, Grant_E, Grant_W, Grant_S, Grant_L) begin \n")
        arbiter_checker_vhd.write(
                "	if (state /= IDLE and RTS_FF = '1' and DCTS = '1' and Grant_N = '0' and Grant_E = '0' and "
                "Grant_W = '0' and Grant_S = '0' and Grant_L = '0') then \n")
        arbiter_checker_vhd.write("		err_Arbiter_no_Grant <= '1'; \n")
        arbiter_checker_vhd.write("	else  \n")
        arbiter_checker_vhd.write("		err_Arbiter_no_Grant <= '0'; \n")
        arbiter_checker_vhd.write("	end if; \n")
        arbiter_checker_vhd.write("end process; \n")

    arbiter_checker_vhd.write("\n")
    arbiter_checker_vhd.write("\n")
    arbiter_checker_vhd.write("\n")
    arbiter_checker_vhd.write("end behavior;\n")
    arbiter_checker_vhd.write("\n")
    arbiter_checker_vhd.write("\n")

    arbiter_checker_vhd.close()
