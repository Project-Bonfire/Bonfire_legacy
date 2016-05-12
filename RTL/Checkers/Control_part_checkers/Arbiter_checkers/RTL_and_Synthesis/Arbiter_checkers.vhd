library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity Arbiter_checkers is
    port (  Req_N, Req_E, Req_W, Req_S, Req_L:in std_logic;
            DCTS: in std_logic;	
    		Grant_N, Grant_E, Grant_W, Grant_S, Grant_L: in  std_logic;
            Xbar_sel : in std_logic_vector(4 downto 0);
            state_in: in std_logic_vector (5 downto 0);

            -- Checker outputs
            err_Arbiter_Grants_onehot, err_Arbiter_Xbar_sel_onehot, err_Arbiter_state_onehot, 
            err_Arbiter_no_req_Grant: out std_logic
            );
end Arbiter_checkers;

architecture behavior of Arbiter_checkers is

CONSTANT IDLE: std_logic_vector (5 downto 0) := "000001";
CONSTANT Local: std_logic_vector (5 downto 0) := "000010";
CONSTANT North: std_logic_vector (5 downto 0) := "000100";
CONSTANT East: std_logic_vector (5 downto 0) := "001000";
CONSTANT West: std_logic_vector (5 downto 0) := "010000";
CONSTANT South: std_logic_vector (5 downto 0) := "100000";

signal Grant_signals: std_logic_vector (4 downto 0);

begin 

Grant_signals <= Grant_N & Grant_E & Grant_W & Grant_S & Grant_L;

-- Checkers

-- Arbiter Grants must be one-hot!
process(Req_N, Req_E, Req_W, Req_S, Req_L, Grant_N, Grant_E, Grant_W, Grant_S, Grant_L) begin
	if ( (Req_N = '1' or Req_E = '1' or Req_W = '1' or Req_S = '1' or Req_L = '1') and Grant_signals /= "00000" and Grant_signals /= "00001" and Grant_signals /= "00010" and Grant_signals /= "00100" and Grant_signals /= "01000" and Grant_signals /= "10000" ) then
		err_Arbiter_Grants_onehot <= '1';
	else
		err_Arbiter_Grants_onehot <= '0';
	end if;
end process;

-- Arbiter select lines for Crossbar Switch must be one-hot!  
process(Req_N, Req_E, Req_W, Req_S, Req_L, Xbar_sel) begin
	if ( (Req_N = '1' or Req_E = '1' or Req_W = '1' or Req_S = '1' or Req_L = '1') and Xbar_sel /= "00000" and Xbar_sel /= "00001" and Xbar_sel /= "00010" and Xbar_sel /= "00100" and Xbar_sel /= "01000" and Xbar_sel /= "10000") then
		err_Arbiter_Xbar_sel_onehot <= '1';		
	else
		err_Arbiter_Xbar_sel_onehot <= '0';
	end if;
end process;

-- If we make the state variable of the arbiter (state_in) one-hot, we must check that it is one-hot!
process(state_in) begin
	if (state_in /= IDLE and state_in /= Local and state_in /= North and state_in /= East and state_in /= West and state_in /= South) then
		err_Arbiter_state_onehot <= '1';		
	else
		err_Arbiter_state_onehot <= '0';
	end if;
end process;

-- If there is no request for arbitration and the next router/NI is also not ready to receive any flits, the arbiter must be in IDLE state!
--process(Req_N, Req_E, Req_W, Req_S, Req_L, state_in) begin
--	if ( (Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '0') and DCTS ='0' and state_in /= IDLE) then
--		err_Arbiter_no_req_IDLE_state <= '1';
--	else
--		err_Arbiter_no_req_IDLE_state <= '0';		
--	end if;	
--end process;

-- If there is no request for arbitration and the next router/NI is also not ready to receive any flits, the arbiter must not active any Grant signals in its output!
process(Req_N, Req_E, Req_W, Req_S, Req_L, Grant_N, Grant_E, Grant_W, Grant_S, Grant_L) begin
	if ( (Req_N = '0' and Req_E = '0' and Req_W = '0' and Req_S = '0' and Req_L = '0') and DCTS ='0' and (Grant_N = '1' or Grant_E = '1' or Grant_W = '1' or Grant_S = '1' or Grant_L = '1')) then
		err_Arbiter_no_req_Grant <= '1';
	else 
		err_Arbiter_no_req_Grant <= '0';
	end if;	
end process;

end behavior;