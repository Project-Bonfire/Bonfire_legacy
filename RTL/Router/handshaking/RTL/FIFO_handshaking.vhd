--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FIFO is
    generic (
        DATA_WIDTH: integer := 32
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            RX: in std_logic_vector(DATA_WIDTH-1 downto 0);
            DRTS: in std_logic;
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            CTS: out std_logic;
            empty_out: out std_logic;
            Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end;

architecture behavior of FIFO is
   signal read_pointer, read_pointer_in,  write_pointer, write_pointer_in: std_logic_vector(1 downto 0);
   signal full, empty: std_logic;
   signal read_en, write_en: std_logic;
   signal CTS_in, CTS_out: std_logic;

   type FIFO_Mem_type is array (0 to 3) of std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_Mem : FIFO_Mem_type ;

   TYPE STATE_TYPE IS (IDLE, READ_DATA);
   SIGNAL HS_state_out,HS_state_in   : STATE_TYPE;

begin
 --------------------------------------------------------------------------------------------
--                           block diagram of the FIFO!
--  previous
--   router
--     --            ------------------------------------------
--       |          |                                          |
--     TX|--------->| RX                               Data_out|----> goes to Xbar and LBDR
--       |          |                                          |
--    RTS|--------->| DRTS             FIFO             read_en|<---- Comes from Arbiters (N,E,W,S,L)
--       |          |                               (N,E,W,S,L)|
--   DCTS|<---------| CTS                                      |
--     --            ------------------------------------------
 --------------------------------------------------------------------------------------------
-- Hand shake protocol!
--
--                |<-Valid->|
--                |   Data  |
--           _____ _________ ______
--  RX       _____X_________X______
--  DRTS     _____|'''''''''|_____
--  CTS      __________|''''|_______
--

 --------------------------------------------------------------------------------------------
--  circular buffer structure
--                                   <--- WriteP
--              ---------------------------------
--              |   3   |   2   |   1   |   0   |
--              ---------------------------------
--                                   <--- readP
 --------------------------------------------------------------------------------------------



   process (clk, reset)begin
        if reset = '0' then
            HS_state_out <= IDLE;
            read_pointer <= "00";
            write_pointer <= "00";
            CTS_out<='0';
            FIFO_Mem<= (others => (others=>'0'));
        elsif clk'event and clk = '1' then
            HS_state_out <= HS_state_in;
            write_pointer <= write_pointer_in;
            if write_en = '1' then
                --write into the memory
                FIFO_Mem(conv_integer(write_pointer)) <= RX;
            end if;
            read_pointer <=  read_pointer_in;
            CTS_out<=CTS_in;
        end if;
    end process;

 -- anything below here is pure combinational

   -- combinatorial part
   Data_out <= FIFO_Mem(conv_integer(read_pointer));
   read_en <= (read_en_N or read_en_E or read_en_W or read_en_S or read_en_L) and not empty;
   empty_out <= empty;
   CTS <= CTS_out;

   process(write_en, write_pointer)begin
     if write_en = '1'then
        write_pointer_in <= write_pointer+1;
     else
        write_pointer_in <= write_pointer;
     end if;
   end process;

   process(read_en, empty, read_pointer)begin
        if (read_en = '1' and empty = '0') then
            read_pointer_in <= read_pointer+1;
        else
            read_pointer_in <= read_pointer;
        end if;
   end process;

   process(HS_state_out, full, DRTS, CTS_out) begin
        case(HS_state_out) is
            when IDLE =>
                if CTS_out = '0' and DRTS = '1' and full ='0' then
                    HS_state_in <= READ_DATA;
                    CTS_in <= '1';
                    write_en <= '1';
                else
                    HS_state_in <= IDLE;
                    CTS_in <= '0';
                    write_en <= '0';
                end if;
            when others => -- READ_DATA
                if CTS_out = '0' and DRTS = '1' and full ='0' then
                    HS_state_in <= READ_DATA;
                    CTS_in <= '1';
                    write_en <= '1';
                else
                    HS_state_in <= IDLE;
                    CTS_in <= '0';
                    write_en <= '0';
                end if;
        end case ;

   end process;

    process(write_pointer, read_pointer)begin
        if read_pointer = write_pointer  then
                empty <= '1';
            else
                empty <= '0';
            end if;
        if write_pointer = read_pointer - 1 then
                full <= '1';
            else
                full <= '0';
            end if;

    end process;

end;
