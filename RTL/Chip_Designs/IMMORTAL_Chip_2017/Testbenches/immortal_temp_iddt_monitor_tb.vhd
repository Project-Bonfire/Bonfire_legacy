----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.09.2017
-- Design Name: 
-- Module Name: immortal_temp_iddt_monitor_tb - Behavioral
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

entity immortal_temp_iddt_monitor_tb is
end immortal_temp_iddt_monitor_tb;

architecture Behavioral of immortal_temp_iddt_monitor_tb is

constant tck_period : time := 10 ns;
constant HALF_SEPARATOR : time := 2*tck_period;
constant FULL_SEPARATOR : time := 8*tck_period;


signal toSI : STD_LOGIC;
signal fromSO : STD_LOGIC;
signal SE : STD_LOGIC;
signal CE : STD_LOGIC;
signal UE : STD_LOGIC;
signal TCK : STD_LOGIC;
signal RST : STD_LOGIC;
signal SEL : STD_LOGIC;
signal toF : STD_LOGIC;
signal toC : STD_LOGIC;

signal temp_control   : std_logic_vector (2 downto 0);
signal temp_adc_data  : std_logic_vector (11 downto 0);
signal temp_adc_drdy  : std_logic;

component immortal_temp_iddt_monitor_instrument is
    port (
      -- IJTAG connection
      TCK         : in std_logic;
      RST         : in std_logic;
      SEL         : in std_logic;
      SI          : in std_logic;
      SE          : in std_logic;
      UE          : in std_logic;
      CE          : in std_logic;
      SO          : out std_logic;
      toF         : out std_logic;
      toC         : out std_logic;

      -- Monitor connections
      control     : out std_logic_vector(2 downto 0);
      adc_data    : in std_logic_vector(11 downto 0);
      adc_drdy    : in std_logic
    );
end component;

begin

temp_monitor : immortal_temp_iddt_monitor_instrument
    port map (
      -- IJTAG connection
      TCK  => TCK,
      RST  => RST,
      SEL  => SEL,
      SI   => toSI,
      SE   => SE,
      UE   => UE,
      CE   => CE,
      SO   => fromSO,
      toF  => toF,
      toC  => toC,

      -- Monitor connections
      control  => temp_control,
      adc_data => temp_adc_data,
      adc_drdy => temp_adc_drdy
    );
               
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
      --tck_tick(1);
      tck_halftick_low;
      UE <= '1';
      tck_halftick_high;
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

    temp_adc_data <= "000000000000";
    temp_adc_drdy <= '0';

    UE <= '0';
    CE <= '0';
    SE <= '0';
    toSI <= '0';
            -- Reset iJTAG chain and Instruments
    RST <= '1';
    wait for tck_period;
    RST <= '0';
    SEL <= '1';
    tck_tick(4);
    
    shift_data("001000000000"&"010000000000"&"0"&"1"&"1"&"01111"); -- shift in threshold H without update 

    tck_tick(4);

    temp_adc_data <= "000000000011";
    tck_tick(1);
    temp_adc_drdy <= '1';
    tck_tick(1);
    temp_adc_drdy <= '0';

    tck_tick(4);

    temp_adc_data <= "000000000100";
    tck_tick(1);
    temp_adc_drdy <= '1';
    tck_tick(1);
    temp_adc_drdy <= '0';

    tck_tick(4);

    temp_adc_data <= "000000001100";
    tck_tick(1);
    temp_adc_drdy <= '1';
    tck_tick(1);
    temp_adc_drdy <= '0';

    tck_tick(4);
    
    shift_data("001000000000"&"010000000000"&"0"&"0"&"1"&"01011"); -- shift in threshold H without update 

    tck_tick(10);
    wait;

end process;

end Behavioral;
