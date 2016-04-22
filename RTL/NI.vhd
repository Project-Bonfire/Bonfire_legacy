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
   signal read_pointer2, write_pointer2, read_pointer1_in: std_logic_vector(1 downto 0);
   signal read_pointer1, write_pointer1, read_pointer2_in: std_logic_vector(1 downto 0);

   signal full2, empty2: std_logic;
   signal full1, empty1: std_logic;
 
   signal CB_write2: std_logic;
   signal CB_write1: std_logic;
 
   type FIFO_Mem_type is array (0 to 3) of std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_Mem2 : FIFO_Mem_type ;
   signal FIFO_Mem1 : FIFO_Mem_type ;

   TYPE READ_STATE_TYPE IS (IDLE, READ_DATA);
    SIGNAL HS_read_state_out2,HS_read_state_in2   : READ_STATE_TYPE;
    SIGNAL HS_read_state_out1,HS_read_state_in1   : READ_STATE_TYPE;

   TYPE WRITE_STATE_TYPE IS (IDLE, WRITE_DATA);
 
   SIGNAL HS_write_state_out2,HS_write_state_in2, HS_write_state_next2   : WRITE_STATE_TYPE;
   SIGNAL HS_write_state_out1,HS_write_state_in1, HS_write_state_next1   : WRITE_STATE_TYPE;
   SIGNAL RTS_FF2, RTS_FF2_in: std_logic;
   SIGNAL RTS_FF1, RTS_FF1_in: std_logic;

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

-- Hand shake protocol!
--
--                |<---Valid--->|
--                |     Data    |  
--           _____ _____________ ______
--  RX       _____X_____________X______ 
--  DRTS     _____|'''''''''''''|_____
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

 
   TX2 <= FIFO_Mem2(conv_integer(read_pointer2));
   TX1 <= FIFO_Mem1(conv_integer(read_pointer1));

   
   RTS2 <= RTS_FF2;
   RTS1 <= RTS_FF1;

   process (clk, reset)begin
        if reset = '0' then
 
            HS_read_state_out2 <= IDLE;
            HS_read_state_out1 <= IDLE;
 
            HS_write_state_out2 <= IDLE;
            HS_write_state_out1<= IDLE;
 
            read_pointer2 <= "00";
            read_pointer1 <= "00";
            RTS_FF2 <= '0';
            RTS_FF1 <= '0';
            write_pointer2 <= "00";
            write_pointer1 <= "00";
            FIFO_Mem2<= (others => (others=>'0'));
            FIFO_Mem1<= (others => (others=>'0'));


        elsif clk'event and clk = '1' then
            RTS_FF2 <= RTS_FF2_in; 
            RTS_FF1 <= RTS_FF1_in; 

            HS_read_state_out1<= HS_read_state_in1;
            HS_read_state_out2<= HS_read_state_in2;

            HS_write_state_out1 <= HS_write_state_next1;
            HS_write_state_out2 <= HS_write_state_next2;

            if (CB_write2 = '1' and full2 = '0')then
                    --write into the memory
                    -- update the write pointer 
                    FIFO_Mem2(conv_integer(write_pointer2)) <= RX2;
                    write_pointer2 <= write_pointer2+ 1;
            end if;
            if (CB_write1 = '1' and full1 = '0')then
                    --write into the memory
                    -- update the write pointer 
                    FIFO_Mem1(conv_integer(write_pointer1)) <= RX1;
                    write_pointer1 <= write_pointer1+ 1;
            end if;
             
 
                    read_pointer1 <=  read_pointer1_in;
                    read_pointer2 <=  read_pointer2_in;
 
        end if;
    end process;



   process(RTS_FF1, empty1, DCTS1, read_pointer1)begin
        if (RTS_FF1 = '1' and DCTS1='1' and empty1 = '0') then
            read_pointer1_in <= read_pointer1+1; 
        else 
            read_pointer1_in <= read_pointer1; 
        end if;
   end process;

    process(RTS_FF2, empty2, DCTS2, read_pointer2)begin
        if (RTS_FF2 = '1'  and DCTS2='1' and empty2 = '0') then
            read_pointer2_in <= read_pointer2+1; 
        else 
            read_pointer2_in <= read_pointer2; 
        end if;
   end process;


 process(RTS_FF1, DCTS1, HS_write_state_out1, HS_write_state_in1)begin
    if RTS_FF1 = '1' and DCTS1 = '0' then 
        HS_write_state_next1 <= HS_write_state_out1;
    else
        HS_write_state_next1 <= HS_write_state_in1;
    end if;    
end process;

 process(RTS_FF2, DCTS2, HS_write_state_out2, HS_write_state_in2)begin
    if RTS_FF2 = '1' and DCTS2 = '0' then 
        HS_write_state_next2 <= HS_write_state_out2;
    else
        HS_write_state_next2 <= HS_write_state_in2;
    end if;    
end process;

process(HS_write_state_out1, RTS_FF1, DCTS1, empty1)begin
    if HS_write_state_out1 = IDLE then 
        RTS_FF1_in <= '0';
        -- if there was a grant given to one of the inputs, 
        -- tell the next router/NI that the output data is valid
    else 
        if  empty1 = '0' then 
            if RTS_FF1 = '1' and DCTS1 = '1' then
                RTS_FF1_in <= '0';
            else 
                RTS_FF1_in <= '1';
            end if;
        else
            RTS_FF1_in <= '0';
        end if;
    end if ;
end process; 

process(HS_write_state_out2, RTS_FF2, DCTS2, empty2)begin
    if HS_write_state_out2 = IDLE then 
        RTS_FF2_in <= '0';
        -- if there was a grant given to one of the inputs, 
        -- tell the next router/NI that the output data is valid
    else 
        if  empty2 = '0' then 
            if RTS_FF2 = '1' and DCTS2 = '1' then
                RTS_FF2_in <= '0';
            else 
                RTS_FF2_in <= '1';
            end if;
        else
            RTS_FF2_in <= '0';
        end if;
    end if ;
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
process(HS_write_state_out1, empty1) begin
    case(HS_write_state_out1) is
        when IDLE =>
            if empty1 ='0' then
                HS_write_state_in1 <= WRITE_DATA;
             else
                HS_write_state_in1 <= IDLE; 
             end if;
        when WRITE_DATA =>
            if empty1 ='0' then
                HS_write_state_in1 <= WRITE_DATA;
            else
                HS_write_state_in1 <= IDLE;
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
process(HS_write_state_out2, empty2) begin
   case(HS_write_state_out2) is
       when IDLE =>
           if  empty2 ='0' then
               HS_write_state_in2 <= WRITE_DATA;
            else
               HS_write_state_in2 <= IDLE; 
            end if;
       when WRITE_DATA =>
           if empty2 ='0' then
               HS_write_state_in2 <= WRITE_DATA;
               
           else
               HS_write_state_in2 <= IDLE;
            end if;
       when others =>
           null;
   end case ;
end process;


process(write_pointer2, read_pointer2, write_pointer1, read_pointer1)begin
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
end process;



end;