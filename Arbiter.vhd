--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Arbiter is
    port (  reset: in  std_logic;
            clk: in  std_logic;
             
            Req_N, Req_E, Req_W, Req_S, Req_L:in std_logic; -- From LBDR modules
            DCTS: in std_logic; -- Getting the CTS signal from the input FIFO of the next router/NI (for hand-shaking)
            Grant_N, Grant_E, Grant_W, Grant_S, Grant_L:out std_logic; -- Grants given to LBDR requests (encoded as one-hot)
            Xbar_sel : out std_logic_vector(4 downto 0); -- select lines for XBAR
            FIFO_Read_N, FIFO_Read_E, FIFO_Read_w, FIFO_Read_S, FIFO_Read_L: out std_logic; -- Read_enable signals of the FIFOs
            RTS: out std_logic -- Valid output which is sent to the next router/NI to specify that the data on the output port is valid
            );
end;

architecture behavior of Arbiter is
--                                     Arbiter             next router/NI
--                     ---                              ----          ----
--                    |                                     |        |    
--              --->  |Req(s)                           RTS | -----> |DRTS
--              <---  |Grant(s)                         DCTS| <----- |CTS
--              <---  |FIFO_Read_enable(s)                  |        |
--              <---  |Xbar_sel                             |        | 
--              <---  |OBuf_Enable (not sure yet)           |        |
--                     ----                             ----          ----

TYPE STATE_TYPE IS (IDLE, North, East, West, South, Local);
SIGNAL state,next_state   : STATE_TYPE := IDLE;


begin
		-- process for updating the state of arbiter's FSM, also setting RTS based on the state (if Grant is given or not)
        process(clk,reset)begin
            if reset = '0' then
                state<=IDLE;
                RTS <= '0';
            elsif clk'event and clk = '1' then
                if next_state = IDLE then -- no grant given yet, it might be that there is no request to arbiter or request is there, but the next router's/NI's FIFO is full
                    RTS <= '0';
                else -- if there was a grant given to one of the inputs, tell the next router/NI that the output data is valid
                    RTS <= '1';
                end if ;
                state <= next_state;
             end if;
	end process;

		-- Process for setting read_enable of input FIFOs based on the Grant given
        process(state, DCTS)begin 
                if state = IDLE then      -- there is a grant issued! 
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
                    
                    if DCTS = '1' then  -- if the next router's/NI's FIFO is not full
                        case( state ) is  -- The input direction that has got grant to access this output, the read_enable of its corresponding FIFO is set to high, therefore, data can be read from it. 
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
			    			when IDLE =>  -- But we have checked for state being IDLE or not before, right ?? (Why checking IDLE again ?)
								null; 
                        end case ;
                    end if;
                end if;
        end process;

        -- sets the grants using round robin 
        -- the order is   L --> N --> E --> W --> S 
        -- TODO:  this process puts one cycle of idle state between rounds of arbitration! should be fixed!
        -- basicaly after each round of request, if that request is released, others should be checked in the same state.
        -- No need for going to IDLE first!
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