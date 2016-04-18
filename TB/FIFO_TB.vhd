--Copyright (C) 2016 Siavoosh Payandeh Azad

 LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;


ENTITY FIFO_tb IS
END FIFO_tb;

ARCHITECTURE behavior OF FIFO_tb IS
  
    COMPONENT FIFO   
 	generic (
        DATA_WIDTH: integer := 8
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            RX: in std_logic_vector(DATA_WIDTH-1 downto 0); 
            DRTS: in std_logic;
            read_en : in std_logic;
            CTS: out std_logic;
            Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
	end COMPONENT;
   

	signal reset, clk, RTS, read_en : std_logic:= '0';
	signal DCTS  : std_logic;
	signal TX_tb, Read_data : std_logic_vector(7 downto 0) := "00000001";
	constant clk_period : time := 1 ns;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
   uut: FIFO 
   generic map (DATA_WIDTH  => 8)
   PORT MAP (
   		  	reset => reset,
         	clk => clk,
          	RX => TX_tb,
          	DRTS => RTS,
          	read_en => read_en,
          	CTS => DCTS,
          	Data_out => Read_data
        );      

    clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;   
        clk <= '1';
        wait for clk_period/2; 
   end process;
   -- Stimulus process
 	
   reset<='1' after 1ns;

   process (clk)
   begin
   		if clk'event and clk = '1' then
	   		if reset = '1' then
		   		RTS <= '1';
		  		if DCTS ='1'then
		  			TX_tb <= TX_tb + 1;
			   	end if; 
			end if;
		end if;
   end process;

   process
   begin
   		wait for 10 ns;
   		read_en <= '1';
      wait for 10 ns;
      read_en <= '0';
   end process;
END;