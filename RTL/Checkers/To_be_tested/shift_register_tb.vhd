--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:25:53 07/18/2016
-- Design Name:   
-- Module Name:   /home/bniazmand/pc/Bonfire/src/EHA/simulation/shift_register/shift_register_tb.vhd
-- Project Name:  shift_register
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shift_register
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY shift_register_tb IS
END shift_register_tb;
 
ARCHITECTURE behavior OF shift_register_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shift_register
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         mux_select : IN  std_logic;
         shift_to_right : IN  std_logic;
         shift_to_left : IN  std_logic;
         serial_in : IN  std_logic;
			checkers_output: in std_logic_vector(3 downto 0);
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal mux_select : std_logic := '0';
   signal shift_to_right : std_logic := '0';
   signal shift_to_left : std_logic := '0';
   signal serial_in : std_logic := '0';
   signal checkers_output: std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift_register PORT MAP (
          reset => reset,
          clk => clk,
          mux_select => mux_select,
          shift_to_right => shift_to_right,
          shift_to_left => shift_to_left,
          serial_in => serial_in,
			 checkers_output => checkers_output,
          output => output
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		
		reset <= '0';
		wait for clk_period*2;
		reset <= '1';
		
		wait for clk_period*2;
		
		shift_to_right <= '1';
		mux_select <= '1';
		serial_in <= '1';

		wait for clk_period;
		serial_in <= '0';
		
		wait for 4*clk_period;
		
		checkers_output <= "0010";
		
		mux_select <= '0';
		wait for clk_period;
		
      wait;
   end process;

END;
