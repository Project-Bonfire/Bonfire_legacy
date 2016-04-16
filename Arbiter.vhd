--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Arbiter is
    port (  reset: in  std_logic;
            clk: in  std_logic;
             
            Req_N, Req_E, Req_W, Req_S, Req_L:in std_logic;
            DCTS: in std_logic;
            Grant_N, Grant_E, Grant_W, Grant_S, Grant_L:out std_logic;
            Xbar_sel : out std_logic_vector(4 downto 0);
            FIFO_Read_N, FIFO_Read_E, FIFO_Read_w, FIFO_Read_S, FIFO_Read_L: out std_logic;
            RTS: out std_logic
            );
end;

architecture behavior of Arbiter is
--                   Arbiter                    next router
--           ---               ----          ----
--          |                      |        |    
--    --->  |Req(s)            RTS |----->  |DRTS
--    <---  |Grant(s)          DCTS|<-----  |CTS
--    <---  |FIFO_Read             |        |
--    <---  |Xbar_sel              |        | 
--    <---  |OBuf_Enable           |        |
--           ----              ----          ----
TYPE STATE_TYPE IS (IDLE, North, East, West, South, Local);
SIGNAL state,next_state   : STATE_TYPE := IDLE;


begin
        process(clk,reset)begin
            if reset = '0' then
                state<=IDLE;
                RTS <= '0';
            elsif clk'event and clk = '1' then
                if next_state = IDLE then
                    RTS <= '0';
                else
                    RTS <= '1';
                end if ;
                state <= next_state;
             end if;
	end process;

        process(state, DCTS)begin
                if state = IDLE then      --there is a grant issued!
                    FIFO_Read_N <= '0';
                    FIFO_Read_E <= '0';
                    FIFO_Read_W <= '0';
                    FIFO_Read_S <= '0';
                    FIFO_Read_L <= '0';
                else 
                    FIFO_Read_N <= '0';
                    FIFO_Read_E <= '0';
                    FIFO_Read_W <= '0';
                    FIFO_Read_S <= '0';
                    FIFO_Read_L <= '0';
                    if DCTS = '1' then 
                        case( state ) is
                            when North =>
                                FIFO_Read_N <= '1';
                            when East =>
                                FIFO_Read_E <= '1';
                            when West =>
                                FIFO_Read_W <= '1';
                            when South => 
                                FIFO_Read_S <= '1';  
                            when Local => 
                                FIFO_Read_L <= '1'; 
			    when IDLE =>
				null; 
                        end case ;
                    end if;
                end if;
        end process;

        -- sets the grans using round robin 
        -- the order is   L --> N --> E --> W --> S 
        -- TODO:  this process puts one cycle of idle state between rounds of arbitration! should be fixed!
        -- basicaly after each round of request, if that request is released others should be checked in the same state. no 
        -- need for going to IDLE first!
        process(state, Req_N, Req_E, Req_W, Req_S, Req_L)begin
            case(state) is
                when IDLE =>
                    Grant_N <= '0';
                    Grant_E <= '0';
                    Grant_W <= '0';
                    Grant_S <= '0';
                    Grant_L <= '0';
                    Xbar_sel<= "00000";
                    If Req_L = '1' then
                        next_state <= Local;
                    elsif Req_N = '1' then
                        next_state <= North;         
                    elsif Req_E = '1' then
                        next_state <= East;
                    elsif Req_W = '1' then
                        next_state <= West;
                    elsif Req_S = '1' then
                        next_state <= South;
                    else
                        next_state <= IDLE;
                    end if;    
                when North =>
                    Grant_N <= '1';
                    Grant_E <= '0';
                    Grant_W <= '0';
                    Grant_S <= '0';
                    Grant_L <= '0';
                    Xbar_sel<= "00001";
                    If Req_N = '1' then
                        next_state <= North; 
                    else
                        next_state <= IDLE; 
                    end if;
                when East =>
                    Grant_N <= '0';
                    Grant_E <= '1';
                    Grant_W <= '0';
                    Grant_S <= '0';
                    Grant_L <= '0';
                    Xbar_sel<= "00010";
                    If Req_E = '1' then
                        next_state <= East; 
                    else
                        next_state <= IDLE; 
                    end if;
                when West =>
                    Grant_N <= '0';
                    Grant_E <= '0';
                    Grant_W <= '1';
                    Grant_S <= '0';
                    Grant_L <= '0';
                    Xbar_sel<= "00100";
                    If Req_W = '1' then
                        next_state <= West; 
                    else
                        next_state <= IDLE; 
                    end if;
                when South =>
                    Grant_N <= '0';
                    Grant_E <= '0';
                    Grant_W <= '0';
                    Grant_S <= '1';
                    Grant_L <= '0';
                    Xbar_sel<= "01000";
                    If Req_S = '1' then
                        next_state <= South; 
                    else
                        next_state <= IDLE; 
                    end if;
                when Local =>
                    Grant_N <= '0';
                    Grant_E <= '0';
                    Grant_W <= '0';
                    Grant_S <= '0';
                    Grant_L <= '1';
                    Xbar_sel<= "10000";
                    If Req_L = '1' then
                        next_state <= Local; 
                    else
                        next_state <= IDLE; 
                    end if;
                when others =>
                    Grant_N <= '0';
                    Grant_E <= '0';
                    Grant_W <= '0';
                    Grant_S <= '0';
                    Grant_L <= '0';
                    Xbar_sel<= "00000";
                    next_state <= IDLE; 
            end case ;
        end process;




end;