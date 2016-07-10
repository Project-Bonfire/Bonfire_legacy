
library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity Arbiter_checkers is
   port (  
           Req_N, Req_E, Req_W, Req_S, Req_L:in std_logic;
           DCTS: in std_logic; 
           Grant_N, Grant_E, Grant_W, Grant_S, Grant_L: in std_logic;
           Xbar_sel : in std_logic_vector(4 downto 0);
           state: in std_logic_vector (5 downto 0);
           state_in: in std_logic_vector (5 downto 0);
           next_state_out: in std_logic_vector (5 downto 0);
           RTS_FF: in std_logic;
           RTS_FF_in: in std_logic;

           -- Checker outputs 
err_Arbiter_Xbar_sel_onehot : out std_logic
                );
end Arbiter_checkers;

architecture behavior of Arbiter_checkers is

CONSTANT IDLE: std_logic_vector (5 downto 0) := "000001";
CONSTANT Local: std_logic_vector (5 downto 0) := "000010";
CONSTANT North: std_logic_vector (5 downto 0) := "000100";
CONSTANT East: std_logic_vector (5 downto 0) := "001000";
CONSTANT West: std_logic_vector (5 downto 0) := "010000";
CONSTANT South: std_logic_vector (5 downto 0) := "100000";

begin 

-- Checkers

-- Arbiter select lines for Crossbar Switch must be one-hot!
process(Xbar_sel) begin
--	if (DCTS = '1' and RTS_FF = '1' and (Req_N = '1' or Req_E = '1' or Req_W = '1' or Req_L = '1') and Xbar_sel /= "0001" and Xbar_sel /= "0010" and Xbar_sel /= "0100" and Xbar_sel /= "1000" ) then
	if (Xbar_sel /= "00000" and Xbar_sel /= "00001" and Xbar_sel /= "00010" and Xbar_sel /= "00100" and Xbar_sel /= "01000" and Xbar_sel /= "10000") then 
		err_Arbiter_Xbar_sel_onehot <= '1';		
	else
		err_Arbiter_Xbar_sel_onehot <= '0';
	end if;
end process;




end behavior;


