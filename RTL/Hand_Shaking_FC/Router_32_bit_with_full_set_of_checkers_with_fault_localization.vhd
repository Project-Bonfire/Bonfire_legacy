--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity router is
	generic (
        DATA_WIDTH: integer := 32;
        current_address : integer := 5;
        Rxy_rst : integer := 60;
        Cx_rst : integer := 15;
        NoC_size: integer := 4
    );
    port (
    reset, clk: in std_logic;
    DCTS_N, DCTS_E, DCTS_w, DCTS_S, DCTS_L: in std_logic;
    DRTS_N, DRTS_E, DRTS_W, DRTS_S, DRTS_L: in std_logic;
    RX_N, RX_E, RX_W, RX_S, RX_L : in std_logic_vector (DATA_WIDTH-1 downto 0); 
    RTS_N, RTS_E, RTS_W, RTS_S, RTS_L: out std_logic;
    CTS_N, CTS_E, CTS_w, CTS_S, CTS_L: out std_logic;
    TX_N, TX_E, TX_W, TX_S, TX_L: out std_logic_vector (DATA_WIDTH-1 downto 0);
    fault_out_N, fault_out_E, fault_out_W, fault_out_S, fault_out_L:out std_logic
    ); 
end router; 

architecture behavior of router is
  
  COMPONENT FIFO   
 	generic (
        DATA_WIDTH: integer := 32
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            RX: in std_logic_vector(DATA_WIDTH-1 downto 0); 
            DRTS: in std_logic;  
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            CTS: out std_logic; 
            empty_out: out std_logic; 
            Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0); 

            -- Checker outputs
            err_write_en_write_pointer, 
            err_not_write_en_write_pointer, 
            err_read_pointer_write_pointer_not_empty, 
            err_read_pointer_write_pointer_empty, 
            err_read_pointer_write_pointer_not_full, 
            err_read_pointer_write_pointer_full, 
            err_read_pointer_increment, 
            err_read_pointer_not_increment, 
            err_CTS_in, 
            err_write_en, 
            err_not_CTS_in, 
            err_not_write_en, 
            err_read_en_mismatch : out std_logic
    );
	end COMPONENT;

    COMPONENT Arbiter   
 	 
    port (  reset: in  std_logic;
            clk: in  std_logic;
            Req_N, Req_E, Req_W, Req_S, Req_L:in std_logic; -- From LBDR modules
            DCTS: in std_logic; -- Getting the CTS signal from the input FIFO of the next router/NI (for hand-shaking)

            Grant_N, Grant_E, Grant_W, Grant_S, Grant_L:out std_logic; -- Grants given to LBDR requests (encoded as one-hot)
            Xbar_sel : out std_logic_vector(4 downto 0); -- select lines for XBAR
            RTS: out std_logic; -- Valid output which is sent to the next router/NI to specify that the data on the output port is valid

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
            err_East_Req_E, 
            err_West_Req_W, 
            err_South_Req_S, 
            err_IDLE_Req_N, 
            err_Local_Req_N,      
            err_North_Req_E, 
            err_East_Req_W, 
            err_West_Req_S, 
            err_South_Req_L, 
            err_IDLE_Req_E,
            err_Local_Req_E,      
            err_North_Req_W,
            err_East_Req_S,
            err_West_Req_L,
            err_South_Req_N,
            err_IDLE_Req_W,
            err_Local_Req_W,
            err_North_Req_S,
            err_East_Req_L,
            err_West_Req_N,
            err_South_Req_E,
            err_IDLE_Req_S,
            err_Local_Req_S,      
            err_North_Req_L,
            err_East_Req_N,
            err_West_Req_E,
            err_South_Req_W,
            err_next_state_onehot, 
            err_state_in_onehot, 
            err_DCTS_RTS_FF_state_Grant_L,
            err_DCTS_RTS_FF_state_Grant_N,
            err_DCTS_RTS_FF_state_Grant_E,
            err_DCTS_RTS_FF_state_Grant_W,
            err_DCTS_RTS_FF_state_Grant_S, 
            err_state_north_xbar_sel, 
            err_state_east_xbar_sel, 
            err_state_west_xbar_sel, 
            err_state_south_xbar_sel,
            err_state_local_xbar_sel : out std_logic
            );
	end COMPONENT;

	COMPONENT LBDR is
    generic (
        cur_addr_rst: integer := 5;
        Rxy_rst: integer := 60;
        Cx_rst: integer := 15;
        NoC_size: integer := 4
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);
            Req_N, Req_E, Req_W, Req_S, Req_L:out std_logic;

            -- Checker outputs
            err_header_not_empty_Requests_in_onehot, 
            err_header_empty_Requests_FF_Requests_in, 
            err_tail_Requests_in_all_zero, 
            err_header_tail_Requests_FF_Requests_in, 
            err_dst_addr_cur_addr_N1,
            err_dst_addr_cur_addr_not_N1,
            err_dst_addr_cur_addr_E1,
            err_dst_addr_cur_addr_not_E1,
            err_dst_addr_cur_addr_W1,
            err_dst_addr_cur_addr_not_W1,
            err_dst_addr_cur_addr_S1,
            err_dst_addr_cur_addr_not_S1, 
            err_dst_addr_cur_addr_not_Req_L_in, 
            err_dst_addr_cur_addr_Req_L_in, 
            err_header_not_empty_Req_N_in,
            err_header_not_empty_Req_E_in,
            err_header_not_empty_Req_W_in,
            err_header_not_empty_Req_S_in : out std_logic
           );
	end COMPONENT;

 	COMPONENT XBAR is
    generic (
        DATA_WIDTH: integer := 32
    );
    port (
        North_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        East_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        West_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        South_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        Local_in: in std_logic_vector(DATA_WIDTH-1 downto 0);
        sel: in std_logic_vector (4 downto 0);
        Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
	end COMPONENT;

  signal FIFO_D_out_N, FIFO_D_out_E, FIFO_D_out_W, FIFO_D_out_S, FIFO_D_out_L: std_logic_vector(DATA_WIDTH-1 downto 0);

    -- Grant_XY : Grant signal generated from Arbiter for output X connected to FIFO of input Y

 	signal Grant_NN, Grant_NE, Grant_NW, Grant_NS, Grant_NL: std_logic;
 	signal Grant_EN, Grant_EE, Grant_EW, Grant_ES, Grant_EL: std_logic;
 	signal Grant_WN, Grant_WE, Grant_WW, Grant_WS, Grant_WL: std_logic;
 	signal Grant_SN, Grant_SE, Grant_SW, Grant_SS, Grant_SL: std_logic;
 	signal Grant_LN, Grant_LE, Grant_LW, Grant_LS, Grant_LL: std_logic;

 	signal Req_NN, Req_EN, Req_WN, Req_SN, Req_LN: std_logic;
 	signal Req_NE, Req_EE, Req_WE, Req_SE, Req_LE: std_logic;
 	signal Req_NW, Req_EW, Req_WW, Req_SW, Req_LW: std_logic;
 	signal Req_NS, Req_ES, Req_WS, Req_SS, Req_LS: std_logic;
 	signal Req_NL, Req_EL, Req_WL, Req_SL, Req_LL: std_logic;

  signal empty_N, empty_E, empty_W, empty_S, empty_L: std_logic; 

 	signal Xbar_sel_N, Xbar_sel_E, Xbar_sel_W, Xbar_sel_S, Xbar_sel_L: std_logic_vector(4 downto 0);

  -- Signals related to Checkers
  -- LBDR Checkers signals
  -- North
  signal  N_err_header_not_empty_Requests_in_onehot, 
          N_err_header_empty_Requests_FF_Requests_in, 
          N_err_tail_Requests_in_all_zero, 
          N_err_header_tail_Requests_FF_Requests_in, 
          N_err_dst_addr_cur_addr_N1,
          N_err_dst_addr_cur_addr_not_N1,
          N_err_dst_addr_cur_addr_E1,
          N_err_dst_addr_cur_addr_not_E1,
          N_err_dst_addr_cur_addr_W1,
          N_err_dst_addr_cur_addr_not_W1,
          N_err_dst_addr_cur_addr_S1,
          N_err_dst_addr_cur_addr_not_S1, 
          N_err_dst_addr_cur_addr_not_Req_L_in, 
          N_err_dst_addr_cur_addr_Req_L_in, 
          N_err_header_not_empty_Req_N_in,
          N_err_header_not_empty_Req_E_in,
          N_err_header_not_empty_Req_W_in,
          N_err_header_not_empty_Req_S_in : std_logic;

  -- East
  signal  E_err_header_not_empty_Requests_in_onehot, 
          E_err_header_empty_Requests_FF_Requests_in, 
          E_err_tail_Requests_in_all_zero, 
          E_err_header_tail_Requests_FF_Requests_in, 
          E_err_dst_addr_cur_addr_N1,
          E_err_dst_addr_cur_addr_not_N1,
          E_err_dst_addr_cur_addr_E1,
          E_err_dst_addr_cur_addr_not_E1,
          E_err_dst_addr_cur_addr_W1,
          E_err_dst_addr_cur_addr_not_W1,
          E_err_dst_addr_cur_addr_S1,
          E_err_dst_addr_cur_addr_not_S1, 
          E_err_dst_addr_cur_addr_not_Req_L_in, 
          E_err_dst_addr_cur_addr_Req_L_in, 
          E_err_header_not_empty_Req_N_in,
          E_err_header_not_empty_Req_E_in,
          E_err_header_not_empty_Req_W_in,
          E_err_header_not_empty_Req_S_in : std_logic;

  -- West
  signal  W_err_header_not_empty_Requests_in_onehot, 
          W_err_header_empty_Requests_FF_Requests_in, 
          W_err_tail_Requests_in_all_zero, 
          W_err_header_tail_Requests_FF_Requests_in, 
          W_err_dst_addr_cur_addr_N1,
          W_err_dst_addr_cur_addr_not_N1,
          W_err_dst_addr_cur_addr_E1,
          W_err_dst_addr_cur_addr_not_E1,
          W_err_dst_addr_cur_addr_W1,
          W_err_dst_addr_cur_addr_not_W1,
          W_err_dst_addr_cur_addr_S1,
          W_err_dst_addr_cur_addr_not_S1, 
          W_err_dst_addr_cur_addr_not_Req_L_in, 
          W_err_dst_addr_cur_addr_Req_L_in, 
          W_err_header_not_empty_Req_N_in,
          W_err_header_not_empty_Req_E_in,
          W_err_header_not_empty_Req_W_in,
          W_err_header_not_empty_Req_S_in : std_logic;

  -- South
  signal  S_err_header_not_empty_Requests_in_onehot, 
          S_err_header_empty_Requests_FF_Requests_in, 
          S_err_tail_Requests_in_all_zero, 
          S_err_header_tail_Requests_FF_Requests_in, 
          S_err_dst_addr_cur_addr_N1,
          S_err_dst_addr_cur_addr_not_N1,
          S_err_dst_addr_cur_addr_E1,
          S_err_dst_addr_cur_addr_not_E1,
          S_err_dst_addr_cur_addr_W1,
          S_err_dst_addr_cur_addr_not_W1,
          S_err_dst_addr_cur_addr_S1,
          S_err_dst_addr_cur_addr_not_S1, 
          S_err_dst_addr_cur_addr_not_Req_L_in, 
          S_err_dst_addr_cur_addr_Req_L_in, 
          S_err_header_not_empty_Req_N_in,
          S_err_header_not_empty_Req_E_in,
          S_err_header_not_empty_Req_W_in,
          S_err_header_not_empty_Req_S_in : std_logic;

  -- Local
  signal  L_err_header_not_empty_Requests_in_onehot, 
          L_err_header_empty_Requests_FF_Requests_in, 
          L_err_tail_Requests_in_all_zero, 
          L_err_header_tail_Requests_FF_Requests_in, 
          L_err_dst_addr_cur_addr_N1,
          L_err_dst_addr_cur_addr_not_N1,
          L_err_dst_addr_cur_addr_E1,
          L_err_dst_addr_cur_addr_not_E1,
          L_err_dst_addr_cur_addr_W1,
          L_err_dst_addr_cur_addr_not_W1,
          L_err_dst_addr_cur_addr_S1,
          L_err_dst_addr_cur_addr_not_S1, 
          L_err_dst_addr_cur_addr_not_Req_L_in, 
          L_err_dst_addr_cur_addr_Req_L_in, 
          L_err_header_not_empty_Req_N_in,
          L_err_header_not_empty_Req_E_in,
          L_err_header_not_empty_Req_W_in,
          L_err_header_not_empty_Req_S_in : std_logic;


  -- Arbiter Checkers signals

  -- North

  signal    N_err_state_IDLE_xbar,
            N_err_state_not_IDLE_xbar,
            N_err_state_IDLE_RTS_FF_in, 
            N_err_state_not_IDLE_RTS_FF_RTS_FF_in,
            N_err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in, 
            N_err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in, 
            N_err_RTS_FF_not_DCTS_state_state_in, 
            N_err_not_RTS_FF_state_in_next_state, 
            N_err_RTS_FF_DCTS_state_in_next_state, 
            N_err_not_DCTS_Grants, 
            N_err_DCTS_not_RTS_FF_Grants, 
            N_err_DCTS_RTS_FF_IDLE_Grants, 
            N_err_DCTS_RTS_FF_not_IDLE_Grants_onehot, 
            N_err_Requests_next_state_IDLE, 
            N_err_IDLE_Req_L, 
            N_err_Local_Req_L,
            N_err_North_Req_N, 
            N_err_East_Req_E, 
            N_err_West_Req_W, 
            N_err_South_Req_S, 
            N_err_IDLE_Req_N, 
            N_err_Local_Req_N,      
            N_err_North_Req_E, 
            N_err_East_Req_W, 
            N_err_West_Req_S, 
            N_err_South_Req_L, 
            N_err_IDLE_Req_E,
            N_err_Local_Req_E,      
            N_err_North_Req_W,
            N_err_East_Req_S,
            N_err_West_Req_L,
            N_err_South_Req_N,
            N_err_IDLE_Req_W,
            N_err_Local_Req_W,
            N_err_North_Req_S,
            N_err_East_Req_L,
            N_err_West_Req_N,
            N_err_South_Req_E,
            N_err_IDLE_Req_S,
            N_err_Local_Req_S,      
            N_err_North_Req_L,
            N_err_East_Req_N,
            N_err_West_Req_E,
            N_err_South_Req_W,
            N_err_next_state_onehot, 
            N_err_state_in_onehot, 
            N_err_DCTS_RTS_FF_state_Grant_L,
            N_err_DCTS_RTS_FF_state_Grant_N,
            N_err_DCTS_RTS_FF_state_Grant_E,
            N_err_DCTS_RTS_FF_state_Grant_W,
            N_err_DCTS_RTS_FF_state_Grant_S, 
            N_err_state_north_xbar_sel, 
            N_err_state_east_xbar_sel, 
            N_err_state_west_xbar_sel, 
            N_err_state_south_xbar_sel,
            N_err_state_local_xbar_sel: std_logic;


  -- East
  signal    E_err_state_IDLE_xbar,
            E_err_state_not_IDLE_xbar,
            E_err_state_IDLE_RTS_FF_in, 
            E_err_state_not_IDLE_RTS_FF_RTS_FF_in,
            E_err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in, 
            E_err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in, 
            E_err_RTS_FF_not_DCTS_state_state_in, 
            E_err_not_RTS_FF_state_in_next_state, 
            E_err_RTS_FF_DCTS_state_in_next_state, 
            E_err_not_DCTS_Grants, 
            E_err_DCTS_not_RTS_FF_Grants, 
            E_err_DCTS_RTS_FF_IDLE_Grants, 
            E_err_DCTS_RTS_FF_not_IDLE_Grants_onehot, 
            E_err_Requests_next_state_IDLE, 
            E_err_IDLE_Req_L, 
            E_err_Local_Req_L,
            E_err_North_Req_N, 
            E_err_East_Req_E, 
            E_err_West_Req_W, 
            E_err_South_Req_S, 
            E_err_IDLE_Req_N, 
            E_err_Local_Req_N,      
            E_err_North_Req_E, 
            E_err_East_Req_W, 
            E_err_West_Req_S, 
            E_err_South_Req_L, 
            E_err_IDLE_Req_E,
            E_err_Local_Req_E,      
            E_err_North_Req_W,
            E_err_East_Req_S,
            E_err_West_Req_L,
            E_err_South_Req_N,
            E_err_IDLE_Req_W,
            E_err_Local_Req_W,
            E_err_North_Req_S,
            E_err_East_Req_L,
            E_err_West_Req_N,
            E_err_South_Req_E,
            E_err_IDLE_Req_S,
            E_err_Local_Req_S,      
            E_err_North_Req_L,
            E_err_East_Req_N,
            E_err_West_Req_E,
            E_err_South_Req_W,
            E_err_next_state_onehot, 
            E_err_state_in_onehot, 
            E_err_DCTS_RTS_FF_state_Grant_L,
            E_err_DCTS_RTS_FF_state_Grant_N,
            E_err_DCTS_RTS_FF_state_Grant_E,
            E_err_DCTS_RTS_FF_state_Grant_W,
            E_err_DCTS_RTS_FF_state_Grant_S, 
            E_err_state_north_xbar_sel, 
            E_err_state_east_xbar_sel, 
            E_err_state_west_xbar_sel, 
            E_err_state_south_xbar_sel,
            E_err_state_local_xbar_sel: std_logic;

  -- West
  signal    W_err_state_IDLE_xbar,
            W_err_state_not_IDLE_xbar,
            W_err_state_IDLE_RTS_FF_in, 
            W_err_state_not_IDLE_RTS_FF_RTS_FF_in,
            W_err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in, 
            W_err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in, 
            W_err_RTS_FF_not_DCTS_state_state_in, 
            W_err_not_RTS_FF_state_in_next_state, 
            W_err_RTS_FF_DCTS_state_in_next_state, 
            W_err_not_DCTS_Grants, 
            W_err_DCTS_not_RTS_FF_Grants, 
            W_err_DCTS_RTS_FF_IDLE_Grants, 
            W_err_DCTS_RTS_FF_not_IDLE_Grants_onehot, 
            W_err_Requests_next_state_IDLE, 
            W_err_IDLE_Req_L, 
            W_err_Local_Req_L,
            W_err_North_Req_N, 
            W_err_East_Req_E, 
            W_err_West_Req_W, 
            W_err_South_Req_S, 
            W_err_IDLE_Req_N, 
            W_err_Local_Req_N,      
            W_err_North_Req_E, 
            W_err_East_Req_W, 
            W_err_West_Req_S, 
            W_err_South_Req_L, 
            W_err_IDLE_Req_E,
            W_err_Local_Req_E,      
            W_err_North_Req_W,
            W_err_East_Req_S,
            W_err_West_Req_L,
            W_err_South_Req_N,
            W_err_IDLE_Req_W,
            W_err_Local_Req_W,
            W_err_North_Req_S,
            W_err_East_Req_L,
            W_err_West_Req_N,
            W_err_South_Req_E,
            W_err_IDLE_Req_S,
            W_err_Local_Req_S,      
            W_err_North_Req_L,
            W_err_East_Req_N,
            W_err_West_Req_E,
            W_err_South_Req_W,
            W_err_next_state_onehot, 
            W_err_state_in_onehot, 
            W_err_DCTS_RTS_FF_state_Grant_L,
            W_err_DCTS_RTS_FF_state_Grant_N,
            W_err_DCTS_RTS_FF_state_Grant_E,
            W_err_DCTS_RTS_FF_state_Grant_W,
            W_err_DCTS_RTS_FF_state_Grant_S, 
            W_err_state_north_xbar_sel, 
            W_err_state_east_xbar_sel, 
            W_err_state_west_xbar_sel, 
            W_err_state_south_xbar_sel,
            W_err_state_local_xbar_sel: std_logic;

  -- South
  signal    S_err_state_IDLE_xbar,
            S_err_state_not_IDLE_xbar,
            S_err_state_IDLE_RTS_FF_in,
            S_err_state_not_IDLE_RTS_FF_RTS_FF_in,
            S_err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in,
            S_err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in,
            S_err_RTS_FF_not_DCTS_state_state_in,
            S_err_not_RTS_FF_state_in_next_state,
            S_err_RTS_FF_DCTS_state_in_next_state,
            S_err_not_DCTS_Grants,
            S_err_DCTS_not_RTS_FF_Grants, 
            S_err_DCTS_RTS_FF_IDLE_Grants, 
            S_err_DCTS_RTS_FF_not_IDLE_Grants_onehot, 
            S_err_Requests_next_state_IDLE, 
            S_err_IDLE_Req_L, 
            S_err_Local_Req_L,
            S_err_North_Req_N, 
            S_err_East_Req_E, 
            S_err_West_Req_W, 
            S_err_South_Req_S, 
            S_err_IDLE_Req_N, 
            S_err_Local_Req_N,      
            S_err_North_Req_E, 
            S_err_East_Req_W, 
            S_err_West_Req_S, 
            S_err_South_Req_L, 
            S_err_IDLE_Req_E,
            S_err_Local_Req_E,      
            S_err_North_Req_W,
            S_err_East_Req_S,
            S_err_West_Req_L,
            S_err_South_Req_N,
            S_err_IDLE_Req_W,
            S_err_Local_Req_W,
            S_err_North_Req_S,
            S_err_East_Req_L,
            S_err_West_Req_N,
            S_err_South_Req_E,
            S_err_IDLE_Req_S,
            S_err_Local_Req_S,      
            S_err_North_Req_L,
            S_err_East_Req_N,
            S_err_West_Req_E,
            S_err_South_Req_W,
            S_err_next_state_onehot, 
            S_err_state_in_onehot, 
            S_err_DCTS_RTS_FF_state_Grant_L,
            S_err_DCTS_RTS_FF_state_Grant_N,
            S_err_DCTS_RTS_FF_state_Grant_E,
            S_err_DCTS_RTS_FF_state_Grant_W,
            S_err_DCTS_RTS_FF_state_Grant_S, 
            S_err_state_north_xbar_sel, 
            S_err_state_east_xbar_sel, 
            S_err_state_west_xbar_sel, 
            S_err_state_south_xbar_sel,
            S_err_state_local_xbar_sel: std_logic;

  -- Local
  signal    L_err_state_IDLE_xbar,
            L_err_state_not_IDLE_xbar,
            L_err_state_IDLE_RTS_FF_in, 
            L_err_state_not_IDLE_RTS_FF_RTS_FF_in,
            L_err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in, 
            L_err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in, 
            L_err_RTS_FF_not_DCTS_state_state_in, 
            L_err_not_RTS_FF_state_in_next_state, 
            L_err_RTS_FF_DCTS_state_in_next_state, 
            L_err_not_DCTS_Grants, 
            L_err_DCTS_not_RTS_FF_Grants, 
            L_err_DCTS_RTS_FF_IDLE_Grants, 
            L_err_DCTS_RTS_FF_not_IDLE_Grants_onehot, 
            L_err_Requests_next_state_IDLE, 
            L_err_IDLE_Req_L, 
            L_err_Local_Req_L,
            L_err_North_Req_N, 
            L_err_East_Req_E, 
            L_err_West_Req_W, 
            L_err_South_Req_S, 
            L_err_IDLE_Req_N, 
            L_err_Local_Req_N,      
            L_err_North_Req_E, 
            L_err_East_Req_W, 
            L_err_West_Req_S, 
            L_err_South_Req_L, 
            L_err_IDLE_Req_E,
            L_err_Local_Req_E,      
            L_err_North_Req_W,
            L_err_East_Req_S,
            L_err_West_Req_L,
            L_err_South_Req_N,
            L_err_IDLE_Req_W,
            L_err_Local_Req_W,
            L_err_North_Req_S,
            L_err_East_Req_L,
            L_err_West_Req_N,
            L_err_South_Req_E,
            L_err_IDLE_Req_S,
            L_err_Local_Req_S,      
            L_err_North_Req_L,
            L_err_East_Req_N,
            L_err_West_Req_E,
            L_err_South_Req_W,
            L_err_next_state_onehot, 
            L_err_state_in_onehot, 
            L_err_DCTS_RTS_FF_state_Grant_L,
            L_err_DCTS_RTS_FF_state_Grant_N,
            L_err_DCTS_RTS_FF_state_Grant_E,
            L_err_DCTS_RTS_FF_state_Grant_W,
            L_err_DCTS_RTS_FF_state_Grant_S, 
            L_err_state_north_xbar_sel, 
            L_err_state_east_xbar_sel, 
            L_err_state_west_xbar_sel, 
            L_err_state_south_xbar_sel,
            L_err_state_local_xbar_sel: std_logic;

  -- FIFO Control Part Checkers signals

  -- North
  signal   N_err_write_en_write_pointer, 
           N_err_not_write_en_write_pointer, 
           N_err_read_pointer_write_pointer_not_empty, 
           N_err_read_pointer_write_pointer_empty, 
           N_err_read_pointer_write_pointer_not_full, 
           N_err_read_pointer_write_pointer_full, 
           N_err_read_pointer_increment, 
           N_err_read_pointer_not_increment, 
           N_err_CTS_in, 
           N_err_write_en, 
           N_err_not_CTS_in, 
           N_err_not_write_en, 
           N_err_read_en_mismatch : std_logic;


  -- East
  signal   E_err_write_en_write_pointer, 
           E_err_not_write_en_write_pointer, 
           E_err_read_pointer_write_pointer_not_empty, 
           E_err_read_pointer_write_pointer_empty, 
           E_err_read_pointer_write_pointer_not_full, 
           E_err_read_pointer_write_pointer_full, 
           E_err_read_pointer_increment, 
           E_err_read_pointer_not_increment, 
           E_err_CTS_in, 
           E_err_write_en, 
           E_err_not_CTS_in, 
           E_err_not_write_en, 
           E_err_read_en_mismatch : std_logic;

  -- West
  signal   W_err_write_en_write_pointer, 
           W_err_not_write_en_write_pointer, 
           W_err_read_pointer_write_pointer_not_empty, 
           W_err_read_pointer_write_pointer_empty, 
           W_err_read_pointer_write_pointer_not_full, 
           W_err_read_pointer_write_pointer_full, 
           W_err_read_pointer_increment, 
           W_err_read_pointer_not_increment, 
           W_err_CTS_in, 
           W_err_write_en, 
           W_err_not_CTS_in, 
           W_err_not_write_en, 
           W_err_read_en_mismatch : std_logic;

  -- South
  signal   S_err_write_en_write_pointer, 
           S_err_not_write_en_write_pointer, 
           S_err_read_pointer_write_pointer_not_empty, 
           S_err_read_pointer_write_pointer_empty, 
           S_err_read_pointer_write_pointer_not_full, 
           S_err_read_pointer_write_pointer_full, 
           S_err_read_pointer_increment, 
           S_err_read_pointer_not_increment, 
           S_err_CTS_in, 
           S_err_write_en, 
           S_err_not_CTS_in, 
           S_err_not_write_en, 
           S_err_read_en_mismatch : std_logic;

  -- Local
  signal   L_err_write_en_write_pointer, 
           L_err_not_write_en_write_pointer, 
           L_err_read_pointer_write_pointer_not_empty, 
           L_err_read_pointer_write_pointer_empty, 
           L_err_read_pointer_write_pointer_not_full, 
           L_err_read_pointer_write_pointer_full, 
           L_err_read_pointer_increment, 
           L_err_read_pointer_not_increment, 
           L_err_CTS_in, 
           L_err_write_en, 
           L_err_not_CTS_in, 
           L_err_not_write_en, 
           L_err_read_en_mismatch : std_logic;

-- Fault localization related signals
  signal N_E_turn, N_W_turn, S_E_turn, S_W_turn, E_N_turn, E_S_turn, W_N_turn, W_S_turn : std_logic;
  signal N_S_path, S_N_path, E_W_path, W_E_path : std_logic;

begin

--
------------------------------------------------------------------------------------------------------------------------------
--                                      block diagram of one channel
--
--                                     .____________grant_________     
--                                     |                          ▲
--                                     |     _______            __|_______        
--                                     |    |       |          |          |      
--                                     |    | LBDR  |---req--->|  Arbiter | <--handshake-->                       
--                                     |    |_______|          |__________|     signals         
--                                     |       ▲                  |
--                                   __▼___    | flit          ___▼__  
--                         RX ----->|      |   | type         |      |        
--                     <-handshake->| FIFO |---o------------->|      |-----> TX
--                        signals   |______|           ------>|      |
--                                                     ------>| XBAR |        
--                                                     ------>|      |        
--                                                     ------>|      |        
--                                                            |______|        
--                    
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

-- all the FIFOs
 FIFO_N: FIFO generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (reset => reset, clk => clk, RX => RX_N, DRTS => DRTS_N, 
   			read_en_N => '0', read_en_E =>Grant_EN, read_en_W =>Grant_WN, read_en_S =>Grant_SN, read_en_L =>Grant_LN, 
   			CTS => CTS_N, empty_out => empty_N, Data_out => FIFO_D_out_N, 

            err_write_en_write_pointer => N_err_write_en_write_pointer,
            err_not_write_en_write_pointer => N_err_not_write_en_write_pointer,
            err_read_pointer_write_pointer_not_empty => N_err_read_pointer_write_pointer_not_empty,
            err_read_pointer_write_pointer_empty => N_err_read_pointer_write_pointer_empty,
            err_read_pointer_write_pointer_not_full => N_err_read_pointer_write_pointer_not_full,
            err_read_pointer_write_pointer_full => N_err_read_pointer_write_pointer_full,
            err_read_pointer_increment => N_err_read_pointer_increment,
            err_read_pointer_not_increment => N_err_read_pointer_not_increment,
            err_CTS_in => N_err_CTS_in,
            err_write_en => N_err_write_en,
            err_not_CTS_in => N_err_not_CTS_in,
            err_not_write_en => N_err_not_write_en,
            err_read_en_mismatch => N_err_read_en_mismatch
   
        );      

 FIFO_E: FIFO generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (reset => reset, clk => clk, RX => RX_E, DRTS => DRTS_E, 
   			read_en_N => Grant_NE, read_en_E =>'0', read_en_W =>Grant_WE, read_en_S =>Grant_SE, read_en_L =>Grant_LE, 
   			CTS => CTS_E, empty_out => empty_E, Data_out => FIFO_D_out_E, 

            err_write_en_write_pointer => E_err_write_en_write_pointer,
            err_not_write_en_write_pointer => E_err_not_write_en_write_pointer,
            err_read_pointer_write_pointer_not_empty => E_err_read_pointer_write_pointer_not_empty,
            err_read_pointer_write_pointer_empty => E_err_read_pointer_write_pointer_empty,
            err_read_pointer_write_pointer_not_full => E_err_read_pointer_write_pointer_not_full,
            err_read_pointer_write_pointer_full => E_err_read_pointer_write_pointer_full,
            err_read_pointer_increment => E_err_read_pointer_increment,
            err_read_pointer_not_increment => E_err_read_pointer_not_increment,
            err_CTS_in => E_err_CTS_in,
            err_write_en => E_err_write_en,
            err_not_CTS_in => E_err_not_CTS_in,
            err_not_write_en => E_err_not_write_en,
            err_read_en_mismatch => E_err_read_en_mismatch
            );     

 FIFO_W: FIFO generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (reset => reset, clk => clk, RX => RX_W, DRTS => DRTS_W, 
   			read_en_N => Grant_NW, read_en_E =>Grant_EW, read_en_W =>'0', read_en_S =>Grant_SW, read_en_L =>Grant_LW, 
   			CTS => CTS_W, empty_out => empty_W, Data_out => FIFO_D_out_W, 

            err_write_en_write_pointer => W_err_write_en_write_pointer,
            err_not_write_en_write_pointer => W_err_not_write_en_write_pointer,
            err_read_pointer_write_pointer_not_empty => W_err_read_pointer_write_pointer_not_empty,
            err_read_pointer_write_pointer_empty => W_err_read_pointer_write_pointer_empty,
            err_read_pointer_write_pointer_not_full => W_err_read_pointer_write_pointer_not_full,
            err_read_pointer_write_pointer_full => W_err_read_pointer_write_pointer_full,
            err_read_pointer_increment => W_err_read_pointer_increment,
            err_read_pointer_not_increment => W_err_read_pointer_not_increment,
            err_CTS_in => W_err_CTS_in,
            err_write_en => W_err_write_en,
            err_not_CTS_in => W_err_not_CTS_in,
            err_not_write_en => W_err_not_write_en,
            err_read_en_mismatch => W_err_read_en_mismatch
        );

 FIFO_S: FIFO generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (reset => reset, clk => clk, RX => RX_S, DRTS => DRTS_S, 
   			read_en_N => Grant_NS, read_en_E =>Grant_ES, read_en_W =>Grant_WS, read_en_S =>'0', read_en_L =>Grant_LS, 
   			CTS => CTS_S, empty_out => empty_S, Data_out => FIFO_D_out_S, 

            err_write_en_write_pointer => S_err_write_en_write_pointer,
            err_not_write_en_write_pointer => S_err_not_write_en_write_pointer,
            err_read_pointer_write_pointer_not_empty => S_err_read_pointer_write_pointer_not_empty,
            err_read_pointer_write_pointer_empty => S_err_read_pointer_write_pointer_empty,
            err_read_pointer_write_pointer_not_full => S_err_read_pointer_write_pointer_not_full,
            err_read_pointer_write_pointer_full => S_err_read_pointer_write_pointer_full,
            err_read_pointer_increment => S_err_read_pointer_increment,
            err_read_pointer_not_increment => S_err_read_pointer_not_increment,
            err_CTS_in => S_err_CTS_in,
            err_write_en => S_err_write_en,
            err_not_CTS_in => S_err_not_CTS_in,
            err_not_write_en => S_err_not_write_en,
            err_read_en_mismatch => S_err_read_en_mismatch

        ); 

 FIFO_L: FIFO generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (reset => reset, clk => clk, RX => RX_L, DRTS => DRTS_L, 
   			read_en_N => Grant_NL, read_en_E =>Grant_EL, read_en_W =>Grant_WL, read_en_S => Grant_SL, read_en_L =>'0',
   			CTS => CTS_L, empty_out => empty_L, Data_out => FIFO_D_out_L, 

            err_write_en_write_pointer => L_err_write_en_write_pointer,
            err_not_write_en_write_pointer => L_err_not_write_en_write_pointer,
            err_read_pointer_write_pointer_not_empty => L_err_read_pointer_write_pointer_not_empty,
            err_read_pointer_write_pointer_empty => L_err_read_pointer_write_pointer_empty,
            err_read_pointer_write_pointer_not_full => L_err_read_pointer_write_pointer_not_full,
            err_read_pointer_write_pointer_full => L_err_read_pointer_write_pointer_full,
            err_read_pointer_increment => L_err_read_pointer_increment,
            err_read_pointer_not_increment => L_err_read_pointer_not_increment,
            err_CTS_in => L_err_CTS_in,
            err_write_en => L_err_write_en,
            err_not_CTS_in => L_err_not_CTS_in,
            err_not_write_en => L_err_not_write_en,
            err_read_en_mismatch => L_err_read_en_mismatch

        ); 

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

-- all the LBDRs
LBDR_N: LBDR generic map (cur_addr_rst => current_address, Rxy_rst => Rxy_rst, Cx_rst => Cx_rst, NoC_size => NoC_size)
	   PORT MAP (reset => reset, clk => clk, empty => empty_N, flit_type => FIFO_D_out_N(DATA_WIDTH-1 downto DATA_WIDTH-3), dst_addr=> FIFO_D_out_N(DATA_WIDTH-19+NoC_size-1 downto DATA_WIDTH-19) ,
   		 	 Req_N=> Req_NN, Req_E=>Req_NE, Req_W=>Req_NW, Req_S=>Req_NS, Req_L=>Req_NL, 

            err_header_not_empty_Requests_in_onehot =>  N_err_header_not_empty_Requests_in_onehot,
            err_header_empty_Requests_FF_Requests_in => N_err_header_empty_Requests_FF_Requests_in,
            err_tail_Requests_in_all_zero =>            N_err_tail_Requests_in_all_zero,
            err_header_tail_Requests_FF_Requests_in =>  N_err_header_tail_Requests_FF_Requests_in,
            err_dst_addr_cur_addr_N1 =>                 N_err_dst_addr_cur_addr_N1,
            err_dst_addr_cur_addr_not_N1 =>             N_err_dst_addr_cur_addr_not_N1,
            err_dst_addr_cur_addr_E1 =>                 N_err_dst_addr_cur_addr_E1,
            err_dst_addr_cur_addr_not_E1 =>             N_err_dst_addr_cur_addr_not_E1,
            err_dst_addr_cur_addr_W1 =>                 N_err_dst_addr_cur_addr_W1,
            err_dst_addr_cur_addr_not_W1 =>             N_err_dst_addr_cur_addr_not_W1,
            err_dst_addr_cur_addr_S1 =>                 N_err_dst_addr_cur_addr_S1,
            err_dst_addr_cur_addr_not_S1 =>             N_err_dst_addr_cur_addr_not_S1,
            err_dst_addr_cur_addr_not_Req_L_in =>       N_err_dst_addr_cur_addr_not_Req_L_in,
            err_dst_addr_cur_addr_Req_L_in =>           N_err_dst_addr_cur_addr_Req_L_in,
            err_header_not_empty_Req_N_in =>            N_err_header_not_empty_Req_N_in,
            err_header_not_empty_Req_E_in =>            N_err_header_not_empty_Req_E_in,
            err_header_not_empty_Req_W_in =>            N_err_header_not_empty_Req_W_in,
            err_header_not_empty_Req_S_in =>            N_err_header_not_empty_Req_S_in
         );

LBDR_E: LBDR generic map (cur_addr_rst => current_address, Rxy_rst => Rxy_rst, Cx_rst => Cx_rst, NoC_size => NoC_size)
   PORT MAP (reset =>  reset, clk => clk, empty => empty_E, flit_type => FIFO_D_out_E(DATA_WIDTH-1 downto DATA_WIDTH-3), dst_addr=> FIFO_D_out_E(DATA_WIDTH-19+NoC_size-1 downto DATA_WIDTH-19) ,
   		 	 Req_N=> Req_EN, Req_E=>Req_EE, Req_W=>Req_EW, Req_S=>Req_ES, Req_L=>Req_EL,

            err_header_not_empty_Requests_in_onehot =>  E_err_header_not_empty_Requests_in_onehot,
            err_header_empty_Requests_FF_Requests_in => E_err_header_empty_Requests_FF_Requests_in,
            err_tail_Requests_in_all_zero =>            E_err_tail_Requests_in_all_zero,
            err_header_tail_Requests_FF_Requests_in =>  E_err_header_tail_Requests_FF_Requests_in,
            err_dst_addr_cur_addr_N1 =>                 E_err_dst_addr_cur_addr_N1,
            err_dst_addr_cur_addr_not_N1 =>             E_err_dst_addr_cur_addr_not_N1,
            err_dst_addr_cur_addr_E1 =>                 E_err_dst_addr_cur_addr_E1,
            err_dst_addr_cur_addr_not_E1 =>             E_err_dst_addr_cur_addr_not_E1,
            err_dst_addr_cur_addr_W1 =>                 E_err_dst_addr_cur_addr_W1,
            err_dst_addr_cur_addr_not_W1 =>             E_err_dst_addr_cur_addr_not_W1,
            err_dst_addr_cur_addr_S1 =>                 E_err_dst_addr_cur_addr_S1,
            err_dst_addr_cur_addr_not_S1 =>             E_err_dst_addr_cur_addr_not_S1,
            err_dst_addr_cur_addr_not_Req_L_in =>       E_err_dst_addr_cur_addr_not_Req_L_in,
            err_dst_addr_cur_addr_Req_L_in =>           E_err_dst_addr_cur_addr_Req_L_in,
            err_header_not_empty_Req_N_in =>            E_err_header_not_empty_Req_N_in,
            err_header_not_empty_Req_E_in =>            E_err_header_not_empty_Req_E_in,
            err_header_not_empty_Req_W_in =>            E_err_header_not_empty_Req_W_in,
            err_header_not_empty_Req_S_in =>            E_err_header_not_empty_Req_S_in
         );

LBDR_W: LBDR generic map (cur_addr_rst => current_address, Rxy_rst => Rxy_rst, Cx_rst => Cx_rst, NoC_size => NoC_size)
   PORT MAP (reset =>  reset, clk => clk, empty => empty_W,  flit_type => FIFO_D_out_W(DATA_WIDTH-1 downto DATA_WIDTH-3), dst_addr=> FIFO_D_out_W(DATA_WIDTH-19+NoC_size-1 downto DATA_WIDTH-19) ,
   		 	 Req_N=> Req_WN, Req_E=>Req_WE, Req_W=>Req_WW, Req_S=>Req_WS, Req_L=>Req_WL, 

            err_header_not_empty_Requests_in_onehot =>  W_err_header_not_empty_Requests_in_onehot,
            err_header_empty_Requests_FF_Requests_in => W_err_header_empty_Requests_FF_Requests_in,
            err_tail_Requests_in_all_zero =>            W_err_tail_Requests_in_all_zero,
            err_header_tail_Requests_FF_Requests_in =>  W_err_header_tail_Requests_FF_Requests_in,
            err_dst_addr_cur_addr_N1 =>                 W_err_dst_addr_cur_addr_N1,
            err_dst_addr_cur_addr_not_N1 =>             W_err_dst_addr_cur_addr_not_N1,
            err_dst_addr_cur_addr_E1 =>                 W_err_dst_addr_cur_addr_E1,
            err_dst_addr_cur_addr_not_E1 =>             W_err_dst_addr_cur_addr_not_E1,
            err_dst_addr_cur_addr_W1 =>                 W_err_dst_addr_cur_addr_W1,
            err_dst_addr_cur_addr_not_W1 =>             W_err_dst_addr_cur_addr_not_W1,
            err_dst_addr_cur_addr_S1 =>                 W_err_dst_addr_cur_addr_S1,
            err_dst_addr_cur_addr_not_S1 =>             W_err_dst_addr_cur_addr_not_S1,
            err_dst_addr_cur_addr_not_Req_L_in =>       W_err_dst_addr_cur_addr_not_Req_L_in,
            err_dst_addr_cur_addr_Req_L_in =>           W_err_dst_addr_cur_addr_Req_L_in,
            err_header_not_empty_Req_N_in =>            W_err_header_not_empty_Req_N_in,
            err_header_not_empty_Req_E_in =>            W_err_header_not_empty_Req_E_in,
            err_header_not_empty_Req_W_in =>            W_err_header_not_empty_Req_W_in,
            err_header_not_empty_Req_S_in =>            W_err_header_not_empty_Req_S_in
         );

LBDR_S: LBDR generic map (cur_addr_rst => current_address, Rxy_rst => Rxy_rst, Cx_rst => Cx_rst, NoC_size => NoC_size)
   PORT MAP (reset =>  reset, clk => clk, empty => empty_S, flit_type => FIFO_D_out_S(DATA_WIDTH-1 downto DATA_WIDTH-3), dst_addr=> FIFO_D_out_S(DATA_WIDTH-19+NoC_size-1 downto DATA_WIDTH-19) ,
   		 	 Req_N=> Req_SN, Req_E=>Req_SE, Req_W=>Req_SW, Req_S=>Req_SS, Req_L=>Req_SL, 

            err_header_not_empty_Requests_in_onehot =>  S_err_header_not_empty_Requests_in_onehot,
            err_header_empty_Requests_FF_Requests_in => S_err_header_empty_Requests_FF_Requests_in,
            err_tail_Requests_in_all_zero =>            S_err_tail_Requests_in_all_zero,
            err_header_tail_Requests_FF_Requests_in =>  S_err_header_tail_Requests_FF_Requests_in,
            err_dst_addr_cur_addr_N1 =>                 S_err_dst_addr_cur_addr_N1,
            err_dst_addr_cur_addr_not_N1 =>             S_err_dst_addr_cur_addr_not_N1,
            err_dst_addr_cur_addr_E1 =>                 S_err_dst_addr_cur_addr_E1,
            err_dst_addr_cur_addr_not_E1 =>             S_err_dst_addr_cur_addr_not_E1,
            err_dst_addr_cur_addr_W1 =>                 S_err_dst_addr_cur_addr_W1,
            err_dst_addr_cur_addr_not_W1 =>             S_err_dst_addr_cur_addr_not_W1,
            err_dst_addr_cur_addr_S1 =>                 S_err_dst_addr_cur_addr_S1,
            err_dst_addr_cur_addr_not_S1 =>             S_err_dst_addr_cur_addr_not_S1,
            err_dst_addr_cur_addr_not_Req_L_in =>       S_err_dst_addr_cur_addr_not_Req_L_in,
            err_dst_addr_cur_addr_Req_L_in =>           S_err_dst_addr_cur_addr_Req_L_in,
            err_header_not_empty_Req_N_in =>            S_err_header_not_empty_Req_N_in,
            err_header_not_empty_Req_E_in =>            S_err_header_not_empty_Req_E_in,
            err_header_not_empty_Req_W_in =>            S_err_header_not_empty_Req_W_in,
            err_header_not_empty_Req_S_in =>            S_err_header_not_empty_Req_S_in
         );

LBDR_L: LBDR generic map (cur_addr_rst => current_address, Rxy_rst => Rxy_rst, Cx_rst => Cx_rst, NoC_size => NoC_size)
   PORT MAP (reset =>  reset, clk => clk, empty => empty_L, flit_type => FIFO_D_out_L(DATA_WIDTH-1 downto DATA_WIDTH-3), dst_addr=> FIFO_D_out_L(DATA_WIDTH-19+NoC_size-1 downto DATA_WIDTH-19) ,
   		 	 Req_N=> Req_LN, Req_E=>Req_LE, Req_W=>Req_LW, Req_S=>Req_LS, Req_L=>Req_LL, 

            err_header_not_empty_Requests_in_onehot =>  L_err_header_not_empty_Requests_in_onehot,
            err_header_empty_Requests_FF_Requests_in => L_err_header_empty_Requests_FF_Requests_in,
            err_tail_Requests_in_all_zero =>            L_err_tail_Requests_in_all_zero,
            err_header_tail_Requests_FF_Requests_in =>  L_err_header_tail_Requests_FF_Requests_in,
            err_dst_addr_cur_addr_N1 =>                 L_err_dst_addr_cur_addr_N1,
            err_dst_addr_cur_addr_not_N1 =>             L_err_dst_addr_cur_addr_not_N1,
            err_dst_addr_cur_addr_E1 =>                 L_err_dst_addr_cur_addr_E1,
            err_dst_addr_cur_addr_not_E1 =>             L_err_dst_addr_cur_addr_not_E1,
            err_dst_addr_cur_addr_W1 =>                 L_err_dst_addr_cur_addr_W1,
            err_dst_addr_cur_addr_not_W1 =>             L_err_dst_addr_cur_addr_not_W1,
            err_dst_addr_cur_addr_S1 =>                 L_err_dst_addr_cur_addr_S1,
            err_dst_addr_cur_addr_not_S1 =>             L_err_dst_addr_cur_addr_not_S1,
            err_dst_addr_cur_addr_not_Req_L_in =>       L_err_dst_addr_cur_addr_not_Req_L_in,
            err_dst_addr_cur_addr_Req_L_in =>           L_err_dst_addr_cur_addr_Req_L_in,
            err_header_not_empty_Req_N_in =>            L_err_header_not_empty_Req_N_in,
            err_header_not_empty_Req_E_in =>            L_err_header_not_empty_Req_E_in,
            err_header_not_empty_Req_W_in =>            L_err_header_not_empty_Req_W_in,
            err_header_not_empty_Req_S_in =>            L_err_header_not_empty_Req_S_in
         );

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

-- all the Arbiters
Arbiter_N: Arbiter 
   PORT MAP (reset => reset, clk => clk,
          Req_N => '0' , Req_E => Req_EN, Req_W => Req_WN, Req_S => Req_SN, Req_L => Req_LN,
          DCTS => DCTS_N, Grant_N => Grant_NN, Grant_E => Grant_NE, Grant_W => Grant_NW, Grant_S => Grant_NS, Grant_L => Grant_NL,
          Xbar_sel => Xbar_sel_N, 
          RTS =>  RTS_N, 

          err_state_IDLE_xbar =>                            N_err_state_IDLE_xbar,
          err_state_not_IDLE_xbar =>                        N_err_state_not_IDLE_xbar,
          err_state_IDLE_RTS_FF_in =>                       N_err_state_IDLE_RTS_FF_in,
          err_state_not_IDLE_RTS_FF_RTS_FF_in =>            N_err_state_not_IDLE_RTS_FF_RTS_FF_in,
          err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in =>       N_err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in,
          err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in =>   N_err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in,
          err_RTS_FF_not_DCTS_state_state_in =>             N_err_RTS_FF_not_DCTS_state_state_in,
          err_not_RTS_FF_state_in_next_state =>             N_err_not_RTS_FF_state_in_next_state,
          err_RTS_FF_DCTS_state_in_next_state =>            N_err_RTS_FF_DCTS_state_in_next_state,
          err_not_DCTS_Grants =>                            N_err_not_DCTS_Grants,
          err_DCTS_not_RTS_FF_Grants =>                     N_err_DCTS_not_RTS_FF_Grants,
          err_DCTS_RTS_FF_IDLE_Grants =>                    N_err_DCTS_RTS_FF_IDLE_Grants,
          err_DCTS_RTS_FF_not_IDLE_Grants_onehot =>         N_err_DCTS_RTS_FF_not_IDLE_Grants_onehot,
          err_Requests_next_state_IDLE =>                   N_err_Requests_next_state_IDLE,
          err_IDLE_Req_L =>                                 N_err_IDLE_Req_L,
          err_Local_Req_L =>                                N_err_Local_Req_L,
          err_North_Req_N =>                                N_err_North_Req_N,
          err_East_Req_E =>                                 N_err_East_Req_E,
          err_West_Req_W =>                                 N_err_West_Req_W,
          err_South_Req_S =>                                N_err_South_Req_S,
          err_IDLE_Req_N =>                                 N_err_IDLE_Req_N,
          err_Local_Req_N =>                                N_err_Local_Req_N,
          err_North_Req_E =>                                N_err_North_Req_E,
          err_East_Req_W =>                                 N_err_East_Req_W,
          err_West_Req_S =>                                 N_err_West_Req_S,
          err_South_Req_L =>                                N_err_South_Req_L,
          err_IDLE_Req_E =>                                 N_err_IDLE_Req_E,
          err_Local_Req_E =>                                N_err_Local_Req_E,
          err_North_Req_W =>                                N_err_North_Req_W,
          err_East_Req_S =>                                 N_err_East_Req_S,
          err_West_Req_L =>                                 N_err_West_Req_L,
          err_South_Req_N =>                                N_err_South_Req_N,
          err_IDLE_Req_W =>                                 N_err_IDLE_Req_W,
          err_Local_Req_W =>                                N_err_Local_Req_W,
          err_North_Req_S =>                                N_err_North_Req_S,
          err_East_Req_L =>                                 N_err_East_Req_L,
          err_West_Req_N =>                                 N_err_West_Req_N,
          err_South_Req_E =>                                N_err_South_Req_E,
          err_IDLE_Req_S =>                                 N_err_IDLE_Req_S,
          err_Local_Req_S =>                                N_err_Local_Req_S,
          err_North_Req_L =>                                N_err_North_Req_L,
          err_East_Req_N =>                                 N_err_East_Req_N,
          err_West_Req_E =>                                 N_err_West_Req_E,
          err_South_Req_W =>                                N_err_South_Req_W,
          err_next_state_onehot =>                          N_err_next_state_onehot,
          err_state_in_onehot =>                            N_err_state_in_onehot,
          err_DCTS_RTS_FF_state_Grant_L =>                  N_err_DCTS_RTS_FF_state_Grant_L,
          err_DCTS_RTS_FF_state_Grant_N =>                  N_err_DCTS_RTS_FF_state_Grant_N,
          err_DCTS_RTS_FF_state_Grant_E =>                  N_err_DCTS_RTS_FF_state_Grant_E,
          err_DCTS_RTS_FF_state_Grant_W =>                  N_err_DCTS_RTS_FF_state_Grant_W,
          err_DCTS_RTS_FF_state_Grant_S =>                  N_err_DCTS_RTS_FF_state_Grant_S,
          err_state_north_xbar_sel =>                       N_err_state_north_xbar_sel,
          err_state_east_xbar_sel =>                        N_err_state_east_xbar_sel,
          err_state_west_xbar_sel =>                        N_err_state_west_xbar_sel,
          err_state_south_xbar_sel =>                       N_err_state_south_xbar_sel,
          err_state_local_xbar_sel =>                       N_err_state_local_xbar_sel
        );     

 Arbiter_E: Arbiter 
   PORT MAP (reset => reset, clk => clk,
          Req_N => Req_NE , Req_E => '0', Req_W => Req_WE, Req_S => Req_SE, Req_L => Req_LE,
          DCTS => DCTS_E, Grant_N => Grant_EN, Grant_E => Grant_EE, Grant_W => Grant_EW, Grant_S => Grant_ES, Grant_L => Grant_EL,
          Xbar_sel => Xbar_sel_E, 
          RTS =>  RTS_E, 

          err_state_IDLE_xbar =>                            E_err_state_IDLE_xbar,
          err_state_not_IDLE_xbar =>                        E_err_state_not_IDLE_xbar,
          err_state_IDLE_RTS_FF_in =>                       E_err_state_IDLE_RTS_FF_in,
          err_state_not_IDLE_RTS_FF_RTS_FF_in =>            E_err_state_not_IDLE_RTS_FF_RTS_FF_in,
          err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in =>       E_err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in,
          err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in =>   E_err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in,
          err_RTS_FF_not_DCTS_state_state_in =>             E_err_RTS_FF_not_DCTS_state_state_in,
          err_not_RTS_FF_state_in_next_state =>             E_err_not_RTS_FF_state_in_next_state,
          err_RTS_FF_DCTS_state_in_next_state =>            E_err_RTS_FF_DCTS_state_in_next_state,
          err_not_DCTS_Grants =>                            E_err_not_DCTS_Grants,
          err_DCTS_not_RTS_FF_Grants =>                     E_err_DCTS_not_RTS_FF_Grants,
          err_DCTS_RTS_FF_IDLE_Grants =>                    E_err_DCTS_RTS_FF_IDLE_Grants,
          err_DCTS_RTS_FF_not_IDLE_Grants_onehot =>         E_err_DCTS_RTS_FF_not_IDLE_Grants_onehot,
          err_Requests_next_state_IDLE =>                   E_err_Requests_next_state_IDLE,
          err_IDLE_Req_L =>                                 E_err_IDLE_Req_L,
          err_Local_Req_L =>                                E_err_Local_Req_L,
          err_North_Req_N =>                                E_err_North_Req_N,
          err_East_Req_E =>                                 E_err_East_Req_E,
          err_West_Req_W =>                                 E_err_West_Req_W,
          err_South_Req_S =>                                E_err_South_Req_S,
          err_IDLE_Req_N =>                                 E_err_IDLE_Req_N,
          err_Local_Req_N =>                                E_err_Local_Req_N,
          err_North_Req_E =>                                E_err_North_Req_E,
          err_East_Req_W =>                                 E_err_East_Req_W,
          err_West_Req_S =>                                 E_err_West_Req_S,
          err_South_Req_L =>                                E_err_South_Req_L,
          err_IDLE_Req_E =>                                 E_err_IDLE_Req_E,
          err_Local_Req_E =>                                E_err_Local_Req_E,
          err_North_Req_W =>                                E_err_North_Req_W,
          err_East_Req_S =>                                 E_err_East_Req_S,
          err_West_Req_L =>                                 E_err_West_Req_L,
          err_South_Req_N =>                                E_err_South_Req_N,
          err_IDLE_Req_W =>                                 E_err_IDLE_Req_W,
          err_Local_Req_W =>                                E_err_Local_Req_W,
          err_North_Req_S =>                                E_err_North_Req_S,
          err_East_Req_L =>                                 E_err_East_Req_L,
          err_West_Req_N =>                                 E_err_West_Req_N,
          err_South_Req_E =>                                E_err_South_Req_E,
          err_IDLE_Req_S =>                                 E_err_IDLE_Req_S,
          err_Local_Req_S =>                                E_err_Local_Req_S,
          err_North_Req_L =>                                E_err_North_Req_L,
          err_East_Req_N =>                                 E_err_East_Req_N,
          err_West_Req_E =>                                 E_err_West_Req_E,
          err_South_Req_W =>                                E_err_South_Req_W,
          err_next_state_onehot =>                          E_err_next_state_onehot,
          err_state_in_onehot =>                            E_err_state_in_onehot,
          err_DCTS_RTS_FF_state_Grant_L =>                  E_err_DCTS_RTS_FF_state_Grant_L,
          err_DCTS_RTS_FF_state_Grant_N =>                  E_err_DCTS_RTS_FF_state_Grant_N,
          err_DCTS_RTS_FF_state_Grant_E =>                  E_err_DCTS_RTS_FF_state_Grant_E,
          err_DCTS_RTS_FF_state_Grant_W =>                  E_err_DCTS_RTS_FF_state_Grant_W,
          err_DCTS_RTS_FF_state_Grant_S =>                  E_err_DCTS_RTS_FF_state_Grant_S,
          err_state_north_xbar_sel =>                       E_err_state_north_xbar_sel,
          err_state_east_xbar_sel =>                        E_err_state_east_xbar_sel,
          err_state_west_xbar_sel =>                        E_err_state_west_xbar_sel,
          err_state_south_xbar_sel =>                       E_err_state_south_xbar_sel,
          err_state_local_xbar_sel =>                       E_err_state_local_xbar_sel
        );  

  Arbiter_W: Arbiter 
   PORT MAP (reset => reset, clk => clk,
          Req_N => Req_NW , Req_E => Req_EW, Req_W => '0', Req_S => Req_SW, Req_L => Req_LW,
          DCTS => DCTS_W, Grant_N => Grant_WN, Grant_E => Grant_WE, Grant_W => Grant_WW, Grant_S => Grant_WS, Grant_L => Grant_WL,
          Xbar_sel => Xbar_sel_W, 
          RTS =>  RTS_W, 

          err_state_IDLE_xbar =>                            W_err_state_IDLE_xbar,
          err_state_not_IDLE_xbar =>                        W_err_state_not_IDLE_xbar,
          err_state_IDLE_RTS_FF_in =>                       W_err_state_IDLE_RTS_FF_in,
          err_state_not_IDLE_RTS_FF_RTS_FF_in =>            W_err_state_not_IDLE_RTS_FF_RTS_FF_in,
          err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in =>       W_err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in,
          err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in =>   W_err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in,
          err_RTS_FF_not_DCTS_state_state_in =>             W_err_RTS_FF_not_DCTS_state_state_in,
          err_not_RTS_FF_state_in_next_state =>             W_err_not_RTS_FF_state_in_next_state,
          err_RTS_FF_DCTS_state_in_next_state =>            W_err_RTS_FF_DCTS_state_in_next_state,
          err_not_DCTS_Grants =>                            W_err_not_DCTS_Grants,
          err_DCTS_not_RTS_FF_Grants =>                     W_err_DCTS_not_RTS_FF_Grants,
          err_DCTS_RTS_FF_IDLE_Grants =>                    W_err_DCTS_RTS_FF_IDLE_Grants,
          err_DCTS_RTS_FF_not_IDLE_Grants_onehot =>         W_err_DCTS_RTS_FF_not_IDLE_Grants_onehot,
          err_Requests_next_state_IDLE =>                   W_err_Requests_next_state_IDLE,
          err_IDLE_Req_L =>                                 W_err_IDLE_Req_L,
          err_Local_Req_L =>                                W_err_Local_Req_L,
          err_North_Req_N =>                                W_err_North_Req_N,
          err_East_Req_E =>                                 W_err_East_Req_E,
          err_West_Req_W =>                                 W_err_West_Req_W,
          err_South_Req_S =>                                W_err_South_Req_S,
          err_IDLE_Req_N =>                                 W_err_IDLE_Req_N,
          err_Local_Req_N =>                                W_err_Local_Req_N,
          err_North_Req_E =>                                W_err_North_Req_E,
          err_East_Req_W =>                                 W_err_East_Req_W,
          err_West_Req_S =>                                 W_err_West_Req_S,
          err_South_Req_L =>                                W_err_South_Req_L,
          err_IDLE_Req_E =>                                 W_err_IDLE_Req_E,
          err_Local_Req_E =>                                W_err_Local_Req_E,
          err_North_Req_W =>                                W_err_North_Req_W,
          err_East_Req_S =>                                 W_err_East_Req_S,
          err_West_Req_L =>                                 W_err_West_Req_L,
          err_South_Req_N =>                                W_err_South_Req_N,
          err_IDLE_Req_W =>                                 W_err_IDLE_Req_W,
          err_Local_Req_W =>                                W_err_Local_Req_W,
          err_North_Req_S =>                                W_err_North_Req_S,
          err_East_Req_L =>                                 W_err_East_Req_L,
          err_West_Req_N =>                                 W_err_West_Req_N,
          err_South_Req_E =>                                W_err_South_Req_E,
          err_IDLE_Req_S =>                                 W_err_IDLE_Req_S,
          err_Local_Req_S =>                                W_err_Local_Req_S,
          err_North_Req_L =>                                W_err_North_Req_L,
          err_East_Req_N =>                                 W_err_East_Req_N,
          err_West_Req_E =>                                 W_err_West_Req_E,
          err_South_Req_W =>                                W_err_South_Req_W,
          err_next_state_onehot =>                          W_err_next_state_onehot,
          err_state_in_onehot =>                            W_err_state_in_onehot,
          err_DCTS_RTS_FF_state_Grant_L =>                  W_err_DCTS_RTS_FF_state_Grant_L,
          err_DCTS_RTS_FF_state_Grant_N =>                  W_err_DCTS_RTS_FF_state_Grant_N,
          err_DCTS_RTS_FF_state_Grant_E =>                  W_err_DCTS_RTS_FF_state_Grant_E,
          err_DCTS_RTS_FF_state_Grant_W =>                  W_err_DCTS_RTS_FF_state_Grant_W,
          err_DCTS_RTS_FF_state_Grant_S =>                  W_err_DCTS_RTS_FF_state_Grant_S,
          err_state_north_xbar_sel =>                       W_err_state_north_xbar_sel,
          err_state_east_xbar_sel =>                        W_err_state_east_xbar_sel,
          err_state_west_xbar_sel =>                        W_err_state_west_xbar_sel,
          err_state_south_xbar_sel =>                       W_err_state_south_xbar_sel,
          err_state_local_xbar_sel =>                       W_err_state_local_xbar_sel
        );      

  Arbiter_S: Arbiter 
   PORT MAP (reset => reset, clk => clk,
          Req_N => Req_NS , Req_E => Req_ES, Req_W => Req_WS, Req_S => '0', Req_L => Req_LS,
          DCTS => DCTS_S, Grant_N => Grant_SN, Grant_E => Grant_SE, Grant_W => Grant_SW, Grant_S => Grant_SS, Grant_L => Grant_SL,
          Xbar_sel => Xbar_sel_S, 
          RTS =>  RTS_S, 

          err_state_IDLE_xbar =>                            S_err_state_IDLE_xbar,
          err_state_not_IDLE_xbar =>                        S_err_state_not_IDLE_xbar,
          err_state_IDLE_RTS_FF_in =>                       S_err_state_IDLE_RTS_FF_in,
          err_state_not_IDLE_RTS_FF_RTS_FF_in =>            S_err_state_not_IDLE_RTS_FF_RTS_FF_in,
          err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in =>       S_err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in,
          err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in =>   S_err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in,
          err_RTS_FF_not_DCTS_state_state_in =>             S_err_RTS_FF_not_DCTS_state_state_in,
          err_not_RTS_FF_state_in_next_state =>             S_err_not_RTS_FF_state_in_next_state,
          err_RTS_FF_DCTS_state_in_next_state =>            S_err_RTS_FF_DCTS_state_in_next_state,
          err_not_DCTS_Grants =>                            S_err_not_DCTS_Grants,
          err_DCTS_not_RTS_FF_Grants =>                     S_err_DCTS_not_RTS_FF_Grants,
          err_DCTS_RTS_FF_IDLE_Grants =>                    S_err_DCTS_RTS_FF_IDLE_Grants,
          err_DCTS_RTS_FF_not_IDLE_Grants_onehot =>         S_err_DCTS_RTS_FF_not_IDLE_Grants_onehot,
          err_Requests_next_state_IDLE =>                   S_err_Requests_next_state_IDLE,
          err_IDLE_Req_L =>                                 S_err_IDLE_Req_L,
          err_Local_Req_L =>                                S_err_Local_Req_L,
          err_North_Req_N =>                                S_err_North_Req_N,
          err_East_Req_E =>                                 S_err_East_Req_E,
          err_West_Req_W =>                                 S_err_West_Req_W,
          err_South_Req_S =>                                S_err_South_Req_S,
          err_IDLE_Req_N =>                                 S_err_IDLE_Req_N,
          err_Local_Req_N =>                                S_err_Local_Req_N,
          err_North_Req_E =>                                S_err_North_Req_E,
          err_East_Req_W =>                                 S_err_East_Req_W,
          err_West_Req_S =>                                 S_err_West_Req_S,
          err_South_Req_L =>                                S_err_South_Req_L,
          err_IDLE_Req_E =>                                 S_err_IDLE_Req_E,
          err_Local_Req_E =>                                S_err_Local_Req_E,
          err_North_Req_W =>                                S_err_North_Req_W,
          err_East_Req_S =>                                 S_err_East_Req_S,
          err_West_Req_L =>                                 S_err_West_Req_L,
          err_South_Req_N =>                                S_err_South_Req_N,
          err_IDLE_Req_W =>                                 S_err_IDLE_Req_W,
          err_Local_Req_W =>                                S_err_Local_Req_W,
          err_North_Req_S =>                                S_err_North_Req_S,
          err_East_Req_L =>                                 S_err_East_Req_L,
          err_West_Req_N =>                                 S_err_West_Req_N,
          err_South_Req_E =>                                S_err_South_Req_E,
          err_IDLE_Req_S =>                                 S_err_IDLE_Req_S,
          err_Local_Req_S =>                                S_err_Local_Req_S,
          err_North_Req_L =>                                S_err_North_Req_L,
          err_East_Req_N =>                                 S_err_East_Req_N,
          err_West_Req_E =>                                 S_err_West_Req_E,
          err_South_Req_W =>                                S_err_South_Req_W,
          err_next_state_onehot =>                          S_err_next_state_onehot,
          err_state_in_onehot =>                            S_err_state_in_onehot,
          err_DCTS_RTS_FF_state_Grant_L =>                  S_err_DCTS_RTS_FF_state_Grant_L,
          err_DCTS_RTS_FF_state_Grant_N =>                  S_err_DCTS_RTS_FF_state_Grant_N,
          err_DCTS_RTS_FF_state_Grant_E =>                  S_err_DCTS_RTS_FF_state_Grant_E,
          err_DCTS_RTS_FF_state_Grant_W =>                  S_err_DCTS_RTS_FF_state_Grant_W,
          err_DCTS_RTS_FF_state_Grant_S =>                  S_err_DCTS_RTS_FF_state_Grant_S,
          err_state_north_xbar_sel =>                       S_err_state_north_xbar_sel,
          err_state_east_xbar_sel =>                        S_err_state_east_xbar_sel,
          err_state_west_xbar_sel =>                        S_err_state_west_xbar_sel,
          err_state_south_xbar_sel =>                       S_err_state_south_xbar_sel,
          err_state_local_xbar_sel =>                       S_err_state_local_xbar_sel
        );   

  Arbiter_L: Arbiter 
   PORT MAP (reset => reset, clk => clk,
          Req_N => Req_NL , Req_E => Req_EL, Req_W => Req_WL, Req_S => Req_SL, Req_L => '0',
          DCTS => DCTS_L, Grant_N => Grant_LN, Grant_E => Grant_LE, Grant_W => Grant_LW, Grant_S => Grant_LS, Grant_L => Grant_LL,
          Xbar_sel => Xbar_sel_L, 
          RTS =>  RTS_L, 

          err_state_IDLE_xbar =>                            L_err_state_IDLE_xbar,
          err_state_not_IDLE_xbar =>                        L_err_state_not_IDLE_xbar,
          err_state_IDLE_RTS_FF_in =>                       L_err_state_IDLE_RTS_FF_in,
          err_state_not_IDLE_RTS_FF_RTS_FF_in =>            L_err_state_not_IDLE_RTS_FF_RTS_FF_in,
          err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in =>       L_err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in,
          err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in =>   L_err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in,
          err_RTS_FF_not_DCTS_state_state_in =>             L_err_RTS_FF_not_DCTS_state_state_in,
          err_not_RTS_FF_state_in_next_state =>             L_err_not_RTS_FF_state_in_next_state,
          err_RTS_FF_DCTS_state_in_next_state =>            L_err_RTS_FF_DCTS_state_in_next_state,
          err_not_DCTS_Grants =>                            L_err_not_DCTS_Grants,
          err_DCTS_not_RTS_FF_Grants =>                     L_err_DCTS_not_RTS_FF_Grants,
          err_DCTS_RTS_FF_IDLE_Grants =>                    L_err_DCTS_RTS_FF_IDLE_Grants,
          err_DCTS_RTS_FF_not_IDLE_Grants_onehot =>         L_err_DCTS_RTS_FF_not_IDLE_Grants_onehot,
          err_Requests_next_state_IDLE =>                   L_err_Requests_next_state_IDLE,
          err_IDLE_Req_L =>                                 L_err_IDLE_Req_L,
          err_Local_Req_L =>                                L_err_Local_Req_L,
          err_North_Req_N =>                                L_err_North_Req_N,
          err_East_Req_E =>                                 L_err_East_Req_E,
          err_West_Req_W =>                                 L_err_West_Req_W,
          err_South_Req_S =>                                L_err_South_Req_S,
          err_IDLE_Req_N =>                                 L_err_IDLE_Req_N,
          err_Local_Req_N =>                                L_err_Local_Req_N,
          err_North_Req_E =>                                L_err_North_Req_E,
          err_East_Req_W =>                                 L_err_East_Req_W,
          err_West_Req_S =>                                 L_err_West_Req_S,
          err_South_Req_L =>                                L_err_South_Req_L,
          err_IDLE_Req_E =>                                 L_err_IDLE_Req_E,
          err_Local_Req_E =>                                L_err_Local_Req_E,
          err_North_Req_W =>                                L_err_North_Req_W,
          err_East_Req_S =>                                 L_err_East_Req_S,
          err_West_Req_L =>                                 L_err_West_Req_L,
          err_South_Req_N =>                                L_err_South_Req_N,
          err_IDLE_Req_W =>                                 L_err_IDLE_Req_W,
          err_Local_Req_W =>                                L_err_Local_Req_W,
          err_North_Req_S =>                                L_err_North_Req_S,
          err_East_Req_L =>                                 L_err_East_Req_L,
          err_West_Req_N =>                                 L_err_West_Req_N,
          err_South_Req_E =>                                L_err_South_Req_E,
          err_IDLE_Req_S =>                                 L_err_IDLE_Req_S,
          err_Local_Req_S =>                                L_err_Local_Req_S,
          err_North_Req_L =>                                L_err_North_Req_L,
          err_East_Req_N =>                                 L_err_East_Req_N,
          err_West_Req_E =>                                 L_err_West_Req_E,
          err_South_Req_W =>                                L_err_South_Req_W,
          err_next_state_onehot =>                          L_err_next_state_onehot,
          err_state_in_onehot =>                            L_err_state_in_onehot,
          err_DCTS_RTS_FF_state_Grant_L =>                  L_err_DCTS_RTS_FF_state_Grant_L,
          err_DCTS_RTS_FF_state_Grant_N =>                  L_err_DCTS_RTS_FF_state_Grant_N,
          err_DCTS_RTS_FF_state_Grant_E =>                  L_err_DCTS_RTS_FF_state_Grant_E,
          err_DCTS_RTS_FF_state_Grant_W =>                  L_err_DCTS_RTS_FF_state_Grant_W,
          err_DCTS_RTS_FF_state_Grant_S =>                  L_err_DCTS_RTS_FF_state_Grant_S,
          err_state_north_xbar_sel =>                       L_err_state_north_xbar_sel,
          err_state_east_xbar_sel =>                        L_err_state_east_xbar_sel,
          err_state_west_xbar_sel =>                        L_err_state_west_xbar_sel,
          err_state_south_xbar_sel =>                       L_err_state_south_xbar_sel,
          err_state_local_xbar_sel =>                       L_err_state_local_xbar_sel
        );          
        
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

-- all the Xbars
XBAR_N: XBAR generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (North_in => FIFO_D_out_N, East_in => FIFO_D_out_E, West_in => FIFO_D_out_W, South_in => FIFO_D_out_S, Local_in => FIFO_D_out_L,
        sel => Xbar_sel_N,  Data_out=> TX_N);
XBAR_E: XBAR generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (North_in => FIFO_D_out_N, East_in => FIFO_D_out_E, West_in => FIFO_D_out_W, South_in => FIFO_D_out_S, Local_in => FIFO_D_out_L,
        sel => Xbar_sel_E,  Data_out=> TX_E);
XBAR_W: XBAR generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (North_in => FIFO_D_out_N, East_in => FIFO_D_out_E, West_in => FIFO_D_out_W, South_in => FIFO_D_out_S, Local_in => FIFO_D_out_L,
        sel => Xbar_sel_W,  Data_out=> TX_W);
XBAR_S: XBAR generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (North_in => FIFO_D_out_N, East_in => FIFO_D_out_E, West_in => FIFO_D_out_W, South_in => FIFO_D_out_S, Local_in => FIFO_D_out_L,
        sel => Xbar_sel_S,  Data_out=> TX_S);
XBAR_L: XBAR generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (North_in => FIFO_D_out_N, East_in => FIFO_D_out_E, West_in => FIFO_D_out_W, South_in => FIFO_D_out_S, Local_in => FIFO_D_out_L,
        sel => Xbar_sel_L,  Data_out=> TX_L);

-- Fault localization logic construction
-- Turns

N_E_turn <= ( N_err_write_en_write_pointer or
              N_err_not_write_en_write_pointer or
              N_err_read_pointer_write_pointer_not_empty or
              N_err_read_pointer_write_pointer_empty or
              N_err_read_pointer_write_pointer_not_full or
              N_err_read_pointer_write_pointer_full or
              N_err_read_pointer_increment or
              N_err_read_pointer_not_increment or
              N_err_read_en_mismatch ) or

            ( N_err_header_not_empty_Req_E_in ) or

            ( E_err_North_Req_N or 
              E_err_East_Req_N or 
              E_err_West_Req_N or 
              E_err_South_Req_N or 
              E_err_Local_Req_N or 
              E_err_IDLE_Req_N or
              E_err_state_north_xbar_sel or 
              E_err_DCTS_RTS_FF_state_Grant_N );

N_W_turn <= ( N_err_write_en_write_pointer or
              N_err_not_write_en_write_pointer or
              N_err_read_pointer_write_pointer_not_empty or
              N_err_read_pointer_write_pointer_empty or
              N_err_read_pointer_write_pointer_not_full or
              N_err_read_pointer_write_pointer_full or
              N_err_read_pointer_increment or
              N_err_read_pointer_not_increment or
              N_err_read_en_mismatch ) or

            ( N_err_header_not_empty_Req_W_in ) or

            ( W_err_North_Req_N or 
              W_err_East_Req_N or 
              W_err_West_Req_N or 
              W_err_South_Req_N or 
              W_err_Local_Req_N or 
              W_err_IDLE_Req_N or
              W_err_state_north_xbar_sel or 
              W_err_DCTS_RTS_FF_state_Grant_N);

S_W_turn <= ( S_err_write_en_write_pointer or
              S_err_not_write_en_write_pointer or
              S_err_read_pointer_write_pointer_not_empty or
              S_err_read_pointer_write_pointer_empty or
              S_err_read_pointer_write_pointer_not_full or
              S_err_read_pointer_write_pointer_full or
              S_err_read_pointer_increment or
              S_err_read_pointer_not_increment or
              S_err_read_en_mismatch ) or

            ( S_err_header_not_empty_Req_W_in ) or

            ( W_err_North_Req_S or 
              W_err_East_Req_S or 
              W_err_West_Req_S or 
              W_err_South_Req_S or 
              W_err_Local_Req_S or 
              W_err_IDLE_Req_S or
              W_err_state_South_xbar_sel or 
              W_err_DCTS_RTS_FF_state_Grant_S);

S_E_turn <= ( S_err_write_en_write_pointer or
              S_err_not_write_en_write_pointer or
              S_err_read_pointer_write_pointer_not_empty or
              S_err_read_pointer_write_pointer_empty or
              S_err_read_pointer_write_pointer_not_full or
              S_err_read_pointer_write_pointer_full or
              S_err_read_pointer_increment or
              S_err_read_pointer_not_increment or
              S_err_read_en_mismatch ) or

            ( S_err_header_not_empty_Req_E_in ) or

            ( E_err_North_Req_S or 
              E_err_East_Req_S or 
              E_err_West_Req_S or 
              E_err_South_Req_S or 
              E_err_Local_Req_S or 
              E_err_IDLE_Req_S or
              E_err_state_South_xbar_sel or 
              E_err_DCTS_RTS_FF_state_Grant_S);

W_N_turn <= ( W_err_write_en_write_pointer or
              W_err_not_write_en_write_pointer or
              W_err_read_pointer_write_pointer_not_empty or
              W_err_read_pointer_write_pointer_empty or
              W_err_read_pointer_write_pointer_not_full or
              W_err_read_pointer_write_pointer_full or
              W_err_read_pointer_increment or
              W_err_read_pointer_not_increment or
              W_err_read_en_mismatch ) or

            ( W_err_header_not_empty_Req_N_in ) or

            ( N_err_North_Req_W or 
              N_err_East_Req_W or 
              N_err_West_Req_W or 
              N_err_South_Req_W or 
              N_err_Local_Req_W or 
              N_err_IDLE_Req_W or
              N_err_state_west_xbar_sel or 
              N_err_DCTS_RTS_FF_state_Grant_W);

W_S_turn <= ( W_err_write_en_write_pointer or
              W_err_not_write_en_write_pointer or
              W_err_read_pointer_write_pointer_not_empty or
              W_err_read_pointer_write_pointer_empty or
              W_err_read_pointer_write_pointer_not_full or
              W_err_read_pointer_write_pointer_full or
              W_err_read_pointer_increment or
              W_err_read_pointer_not_increment or
              W_err_read_en_mismatch ) or

            ( W_err_header_not_empty_Req_S_in ) or

            ( S_err_North_Req_W or 
              S_err_East_Req_W or 
              S_err_West_Req_W or 
              S_err_South_Req_W or 
              S_err_Local_Req_W or 
              S_err_IDLE_Req_W or
              S_err_state_west_xbar_sel or 
              S_err_DCTS_RTS_FF_state_Grant_W);

E_N_turn <= ( E_err_write_en_write_pointer or
              E_err_not_write_en_write_pointer or
              E_err_read_pointer_write_pointer_not_empty or
              E_err_read_pointer_write_pointer_empty or
              E_err_read_pointer_write_pointer_not_full or
              E_err_read_pointer_write_pointer_full or
              E_err_read_pointer_increment or
              E_err_read_pointer_not_increment or
              E_err_read_en_mismatch ) or

            ( E_err_header_not_empty_Req_N_in ) or

            ( N_err_North_Req_E or 
              N_err_East_Req_E or 
              N_err_West_Req_E or 
              N_err_South_Req_E or 
              N_err_Local_Req_E or 
              N_err_IDLE_Req_E or
              N_err_state_east_xbar_sel or 
              N_err_DCTS_RTS_FF_state_Grant_E);

E_S_turn <= ( E_err_write_en_write_pointer or
              E_err_not_write_en_write_pointer or
              E_err_read_pointer_write_pointer_not_empty or
              E_err_read_pointer_write_pointer_empty or
              E_err_read_pointer_write_pointer_not_full or
              E_err_read_pointer_write_pointer_full or
              E_err_read_pointer_increment or
              E_err_read_pointer_not_increment or
              E_err_read_en_mismatch ) or

            ( E_err_header_not_empty_Req_S_in ) or

            ( S_err_North_Req_E or 
              S_err_East_Req_E or 
              S_err_West_Req_E or 
              S_err_South_Req_E or 
              S_err_Local_Req_E or 
              S_err_IDLE_Req_E or
              S_err_state_east_xbar_sel or 
              S_err_DCTS_RTS_FF_state_Grant_E);

-- Paths

N_S_path <= ( N_err_write_en_write_pointer or
              N_err_not_write_en_write_pointer or
              N_err_read_pointer_write_pointer_not_empty or
              N_err_read_pointer_write_pointer_empty or
              N_err_read_pointer_write_pointer_not_full or
              N_err_read_pointer_write_pointer_full or
              N_err_read_pointer_increment or
              N_err_read_pointer_not_increment or
              N_err_read_en_mismatch ) or

            ( N_err_header_not_empty_Req_S_in ) or

            ( S_err_North_Req_N or 
              S_err_East_Req_N or 
              S_err_West_Req_N or 
              S_err_South_Req_N or 
              S_err_Local_Req_N or 
              S_err_IDLE_Req_N or
              S_err_state_north_xbar_sel or 
              S_err_DCTS_RTS_FF_state_Grant_N );

S_N_path <= ( S_err_write_en_write_pointer or
              S_err_not_write_en_write_pointer or
              S_err_read_pointer_write_pointer_not_empty or
              S_err_read_pointer_write_pointer_empty or
              S_err_read_pointer_write_pointer_not_full or
              S_err_read_pointer_write_pointer_full or
              S_err_read_pointer_increment or
              S_err_read_pointer_not_increment or
              S_err_read_en_mismatch ) or

            ( S_err_header_not_empty_Req_N_in ) or

            ( N_err_North_Req_S or 
              N_err_East_Req_S or 
              N_err_West_Req_S or 
              N_err_South_Req_S or 
              N_err_Local_Req_S or 
              N_err_IDLE_Req_S or
              N_err_state_South_xbar_sel or 
              N_err_DCTS_RTS_FF_state_Grant_S);

E_W_path <= ( E_err_write_en_write_pointer or
              E_err_not_write_en_write_pointer or
              E_err_read_pointer_write_pointer_not_empty or
              E_err_read_pointer_write_pointer_empty or
              E_err_read_pointer_write_pointer_not_full or
              E_err_read_pointer_write_pointer_full or
              E_err_read_pointer_increment or
              E_err_read_pointer_not_increment or
              E_err_read_en_mismatch ) or

            ( E_err_header_not_empty_Req_W_in ) or

            ( W_err_North_Req_E or 
              W_err_East_Req_E or 
              W_err_West_Req_E or 
              W_err_South_Req_E or 
              W_err_Local_Req_E or 
              W_err_IDLE_Req_E or
              W_err_state_east_xbar_sel or 
              W_err_DCTS_RTS_FF_state_Grant_E);

W_E_path <= ( W_err_write_en_write_pointer or
              W_err_not_write_en_write_pointer or
              W_err_read_pointer_write_pointer_not_empty or
              W_err_read_pointer_write_pointer_empty or
              W_err_read_pointer_write_pointer_not_full or
              W_err_read_pointer_write_pointer_full or
              W_err_read_pointer_increment or
              W_err_read_pointer_not_increment or
              W_err_read_en_mismatch ) or

            ( W_err_header_not_empty_Req_E_in ) or

            ( E_err_North_Req_W or 
              E_err_East_Req_W or 
              E_err_West_Req_W or 
              E_err_South_Req_W or 
              E_err_Local_Req_W or 
              E_err_IDLE_Req_W or
              E_err_state_west_xbar_sel or 
              E_err_DCTS_RTS_FF_state_Grant_W);

end;
