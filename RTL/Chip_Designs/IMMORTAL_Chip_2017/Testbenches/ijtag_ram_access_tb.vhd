----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/21/2017 05:18:09 PM
-- Design Name: 
-- Module Name: ijtag_ram_access_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ijtag_ram_access_tb is
end ijtag_ram_access_tb;

architecture Behavioral of ijtag_ram_access_tb is

constant tck_period : time := 10 ns;
constant HALF_SEPARATOR : time := 2*tck_period;
constant FULL_SEPARATOR : time := 8*tck_period;
constant RAMDataSize : positive := 32;
constant RAMAddrSize : positive := 32;


signal toSI : STD_LOGIC;
signal fromSO : STD_LOGIC;
signal SE : STD_LOGIC;
signal CE : STD_LOGIC;
signal UE : STD_LOGIC;
signal TCK : STD_LOGIC;
signal RST : STD_LOGIC;
signal SEL : STD_LOGIC;
signal MEM_SIB_SEL : STD_LOGIC;
signal RAM_data_read : STD_LOGIC_VECTOR (RAMDataSize-1 downto 0);
signal RAM_data_write : STD_LOGIC_VECTOR (RAMDataSize-1 downto 0);
signal RAM_address_out : STD_LOGIC_VECTOR (RAMAddrSize-1 downto 0);
signal RAM_write_enable : STD_LOGIC;

component RAMAccessInstrument is
 Generic ( DataSize : positive := 8;
          AddressSize : positive := 8);
   Port ( -- Scan Interface scan_client ----------
           SI : in STD_LOGIC; -- ScanInPort 
          SO : out STD_LOGIC; -- ScanOutPort
          SEL : in STD_LOGIC; -- SelectPort
          ----------------------------------------        
          SE : in STD_LOGIC; -- ShiftEnPort
          CE : in STD_LOGIC; -- CaptureEnPort
          UE : in STD_LOGIC; -- UpdateEnPort
          RST : in STD_LOGIC; -- ResetPort
          TCK : in STD_LOGIC; -- TCKPort
          MEM_SIB_SEL : out STD_LOGIC;
             -- RAM interface
          RAM_data_read : in STD_LOGIC_VECTOR (DataSize-1 downto 0);
          RAM_data_write : out STD_LOGIC_VECTOR (DataSize-1 downto 0);
          RAM_address_out : out STD_LOGIC_VECTOR (AddressSize-1 downto 0);
          RAM_write_enable : out STD_LOGIC);
end component;

begin

RAM_instr : RAMAccessInstrument
 generic map ( DataSize => RAMDataSize,
               AddressSize => RAMAddrSize)
    port map ( SI => toSI,
               SO => fromSO,
               SEL => SEL,
               SE => SE,
               CE => CE,
               UE => UE,
               RST => RST,
               TCK => TCK,
               MEM_SIB_SEL => MEM_SIB_SEL,
               RAM_data_read => RAM_data_read,
               RAM_data_write => RAM_data_write,
               RAM_address_out => RAM_address_out,
               RAM_write_enable => RAM_write_enable);
               
RAM_data_read <= "00000000000000001111000000000000";

ijtag_shift_proc: process
       -- Generate a number of TCK ticks
    procedure tck_tick (number_of_tick : in positive) is
    begin
      for i in 1 to number_of_tick loop
        TCK <= '0';
        wait for TCK_period/2;
        TCK <= '1';
        wait for TCK_period/2;
      end loop;
    end procedure tck_tick;
    
    procedure tck_halftick_high is
    begin
      TCK <= '1';
      wait for TCK_period/2;
    end procedure tck_halftick_high;
             
    procedure tck_halftick_low is
    begin
      TCK <= '0';
      wait for TCK_period/2;
    end procedure tck_halftick_low;

     -- Shifts in specified data (Capture -> Shift -> Update)
    procedure shift_data (data : in std_logic_vector) is
    begin
        --Capture phase
      CE <= '1';
      tck_tick(1);
      CE <= '0';
         --Shift phase
      SE <= '1';
      for i in data'range loop
         toSI <= data(i);
         tck_tick(1);
      end loop;
      SE <= '0';
      -- Update phase
      UE <= '1';
      tck_tick(1);
      tck_halftick_low;
      UE <= '0';
      tck_halftick_high;
    end procedure shift_data;

          -- Returns all zeroes std_logic_vector of specified size
    function all_zeroes (number_of_zeroes : in positive) return std_logic_vector is
      variable zero_array : std_logic_vector(0 to number_of_zeroes-1);
    begin
      for i in zero_array'range loop
       zero_array(i) := '0';
      end loop;
      return zero_array;
    end function all_zeroes;

  begin

            -- Reset iJTAG chain and Instruments
    RST <= '1';
    wait for tck_period;
    RST <= '0';
    SEL <= '1';
    tck_tick(4);

    shift_data("1"); -- open sib_mem
    tck_tick(4);
    
    shift_data("11"&"0"); -- open sib_mem and sib_addr and close sib_data
    shift_data("11"&"110000000000000000000000000000000"&"0"); -- shift in address 3 and no autoincrement
    shift_data("10"&"101000000000000000000000000000001"&"1"); -- shift in address 5, close addr_sib and enable autoincrement
    
    shift_data("10"&"1"&"01110000000000000000000000000000"); -- shift in data 14

    wait;

end process;

end Behavioral;
