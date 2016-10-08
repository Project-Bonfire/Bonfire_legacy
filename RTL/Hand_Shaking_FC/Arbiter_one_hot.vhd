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
            RTS: out std_logic -- Valid output which is sent to the next router/NI to specify that the data on the output port is valid
            );
end;

architecture behavior of Arbiter is
--                                                                        next
--                                     Arbiter                        router or NI
--                     --- ---------------------------- ----          ----
--   from LBDR  --->  |Req(s)                           RTS | -----> |DRTS
--    To FIFO   <---  |Grant(s)                         DCTS| <----- |CTS
--    to XBAR   <---  |Xbar_sel                             |        | 
--                     --- ---------------------------- ----          ----

 --------------------------------------------------------------------------------------------
 -- an example of a request/grant + handshake process with next router or NI

--CLK      _|'|_|'|_|'|_|'|_|'|_|'|_|'|_|'|_|'|_|'|_|'|_|'|_|'|_|'|__

-- Req     _____|'''''''''''''''''''''''''''''''''''''''''''|________

--         _________ ___________________ _______ _______ _______ ____
-- TX      _________X_______HEADER______X_Body__X_Body__X__Tail_X____

-- Grant   _________________________|'''|___|'''|___|'''|____________

--  RTS    _________|'''''''''''''''''''|___|'''''''|___|'''''''|____

--  DCTS   _________________________|'''|_______|'''|_______|'''|____  (CTS (DCTS) is always maximum 1 clock cycle!)
--                                  |<---------clear----------->|
--                                  |         to send           |
 --------------------------------------------------------------------------------------------

--TYPE STATE_TYPE IS (IDLE, North, East, West, South, Local);
SUBTYPE STATE_TYPE IS STD_LOGIC_VECTOR (5 downto 0);

CONSTANT IDLE:  STATE_TYPE := "000001";
CONSTANT Local: STATE_TYPE := "000010";
CONSTANT North: STATE_TYPE := "000100";
CONSTANT East:  STATE_TYPE := "001000";
CONSTANT West:  STATE_TYPE := "010000";
CONSTANT South: STATE_TYPE := "100000";

SIGNAL state, state_in, next_state   : STATE_TYPE := IDLE;

SIGNAL RTS_FF, RTS_FF_in: std_logic;

begin
        -- process for updating the state of arbiter's FSM, also setting RTS based on the state (if Grant is given or not)
         process(clk, reset)begin
             if reset = '0' then
                 state<=IDLE;
                 RTS_FF <= '0';
             elsif clk'event and clk = '1' then
                -- no grant given yet, it might be that there is no request to 
                -- arbiter or request is there, but the next router's/NI's FIFO is full
                state <= state_in;
                RTS_FF <= RTS_FF_in;   
              end if;
     end process;

-- anything below here is pure combinational

RTS <= RTS_FF;

process(RTS_FF, DCTS, state, next_state)begin
    if RTS_FF = '1' and DCTS = '0' then 
        state_in <= state;
    else
        state_in <= next_state;
    end if;    
end process;


process(state, RTS_FF, DCTS)begin
    if state = IDLE then 
        RTS_FF_in <= '0';
        -- if there was a grant given to one of the inputs, 
        -- tell the next router/NI that the output data is valid
    else 
        if RTS_FF = '1' and DCTS = '1' then
            RTS_FF_in <= '0';
        else 
            RTS_FF_in <= '1';
        end if;
    end if ;
end process; 

-- sets the grants using round robin 
-- the order is   L --> N --> E --> W --> S  and then back to L
process(state, Req_N, Req_E, Req_W, Req_S, Req_L, DCTS, RTS_FF)begin
    Grant_N <= '0';
    Grant_E <= '0';
    Grant_W <= '0';
    Grant_S <= '0';
    Grant_L <= '0';
    Xbar_sel<= "00000"; 
    case(state) is
        when IDLE =>
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
            Grant_N <= DCTS and RTS_FF ;
            Xbar_sel<= "00001";
            
            If Req_N = '1' then 
                next_state <= North; 
            elsif Req_E = '1' then
                next_state <= East;
            elsif Req_W = '1' then
                next_state <= West;
            elsif Req_S = '1' then
                next_state <= South;
            elsif Req_L = '1' then
                next_state <= Local;
            else
                next_state <= IDLE; 
            end if;
                    
        when East =>
            Grant_E <= DCTS and RTS_FF;
            Xbar_sel<= "00010";
            
            If Req_E = '1' then 
                next_state <= East; 
            elsif Req_W = '1' then
                next_state <= West;
            elsif Req_S = '1' then
                next_state <= South;
            elsif Req_L = '1' then
                next_state <= Local;
            elsif Req_N = '1' then
                next_state <= North;
            else
                next_state <= IDLE; 
            end if;
            
        when West =>
            Grant_W <= DCTS and RTS_FF;
            Xbar_sel<= "00100";
            
            If Req_W = '1' then
                next_state <= West; 
            elsif Req_S = '1' then
                next_state <= South;
            elsif Req_L = '1' then
                next_state <= Local;
            elsif Req_N = '1' then
                next_state <= North;
            elsif Req_E = '1' then
                next_state <= East;
            else
                next_state <= IDLE; 
            end if;
            
        when South =>
            Grant_S <= DCTS and RTS_FF;
            Xbar_sel<= "01000";
            
            If Req_S = '1' then 
                next_state <= South; 
            elsif Req_L = '1' then
                next_state <= Local;
            elsif Req_N = '1' then
                next_state <= North;
            elsif Req_E = '1' then
                next_state <= East;
            elsif Req_W = '1' then
                next_state <= West;
            else
                next_state <= IDLE; 
            end if;
            
        when others => -- Local
            Grant_L <= DCTS and RTS_FF;
            Xbar_sel<= "10000";
            
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
    end case ;
end process;

end;
