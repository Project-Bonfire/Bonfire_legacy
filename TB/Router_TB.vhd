--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.TB_Package.all;
entity router_tb is
	 
end router_tb; 

architecture behavior of router_tb is

component router is
  generic (
        DATA_WIDTH: integer := 32;
        current_address : integer := 5;
        Rxy_rst : integer := 60;
        Cx_rst : integer := 15
    );
    port (
    reset, clk: in std_logic;
    DCTS_N, DCTS_E, DCTS_w, DCTS_S, DCTS_L: in std_logic;
    DRTS_N, DRTS_E, DRTS_W, DRTS_S, DRTS_L: in std_logic;
    RX_N, RX_E, RX_W, RX_S, RX_L : in std_logic_vector (DATA_WIDTH-1 downto 0); 
    RTS_N, RTS_E, RTS_W, RTS_S, RTS_L: out std_logic;
    CTS_N, CTS_E, CTS_w, CTS_S, CTS_L: out std_logic;
    TX_N, TX_E, TX_W, TX_S, TX_L: out std_logic_vector (DATA_WIDTH-1 downto 0));
end component; 
 
 signal reset,clk: std_logic :='0';
 signal DCTS_N, DCTS_E, DCTS_w, DCTS_S, DCTS_L: std_logic := '0';
 signal DRTS_N, DRTS_E, DRTS_W, DRTS_S, DRTS_L: std_logic;
 signal RTS_N, RTS_E, RTS_W, RTS_S, RTS_L: std_logic;
 signal CTS_N, CTS_E, CTS_w, CTS_S, CTS_L: std_logic;
 signal RX_N, RX_E, RX_W, RX_S, RX_L: std_logic_vector(31 downto 0)  := (others=>'0');
 signal TX_N, TX_E, TX_W, TX_S, TX_L: std_logic_vector(31 downto 0);
 constant clk_period : time := 1 ns;
 

begin

 UUT: router generic map (DATA_WIDTH  => 32, current_address=> 5, Rxy_rst => 60, Cx_rst => 15)
   PORT MAP (reset, clk, 
    DCTS_N, DCTS_E, DCTS_w, DCTS_S, DCTS_L,
    DRTS_N, DRTS_E, DRTS_W, DRTS_S, DRTS_L,
    RX_N, RX_E, RX_W, RX_S, RX_L,
    RTS_N, RTS_E, RTS_W, RTS_S, RTS_L,
    CTS_N, CTS_E, CTS_w, CTS_S, CTS_L,
    TX_N, TX_E, TX_W, TX_S, TX_L);  

   clk_process :process
   begin
        clk <= '0';
        wait for clk_period/2;   
        clk <= '1';
        wait for clk_period/2; 
   end process;

reset <= '1' after 1 ns;
 

 --TODO: I have to find a way to better manage this packet generation. I basically want them out of the process
 --       one way to do it is to add some variable as initial delay....
process begin
 
  gen_packet(7, 1, 5, 1, 2, clk, CTS_N, DRTS_N, RX_N);
wait;
 end process;

process begin
 
  gen_packet(3, 6, 5, 1, 2, clk, CTS_E, DRTS_E, RX_E);
wait;
 end process;  

 process begin 
 
  gen_packet(3, 4, 5, 1, 2, clk,CTS_W, DRTS_W, RX_W);
wait;
 end process;  


 process begin
 
  gen_packet(3, 9, 5, 1, 2, clk,CTS_S, DRTS_S, RX_S);
wait;
 end process;   

  process begin
 
  gen_packet(9, 5, 2, 1, 2, clk, CTS_L, DRTS_L, RX_L);
wait;
 end process;   

 process begin
 get_packet(32, 10,  clk, DCTS_E, RTS_E, TX_E);
 end process;

 process begin
 get_packet(32, 15,  clk, DCTS_L, RTS_L, TX_L);
 end process;

end;