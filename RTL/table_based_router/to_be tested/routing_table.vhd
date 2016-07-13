--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity routing_table is       
    generic (
        cur_addr_rst: integer := 8;
        table_address_width := integer 2;
        NoC_size: integer := 4
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            -- this is for programming the routing table
            load_table_en: in std_logic;
            wr_table_data: in std_logic_vector(4 downto 0);
            wr_table_add: in std_logic_vector(NoC_size-1 downto 0)
            -- we need to have 5 read ports for each routing module 
            r_address_N: in std_logic_vector(NoC_size-1 downto 0);   
            r_address_E: in std_logic_vector(NoC_size-1 downto 0);   
            r_address_W: in std_logic_vector(NoC_size-1 downto 0);   
            r_address_S: in std_logic_vector(NoC_size-1 downto 0);   
            r_address_L: in std_logic_vector(NoC_size-1 downto 0); 
            r_data_N: in (4 downto 0);  
            r_data_E: in (4 downto 0);  
            r_data_W: in (4 downto 0);  
            r_data_S: in (4 downto 0);  
            r_data_L: in (4 downto 0)
            );
end routing_table;

architecture behavior of routing_table is

  type routin_table_type is array (0 to NoC_size) of std_logic_vector(4 downto 0);
  signal routing_table : routin_table_type ;

begin 
  
-- sequential part
process(clk, reset)
begin
if reset = '0' then 
  routing_table <= (others =>(others=>'0'));
elsif clk'event and clk = '1' then 
  if load_table_en = '1' then 
    routing_table(conv_integer(wr_table_add)) <= wr_table_data;
  end if;
end if;
end process;
 
-- The combionational part
r_data_N <= routing_table(conv_integer(r_address_N));
r_data_E <= routing_table(conv_integer(r_address_E));
r_data_W <= routing_table(conv_integer(r_address_W));
r_data_S <= routing_table(conv_integer(r_address_S));
r_data_L <= routing_table(conv_integer(r_address_L));

END;


