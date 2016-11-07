
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY hamcdtb IS
END hamcdtb;
 
ARCHITECTURE behavior OF hamcdtb IS 
 
    COMPONENT hamtm
    PORT(
         datain : IN  std_logic_vector(31 downto 0);
         data_out : OUT  std_logic_vector(31 downto 0);
         se : OUT  std_logic;
         de : OUT  std_logic;
         ne : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal datain : std_logic_vector(31 downto 0) := (others => '0');

  --Outputs
   signal data_out : std_logic_vector(31 downto 0);
   signal se : std_logic;
   signal de : std_logic;
   signal ne : std_logic;
 
BEGIN
 
  -- Instantiate the Unit Under Test (UUT)
   uut: hamtm PORT MAP (
          datain => datain,
          data_out => data_out,
          se => se,
          de => de,
          ne => ne
        );
   stim_proc: process
   begin    
      wait for 100 ns;  

 datain <="10101100101010111010101001111101";
   end process;

END;
