--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity router_channel is
	generic (
        DATA_WIDTH: integer := 32;
        current_address : integer := 5;
        Rxy_rst : integer := 60;
        Cx_rst : integer := 15;
        NoC_size: integer := 4
    );
    port (
        reset, clk: in std_logic;

        DCTS : in std_logic;
        DRTS : in std_logic;
        RTS : out std_logic;
        CTS : out std_logic;
        flit_type : in std_logic_vector(2 downto 0);
        destination_address : in std_logic_vector(NoC_size-1 downto 0);
        Grant_N_in , Grant_E_in , Grant_W_in , Grant_S_in , Grant_L_in : in  std_logic;
        Grant_N_out, Grant_E_out, Grant_W_out, Grant_S_out, Grant_L_out: out std_logic;
        Req_N_in ,  Req_E_in , Req_W_in , Req_S_in , Req_L_in :in  std_logic;
        Req_N_out , Req_E_out, Req_W_out, Req_S_out, Req_L_out:out std_logic;
        read_pointer_out, write_pointer_out: out std_logic_vector(3 downto 0);
        write_en_out :out std_logic;
        Xbar_sel: out std_logic_vector(4 downto 0)
    );
end router_channel;

architecture behavior of router_channel is


  COMPONENT FIFO is
    generic (
        DATA_WIDTH: integer := 32
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            DRTS: in std_logic;
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            CTS: out std_logic;
            empty_out: out std_logic;
            read_pointer_out, write_pointer_out: out std_logic_vector(3 downto 0);
            write_en_out :out std_logic;
            -- Checker outputs
            err_write_en_write_pointer,
            err_not_write_en_write_pointer,
            err_read_pointer_write_pointer_not_empty,
            err_read_pointer_write_pointer_empty,
            err_read_pointer_write_pointer_not_full,
            err_read_pointer_write_pointer_full,
            err_read_pointer_increment,
            err_read_pointer_not_increment,
            --err_CTS_in,
            err_write_en,
            err_not_CTS_in,
            --err_not_write_en,
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
            --err_header_not_empty_Requests_in_onehot,
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




    -- Grant_XY : Grant signal generated from Arbiter for output X connected to FIFO of input Y


  signal empty: std_logic;



  -- Signals related to Checkers
  -- LBDR Checkers signals
  -- North
  signal N_err_header_empty_Requests_FF_Requests_in,
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

  -- Arbiter Checkers signals

  -- North
  signal N_err_state_IDLE_xbar,
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
         N_err_IDLE_Req_N,
         N_err_Local_Req_N,
         N_err_South_Req_L,
         N_err_West_Req_L,
         N_err_South_Req_N,
         N_err_East_Req_L,
         N_err_West_Req_N,
         N_err_East_Req_N,
         N_err_next_state_onehot,
         N_err_state_in_onehot,
         N_err_state_north_xbar_sel,
         N_err_state_east_xbar_sel,
         N_err_state_west_xbar_sel,
         N_err_state_south_xbar_sel : std_logic;




  -- FIFO Control Part Checkers signals

  -- North
  signal N_err_write_en_write_pointer,
         N_err_not_write_en_write_pointer,
         N_err_read_pointer_write_pointer_not_empty,
         N_err_read_pointer_write_pointer_empty,
         N_err_read_pointer_write_pointer_not_full,
         N_err_read_pointer_write_pointer_full,
         N_err_read_pointer_increment,
         N_err_read_pointer_not_increment,
         N_err_write_en,
         N_err_not_CTS_in,
         N_err_read_en_mismatch : std_logic;




-- Error Signals for each module (ORed combination of checker outputs)

signal N_LBDR_checkers_output: std_logic;
signal N_Arbiter_checkers_output: std_logic;
signal N_FIFO_control_part_checkers_output: std_logic;

begin

-- OR of checker outputs for each module (corresponding to each direction)
-- This is used for feeding the checker outputs to shift registers (later)

  -- LBDR

  N_LBDR_checkers_output <= N_err_header_empty_Requests_FF_Requests_in or
                            N_err_tail_Requests_in_all_zero or
                            N_err_header_tail_Requests_FF_Requests_in or
                            N_err_dst_addr_cur_addr_N1 or
                            N_err_dst_addr_cur_addr_not_N1 or
                            N_err_dst_addr_cur_addr_E1 or
                            N_err_dst_addr_cur_addr_not_E1 or
                            N_err_dst_addr_cur_addr_W1 or
                            N_err_dst_addr_cur_addr_not_W1 or
                            N_err_dst_addr_cur_addr_S1 or
                            N_err_dst_addr_cur_addr_not_S1 or
                            N_err_dst_addr_cur_addr_not_Req_L_in or
                            N_err_dst_addr_cur_addr_Req_L_in or
                            N_err_header_not_empty_Req_N_in or
                            N_err_header_not_empty_Req_E_in or
                            N_err_header_not_empty_Req_W_in or
                            N_err_header_not_empty_Req_S_in;

  -- Arbiter
  N_Arbiter_checkers_output <= N_err_state_IDLE_xbar or
                               N_err_state_not_IDLE_xbar or
                               N_err_state_IDLE_RTS_FF_in or
                               N_err_state_not_IDLE_RTS_FF_RTS_FF_in or
                               N_err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in or
                               N_err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in or
                               N_err_RTS_FF_not_DCTS_state_state_in or
                               N_err_not_RTS_FF_state_in_next_state or
                               N_err_RTS_FF_DCTS_state_in_next_state or
                               N_err_not_DCTS_Grants or
                               N_err_DCTS_not_RTS_FF_Grants or
                               N_err_DCTS_RTS_FF_IDLE_Grants or
                               N_err_DCTS_RTS_FF_not_IDLE_Grants_onehot or
                               N_err_Requests_next_state_IDLE or
                               N_err_IDLE_Req_L or
                               N_err_Local_Req_L or
                               N_err_North_Req_N or
                               N_err_IDLE_Req_N or
                               N_err_Local_Req_N or
                               N_err_South_Req_L or
                               N_err_West_Req_L or
                               N_err_South_Req_N or
                               N_err_East_Req_L or
                               N_err_West_Req_N or
                               N_err_East_Req_N or
                               N_err_next_state_onehot or
                               N_err_state_in_onehot or
                               N_err_state_north_xbar_sel or
                               N_err_state_east_xbar_sel or
                               N_err_state_west_xbar_sel or
                               N_err_state_south_xbar_sel;



  -- FIFO Control Part
  N_FIFO_control_part_checkers_output <= N_err_write_en_write_pointer or
                                         N_err_not_write_en_write_pointer or
                                         N_err_read_pointer_write_pointer_not_empty or
                                         N_err_read_pointer_write_pointer_empty or
                                         N_err_read_pointer_write_pointer_not_full or
                                         N_err_read_pointer_write_pointer_full or
                                         N_err_read_pointer_increment or
                                         N_err_read_pointer_not_increment or
                                         N_err_write_en or
                                         N_err_not_CTS_in or
                                         N_err_read_en_mismatch;



------------------------------------------------------------------------------------------------------------------------------


-- all the FIFOs
 FIFO_unit: FIFO generic map (DATA_WIDTH  => DATA_WIDTH)
   PORT MAP (reset => reset, clk => clk, DRTS => DRTS,
   			read_en_N => Grant_N_in, read_en_E =>Grant_E_in, read_en_W =>Grant_W_in, read_en_S =>Grant_S_in, read_en_L =>Grant_L_in,
   			CTS => CTS, empty_out => empty,

            read_pointer_out => read_pointer_out, write_pointer_out => write_pointer_out,
            write_en_out => write_en_out,

        err_write_en_write_pointer => N_err_write_en_write_pointer,
        err_not_write_en_write_pointer => N_err_not_write_en_write_pointer,
        err_read_pointer_write_pointer_not_empty => N_err_read_pointer_write_pointer_not_empty,
        err_read_pointer_write_pointer_empty => N_err_read_pointer_write_pointer_empty,
        err_read_pointer_write_pointer_not_full => N_err_read_pointer_write_pointer_not_full,
        err_read_pointer_write_pointer_full => N_err_read_pointer_write_pointer_full,
        err_read_pointer_increment => N_err_read_pointer_increment,
        err_read_pointer_not_increment => N_err_read_pointer_not_increment,
        err_write_en => N_err_write_en,
        err_not_CTS_in => N_err_not_CTS_in,
        err_read_en_mismatch => N_err_read_en_mismatch
        );


------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

-- all the LBDRs
LBDR_unit: LBDR generic map (cur_addr_rst => current_address, Rxy_rst => Rxy_rst, Cx_rst => Cx_rst, NoC_size => NoC_size)
	   PORT MAP (reset => reset, clk => clk, empty => empty, flit_type => flit_type, dst_addr=> destination_address,
   		 	 Req_N=> Req_N_out, Req_E=>Req_E_out, Req_W=>Req_W_out, Req_S=>Req_S_out, Req_L=>Req_L_out,

         err_header_empty_Requests_FF_Requests_in => N_err_header_empty_Requests_FF_Requests_in,
         err_tail_Requests_in_all_zero => N_err_tail_Requests_in_all_zero,
         err_header_tail_Requests_FF_Requests_in => N_err_header_tail_Requests_FF_Requests_in,
         err_dst_addr_cur_addr_N1 => N_err_dst_addr_cur_addr_N1,
         err_dst_addr_cur_addr_not_N1 => N_err_dst_addr_cur_addr_not_N1,
         err_dst_addr_cur_addr_E1 => N_err_dst_addr_cur_addr_E1,
         err_dst_addr_cur_addr_not_E1 => N_err_dst_addr_cur_addr_not_E1,
         err_dst_addr_cur_addr_W1 => N_err_dst_addr_cur_addr_W1,
         err_dst_addr_cur_addr_not_W1 => N_err_dst_addr_cur_addr_not_W1,
         err_dst_addr_cur_addr_S1 => N_err_dst_addr_cur_addr_S1,
         err_dst_addr_cur_addr_not_S1 => N_err_dst_addr_cur_addr_not_S1,
         err_dst_addr_cur_addr_not_Req_L_in => N_err_dst_addr_cur_addr_not_Req_L_in,
         err_dst_addr_cur_addr_Req_L_in => N_err_dst_addr_cur_addr_Req_L_in,
         err_header_not_empty_Req_N_in => N_err_header_not_empty_Req_N_in,
         err_header_not_empty_Req_E_in => N_err_header_not_empty_Req_E_in,
         err_header_not_empty_Req_W_in => N_err_header_not_empty_Req_W_in,
         err_header_not_empty_Req_S_in => N_err_header_not_empty_Req_S_in
         );



------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

-- all the Arbiters
Arbiter_unit: Arbiter
   PORT MAP (reset => reset, clk => clk,
          Req_N => Req_N_in , Req_E => Req_E_in, Req_W => Req_W_in, Req_S => Req_S_in, Req_L => Req_L_in,
          DCTS => DCTS, Grant_N => Grant_N_out, Grant_E => Grant_E_out, Grant_W => Grant_W_out, Grant_S => Grant_S_out, Grant_L => Grant_L_out,
          Xbar_sel => Xbar_sel,
          RTS =>  RTS,

          err_state_IDLE_xbar => N_err_state_IDLE_xbar ,
          err_state_not_IDLE_xbar => N_err_state_not_IDLE_xbar ,
          err_state_IDLE_RTS_FF_in => N_err_state_IDLE_RTS_FF_in ,
          err_state_not_IDLE_RTS_FF_RTS_FF_in => N_err_state_not_IDLE_RTS_FF_RTS_FF_in ,
          err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in => N_err_state_not_IDLE_DCTS_RTS_FF_RTS_FF_in ,
          err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in => N_err_state_not_IDLE_not_DCTS_RTS_FF_RTS_FF_in ,
          err_RTS_FF_not_DCTS_state_state_in => N_err_RTS_FF_not_DCTS_state_state_in ,
          err_not_RTS_FF_state_in_next_state => N_err_not_RTS_FF_state_in_next_state ,
          err_RTS_FF_DCTS_state_in_next_state => N_err_RTS_FF_DCTS_state_in_next_state ,
          err_not_DCTS_Grants => N_err_not_DCTS_Grants ,
          err_DCTS_not_RTS_FF_Grants => N_err_DCTS_not_RTS_FF_Grants ,
          err_DCTS_RTS_FF_IDLE_Grants => N_err_DCTS_RTS_FF_IDLE_Grants ,
          err_DCTS_RTS_FF_not_IDLE_Grants_onehot => N_err_DCTS_RTS_FF_not_IDLE_Grants_onehot ,
          err_Requests_next_state_IDLE => N_err_Requests_next_state_IDLE ,
          err_IDLE_Req_L => N_err_IDLE_Req_L ,
          err_Local_Req_L => N_err_Local_Req_L ,
          err_North_Req_N => N_err_North_Req_N ,
          err_IDLE_Req_N => N_err_IDLE_Req_N ,
          err_Local_Req_N => N_err_Local_Req_N ,
          err_South_Req_L => N_err_South_Req_L ,
          err_West_Req_L => N_err_West_Req_L ,
          err_South_Req_N => N_err_South_Req_N ,
          err_East_Req_L => N_err_East_Req_L ,
          err_West_Req_N => N_err_West_Req_N ,
          err_East_Req_N => N_err_East_Req_N ,
          err_next_state_onehot => N_err_next_state_onehot ,
          err_state_in_onehot => N_err_state_in_onehot ,
          err_state_north_xbar_sel => N_err_state_north_xbar_sel ,
          err_state_east_xbar_sel => N_err_state_east_xbar_sel ,
          err_state_west_xbar_sel => N_err_state_west_xbar_sel ,
          err_state_south_xbar_sel => N_err_state_south_xbar_sel
        );


end;
