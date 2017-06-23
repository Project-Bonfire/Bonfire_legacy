
library ieee;
use ieee.std_logic_1164.all;
 use std.textio.all;
 use ieee.std_logic_textio.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity decoder_tb is
end decoder_tb;

architecture arch of  decoder_tb is

component crc is
port(rst, clk: in std_logic;
     data_in: in std_logic;
     ready : out std_logic;
     crc_out: out std_logic_vector (7 downto 0)
     );
end component;

 file outfile : text;
-- declare the file to be a text file


 signal crc_out : std_logic_vector (7 downto 0);
 signal data: std_logic_vector (39 downto 0) := (others => '0');
 signal clk, reset, data_in, ready: std_logic := '0';



 constant clk_period : time := 1 ns;

begin


crc_module: crc
         port map(rst=>reset, clk =>clk,
                  data_in => data_in, ready => ready,
                  crc_out=>crc_out);


clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
end process;

process
 variable LINEVARIABLE : line;
 variable fstatus  : File_open_status;
variable coutner_i : integer:=0;
variable s: std_logic_vector (39 downto 0);
file   infile    : text is in  "encoded.txt";   --declare input file
begin

    wait until clk'event and clk ='1';
    if (not endfile(infile)) then
        readline(infile, LINEVARIABLE);
        read(LINEVARIABLE, s);
    else
      wait;
    end if;


    -- report integer'image(to_integer(unsigned(s)));
    data <= s;
    --data <= "0000000000000000000000000000000100000111";
    data_in <= data(39);
    reset <= '0';
    wait for 1 ns;
    reset <= '1';

    while coutner_i < 40 loop

        wait until clk'event and clk ='1';
        data_in <= data(39-coutner_i);

        coutner_i := coutner_i+1;
    end loop;
    wait until clk'event and clk ='1';
    data_in<= '0';
    wait until ready <= '1';
    coutner_i := 0;

end process;

end architecture ; -- arch




