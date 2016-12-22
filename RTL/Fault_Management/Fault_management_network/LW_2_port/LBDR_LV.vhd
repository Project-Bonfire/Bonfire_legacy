--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity LBDR_LV is
    generic (
        cur_addr_rst: integer := 8;
        Rxy_rst: integer := 8;
        Cx_rst: integer := 8;
        NoC_size: integer := 4
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            empty: in  std_logic;
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);
            packet_info: in std_logic;
            flit_type: in std_logic_vector(2 downto 0);
	          grant_E, grant_W, grant_L: in std_logic;
            Req_E, Req_W, Req_L:out std_logic
            );
end LBDR_LV;

architecture behavior of LBDR_LV is

  signal Cx:  std_logic_vector(3 downto 0);
  signal cur_addr:  std_logic_vector(NoC_size-1 downto 0);  
  signal N1, E1, W1, S1  :std_logic :='0';  
  signal grants: std_logic;
begin 

 grants <= grant_E or grant_W or grant_L;

  Cx       <=  std_logic_vector(to_unsigned(Cx_rst, Cx'length));
  cur_addr <= std_logic_vector(to_unsigned(cur_addr_rst, cur_addr'length));

  N1 <= '1' when  dst_addr(NoC_size-1 downto NoC_size/2) < cur_addr(NoC_size-1 downto NoC_size/2) else '0';
  E1 <= '1' when  cur_addr((NoC_size/2)-1 downto 0) < dst_addr((NoC_size/2)-1 downto 0) else '0';
  W1 <= '1' when  dst_addr((NoC_size/2)-1 downto 0) < cur_addr((NoC_size/2)-1 downto 0) else '0';
  S1 <= '1' when  cur_addr(NoC_size-1 downto NoC_size/2) < dst_addr(NoC_size-1 downto NoC_size/2) else '0';


process(clk, reset)
begin
  if reset = '0' then 
    Req_E_FF <= '0';
    Req_W_FF <= '0';
    Req_L_FF <= '0';
  elsif clk'event and clk = '1' then 
    Req_E_FF <= Req_E_in;
    Req_W_FF <= Req_W_in;
    Req_L_FF <= Req_L_in;
  end if;
end process;
 

-- The combionational part

Req_E <= Req_E_FF;
Req_W <= Req_W_FF;
Req_L <= Req_L_FF;

process(N1, E1, W1, S1, Rxy, Cx, empty, Req_E_FF, Req_W_FF, Req_L_FF, grants) begin
 if  flit_type = "001" and empty = '0' then
        Req_E_in <= (S1 or (E1 and not N1)) and Cx(1);
        Req_W_in <= (N1 or (W1 and not S1)) and Cx(2);
        Req_L_in <= not N1 and not E1 and not W1 and not S1;
  elsif  ( flit_type = "100" and empty = '0' and grants = '1') then
        Req_E_in <= '0';
        Req_W_in <= '0';
        Req_L_in <= '0';
  else
        Req_E_in <= Req_E_FF;
        Req_W_in <= Req_W_FF;
        Req_L_in <= Req_L_FF;
  end if;
end process;
   
END;