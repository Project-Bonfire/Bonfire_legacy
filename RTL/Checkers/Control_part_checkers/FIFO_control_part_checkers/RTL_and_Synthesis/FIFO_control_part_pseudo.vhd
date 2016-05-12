--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FIFO_control_part_pseudo is
    port (  DRTS: in std_logic;  
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            CTS_out : in std_logic; -- pseudo-input
            read_pointer: in std_logic_vector(1 downto 0); -- pseudo-input
            write_pointer: in std_logic_vector(1 downto 0); -- pseudo-input
            --read_pointer: in std_logic_vector(3 downto 0); -- pseudo-input
            --write_pointer: in std_logic_vector(3 downto 0); -- pseudo-input

            CTS_in: out std_logic; -- pseudo-output
            read_pointer_in: out std_logic_vector(1 downto 0); -- pseudo-output
            write_pointer_in: out std_logic_vector(1 downto 0); -- pseudo-output
            --read_pointer_in: out std_logic_vector(3 downto 0); -- pseudo-output
            --write_pointer_in: out std_logic_vector(3 downto 0); -- pseudo-output
            empty_out: out std_logic;
            full_out: out std_logic;
            read_en_out: out std_logic;
            write_en_out: out std_logic            
    );
end;

architecture behavior of FIFO_control_part_pseudo is
    
   signal full, empty: std_logic;
   signal read_en, write_en: std_logic;

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

 -- anything below here is pure combinational
 
   -- combinational part
   read_en <= (read_en_N or read_en_E or read_en_W or read_en_S or read_en_L) and not empty; 
   empty_out <= empty;
   full_out <= full;
   read_en_out <= read_en;
   write_en_out <= write_en;

   process(write_en, write_pointer) 
   begin
     if write_en = '1' then
         write_pointer_in <= write_pointer+1; 
      -- write_pointer_in <= write_pointer(2 downto 0) & write_pointer(3);
     else
        write_pointer_in <= write_pointer; 
     end if;
   end process;

   process(read_en, empty, read_pointer) begin
        if (read_en = '1' and empty = '0') then
            read_pointer_in <= read_pointer+1; 
         -- read_pointer_in <= read_pointer(2 downto 0) & read_pointer(3);            
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

            when others => -- The same as READ_DATA
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
                        
    process(write_pointer, read_pointer) begin

        if (read_pointer = write_pointer)  then
                empty <= '1';
            else
                empty <= '0';
            end if;

        -- if (write_pointer = read_pointer(0) & read_pointer(3 downto 1)) then
        if write_pointer = read_pointer - 1 then
                full <= '1';
            else
                full <= '0'; 
            end if; 

    end process;

end;
