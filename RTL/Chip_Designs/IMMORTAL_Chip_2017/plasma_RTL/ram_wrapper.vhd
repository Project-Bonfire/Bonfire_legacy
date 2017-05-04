---------------------------------------------------------------------
-- TITLE: RAM wrapper
-- AUTHOR: Siavoosh Payandeh Azad
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
   component TS1N40LPB4096X32M4S is 
   generic (cdeFileInit : string);
   port (
      PD : in std_logic;    --Power down mode
      CLK : in std_logic;   --CLK input
      CEB : in std_logic;   --Chip enable, active low for SRAM operation; active high for fuse data setting
      WEB : in std_logic;   --Write enable, active low
      --CEBM : in std_logic;  --Chip enable for BIST, active low for SRAM operation; active high for fuse data setting
      --WEBM : in std_logic;  --Write enable for BIST, active low
      AWT : in std_logic;   --Asynchronous write through
      A: in std_logic_vector(11 downto 0);       --Address input
      D: in std_logic_vector(31 downto 0);      --Data input
      BWEB: in std_logic_vector(31 downto 0);   --Bit write enable, active low
      --AM: in std_logic_vector(9 downto 0);      --Address input for BIST
      --DM: in std_logic_vector(31 downto 0);     --Data input for BIST
      --BWEBM: in std_logic_vector(31 downto 0);  --Bit write enable, active low
      --<BIST: in std_logic;                       --BIST enable
      RTSEL:in std_logic_vector(1 downto 0);    --Read margin setting pins
      WTSEL:in std_logic_vector(1 downto 0);    --Write margin setting pins
      Q: out std_logic_vector(31 downto 0)      --Data output
    );
    end component;
    signal write_enable: std_logic;
    signal write_BWEB: std_logic_vector(31 downto 0);
    signal not_clock: std_logic;
    signal delayed_data_out, Q: std_logic_vector(31 downto 0);
begin
  
   write_enable <= not(write_byte_enable(0) or write_byte_enable(1) or write_byte_enable(2) or write_byte_enable(3));
   not_clock <= not clk;

   -- the following process is not actually tested! 
   process(write_byte_enable)
   begin
   write_BWEB <= (others => '1'); 
   if write_byte_enable(0) = '1' then 
      write_BWEB(7 downto 0) <= "00000000";
   end if;

   if write_byte_enable(1) = '1' then 
      write_BWEB(15 downto 8) <= "00000000";
   end if;

   if write_byte_enable(2) = '1' then 
      write_BWEB(23 downto 16) <= "00000000";
   end if;

   if write_byte_enable(3) = '1' then 
      write_BWEB(31 downto 24) <= "00000000";
   end if;
   end process;

   -- Plasma wants the data in the next clock cycle!
    process(clk, reset)begin
      if reset = '1' then
        delayed_data_out <= (others=> '0');
      elsif rising_edge(clk) then
        delayed_data_out <= Q;
      end if;
    end process;


   RAM_unit: TS1N40LPB4096X32M4S  
   generic map (cdeFileInit => stim_file)
   port map(
      PD  => '0',
      CLK => not_clock,   -- this is the part that we changed. there was some serious timing issues with setup and hold times!
      CEB => '0',
      WEB => write_enable,
      --CEBM => '0',    
      --WEBM => '0',  
      AWT  => '0',  
      A => address(13 downto 2),
      D => data_write, 
      BWEB => write_BWEB,
      --AM => (others =>'0'),
      --DM => (others =>'0'),
      --BWEBM => write_BWEBM,
      --BIST => '0',
      RTSEL => "01",  -- they said and i qoute: "Please use this setting"
      WTSEL => "01",  -- they said and i qoute: "Please use this setting"
      Q => Q
    );

data_read <= delayed_data_out;

end; --architecture logic
