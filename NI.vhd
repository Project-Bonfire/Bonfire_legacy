--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity NI is
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
end NI;

architecture behavior of NI is
   signal read_pointer1, write_pointer1: std_logic_vector(1 downto 0);
   signal read_pointer2, write_pointer2: std_logic_vector(1 downto 0);
   signal full1, empty1: std_logic;
   signal full2, empty2: std_logic;
   signal CB_write1, CB_read1: std_logic;
   signal CB_write2, CB_read2: std_logic;
 
   type FIFO_Mem_type is array (0 to 3) of std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_Mem1, FIFO_Mem2 : FIFO_Mem_type ;

   TYPE READ_STATE_TYPE IS (IDLE, READ_DATA);
   SIGNAL HS_read_state_out1,HS_read_state_in1   : READ_STATE_TYPE;
   SIGNAL HS_read_state_out2,HS_read_state_in2   : READ_STATE_TYPE;

   TYPE WRITE_STATE_TYPE IS (IDLE, WRITE_DATA);
   SIGNAL HS_write_state_out1,HS_write_state_in1   : WRITE_STATE_TYPE;
   SIGNAL HS_write_state_out2,HS_write_state_in2   : WRITE_STATE_TYPE;

begin

--              
--   PE                                                                 router
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
--
--               |<-clear->|
--               | to send |

--  circular buffer structure
--                                   <--- WriteP    
--              ---------------------------------
--              |   3   |   2   |   1   |   0   |
--              ---------------------------------
--                                   <--- readP          

   TX1 <= FIFO_Mem1(conv_integer(read_pointer1));
   TX2 <= FIFO_Mem2(conv_integer(read_pointer2));

   RTS1 <= not empty1;
   RTS2 <= not empty2;

   process (clk, reset)begin
        if reset = '0' then
            HS_read_state_out1 <= IDLE;
            HS_read_state_out2 <= IDLE;
            HS_write_state_out1 <= IDLE;
            HS_write_state_out2 <= IDLE;
            read_pointer1 <= "00";
            read_pointer2 <= "00";
            write_pointer1 <= "00";
            write_pointer2 <= "00";
            FIFO_Mem1<= (others => (others=>'0'));
            FIFO_Mem2<= (others => (others=>'0'));
        elsif clk'event and clk = '1' then
            HS_read_state_out1 <= HS_read_state_in1;
            HS_read_state_out2 <= HS_read_state_in2;
            HS_write_state_out1 <= HS_write_state_in1;
            HS_write_state_out2 <= HS_write_state_in2;
            if (CB_write1 = '1' and full1 = '0')then
                    --write into the memory
                    -- update the write pointer 
                    FIFO_Mem1(conv_integer(write_pointer1)) <= RX1;
                    write_pointer1 <= write_pointer1+ 1;
            elsif (CB_read1 = '1' and empty1 = '0') then
                     --read from the memory
                    --update the read pointer 
                    read_pointer1 <=  read_pointer1+1;
             end if;

             if (CB_write2 = '1' and full2 = '0')then
                    --write into the memory
                    -- update the write pointer 
                    FIFO_Mem2(conv_integer(write_pointer2)) <= RX2;
                    write_pointer2 <= write_pointer2+ 1;
            elsif (CB_read2 = '1' and empty2 = '0') then
                     --read from the memory
                    --update the read pointer 
                    read_pointer2 <=  read_pointer2+1;
             end if;
        end if;
    end process;

--module 1 read from outside
   process(HS_read_state_out1, full1, DRTS1) begin
        case(HS_read_state_out1) is
            when IDLE =>
                if DRTS1 = '1' and full1 ='0' then
                    HS_read_state_in1 <= READ_DATA;
                    CTS1 <= '1';
                    CB_write1 <= '1';
                else
                    HS_read_state_in1 <= IDLE;
                    CTS1 <= '0';
                    CB_write1 <= '0';
                end if;
            when READ_DATA =>
                if DRTS1 = '1' and full1 ='0' then
                    HS_read_state_in1 <= READ_DATA;
                    CTS1 <= '1';
                    CB_write1 <= '1';
                else
                    HS_read_state_in1 <= IDLE;
                    CTS1 <= '0';
                    CB_write1 <= '0';
                end if;
            when others =>
                null;
        end case ;
   end process;

--module 1 write to outside
     process(HS_write_state_out1, empty1, DCTS1) begin
        case(HS_write_state_out1) is
            when IDLE =>
                if DCTS1 = '1' and empty1 ='0' then
                    HS_write_state_in1 <= WRITE_DATA;
                    CB_read1 <= '1';
                else
                    HS_write_state_in1 <= IDLE; 
                    CB_read1 <= '0';
                end if;
            when WRITE_DATA =>
                if DCTS1 = '1' and empty1 ='0' then
                    HS_write_state_in1 <= WRITE_DATA;
                    CB_read1 <= '1';
                else
                    HS_write_state_in1 <= IDLE;

                    CB_read1 <= '0';
                end if;
            when others =>
                null;
        end case ;
   end process;

--module 2 read from outside
   process(HS_read_state_out2, full2, DRTS2) begin
        case(HS_read_state_out2) is
            when IDLE =>
                if DRTS2 = '1' and full2 ='0' then
                    HS_read_state_in2 <= READ_DATA;
                    CTS2 <= '1';
                    CB_write2 <= '1';
                else
                    HS_read_state_in2 <= IDLE;
                    CTS2 <= '0';
                    CB_write2 <= '0';
                end if;
            when READ_DATA =>
                if DRTS2 = '1' and full2 ='0' then
                    HS_read_state_in2 <= READ_DATA;
                    CTS2 <= '1';
                    CB_write2 <= '1';
                else
                    HS_read_state_in2 <= IDLE;
                    CTS2 <= '0';
                    CB_write2 <= '0';
                end if;
            when others =>
                null;
        end case ;
   end process;

--module 2 write to outside
     process(HS_write_state_out2, empty2, DRTS2) begin
        case(HS_write_state_out2) is
            when IDLE =>
                if DRTS2 = '1' and empty2 ='0' then
                    HS_write_state_in2 <= WRITE_DATA;
                    CB_read2 <= '1';
                else
                    HS_write_state_in2 <= IDLE; 
                    CB_read2 <= '0';
                end if;
            when WRITE_DATA =>
                if DRTS2 = '1' and empty2 ='0' then
                    HS_write_state_in2 <= WRITE_DATA;
                    CB_read2 <= '1';
                else
                    HS_write_state_in2 <= IDLE;
                    CB_read2 <= '0';
                end if;
            when others =>
                null;
        end case ;
   end process;


    process(write_pointer1, read_pointer1, write_pointer2, read_pointer2)begin
        if read_pointer1 = write_pointer1  then
                empty1 <= '1';
            else
                empty1 <= '0';
            end if;
        if write_pointer1 = read_pointer1 - 1 then
                full1 <= '1';
            else
                full1 <= '0'; 
            end if; 
        if read_pointer2 = write_pointer2  then
                empty2 <= '1';
            else
                empty2 <= '0';
            end if;
        if write_pointer2 = read_pointer2 - 1 then
                full2 <= '1';
            else
                full2 <= '0'; 
            end if; 
        
    end process;

end;