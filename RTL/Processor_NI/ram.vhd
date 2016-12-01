---------------------------------------------------------------------
-- TITLE: Random Access Memory
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 4/21/01
-- FILENAME: ram.vhd
-- PROJECT: Plasma CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    Implements the RAM, reads the executable from either "code.txt",
--    or for Altera "code[0-3].hex".
--    Modified from "The Designer's Guide to VHDL" by Peter J. Ashenden

---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use work.mlite_pack.all;

entity ram is
   generic(memory_type : string := "DEFAULT";
           stim_file: string :="code.txt");
   port(clk               : in std_logic;
		reset             : in std_logic;
        enable            : in std_logic;
        write_byte_enable : in std_logic_vector(3 downto 0);
        address           : in std_logic_vector(31 downto 2);
        data_write        : in std_logic_vector(31 downto 0);
        data_read         : out std_logic_vector(31 downto 0));
end; --entity ram

architecture logic of ram is
   constant ADDRESS_WIDTH   : natural := 13;
   subtype word is std_logic_vector(data_write'length-1 downto 0);
      type storage_array is
         array(natural range 0 to (2 ** ADDRESS_WIDTH)/4 - 1) of word;
   signal storage : storage_array;
begin
 
    
   ram_proc: process(clk, enable, write_byte_enable, 
         address, data_write) --mem_write, mem_sel
       variable data : std_logic_vector(31 downto 0); 
      
       variable index : natural := 0;
      file load_file : text open read_mode is stim_file;
      variable hex_file_line : line;
   begin

      --Load in the ram executable image
      if index = 0 then
         while not endfile(load_file) loop
--The following two lines had to be commented out for synthesis
            readline(load_file, hex_file_line);
            hread(hex_file_line, data);
            storage(index) <= data;
            index := index + 1;
         end loop;
      end if;

      if rising_edge(clk) then
         index := conv_integer(address(ADDRESS_WIDTH-1 downto 2));
         data := storage(index);

         if enable = '1'  then
            if write_byte_enable(0) = '1' then
               data(7 downto 0) := data_write(7 downto 0);
            end if;
            if write_byte_enable(1) = '1' then
               data(15 downto 8) := data_write(15 downto 8);
            end if;
            if write_byte_enable(2) = '1' then
               data(23 downto 16) := data_write(23 downto 16);
            end if;
            if write_byte_enable(3) = '1' then
               data(31 downto 24) := data_write(31 downto 24);
            end if;
         end if;
      
         if write_byte_enable /= "0000" then
            storage(index) <= data;
         end if;
      end if;

      data_read <= data;
   end process;
 
 

end; --architecture logic
