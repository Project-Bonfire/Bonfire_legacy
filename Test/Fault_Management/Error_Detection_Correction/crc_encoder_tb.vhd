library ieee;
use ieee.std_logic_1164.all;
 use std.textio.all;
 use ieee.std_logic_textio.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 

entity encoder_tb is
end encoder_tb;

architecture arch of  encoder_tb is

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
 signal data: std_logic_vector (31 downto 0) := (others => '0');
 signal clk, reset, data_in, ready: std_logic := '0';
 

 
 constant clk_period : time := 1 ns;

begin


encoder: crc 
         port map(rst=>reset, clk =>clk, 
                  data_in => data_in, ready => ready, 
                  crc_out=>crc_out);


process(ready) 
 variable LINEVARIABLE : line;  
 variable fstatus  : File_open_status;
begin
file_open(fstatus,outfile,"encoded.txt",write_mode); 
if ready'event and ready = '1' then 
    write(LINEVARIABLE, data&crc_out);

    writeline(outfile, LINEVARIABLE);
 	 
end if;
end process;


clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;   
        clk <= '1';
        wait for clk_period/2; 
end process;

process
variable coutner_i : integer:=0;
begin
    wait until clk'event and clk ='1';
    data_in <= data(31);
	reset <= '0';
	wait for 1 ns;
	reset <= '1';
	
    -- send in the data
	while coutner_i <32 loop 
 	    report "coutner_i: " & integer'image(coutner_i) & "    "& std_logic'image(data(31-coutner_i));
        wait until clk'event and clk ='1';
		data_in <= data(31-coutner_i);
        coutner_i := coutner_i+1;
    end loop;

    coutner_i := 0;

    -- send in 8 zeros
    while coutner_i < 8 loop 
        report "coutner_i: " & integer'image(coutner_i) & "    "& std_logic'image(data(31-coutner_i));
        wait until clk'event and clk ='1';
        data_in <= '0';
        coutner_i := coutner_i+1;
    end loop;

    wait until ready <= '1';
    coutner_i := 0;
    data <= data + 1;
end process;

end architecture ; -- arch





