--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity Routing_module_TB is       -- table based routing module
    generic (
        cur_addr_rst: integer := 8;
        table_address_width := integer 2;
        NoC_size: integer := 4
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);
            load_table_en: in std_logic;
            r_table_address: in std_logic_vector(table_address_width downto 0)
            r_table_data: in (4 downto 0);       
            Req_N, Req_E, Req_W, Req_S, Req_L:out std_logic
            );
end Routing_module_TB;

architecture behavior of Routing_module_TB is

  type routin_table_type is array (0 to NoC_size) of std_logic_vector(4 downto 0);
  signal routing_table : routin_table_type ;
  signal Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: std_logic;
  signal Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: std_logic;

begin 
  
-- sequential part
process(clk, reset)
begin
if reset = '0' then 
  Req_N_FF <= '0';
  Req_E_FF <= '0';
  Req_W_FF <= '0';
  Req_S_FF <= '0';
  Req_L_FF <= '0';
  routing_table <= routing_table_init;
elsif clk'event and clk = '1' then 
  if load_table_en = '1':
    routing_table(conv_integer(r_table_address)) <= r_table_data;
    Req_N_FF <= '0';
    Req_E_FF <= '0';
    Req_W_FF <= '0';
    Req_S_FF <= '0';
    Req_L_FF <= '0';    
  else
    Req_N_FF <= Req_N_in;
    Req_E_FF <= Req_E_in;
    Req_W_FF <= Req_W_in;
    Req_S_FF <= Req_S_in;
    Req_L_FF <= Req_L_in;
  end if;
end if;
end process;
 
-- The combionational part
process(flit_type, dst_addr, Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF) 
begin 
  if flit_type = "001" then
      Req_N_in <= routin_table_type(conv_integer(dst_addr))(4);
      Req_E_in <= routin_table_type(conv_integer(dst_addr))(3);
      Req_W_in <= routin_table_type(conv_integer(dst_addr))(2);
      Req_S_in <= routin_table_type(conv_integer(dst_addr))(1);
      Req_L_in <= routin_table_type(conv_integer(dst_addr))(0);
  elsif flit_type = "100" then
      Req_N_in <= '0';
      Req_E_in <= '0';
      Req_W_in <= '0';
      Req_S_in <= '0';
      Req_L_in <= '0';
  else
      Req_N_in <= Req_N_FF;
      Req_E_in <= Req_E_FF;
      Req_W_in <= Req_W_FF;
      Req_S_in <= Req_S_FF;
      Req_L_in <= Req_L_FF;
  end if;
end process;   
END;