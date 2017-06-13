-- In Questasim simulation. because i cant add actual xilinx rams, since they use unisim libraries. I can export libraries but can not put it on git for license issues.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.mlite_pack.all;
entity ram_0 is
   generic(memory_type : string := "DEFAULT";
           --Number of 8KB blocks of internal RAM, up to 64KB (1 to 8)
           block_count : integer := 8);
   port(clk               : in std_logic;
        enable            : in std_logic;
        reset             : in std_logic;
        write_byte_enable : in std_logic_vector(3 downto 0);
        address           : in std_logic_vector(31 downto 2);
        data_write        : in std_logic_vector(31 downto 0);
        data_read         : out std_logic_vector(31 downto 0));
end; --entity ram

architecture logic of ram_0 is
begin
end;





library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.mlite_pack.all;
entity ram_1 is
   generic(memory_type : string := "DEFAULT";
           --Number of 8KB blocks of internal RAM, up to 64KB (1 to 8)
           block_count : integer := 8);
   port(clk               : in std_logic;
        enable            : in std_logic;
        reset             : in std_logic;
        write_byte_enable : in std_logic_vector(3 downto 0);
        address           : in std_logic_vector(31 downto 2);
        data_write        : in std_logic_vector(31 downto 0);
        data_read         : out std_logic_vector(31 downto 0));
end; --entity ram
architecture logic of ram_1 is
begin
end;







library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.mlite_pack.all;
entity ram_2 is
   generic(memory_type : string := "DEFAULT";
           --Number of 8KB blocks of internal RAM, up to 64KB (1 to 8)
           block_count : integer := 8);
   port(clk               : in std_logic;
        enable            : in std_logic;
        reset             : in std_logic;
        write_byte_enable : in std_logic_vector(3 downto 0);
        address           : in std_logic_vector(31 downto 2);
        data_write        : in std_logic_vector(31 downto 0);
        data_read         : out std_logic_vector(31 downto 0));
end; --entity ram
architecture logic of ram_2 is
begin
end;






library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.mlite_pack.all;
entity ram_3 is
   generic(memory_type : string := "DEFAULT";
           --Number of 8KB blocks of internal RAM, up to 64KB (1 to 8)
           block_count : integer := 8);
   port(clk               : in std_logic;
        enable            : in std_logic;
        reset             : in std_logic;
        write_byte_enable : in std_logic_vector(3 downto 0);
        address           : in std_logic_vector(31 downto 2);
        data_write        : in std_logic_vector(31 downto 0);
        data_read         : out std_logic_vector(31 downto 0));
end; --entity ram
architecture logic of ram_3 is
begin
end;
