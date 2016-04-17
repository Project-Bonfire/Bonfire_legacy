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
            Data_in: in std_logic_vector(DATA_WIDTH-1 downto 0); -- Why not called Data_in ??
            DRTS: in std_logic; -- Based on the general structure of a FIFO, it should have one write_en and one read_en input, DRTS should be write_en I guess. 
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            CTS: out std_logic; -- Ready signal which tells the previous router/NI that FIFO is not full
            Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end;

architecture behavior of FIFO is
   signal read_pointer, read_pointer_in,  write_pointer, write_pointer_in: std_logic_vector(1 downto 0);
   signal full, empty: std_logic;
   signal CB_write: std_logic;
   signal read_en: std_logic;

   type FIFO_Mem_type is array (0 to 3) of std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_Mem : FIFO_Mem_type ;

   TYPE STATE_TYPE IS (IDLE, READ_DATA);
   SIGNAL HS_state_out,HS_state_in   : STATE_TYPE;

begin

--  previous            
--   router                
--     --            ---- ---------------------------------- --             
--       |          |                                          |
--     TX|--------->| Data_in                          Data_out|----> goes to Xbar and LBDR
--       |          |                                          | 
--    RTS|--------->| DRTS             FIFO                read|<---- Comes from Arbiter
--       |          |                                          |
--   DCTS|<---------| CTS                                      |    
--     --            ---- ---------------------------------- -- 


-- Hand shake protocol!
--
--                |<-Valid->|
--                |   Data  |  
--           _____ _________ ______
--  Data_in  _____X_________X______
--  DRTS     _____|'''''''''|_____
--  CTS      _________|'''''''''|_______
--
--                    |<-clear->|
--                    | to send |

--  circular buffer structure
--                                   <--- WriteP    
--              ---------------------------------
--              |   3   |   2   |   1   |   0   |
--              ---------------------------------
--                                   <--- readP   

   --TODO: this is a very bad practice, empty signal should be read by the LBDR to mask the request generator... not like this! 
   Data_out <= FIFO_Mem(conv_integer(read_pointer)) when empty = '0' else (others=>'0');

   
   read_en <= read_en_N or read_en_E or read_en_W or read_en_S or read_en_L; -- Why ?? (Would it be a mess if we do this in the top module of the router ?? Because now the FIFO has more inputs, would it affect the checkers evaluation later ??
   read_pointer_in <= read_pointer+1; -- Trying to make a pseudo-combinational version of FIFO already
   write_pointer_in <= write_pointer+1; -- Trying to make a pseudo-combinational version of FIFO already

   process (clk, reset)begin
        if reset = '0' then
            HS_state_out <= IDLE;
            read_pointer <= "00";
            write_pointer <= "00";
            FIFO_Mem<= (others => (others=>'0'));
        elsif clk'event and clk = '1' then
            HS_state_out <= HS_state_in;
            if (CB_write = '1' and full = '0')then
                    --write into the memory
                    -- update the write pointer 
                    FIFO_Mem(conv_integer(write_pointer)) <= Data_in;
                    write_pointer <= write_pointer_in;
            elsif (read_en = '1' and empty = '0') then
                     --read from the memory
                    --update the read pointer 
                    read_pointer <=  read_pointer_in;
             end if;
        end if;
    end process;

   process(HS_state_out, full, DRTS) begin
        case(HS_state_out) is
            when IDLE =>
                if DRTS = '1' and full ='0' then
                    HS_state_in <= READ_DATA;
                    CTS <= '1';
                    CB_write <= '1';
                else
                    HS_state_in <= IDLE;
                    CTS <= '0';
                    CB_write <= '0';
                end if;
            when READ_DATA =>
                if DRTS = '1' and full ='0' then
                    HS_state_in <= READ_DATA;
                    CTS <= '1';
                    CB_write <= '1';
                else
                    HS_state_in <= IDLE;
                    CTS <= '0';
                    CB_write <= '0';
                end if;
            when others =>
                null;
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