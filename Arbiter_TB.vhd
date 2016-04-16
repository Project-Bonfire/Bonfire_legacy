
 LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;


ENTITY Arbiter_tb IS
END Arbiter_tb;

ARCHITECTURE behavior OF Arbiter_tb IS
  
    COMPONENT Arbiter   
 	 
    port (  reset: in  std_logic;
            clk: in  std_logic;
            Req_N, Req_E, Req_W, Req_S, Req_L:in std_logic;
            DCTS: in std_logic;
            Grant_N, Grant_E, Grant_W, Grant_S, Grant_L:out std_logic;
            Xbar_sel : out std_logic_vector(4 downto 0);
            FIFO_Read: out std_logic;
             
            RTS: out std_logic
            );
	end COMPONENT;
   

	signal reset, clk, DRTS : std_logic:= '0';
 	 signal Xbar_sel: std_logic_vector (4 downto 0);
	signal CTS, Req_N, Req_E, Req_W, Req_S, Req_L: std_logic:='0'; 
  signal FIFO_Read, Grant_N, Grant_E, Grant_W, Grant_S, Grant_L: std_logic;
	constant clk_period : time := 1 ns;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
   uut: Arbiter 
   PORT MAP (
   		  	reset => reset,
         	clk => clk,
          Req_N => Req_N ,
          Req_E => Req_E ,
          Req_W => Req_W ,
          Req_S => Req_S ,
          Req_L => Req_L ,
          DCTS => CTS,
          Grant_N => Grant_N,
          Grant_E => Grant_E,
          Grant_W => Grant_W,
          Grant_S => Grant_S,
          Grant_L => Grant_L,
          Xbar_sel => Xbar_sel,
          FIFO_Read => FIFO_Read,
          
          RTS =>  DRTS
        );      

    clk_process :process
   begin
        clk <= '1';
        wait for clk_period/2;   
        clk <= '0';
        wait for clk_period/2; 
   end process;
   -- Stimulus process
 	
   process
   begin
   wait for clk_period;
   reset<='1';
   wait for 3*clk_period;
   Req_N <='1';
   wait for 3*clk_period;
   CTS<= '1';
 
   wait;
   end process;
   
END;