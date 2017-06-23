library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity crc is
port(rst, clk: in std_logic;
     data_in: in std_logic;
     ready : out std_logic;
     crc_out: out std_logic_vector (7 downto 0)
     );
end crc;

architecture beh of crc is

 signal crc_in, crc: std_logic_vector (7 downto 0);
signal counter, counter_in : std_logic_vector (5 downto 0);
begin

process(clk, rst) begin
	if rst = '0' then
		crc <= (others => '0');
		counter <= (others => '0');
 	elsif clk'event and clk = '1' then
		crc <= crc_in;
		counter <= counter_in;

	end if;
end process;

crc_in(0) <= crc(7) xor data_in;
crc_in(1) <= crc(0) xor crc(7);
crc_in(2) <= crc(1) xor crc(7);
crc_in(3) <= crc(2);
crc_in(4) <= crc(3);
crc_in(5) <= crc(4);
crc_in(6) <= crc(5);
crc_in(7) <= crc(6);

crc_out <= crc;

process(counter)begin
	if counter = "101001" then
		counter_in <= (others => '0');
		ready <= '1';
	else
		counter_in <= counter + 1;
		ready <= '0';
	end if;
end process;

end architecture;
