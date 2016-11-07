--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity NI is
    generic (
        DATA_WIDTH: integer := 32;
        NI_DEPTH: integer:=16
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
end NI;

architecture behavior of NI is


component NI_channel is
    generic (
        DATA_WIDTH: integer := 32;
        NI_DEPTH: integer:=16
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            RX: in std_logic_vector(DATA_WIDTH-1 downto 0); 
            TX: out std_logic_vector(DATA_WIDTH-1 downto 0); 
            DRTS, DCTS: in  std_logic;
            RTS,CTS: out  std_logic
    );
end component;

begin

--              
--   PE                                                                 router
--     --            ---- ---------------------------------- --          --  
--   RX  |<---------| TX1                                   RX1|<----   | TX_L_R_?
--   DRTS|<---------| RTS1                                DRTS1|<----   | RTS_L_R_?
--   CTS |--------->| DCTS1                                CTS1|---->   | DCTS_L_R_?
--       |          |                    NI                    |        |
--     TX|--------->| RX2                                   TX2|---->   | RX_L_R_?
--    RTS|--------->| DRTS2                                RTS2|---->   | DRTS_L_R_?
--   DCTS|<---------| CTS2                                DCTS2|<----   | CTS_L_R_?
--     --            ---- ---------------------------------- --          --


--  circular buffer structure
--                                   <--- WriteP    
--              ---------------------------------
--              |   3   |   2   |   1   |   0   |
--              ---------------------------------
--                                   <--- readP          

Channel_1: NI_channel generic map(DATA_WIDTH => DATA_WIDTH, NI_DEPTH => NI_DEPTH)
            port map(reset=>reset, clk =>clk, 
                RX => RX1, TX => TX1, 
                DRTS=>DRTS1, DCTS=>DCTS1,
                RTS=>RTS1,CTS=>CTS1);

Channel_2: NI_channel generic map(DATA_WIDTH => DATA_WIDTH, NI_DEPTH => NI_DEPTH)
            port map(reset=>reset, clk =>clk, 
                RX => RX2, TX => TX2, 
                DRTS=>DRTS2, DCTS=>DCTS2,
                RTS=>RTS2,CTS=>CTS2);


end;