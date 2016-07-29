--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.math_real."ceil";
--use IEEE.math_real."log2";

entity Arbiter is
    port (  reset: in  std_logic;
            clk: in  std_logic;
            Req_N, Req_E, Req_W, Req_S, Req_L:in std_logic; -- From LBDR modules
            DCTS: in std_logic; -- Getting the CTS signal from the input FIFO of the next router/NI (for hand-shaking)

            Grant_N, Grant_E, Grant_W, Grant_S, Grant_L:out std_logic; -- Grants given to LBDR requests (encoded as one-hot)
            Xbar_sel : out std_logic_vector(4 downto 0); -- select lines for XBAR
            RTS: out std_logic; -- Valid output which is sent to the next router/NI to specify that the data on the output port is valid
            -- fault injector signals
            shift: in std_logic;
            fault_clk: in std_logic;
            data_in_serial: in std_logic;
            data_out_serial: out std_logic;
            -- Checker outputs
            err_state_IDLE_xbar,
            err_state_not_IDLE_xbar,
            err_state_IDLE_RTS_FF_in, 
            err_state_not_IDLE_RTS_FF_RTS_FF_in,
            err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in, 
            err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in, 
            err_RTS_FF_not_DCTS_state_state_in, 
            err_not_RTS_FF_state_in_next_state, 
            err_RTS_FF_DCTS_state_in_next_state, 
            err_not_DCTS_Grants, 
            err_DCTS_not_RTS_FF_Grants, 
            err_DCTS_RTS_FF_IDLE_Grants, 
            err_DCTS_RTS_FF_not_IDLE_Grants_onehot, 
            err_Requests_next_state_IDLE, 
            err_IDLE_Req_L, 
            err_Local_Req_L,
            err_North_Req_N, 
            --err_East_Req_E, 
            --err_West_Req_W, 
            --err_South_Req_S, 
            err_IDLE_Req_N, 
            err_Local_Req_N,      
            --err_North_Req_E, 
            --err_East_Req_W, 
            --err_West_Req_S, 
            err_South_Req_L, 
            --err_IDLE_Req_E,
            --err_Local_Req_E,      
            --err_North_Req_W,
            --err_East_Req_S,
            err_West_Req_L,
            err_South_Req_N,
            --err_IDLE_Req_W,
            --err_Local_Req_W,
            --err_North_Req_S,
            err_East_Req_L,
            err_West_Req_N,
            --err_South_Req_E,
            --err_IDLE_Req_S,
            --err_Local_Req_S,      
            --err_North_Req_L,
            err_East_Req_N,
            --err_West_Req_E,
            --err_South_Req_W,
            err_next_state_onehot, 
            err_state_in_onehot, 
            --err_DCTS_RTS_FF_state_Grant_L,
            --err_DCTS_RTS_FF_state_Grant_N,
            --err_DCTS_RTS_FF_state_Grant_E,
            --err_DCTS_RTS_FF_state_Grant_W,
            --err_DCTS_RTS_FF_state_Grant_S, 
            err_state_north_xbar_sel, 
            err_state_east_xbar_sel, 
            err_state_west_xbar_sel, 
            err_state_south_xbar_sel : out std_logic 
            --err_state_local_xbar_sel : out std_logic
            );
end;

architecture behavior of Arbiter is
 

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

  -- New signals used for integration of FI(s) in LBDR module
signal Req_N_faulty, Req_E_faulty, Req_W_faulty, Req_S_faulty, Req_L_faulty : std_logic;
signal DCTS_faulty : std_logic;
SIGNAL state_faulty, state_in_faulty, next_state_faulty : STATE_TYPE := IDLE;
SIGNAL RTS_FF_faulty, RTS_FF_in_faulty: std_logic;
signal Grant_N_sig_faulty, Grant_E_sig_faulty, Grant_W_sig_faulty, Grant_S_sig_faulty, Grant_L_sig_faulty: std_logic;
signal Xbar_sel_sig_faulty: std_logic_vector(4 downto 0);

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
            err_state_IDLE_xbar,
            err_state_not_IDLE_xbar,
            err_state_IDLE_RTS_FF_in, 
            err_state_not_IDLE_RTS_FF_RTS_FF_in,
            err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in, 
            err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in, 
            err_RTS_FF_not_DCTS_state_state_in, 
            err_not_RTS_FF_state_in_next_state, 
            err_RTS_FF_DCTS_state_in_next_state, 
            err_not_DCTS_Grants, 
            err_DCTS_not_RTS_FF_Grants, 
            err_DCTS_RTS_FF_IDLE_Grants, 
            err_DCTS_RTS_FF_not_IDLE_Grants_onehot, 
            err_Requests_next_state_IDLE, 
            err_IDLE_Req_L, 
            err_Local_Req_L,
            err_North_Req_N, 
            --err_East_Req_E, 
            --err_West_Req_W, 
            --err_South_Req_S, 
            err_IDLE_Req_N, 
            err_Local_Req_N,      
            --err_North_Req_E, 
            --err_East_Req_W, 
            --err_West_Req_S, 
            err_South_Req_L, 
            --err_IDLE_Req_E,
            --err_Local_Req_E,      
            --err_North_Req_W,
            --err_East_Req_S,
            err_West_Req_L,
            err_South_Req_N,
            --err_IDLE_Req_W,
            --err_Local_Req_W,
            --err_North_Req_S,
            err_East_Req_L,
            err_West_Req_N,
            --err_South_Req_E,
            --err_IDLE_Req_S,
            --err_Local_Req_S,      
            --err_North_Req_L,
            err_East_Req_N,
            --err_West_Req_E,
            --err_South_Req_W,
            err_next_state_onehot, 
            err_state_in_onehot, 
            --err_DCTS_RTS_FF_state_Grant_L,
            --err_DCTS_RTS_FF_state_Grant_N,
            --err_DCTS_RTS_FF_state_Grant_E,
            --err_DCTS_RTS_FF_state_Grant_W,
            --err_DCTS_RTS_FF_state_Grant_S, 
            err_state_north_xbar_sel, 
            err_state_east_xbar_sel, 
            err_state_west_xbar_sel, 
            err_state_south_xbar_sel : out std_logic 
            --err_state_local_xbar_sel : out std_logic
            );
end component;

component fault_injector is 
  generic(DATA_WIDTH : integer := 32);
  port(
    data_in: in std_logic_vector (DATA_WIDTH-1 downto 0);
    address: in std_logic_vector(5 downto 0);
    sta_0: in std_logic;
    sta_1: in std_logic;
    data_out: out std_logic_vector (DATA_WIDTH-1 downto 0)
    );
end component;

component shift_register_serial_in is
    generic (
        REG_WIDTH: integer := 44
    );
    port (
        clk, reset : in std_logic;
        shift: in std_logic;
        data_in_serial: in std_logic;
        data_out_parallel: out std_logic_vector(REG_WIDTH-1 downto 0);
        data_out_serial: out std_logic
    );
end component;

signal FI_add_sta: std_logic_vector(43 downto 0); -- 36 bits for inputs and internal signals
                                                  -- 6 bits for fault injection location address (ceil of log2(36) = 6)
                                                  -- 2 bits for type of fault (SA0 or SA1)
signal non_faulty_signals: std_logic_vector (35 downto 0);                                                
signal faulty_signals: std_logic_vector(35 downto 0); -- 36 bits for inputs, internal and output signals (with one fault injected in one of them)

begin

non_faulty_signals <= Req_N & Req_E & Req_W & Req_S & Req_L & 
                      DCTS & 
                      state & state_in & next_state &
                      RTS_FF & RTS_FF_in & 
                      Grant_N_sig & Grant_E_sig & Grant_W_sig & Grant_S_sig & Grant_L_sig & 
                      Xbar_sel_sig;

FI: fault_injector generic map(DATA_WIDTH => 36) 
           port map (data_in=> non_faulty_signals , address=> FI_add_sta(7 downto 2), sta_0=> FI_add_sta(1), sta_1=> FI_add_sta(0), data_out=> faulty_signals
            );

-- Extracting faulty values for input, internal and output signals
Req_N_faulty         <= faulty_signals(35);
Req_E_faulty         <= faulty_signals(34);
Req_W_faulty         <= faulty_signals(33);
Req_S_faulty         <= faulty_signals(32);
Req_L_faulty         <= faulty_signals(31);
DCTS_faulty          <= faulty_signals(30);
state_faulty         <= faulty_signals(29 downto 24);
state_in_faulty      <= faulty_signals(23 downto 18);
next_state_faulty    <= faulty_signals(17 downto 12);
RTS_FF_faulty        <= faulty_signals(11);
RTS_FF_in_faulty     <= faulty_signals(10);
Grant_N_sig_faulty   <= faulty_signals(9);
Grant_E_sig_faulty   <= faulty_signals(8);
Grant_W_sig_faulty   <= faulty_signals(7);
Grant_S_sig_faulty   <= faulty_signals(6);
Grant_L_sig_faulty   <= faulty_signals(5);
Xbar_sel_sig_faulty  <= faulty_signals(4 downto 0);

SR: shift_register_serial_in generic map(REG_WIDTH => 44)
          port map( clk=> fault_clk, reset=>reset, shift=> shift,data_in_serial=> data_in_serial, 
                data_out_parallel=> FI_add_sta, data_out_serial=> data_out_serial
              );

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

                                      err_state_IDLE_xbar => err_state_IDLE_xbar,
                                      err_state_not_IDLE_xbar => err_state_not_IDLE_xbar,
                                      err_state_IDLE_RTS_FF_in => err_state_IDLE_RTS_FF_in,
                                      err_state_not_IDLE_RTS_FF_RTS_FF_in => err_state_not_IDLE_RTS_FF_RTS_FF_in,
                                      err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in => err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in,
                                      err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in => err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in,
                                      err_RTS_FF_not_DCTS_state_state_in => err_RTS_FF_not_DCTS_state_state_in,
                                      err_not_RTS_FF_state_in_next_state => err_not_RTS_FF_state_in_next_state,
                                      err_RTS_FF_DCTS_state_in_next_state => err_RTS_FF_DCTS_state_in_next_state,
                                      err_not_DCTS_Grants => err_not_DCTS_Grants,
                                      err_DCTS_not_RTS_FF_Grants => err_DCTS_not_RTS_FF_Grants,
                                      err_DCTS_RTS_FF_IDLE_Grants => err_DCTS_RTS_FF_IDLE_Grants,
                                      err_DCTS_RTS_FF_not_IDLE_Grants_onehot => err_DCTS_RTS_FF_not_IDLE_Grants_onehot,
                                      err_Requests_next_state_IDLE => err_Requests_next_state_IDLE,
                                      err_IDLE_Req_L => err_IDLE_Req_L,
                                      err_Local_Req_L => err_Local_Req_L,
                                      err_North_Req_N => err_North_Req_N,
                                      err_IDLE_Req_N => err_IDLE_Req_N,
                                      err_Local_Req_N => err_Local_Req_N,
                                      err_South_Req_L => err_South_Req_L,
                                      err_West_Req_L => err_West_Req_L,
                                      err_South_Req_N => err_South_Req_N,
                                      err_East_Req_L => err_East_Req_L,
                                      err_West_Req_N => err_West_Req_N,
                                      err_East_Req_N => err_East_Req_N,
                                      err_next_state_onehot => err_next_state_onehot,
                                      err_state_in_onehot => err_state_in_onehot,
                                      err_state_north_xbar_sel => err_state_north_xbar_sel,
                                      err_state_east_xbar_sel => err_state_east_xbar_sel,
                                      err_state_west_xbar_sel => err_state_west_xbar_sel,
                                      err_state_south_xbar_sel => err_state_south_xbar_sel
                                     );

        -- process for updating the state of arbiter's FSM, also setting RTS based on the state (if Grant is given or not)
         process(clk, reset)begin
             if reset = '0' then
                 state<=IDLE;
                 RTS_FF <= '0';
             elsif clk'event and clk = '1' then
                -- no grant given yet, it might be that there is no request to 
                -- arbiter or request is there, but the next router's/NI's FIFO is full
                state <= state_in_faulty;
                RTS_FF <= RTS_FF_in_faulty;   
              end if;
     end process;

-- anything below here is pure combinational

RTS <= RTS_FF;

-- Becuase of checkers we did this!
Grant_N  <= Grant_N_sig;
Grant_E  <= Grant_E_sig;
Grant_W  <= Grant_W_sig;
Grant_S  <= Grant_S_sig;
Grant_L  <= Grant_L_sig;
Xbar_sel <= Xbar_sel_sig;

process(RTS_FF_faulty, DCTS_faulty, state_faulty, next_state_faulty)begin
    if RTS_FF_faulty = '1' and DCTS_faulty = '0' then 
        state_in <= state_faulty;
    else
        state_in <= next_state_faulty;
    end if;    
end process;


process(state_faulty, RTS_FF_faulty, DCTS_faulty)begin
    if state_faulty = IDLE then 
        RTS_FF_in <= '0';
        -- if there was a grant given to one of the inputs, 
        -- tell the next router/NI that the output data is valid
    else 
        if RTS_FF_faulty = '1' and DCTS_faulty = '1' then
            RTS_FF_in <= '0';
        else 
            RTS_FF_in <= '1';
        end if;
    end if ;
end process; 

-- sets the grants using round robin 
-- the order is   L --> N --> E --> W --> S  and then back to L
process(state_faulty, Req_N_faulty, Req_E_faulty, Req_W_faulty, Req_S_faulty, Req_L_faulty, DCTS_faulty, RTS_FF_faulty)begin
    Grant_N_sig <= '0';
    Grant_E_sig <= '0';
    Grant_W_sig <= '0';
    Grant_S_sig <= '0';
    Grant_L_sig <= '0';
    Xbar_sel_sig <= "00000"; 

    case(state_faulty) is
        when IDLE =>
            Xbar_sel_sig <= "00000"; 
            
            If Req_L_faulty = '1' then
                next_state <= Local;
            elsif Req_N_faulty = '1' then
                next_state <= North;         
            elsif Req_E_faulty = '1' then
                next_state <= East;
            elsif Req_W_faulty = '1' then
                next_state <= West;
            elsif Req_S_faulty = '1' then
                next_state <= South;
            else
                next_state <= IDLE;
            end if;    
            
        when North =>
            Grant_N_sig <= DCTS_faulty and RTS_FF_faulty ;
            Xbar_sel_sig <= "00001";
            
            If Req_N_faulty = '1' then 
                next_state <= North; 
            elsif Req_E_faulty = '1' then
                next_state <= East;
            elsif Req_W_faulty = '1' then
                next_state <= West;
            elsif Req_S_faulty = '1' then
                next_state <= South;
            elsif Req_L_faulty = '1' then
                next_state <= Local;
            else
                next_state <= IDLE; 
            end if;
                    
        when East =>
            Grant_E_sig <= DCTS_faulty and RTS_FF_faulty;
            Xbar_sel_sig <= "00010";
            
            If Req_E_faulty = '1' then 
                next_state <= East; 
            elsif Req_W_faulty = '1' then
                next_state <= West;
            elsif Req_S_faulty = '1' then
                next_state <= South;
            elsif Req_L_faulty = '1' then
                next_state <= Local;
            elsif Req_N_faulty = '1' then
                next_state <= North;
            else
                next_state <= IDLE; 
            end if;
            
        when West =>
            Grant_W_sig <= DCTS_faulty and RTS_FF_faulty;
            Xbar_sel_sig <= "00100";
            
            If Req_W_faulty = '1' then
                next_state <= West; 
            elsif Req_S_faulty = '1' then
                next_state <= South;
            elsif Req_L_faulty = '1' then
                next_state <= Local;
            elsif Req_N_faulty = '1' then
                next_state <= North;
            elsif Req_E_faulty = '1' then
                next_state <= East;
            else
                next_state <= IDLE; 
            end if;
            
        when South =>
            Grant_S_sig <= DCTS_faulty and RTS_FF_faulty;
            Xbar_sel_sig <= "01000";
            
            If Req_S_faulty = '1' then 
                next_state <= South; 
            elsif Req_L_faulty = '1' then
                next_state <= Local;
            elsif Req_N_faulty = '1' then
                next_state <= North;
            elsif Req_E_faulty = '1' then
                next_state <= East;
            elsif Req_W_faulty = '1' then
                next_state <= West;
            else
                next_state <= IDLE; 
            end if;
            
        when others => -- Local
            Grant_L_sig <= DCTS_faulty and RTS_FF_faulty;
            Xbar_sel_sig <= "10000";
            
            If Req_L_faulty = '1' then
                next_state <= Local; 
            elsif Req_N_faulty = '1' then
                next_state <= North;         
            elsif Req_E_faulty = '1' then
                next_state <= East;
            elsif Req_W_faulty = '1' then
                next_state <= West;
            elsif Req_S_faulty = '1' then
                next_state <= South;
            else
                next_state <= IDLE; 
            end if;
    end case ;
end process;

end;
