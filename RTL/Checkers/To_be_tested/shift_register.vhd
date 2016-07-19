library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shift_register is
    generic (
        DATA_WIDTH: integer := 4
    );
    port (
        reset, clk: in std_logic;
		  mux_select: in std_logic;
        shift_to_right: in std_logic;
        shift_to_left: in std_logic;
        serial_in: in std_logic;
		  checkers_output: in std_logic_vector(DATA_WIDTH-1 downto 0);
        output: out std_logic_vector(DATA_WIDTH-1 downto 0)
    ); 
end shift_register; 

architecture behavior of shift_register is

signal register_value_in, register_value_FF: std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');

begin

output <= register_value_FF;

process(clk, reset)
begin
  if reset = '0' then 
    register_value_FF <= (others => '0');
	
  elsif clk'event and clk = '1' then 
    register_value_FF <= register_value_in;
  end if; 
end process;

process (mux_select, shift_to_right, shift_to_left, register_value_FF, serial_in, checkers_output)
begin
  if mux_select = '1' and shift_to_right = '1' then  -- Shift to Right
    register_value_in <= serial_in & register_value_FF(DATA_WIDTH-1 downto 1);
  elsif mux_select = '1' and shift_to_left = '1' then  -- Shift to Left
    register_value_in <= register_value_FF(DATA_WIDTH-2 downto 0) & serial_in;
  elsif mux_select = '0' then
	 register_value_in <= register_value_FF or checkers_output;
  end if;
end process;

end behavior;