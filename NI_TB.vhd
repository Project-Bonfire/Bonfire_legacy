--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.Router_Package.all;

entity NI_TB is
 
end NI_TB;

architecture behavior of NI_TB is

  component NI is
    generic (
        DATA_WIDTH: integer := 32
    );
   port (  reset: in  std_logic;
            clk: in  std_logic;
            RX1: in std_logic_vector(DATA_WIDTH-1 downto 0); 
            TX1: out std_logic_vector(DATA_WIDTH-1 downto 0); 
            DRTS1, DCTS1: in  std_logic;
            RTS1,CTS1: out  std_logic;

            RX2: in std_logic_vector(DATA_WIDTH-1 downto 0); 
            TX2: out std_logic_vector(DATA_WIDTH-1 downto 0); 
            DRTS2, DCTS2: in  std_logic;
            RTS2,CTS2: out  std_logic
    );
    end component;
    signal clk, reset: std_logic := '0';
    signal RX1, RX2: std_logic_vector(31 downto 0):= (others => '0') ; 
    signal TX1, TX2: std_logic_vector(31 downto 0); 
    signal RTS1, CTS1,RTS2, CTS2:  std_logic;
    signal  DRTS1, DCTS1, DRTS2, DCTS2:  std_logic := '0';
    constant clk_period : time := 1 ns;

begin
--              
--   TB                                                                 TB
--     --            ---- ---------------------------------- --          --  
--   RX  |<---------| TX1                                   RX1|<----   |
--   DRTS|<---------| RTS1                                DRTS1|<----   |    
--   CTS |--------->| DCTS1                                CTS1|---->   |
--       |          |                    NI                    |        |
--     TX|--------->| RX2                                   TX2|---->   | 
--    RTS|--------->| DRTS2                                RTS2|<----   | 
--   DCTS|<---------| CTS2                                DCTS2|---->   |    
--     --            ---- ---------------------------------- --          --


-- Hand shake protocol!
--
--           |<-Valid->|
--           |   Data  |  
--      _____ _________ ______
--  RX  _____X_________X______
--  DRTS_____|'''''''''|_____
--  CTS _________|'''''''''|_______

 uut: NI 
   generic map (DATA_WIDTH=> 32)
   PORT MAP (
            reset => reset,
            clk => clk,
            RX1 => RX1, TX1 => TX1, RTS1 =>RTS1,DRTS1=>DRTS1, CTS1=>CTS1, DCTS1=>DCTS1,
            RX2 => RX2, TX2 => TX2, RTS2 =>RTS2,DRTS2=>DRTS2, CTS2=>CTS2, DCTS2=>DCTS2
        );      

reset <= '1' after 1 ns;

 clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;   
        clk <= '1';
        wait for clk_period/2; 
   end process;

DCTS1 <= '1' after 10 ns;

DRTS1 <= '1'after 1 ns, '0' after 4 ns;

process begin
wait for 1*clk_period;
RX1 <= Header_gen(1, 1, 0, 1);
wait for 1*clk_period;
RX1 <= Body_gen(1, 100);
wait for 1*clk_period;
RX1 <= Tail_gen(1, 200);
 
 wait;
 end process;
end;