--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.math_real.all;

entity NI_channel is
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
end NI_channel;

architecture behavior of NI_channel is
   signal read_pointer, write_pointer, read_pointer_in: std_logic_vector(integer(ceil(log2(real(NI_DEPTH))))-1 downto 0);
   signal full, empty: std_logic;
   signal CB_write: std_logic;
   signal CTS_in, CTS_out: std_logic;
 
   type FIFO_Mem_type is array (0 to NI_DEPTH-1) of std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_Mem : FIFO_Mem_type ;

   TYPE READ_STATE_TYPE IS (IDLE, READ_DATA);
    SIGNAL HS_read_state_out, HS_read_state_in   : READ_STATE_TYPE;

   TYPE WRITE_STATE_TYPE IS (IDLE, WRITE_DATA);
 
   SIGNAL HS_write_state_out,HS_write_state_in, HS_write_state_next   : WRITE_STATE_TYPE;
   SIGNAL RTS_FF, RTS_FF_in: std_logic;

begin

--              
--   PE                                                                 router
--     --            ---- ---------------------------------- --          --  
--   RX  |<---------| TX                                    RX |<----   | TX_L_R_?
--   DRTS|<---------| RTS                                 DRTS |<----   | RTS_L_R_?
--   CTS |--------->| DCTS                                 CTS |---->   | DCTS_L_R_?
--     --            ---- ---------------------------------- --          --


--  circular buffer structure
--                                   <--- WriteP    
--              ---------------------------------
--              |   3   |   2   |   1   |   0   |
--              ---------------------------------
--                                   <--- readP          

 
   
   process (clk, reset)begin
        if reset = '0' then
 
            HS_read_state_out <= IDLE;
            HS_write_state_out <= IDLE;
            read_pointer <= (others=>'0');
            RTS_FF <= '0';
            write_pointer <= (others=>'0');
            FIFO_Mem <= (others => (others=>'0'));
            CTS_out<= '0';

        elsif clk'event and clk = '1' then
            RTS_FF <= RTS_FF_in; 
            HS_read_state_out <= HS_read_state_in;
            HS_write_state_out <= HS_write_state_next;

            if (CB_write = '1' and full = '0')then
                    --write into the memory
                    -- update the write pointer 
                    FIFO_Mem(conv_integer(write_pointer)) <= RX;
                    write_pointer <= write_pointer+ 1;
            end if;
            read_pointer <=  read_pointer_in;
            CTS_out<=CTS_in;
        end if;
    end process;

-- anything below here is pure combinational

    TX <= FIFO_Mem(conv_integer(read_pointer));
    RTS <= RTS_FF;
    CTS <= CTS_out;


   process(RTS_FF, empty, DCTS, read_pointer)begin
        if (RTS_FF = '1' and DCTS='1' and empty = '0') then
            read_pointer_in <= read_pointer+1; 
        else 
            read_pointer_in <= read_pointer; 
        end if;
   end process;


process(RTS_FF, DCTS, HS_write_state_out, HS_write_state_in)begin
    if RTS_FF = '1' and DCTS = '0' then 
        HS_write_state_next <= HS_write_state_out;
    else
        HS_write_state_next <= HS_write_state_in;
    end if;    
end process;


process(HS_write_state_out, RTS_FF, DCTS, empty)begin
    if HS_write_state_out = IDLE then 
        RTS_FF_in <= '0';
        -- if there was a grant given to one of the inputs, 
        -- tell the next router/NI that the output data is valid
    else 
        if empty = '0' then 
            if RTS_FF = '1' and DCTS = '1' then
                RTS_FF_in <= '0';
            else 
                RTS_FF_in <= '1';
            end if;
        else
            RTS_FF_in <= '0';
        end if;
    end if ;
end process; 

-- read from outside
process(HS_read_state_out, full, DRTS) begin
    case(HS_read_state_out) is
        when IDLE =>
            if CTS_out = '0' and DRTS = '1' and full ='0' then
                HS_read_state_in <= READ_DATA;
                CTS_in <= '1';
                CB_write <= '1';
            else
                HS_read_state_in <= IDLE;
                CTS_in <= '0';
                CB_write <= '0';
            end if;
        when others  => -- READ_DATA
            if CTS_out = '0' and DRTS = '1' and full ='0' then
                HS_read_state_in <= READ_DATA;
                CTS_in <= '1';
                CB_write <= '1';
            else
                HS_read_state_in <= IDLE;
                CTS_in <= '0';
                CB_write <= '0';
            end if;
    end case ;
end process;

-- write to outside
process(HS_write_state_out, empty) begin
    case(HS_write_state_out) is
        when IDLE =>
            if empty ='0' then
                HS_write_state_in <= WRITE_DATA;
             else
                HS_write_state_in <= IDLE; 
             end if;
        when others => -- WRITE_DATA
            if empty ='0' then
                HS_write_state_in <= WRITE_DATA;
            else
                HS_write_state_in <= IDLE;
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