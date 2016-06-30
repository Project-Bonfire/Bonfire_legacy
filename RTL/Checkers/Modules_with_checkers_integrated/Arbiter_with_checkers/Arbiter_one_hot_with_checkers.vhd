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
            RTS: out std_logic; -- Valid output which is sent to the next router/NI to specify that the data on the output port is valid

            -- Checker outputs
            -- Arbiter with dominant checkers and the ones that give in total 100% CEI and FC            
            err_Arbiter_Xbar_sel_onehot: out std_logic;
            err_Arbiter_DCTS_RTS: out std_logic; 
            err_Arbiter_DCTS_RTS1: out std_logic; 
            err_Arbiter_DCTS_RTS2: out std_logic; 
            err_Arbiter_DCTS_RTS3: out std_logic; 
            err_Arbiter_state_and_grants_onehot: out std_logic; 
            err_Arbiter_state_and_grants_onehot1: out std_logic; 
            err_Arbiter_no_req_state_change: out std_logic; 
            err_Arbiter_valid_state: out std_logic;
            err_Arbiter_switchgrantN: out std_logic;
            err_Arbiter_switchgrantE: out std_logic;
            err_Arbiter_switchgrantW: out std_logic;
            err_Arbiter_switchgrantS: out std_logic;
            err_Arbiter_switchgrantL: out std_logic;
            err_Arbiter_state_update: out std_logic;
            err_Arbiter_state_RTS_FF_in: out std_logic; 
            err_Arbiter_switchgrantN_not_active: out std_logic;
            err_Arbiter_switchgrantE_not_active: out std_logic;
            err_Arbiter_switchgrantW_not_active: out std_logic;
            err_Arbiter_switchgrantS_not_active: out std_logic;
            err_Arbiter_switchgrantL_not_active: out std_logic;
            err_Arbiter_switchgrantN_not_active1: out std_logic;
            err_Arbiter_switchgrantE_not_active1: out std_logic;
            err_Arbiter_switchgrantW_not_active1: out std_logic;
            err_Arbiter_switchgrantS_not_active1: out std_logic;
            err_Arbiter_switchgrantL_not_active1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_IDLE: out std_logic;
            err_Arbiter_Xbar_sel_invalid_North: out std_logic;
            err_Arbiter_Xbar_sel_invalid_East: out std_logic;
            err_Arbiter_Xbar_sel_invalid_West: out std_logic;
            err_Arbiter_Xbar_sel_invalid_South: out std_logic;
            err_Arbiter_Xbar_sel_invalid_Local: out std_logic;
            err_Arbiter_Xbar_sel_invalid_North1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_East1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_West1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_South1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_Local1: out std_logic;
            err_Arbiter_priorityIDLE3: out std_logic;
            err_Arbiter_priorityL3: out std_logic;
            err_Arbiter_priorityN3: out std_logic;
            err_Arbiter_priorityE3: out std_logic;
            err_Arbiter_priorityW3: out std_logic;
            err_Arbiter_priorityS3: out std_logic;
            err_Arbiter_switchgrantN1: out std_logic;
            err_Arbiter_switchgrantE1: out std_logic;
            err_Arbiter_switchgrantW1: out std_logic;
            err_Arbiter_switchgrantS1: out std_logic;
            err_Arbiter_switchgrantL1: out std_logic;
            err_Arbiter_state_not_update: out std_logic
            );
end;

architecture behavior of Arbiter is
--                                                                        next
--                                     Arbiter                        router or NI
--                     -------------------------------------          ----
--   from LBDR  --->  |Req(s)                           RTS | -----> |DRTS
--    To FIFO   <---  |Grant(s)                         DCTS| <----- |CTS
--    to XBAR   <---  |Xbar_sel                             |        | 
--                     -------------------------------------          ----

 --------------------------------------------------------------------------------------------
 -- an example of a request/grant + handshake process with next router or NI

--CLK      _|'|_|'|_|'|_|'|_|'|_|'|_|'|_|'|_|'|_|'|_|'|_|'|_|'|_|'|__

-- Req     _____|'''''''''''''''''''''''''''''''''''''''''''|________

--         _________ ___________________ _______ _______ _______ ____
-- TX      _________X_______HEADER______X_Body__X_Body__X__Tail_X____

-- Grant   _________________________|'''|___|'''|___|'''|____________

--  RTs    _________|'''''''''''''''''''|___|'''''''|___|'''''''|____

--  DCTS   _________________________|'''|_______|'''|_______|'''|____
--                                  |<---------clear----------->|
--                                  |         to send           |
 --------------------------------------------------------------------------------------------

-- TYPE STATE_TYPE IS (IDLE, North, East, West, South, Local);
SUBTYPE STATE_TYPE IS STD_LOGIC_VECTOR (5 downto 0);

CONSTANT IDLE:  STATE_TYPE := "000001";
CONSTANT Local: STATE_TYPE := "000010";
CONSTANT North: STATE_TYPE := "000100";
CONSTANT East:  STATE_TYPE := "001000";
CONSTANT West:  STATE_TYPE := "010000";
CONSTANT South: STATE_TYPE := "100000";

SIGNAL state, state_in, next_state : STATE_TYPE := IDLE;

SIGNAL RTS_FF, RTS_FF_in: std_logic;
signal Grant_N_sig, Grant_E_sig, Grant_W_sig, Grant_S_sig, Grant_L_sig: std_logic;
signal Xbar_sel_sig: std_logic_vector(4 downto 0);

component Arbiter_checkers is
    port (  
            Req_N, Req_E, Req_W, Req_S, Req_L:in std_logic;
            DCTS: in std_logic; 
            Grant_N, Grant_E, Grant_W, Grant_S, Grant_L: in  std_logic;
            Xbar_sel : in std_logic_vector(4 downto 0);
            state: in std_logic_vector (5 downto 0);
            state_in: in std_logic_vector (5 downto 0);
            next_state_out: in std_logic_vector (5 downto 0);
            RTS_FF: in std_logic;
            RTS_FF_in: in std_logic;

            -- Checker outputs
            -- Arbiter with dominant checkers and the ones that give in total 100% CEI and FC            
            err_Arbiter_Xbar_sel_onehot: out std_logic;
            err_Arbiter_DCTS_RTS: out std_logic; 
            err_Arbiter_DCTS_RTS1: out std_logic; 
            err_Arbiter_DCTS_RTS2: out std_logic; 
            err_Arbiter_DCTS_RTS3: out std_logic; 
            err_Arbiter_state_and_grants_onehot: out std_logic; 
            err_Arbiter_state_and_grants_onehot1: out std_logic; 
            err_Arbiter_no_req_state_change: out std_logic; 
            err_Arbiter_valid_state: out std_logic;
            err_Arbiter_switchgrantN: out std_logic;
            err_Arbiter_switchgrantE: out std_logic;
            err_Arbiter_switchgrantW: out std_logic;
            err_Arbiter_switchgrantS: out std_logic;
            err_Arbiter_switchgrantL: out std_logic;
            err_Arbiter_state_update: out std_logic;
            err_Arbiter_state_RTS_FF_in: out std_logic; 
            err_Arbiter_switchgrantN_not_active: out std_logic;
            err_Arbiter_switchgrantE_not_active: out std_logic;
            err_Arbiter_switchgrantW_not_active: out std_logic;
            err_Arbiter_switchgrantS_not_active: out std_logic;
            err_Arbiter_switchgrantL_not_active: out std_logic;
            err_Arbiter_switchgrantN_not_active1: out std_logic;
            err_Arbiter_switchgrantE_not_active1: out std_logic;
            err_Arbiter_switchgrantW_not_active1: out std_logic;
            err_Arbiter_switchgrantS_not_active1: out std_logic;
            err_Arbiter_switchgrantL_not_active1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_IDLE: out std_logic;
            err_Arbiter_Xbar_sel_invalid_North: out std_logic;
            err_Arbiter_Xbar_sel_invalid_East: out std_logic;
            err_Arbiter_Xbar_sel_invalid_West: out std_logic;
            err_Arbiter_Xbar_sel_invalid_South: out std_logic;
            err_Arbiter_Xbar_sel_invalid_Local: out std_logic;
            err_Arbiter_Xbar_sel_invalid_North1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_East1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_West1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_South1: out std_logic;
            err_Arbiter_Xbar_sel_invalid_Local1: out std_logic;
            err_Arbiter_priorityIDLE3: out std_logic;
            err_Arbiter_priorityL3: out std_logic;
            err_Arbiter_priorityN3: out std_logic;
            err_Arbiter_priorityE3: out std_logic;
            err_Arbiter_priorityW3: out std_logic;
            err_Arbiter_priorityS3: out std_logic;
            err_Arbiter_switchgrantN1: out std_logic;
            err_Arbiter_switchgrantE1: out std_logic;
            err_Arbiter_switchgrantW1: out std_logic;
            err_Arbiter_switchgrantS1: out std_logic;
            err_Arbiter_switchgrantL1: out std_logic;
            err_Arbiter_state_not_update: out std_logic
            );
end component;


begin

-- Arbiter checkers instantiation
ARBITERCHECKERS: Arbiter_checkers port map (
                                      Req_N => Req_N, 
                                      Req_E => Req_E, 
                                      Req_W => Req_W, 
                                      Req_S => Req_S, 
                                      Req_L => Req_L,
                                      DCTS => DCTS,                                       
                                      Grant_N => Grant_N_sig, 
                                      Grant_E => Grant_E_sig, 
                                      Grant_W => Grant_W_sig, 
                                      Grant_S => Grant_S_sig, 
                                      Grant_L => Grant_L_sig, 
                                      Xbar_sel=>Xbar_sel_sig,
                                      state => state, 
                                      state_in => state_in,
                                      next_state_out => next_state,
                                      RTS_FF => RTS_FF,
                                      RTS_FF_in => RTS_FF_in, 

                                      err_Arbiter_Xbar_sel_onehot => err_Arbiter_Xbar_sel_onehot, 
                                      err_Arbiter_DCTS_RTS => err_Arbiter_DCTS_RTS, 
                                      err_Arbiter_DCTS_RTS1 => err_Arbiter_DCTS_RTS1,
                                      err_Arbiter_DCTS_RTS2 => err_Arbiter_DCTS_RTS2,
                                      err_Arbiter_DCTS_RTS3 => err_Arbiter_DCTS_RTS3,
                                      err_Arbiter_state_and_grants_onehot => err_Arbiter_state_and_grants_onehot, 
                                      err_Arbiter_state_and_grants_onehot1 => err_Arbiter_state_and_grants_onehot1, 
                                      err_Arbiter_no_req_state_change => err_Arbiter_no_req_state_change, 
                                      err_Arbiter_valid_state => err_Arbiter_valid_state, 
                                      err_Arbiter_switchgrantN => err_Arbiter_switchgrantN, 
                                      err_Arbiter_switchgrantE => err_Arbiter_switchgrantE,
                                      err_Arbiter_switchgrantW => err_Arbiter_switchgrantW, 
                                      err_Arbiter_switchgrantS => err_Arbiter_switchgrantS, 
                                      err_Arbiter_switchgrantL => err_Arbiter_switchgrantL, 
                                      err_Arbiter_state_update => err_Arbiter_state_update, 
                                      err_Arbiter_state_RTS_FF_in => err_Arbiter_state_RTS_FF_in, 
                                      err_Arbiter_switchgrantN_not_active => err_Arbiter_switchgrantN_not_active,
                                      err_Arbiter_switchgrantN_not_active1 => err_Arbiter_switchgrantN_not_active1,
                                      err_Arbiter_switchgrantE_not_active => err_Arbiter_switchgrantE_not_active, 
                                      err_Arbiter_switchgrantE_not_active1 => err_Arbiter_switchgrantE_not_active1, 
                                      err_Arbiter_switchgrantW_not_active => err_Arbiter_switchgrantW_not_active, 
                                      err_Arbiter_switchgrantW_not_active1 => err_Arbiter_switchgrantW_not_active1, 
                                      err_Arbiter_switchgrantS_not_active => err_Arbiter_switchgrantS_not_active, 
                                      err_Arbiter_switchgrantS_not_active1 => err_Arbiter_switchgrantS_not_active1, 
                                      err_Arbiter_switchgrantL_not_active => err_Arbiter_switchgrantL_not_active, 
                                      err_Arbiter_switchgrantL_not_active1 => err_Arbiter_switchgrantL_not_active1, 
                                      err_Arbiter_Xbar_sel_invalid_IDLE => err_Arbiter_Xbar_sel_invalid_IDLE,
                                      err_Arbiter_Xbar_sel_invalid_North => err_Arbiter_Xbar_sel_invalid_North, 
                                      err_Arbiter_Xbar_sel_invalid_North1 => err_Arbiter_Xbar_sel_invalid_North1,
                                      err_Arbiter_Xbar_sel_invalid_East => err_Arbiter_Xbar_sel_invalid_East,
                                      err_Arbiter_Xbar_sel_invalid_East1 => err_Arbiter_Xbar_sel_invalid_East1,                                       
                                      err_Arbiter_Xbar_sel_invalid_West => err_Arbiter_Xbar_sel_invalid_West, 
                                      err_Arbiter_Xbar_sel_invalid_West1 => err_Arbiter_Xbar_sel_invalid_West1,
                                      err_Arbiter_Xbar_sel_invalid_South => err_Arbiter_Xbar_sel_invalid_South, 
                                      err_Arbiter_Xbar_sel_invalid_South1 => err_Arbiter_Xbar_sel_invalid_South1, 
                                      err_Arbiter_Xbar_sel_invalid_Local => err_Arbiter_Xbar_sel_invalid_Local, 
                                      err_Arbiter_Xbar_sel_invalid_Local1 => err_Arbiter_Xbar_sel_invalid_Local1, 
                                      err_Arbiter_priorityIDLE3 => err_Arbiter_priorityIDLE3, 
                                      err_Arbiter_priorityL3 => err_Arbiter_priorityL3, 
                                      err_Arbiter_priorityN3 => err_Arbiter_priorityN3, 
                                      err_Arbiter_priorityE3 => err_Arbiter_priorityE3, 
                                      err_Arbiter_priorityW3 => err_Arbiter_priorityW3, 
                                      err_Arbiter_priorityS3 => err_Arbiter_priorityS3, 
                                      err_Arbiter_switchgrantN1 => err_Arbiter_switchgrantN1,
                                      err_Arbiter_switchgrantE1 => err_Arbiter_switchgrantE1,
                                      err_Arbiter_switchgrantW1 => err_Arbiter_switchgrantW1,
                                      err_Arbiter_switchgrantS1 => err_Arbiter_switchgrantS1,
                                      err_Arbiter_switchgrantL1 => err_Arbiter_switchgrantL1,
                                      err_Arbiter_state_not_update => err_Arbiter_state_not_update
                                     );


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

-- Becuase of checkers we did this!
Grant_N <= Grant_N_sig;
Grant_E <= Grant_E_sig;
Grant_W <= Grant_W_sig;
Grant_S <= Grant_S_sig;
Grant_L <= Grant_L_sig;
Xbar_sel <= Xbar_sel_sig;

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
    Grant_N_sig <= '0';
    Grant_E_sig <= '0';
    Grant_W_sig <= '0';
    Grant_S_sig <= '0';
    Grant_L_sig <= '0';
    Xbar_sel_sig <= "00000"; 
    case(state) is
        when IDLE =>
            Xbar_sel_sig <= "00000"; 
            
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
            Grant_N_sig <= DCTS and RTS_FF ;
            Xbar_sel_sig <= "00001";
            
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
            Grant_E_sig <= DCTS and RTS_FF;
            Xbar_sel_sig <= "00010";
            
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
            Grant_W_sig <= DCTS and RTS_FF;
            Xbar_sel_sig <= "00100";
            
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
            Grant_S_sig <= DCTS and RTS_FF;
            Xbar_sel_sig <= "01000";
            
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
            Grant_L_sig <= DCTS and RTS_FF;
            Xbar_sel_sig <= "10000";
            
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
