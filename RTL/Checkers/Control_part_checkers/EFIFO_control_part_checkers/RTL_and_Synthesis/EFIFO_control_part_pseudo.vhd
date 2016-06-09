--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity EFIFO_control_part_pseudo is
    port (  DRTS: in std_logic;  
            read_en_N : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            read_pointer: in std_logic_vector(3 downto 0);
            write_pointer: in std_logic_vector(3 downto 0);
            CTS_out: in std_logic;
            HS_state_out: in std_logic_vector(1 downto 0);

            CTS_in: out std_logic; 
            empty_out: out std_logic; 
            full_out: out std_logic;
            read_pointer_in: out std_logic_vector(3 downto 0); 
            write_pointer_in: out std_logic_vector(3 downto 0);
            read_en_out: out std_logic;
            write_en_out: out std_logic; 
            HS_state_in: out std_logic_vector(1 downto 0)
    );
end EFIFO_control_part_pseudo;

architecture behavior of EFIFO_control_part_pseudo is
   signal full, empty: std_logic;
   signal read_en, write_en: std_logic;
   
begin
 --------------------------------------------------------------------------------------------
--                           block diagram of the East FIFO!
--  previous            
--   router                
--     --            ------------------------------------------             
--       |          |                                          |
--     TX|--------->| RX                               Data_out|----> goes to Xbar and LBDR
--       |          |                                          | 
--    RTS|--------->| DRTS             E_FIFO           read_en|<---- Comes from Arbiters (N,W,S,L)
--       |          |                                 (N,W,S,L)|
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
 
   -- combinatorial part

   read_en <= (read_en_N or read_en_W or read_en_S or read_en_L) and not empty; 
   empty_out <= empty;
   read_en_out <= read_en;
   write_en_out <= write_en;
   full_out <= full;

   process(write_en, write_pointer)begin
     if write_en = '1'then
        write_pointer_in <= write_pointer(2 downto 0)&write_pointer(3); 
     else
        write_pointer_in <= write_pointer; 
     end if;
   end process;

   process(read_en, empty, read_pointer)begin
        if (read_en = '1' and empty = '0') then
            read_pointer_in <= read_pointer(2 downto 0)&read_pointer(3); 
        else 
            read_pointer_in <= read_pointer; 
        end if;
   end process;

   process(HS_state_out, full, DRTS, CTS_out) begin
        if (HS_state_out = "01") then
                if CTS_out = '0' and DRTS = '1' and full ='0' then
                    HS_state_in <= "10";
                    CTS_in <= '1';
                    write_en <= '1';
                else
                    HS_state_in <= "01";
                    CTS_in <= '0';
                    write_en <= '0';
                end if;
         elsif (HS_state_out = "10") then -- READ_DATA
                if CTS_out = '0' and DRTS = '1' and full ='0' then
                    HS_state_in <= "10";
                    CTS_in <= '1';
                    write_en <= '1';
                else
                    HS_state_in <= "01";
                    CTS_in <= '0';
                    write_en <= '0';
                end if;
         else  
                    HS_state_in <= "01";
                    CTS_in <= '0';
                    write_en <= '0';                
        end if;
        
   end process;
                        
    process(write_pointer, read_pointer) begin
        if read_pointer = write_pointer  then
                empty <= '1';
            else
                empty <= '0';
            end if;

	if write_pointer = read_pointer(0)&read_pointer(3 downto 1) then
                full <= '1';
            else
                full <= '0'; 
            end if; 

    end process;

end;
