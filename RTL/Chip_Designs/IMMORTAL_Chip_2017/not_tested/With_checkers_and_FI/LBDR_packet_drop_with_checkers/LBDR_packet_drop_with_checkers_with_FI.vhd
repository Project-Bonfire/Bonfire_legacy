--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity LBDR_packet_drop is
    generic (
        cur_addr_rst: integer := 8;
        Rxy_rst: integer := 8;
        Cx_rst: integer := 8;
        NoC_size: integer := 4
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            
            Faulty_C_N, Faulty_C_E, Faulty_C_W, Faulty_C_S: in std_logic;

            empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);
            faulty: in std_logic;
            packet_drop_order: out std_logic;
	          grant_N, grant_E, grant_W, grant_S, grant_L: in std_logic;
            Req_N, Req_E, Req_W, Req_S, Req_L:out std_logic;

            Rxy_reconf_PE: in  std_logic_vector(7 downto 0);
            Cx_reconf_PE: in  std_logic_vector(3 downto 0);
            Reconfig_command : in std_logic; 

            -- fault injector signals
            shift: in std_logic;
            fault_clk: in std_logic;
            data_in_serial: in std_logic;
            data_out_serial: out std_logic;

            -- Checker outputs
            -- Routing part checkers            
            err_header_empty_Requests_FF_Requests_in, 
            err_tail_Requests_in_all_zero, 
            err_tail_empty_Requests_FF_Requests_in, 
            err_tail_not_empty_not_grants_Requests_FF_Requests_in,
            err_grants_onehot,
            err_grants_mismatch, 
            err_header_tail_Requests_FF_Requests_in, 
            err_dst_addr_cur_addr_N1,
            err_dst_addr_cur_addr_not_N1,
            err_dst_addr_cur_addr_E1,
            err_dst_addr_cur_addr_not_E1,
            err_dst_addr_cur_addr_W1,
            err_dst_addr_cur_addr_not_W1,
            err_dst_addr_cur_addr_S1,
            err_dst_addr_cur_addr_not_S1, 
            err_dst_addr_cur_addr_Req_L_in, 
            err_dst_addr_cur_addr_not_Req_L_in, 
            err_header_not_empty_faulty_drop_packet_in, -- added according to new design
            err_header_not_empty_not_faulty_drop_packet_in_packet_drop_not_change, -- added according to new design
            err_header_not_empty_faulty_Req_in_all_zero, -- added according to new design
            err_header_not_empty_Req_L_in, -- added according to new design
            err_header_not_empty_Req_N_in,
            err_header_not_empty_Req_E_in,
            err_header_not_empty_Req_W_in,
            err_header_not_empty_Req_S_in, 
            err_header_empty_packet_drop_in_packet_drop_equal, 
            err_tail_not_empty_packet_drop_not_packet_drop_in, 
            err_tail_not_empty_not_packet_drop_packet_drop_in_packet_drop_equal, 
            err_invalid_or_body_flit_packet_drop_in_packet_drop_equal, 
            err_packet_drop_order, 

            -- Cx_Reconf checkers
            err_reconfig_cx_flit_type_Tail_not_empty_grants_Cx_in_Temp_Cx_equal, 
            err_reconfig_cx_flit_type_Tail_not_empty_grants_not_reconfig_cx_in, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Cx_in_Cx_equal, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_reconfig_cx_in, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_Temp_Cx_in, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Reconfig_command_reconfig_cx_in, 
            err_reconfig_cx_flit_type_Tail_not_empty_grants_Temp_Cx_in_Temp_Cx_equal, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Temp_Cx_in_Cx_reconf_PE_equal, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_reconfig_cx_in_reconfig_cx_equal, -- Added 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_Temp_Cx_in_Temp_Cx_equal, -- Added

            -- Rxy_Reconf checkers
            err_ReConf_FF_out_flit_type_Tail_not_empty_grants_Rxy_in_Rxy_tmp, 
            err_ReConf_FF_out_flit_type_Tail_not_empty_grants_not_ReConf_FF_in, 
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Rxy_in_Rxy_equal, 
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_ReConf_FF_in, 
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_Rxy_tmp_in_Rxy_reconf_PE_equal, 
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_Rxy_tmp_in_Rxy_tmp_equal, 
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_ReConf_FF_in_ReConf_FF_out_equal : out std_logic            
            );
end LBDR_packet_drop;

architecture behavior of LBDR_packet_drop is

component LBDR_packet_drop_routing_part_pseudo_checkers is
  generic (
        cur_addr_rst: integer := 8;
        Rxy_rst: integer := 8;
        Cx_rst: integer := 8;
        NoC_size: integer := 4
            );
    port (  
            empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;
            grant_N, grant_E, grant_W, grant_S, grant_L: in std_logic;            
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);
            faulty: in std_logic;
            Cx: in std_logic_vector(3 downto 0);
            Rxy: in std_logic_vector(7 downto 0);
            packet_drop: in std_logic;

            N1_out, E1_out, W1_out, S1_out: in std_logic;
            Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: in std_logic;
            grants: in std_logic;
            packet_drop_order: in std_logic;
            packet_drop_in: in std_logic;

            -- Checker outputs
            err_header_empty_Requests_FF_Requests_in, 
            err_tail_Requests_in_all_zero, 
            err_tail_empty_Requests_FF_Requests_in, 
            err_tail_not_empty_not_grants_Requests_FF_Requests_in,
            err_grants_onehot,
            err_grants_mismatch, 
            err_header_tail_Requests_FF_Requests_in, 
            err_dst_addr_cur_addr_N1,
            err_dst_addr_cur_addr_not_N1,
            err_dst_addr_cur_addr_E1,
            err_dst_addr_cur_addr_not_E1,
            err_dst_addr_cur_addr_W1,
            err_dst_addr_cur_addr_not_W1,
            err_dst_addr_cur_addr_S1,
            err_dst_addr_cur_addr_not_S1, 
            err_dst_addr_cur_addr_Req_L_in, 
            err_dst_addr_cur_addr_not_Req_L_in, 
            err_header_not_empty_faulty_drop_packet_in, -- added according to new design
            err_header_not_empty_not_faulty_drop_packet_in_packet_drop_not_change, -- added according to new design
            err_header_not_empty_faulty_Req_in_all_zero, -- added according to new design
            err_header_not_empty_Req_L_in, -- added according to new design
            err_header_not_empty_Req_N_in,
            err_header_not_empty_Req_E_in,
            err_header_not_empty_Req_W_in,
            err_header_not_empty_Req_S_in, 
            err_header_empty_packet_drop_in_packet_drop_equal, 
            err_tail_not_empty_packet_drop_not_packet_drop_in, 
            err_tail_not_empty_not_packet_drop_packet_drop_in_packet_drop_equal, 
            err_invalid_or_body_flit_packet_drop_in_packet_drop_equal, 
            err_packet_drop_order : out std_logic
            );
end component;

component Cx_Reconf_pseudo_checkers is
    port (  reconfig_cx: in  std_logic; -- *
            flit_type: in std_logic_vector(2 downto 0); -- *
            empty: in std_logic; -- *
            grants: in std_logic;  -- *
            Cx_in: in std_logic_vector(3 downto 0); -- * 
            Temp_Cx: in std_logic_vector(3 downto 0); -- *
            reconfig_cx_in: in std_logic; -- *
            Cx: in std_logic_vector(3 downto 0); -- *
            Cx_reconf_PE: in  std_logic_vector(3 downto 0); -- newly added
            Reconfig_command : in std_logic; -- newly added
            Faulty_C_N: in std_logic; -- *
            Faulty_C_E: in std_logic; -- *
            Faulty_C_W: in std_logic; -- *
            Faulty_C_S: in std_logic; -- *
            Temp_Cx_in: in std_logic_vector(3 downto 0); -- *

            -- Checker Outputs
            err_reconfig_cx_flit_type_Tail_not_empty_grants_Cx_in_Temp_Cx_equal, 
            err_reconfig_cx_flit_type_Tail_not_empty_grants_not_reconfig_cx_in, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Cx_in_Cx_equal, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_reconfig_cx_in, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_Temp_Cx_in, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Reconfig_command_reconfig_cx_in, 
            err_reconfig_cx_flit_type_Tail_not_empty_grants_Temp_Cx_in_Temp_Cx_equal, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Temp_Cx_in_Cx_reconf_PE_equal, 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_reconfig_cx_in_reconfig_cx_equal, -- Added 
            err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_Temp_Cx_in_Temp_Cx_equal : out std_logic -- Added
            );
end component;

component Rxy_Reconf_pseudo_checkers is
    port (  ReConf_FF_out: in std_logic;
            Rxy: in  std_logic_vector(7 downto 0);   
            Rxy_tmp: in std_logic_vector(7 downto 0);
            Reconfig_command : in std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            grants: in std_logic;
            empty: in  std_logic;
            Rxy_reconf_PE: in  std_logic_vector(7 downto 0);
            Rxy_in: in std_logic_vector(7 downto 0);
            Rxy_tmp_in: in std_logic_vector(7 downto 0);            
            ReConf_FF_in: in std_logic;

            err_ReConf_FF_out_flit_type_Tail_not_empty_grants_Rxy_in_Rxy_tmp, 
            err_ReConf_FF_out_flit_type_Tail_not_empty_grants_not_ReConf_FF_in, 
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Rxy_in_Rxy_equal, 
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_ReConf_FF_in, 
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_Rxy_tmp_in_Rxy_reconf_PE_equal, 
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_Rxy_tmp_in_Rxy_tmp_equal, 
            err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_ReConf_FF_in_ReConf_FF_out_equal : out std_logic
         );
end component;

component fault_injector is 
  generic ( DATA_WIDTH    : integer := 32; 
            ADDRESS_WIDTH : integer := 5  );
  port(
    data_in: in std_logic_vector (DATA_WIDTH-1 downto 0);
    address: in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
    sta_0: in std_logic;
    sta_1: in std_logic;
    data_out: out std_logic_vector (DATA_WIDTH-1 downto 0)
    );
end component;

component shift_register_serial_in is
    generic (
        REG_WIDTH: integer := 35
    );
    port (
        clk, reset : in std_logic;
        shift: in std_logic;
        data_in_serial: in std_logic;
        data_out_parallel: out std_logic_vector(REG_WIDTH-1 downto 0);
        data_out_serial: out std_logic
    );
end component;

   ----------------------------------------
   -- Signals related to fault injection --
   ----------------------------------------

   -- Total: 9 bits
   signal FI_add_sta: std_logic_vector(8 downto 0); -- 7 bits for fault injection location address (ceil of log2(70) = 7)
                                                     -- 2 bits for type of fault (SA0 or SA1)
   signal non_faulty_signals: std_logic_vector (69 downto 0); -- 70 bits for internal- and output-related signals (non-faulty)                                          
   signal faulty_signals: std_logic_vector(69 downto 0); -- 70 bits for internal- and output-related signals (with single stuck-at fault injected in one of them)

   ----------------------------------------
   ----------------------------------------

  signal Cx, Cx_in:  std_logic_vector(3 downto 0);
  signal Temp_Cx, Temp_Cx_in:  std_logic_vector(3 downto 0);

  signal reconfig_cx, reconfig_cx_in: std_logic;
  signal ReConf_FF_in, ReConf_FF_out: std_logic;

  signal Rxy, Rxy_in:  std_logic_vector(7 downto 0);
  signal Rxy_tmp, Rxy_tmp_in:  std_logic_vector(7 downto 0);

  signal cur_addr:  std_logic_vector(NoC_size-1 downto 0);  
  signal N1, E1, W1, S1  :std_logic :='0';  
  signal Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: std_logic;
  signal Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: std_logic;
  signal grants: std_logic;
  signal packet_drop, packet_drop_in: std_logic;
  
  -- Signal(s) required for checker(s)
  signal packet_drop_order_sig: std_logic;

   -- Signal(s) used for creating the chain of injected fault locations
   -- Total: 70 bits ??!!
   -- LBDR internal-related signals
  signal Cx_faulty, Cx_in_faulty:  std_logic_vector(3 downto 0);
  signal Temp_Cx_faulty, Temp_Cx_in_faulty:  std_logic_vector(3 downto 0);
  signal reconfig_cx_faulty, reconfig_cx_in_faulty: std_logic;
  signal ReConf_FF_in_faulty, ReConf_FF_out_faulty: std_logic;
  signal Rxy_faulty, Rxy_in_faulty:  std_logic_vector(7 downto 0);
  signal Rxy_tmp_faulty, Rxy_tmp_in_faulty:  std_logic_vector(7 downto 0);
  --signal cur_addr_faulty:  std_logic_vector(NoC_size-1 downto 0); -- current address not included yet, in this way ??!!
  signal N1_faulty, E1_faulty, W1_faulty, S1_faulty :std_logic;  
  signal Req_N_in_faulty, Req_E_in_faulty, Req_W_in_faulty, Req_S_in_faulty, Req_L_in_faulty: std_logic;
  signal Req_N_FF_faulty, Req_E_FF_faulty, Req_W_FF_faulty, Req_S_FF_faulty, Req_L_FF_faulty: std_logic;
  signal grants_faulty: std_logic;
  signal packet_drop_faulty, packet_drop_in_faulty: std_logic;

   -- LBDR output-related signals
  signal packet_drop_order_sig_faulty: std_logic;

begin 


-------------------------------------      
---- Related to fault injection -----
-------------------------------------      

-- Total: 70 bits
-- Still not sure whether to include cur_addr or not ??!!
-- for packet_drop_order output, not sure whether to include that one or the signal with _sig suffix in its name ??!!
non_faulty_signals <= Cx & Cx_in & Temp_Cx & Temp_Cx_in & reconfig_cx & reconfig_cx_in & ReConf_FF_in &
                      ReConf_FF_out & Rxy & Rxy_in & Rxy_tmp & Rxy_tmp_in & N1 & E1 & W1 & S1 & 
                      Req_N_in & Req_E_in & Req_W_in & Req_S_in & Req_L_in &
                      Req_N_FF & Req_E_FF & Req_W_FF & Req_S_FF & Req_L_FF &
                      grants & packet_drop & packet_drop_in & packet_drop_order_sig;

-- Fault injector module instantiation
FI: fault_injector generic map(DATA_WIDTH => 70, ADDRESS_WIDTH => 7) 
           port map (data_in=> non_faulty_signals , address => FI_add_sta(8 downto 2), sta_0=> FI_add_sta(1), sta_1=> FI_add_sta(0), data_out=> faulty_signals
            );

-- Extracting faulty values for internal- and output-related signals
-- Total: 70 bits
Cx_faulty                         <= faulty_signals (69 downto 66);
Cx_in_faulty                      <= faulty_signals (65 downto 62);
Temp_Cx_faulty                    <= faulty_signals (61 downto 58);
Temp_Cx_in_faulty                 <= faulty_signals (57 downto 54);
reconfig_cx_faulty                <= faulty_signals (53);
reconfig_cx_in_faulty             <= faulty_signals (52);
ReConf_FF_in_faulty               <= faulty_signals (51);
ReConf_FF_out_faulty              <= faulty_signals (50);
Rxy_faulty                        <= faulty_signals (49 downto 42);
Rxy_in_faulty                     <= faulty_signals (41 downto 34);
Rxy_tmp_faulty                    <= faulty_signals (33 downto 26);
Rxy_tmp_in_faulty                 <= faulty_signals (25 downto 18);
N1_faulty                         <= faulty_signals (17);
E1_faulty                         <= faulty_signals (16);
W1_faulty                         <= faulty_signals (15);
S1_faulty                         <= faulty_signals (14);
Req_N_in_faulty                   <= faulty_signals (13);
Req_E_in_faulty                   <= faulty_signals (12);
Req_W_in_faulty                   <= faulty_signals (11);
Req_S_in_faulty                   <= faulty_signals (10);
Req_L_in_faulty                   <= faulty_signals (9);
Req_N_FF_faulty                   <= faulty_signals (8);
Req_E_FF_faulty                   <= faulty_signals (7);
Req_W_FF_faulty                   <= faulty_signals (6);
Req_S_FF_faulty                   <= faulty_signals (5);
Req_L_FF_faulty                   <= faulty_signals (4);
grants_faulty                     <= faulty_signals (3);
packet_drop_faulty                <= faulty_signals (2);
packet_drop_in_faulty             <= faulty_signals (1);
packet_drop_order_sig_faulty      <= faulty_signals (0);


-- Total: 9 bits
SR: shift_register_serial_in generic map(REG_WIDTH => 9)
          port map ( clk=> fault_clk, reset=>reset, shift=> shift,data_in_serial=> data_in_serial, 
                     data_out_parallel=> FI_add_sta, data_out_serial=> data_out_serial
                   );

-------------------------------------      
-------------------------------------      

-- Becuase of checkers we did this

  packet_drop_order <= packet_drop_order_sig;

-- LBDR packet drop routing part checkers instantiation
LBDR_packet_drop_routing_part_checkers: LBDR_packet_drop_routing_part_pseudo_checkers  
                          generic map (cur_addr_rst => cur_addr_rst, Cx_rst => Cx_rst, Rxy_rst => Rxy_rst, NoC_size => NoC_size)
                          port map (
                                    empty       => empty,        
                                    flit_type   => flit_type,        
                                    Req_N_FF    => Req_N_FF_faulty, 
                                    Req_E_FF    => Req_E_FF_faulty, 
                                    Req_W_FF    => Req_W_FF_faulty, 
                                    Req_S_FF    => Req_S_FF_faulty, 
                                    Req_L_FF    => Req_L_FF_faulty,        
                                    grant_N     => grant_N, 
                                    grant_E     => grant_E, 
                                    grant_W     => grant_W, 
                                    grant_S     => grant_S, 
                                    grant_L     => grant_L,        
                                    dst_addr    => dst_addr,
                                    faulty      => faulty,         
                                    Cx          => Cx_faulty,        
                                    Rxy         => Rxy_faulty,        
                                    packet_drop => packet_drop_faulty,        

                                    N1_out            => N1_faulty, 
                                    E1_out            => E1_faulty, 
                                    W1_out            => W1_faulty, 
                                    S1_out            => S1_faulty, 
                                    Req_N_in          => Req_N_in_faulty, 
                                    Req_E_in          => Req_E_in_faulty, 
                                    Req_W_in          => Req_W_in_faulty, 
                                    Req_S_in          => Req_S_in_faulty, 
                                    Req_L_in          => Req_L_in_faulty, 
                                    grants            => grants_faulty, 
                                    packet_drop_order => packet_drop_order_sig_faulty, 
                                    packet_drop_in    => packet_drop_in_faulty, 

                                    -- Checker outputs
                                    err_header_empty_Requests_FF_Requests_in => err_header_empty_Requests_FF_Requests_in, 
                                    err_tail_Requests_in_all_zero => err_tail_Requests_in_all_zero, 
                                    err_tail_empty_Requests_FF_Requests_in => err_tail_empty_Requests_FF_Requests_in, 
                                    err_tail_not_empty_not_grants_Requests_FF_Requests_in => err_tail_not_empty_not_grants_Requests_FF_Requests_in, 
                                    err_grants_onehot => err_grants_onehot, 
                                    err_grants_mismatch => err_grants_mismatch, 
                                    err_header_tail_Requests_FF_Requests_in => err_header_tail_Requests_FF_Requests_in, 
                                    err_dst_addr_cur_addr_N1 => err_dst_addr_cur_addr_N1, 
                                    err_dst_addr_cur_addr_not_N1 => err_dst_addr_cur_addr_not_N1, 
                                    err_dst_addr_cur_addr_E1 => err_dst_addr_cur_addr_E1, 
                                    err_dst_addr_cur_addr_not_E1 => err_dst_addr_cur_addr_not_E1, 
                                    err_dst_addr_cur_addr_W1 => err_dst_addr_cur_addr_W1, 
                                    err_dst_addr_cur_addr_not_W1 => err_dst_addr_cur_addr_not_W1, 
                                    err_dst_addr_cur_addr_S1 => err_dst_addr_cur_addr_S1, 
                                    err_dst_addr_cur_addr_not_S1 => err_dst_addr_cur_addr_not_S1, 
                                    err_dst_addr_cur_addr_Req_L_in => err_dst_addr_cur_addr_Req_L_in,                                     
                                    err_dst_addr_cur_addr_not_Req_L_in => err_dst_addr_cur_addr_not_Req_L_in, 
                                    err_header_not_empty_faulty_drop_packet_in => err_header_not_empty_faulty_drop_packet_in, -- added according to new design
                                    err_header_not_empty_not_faulty_drop_packet_in_packet_drop_not_change => err_header_not_empty_not_faulty_drop_packet_in_packet_drop_not_change, -- added according to new design
                                    err_header_not_empty_faulty_Req_in_all_zero => err_header_not_empty_faulty_Req_in_all_zero, -- added according to new design
                                    err_header_not_empty_Req_L_in => err_header_not_empty_Req_L_in, -- added according to new design
                                    err_header_not_empty_Req_N_in => err_header_not_empty_Req_N_in, 
                                    err_header_not_empty_Req_E_in => err_header_not_empty_Req_E_in, 
                                    err_header_not_empty_Req_W_in => err_header_not_empty_Req_W_in, 
                                    err_header_not_empty_Req_S_in => err_header_not_empty_Req_S_in, 
                                    err_header_empty_packet_drop_in_packet_drop_equal => err_header_empty_packet_drop_in_packet_drop_equal, 
                                    err_tail_not_empty_packet_drop_not_packet_drop_in => err_tail_not_empty_packet_drop_not_packet_drop_in, 
                                    err_tail_not_empty_not_packet_drop_packet_drop_in_packet_drop_equal => err_tail_not_empty_not_packet_drop_packet_drop_in_packet_drop_equal, 
                                    err_invalid_or_body_flit_packet_drop_in_packet_drop_equal => err_invalid_or_body_flit_packet_drop_in_packet_drop_equal, 
                                    err_packet_drop_order => err_packet_drop_order
                                   );

-- LBDR packet drop Cx Reconfiguration module checkers instantiation
Cx_Reconf_checkers: Cx_Reconf_pseudo_checkers port map (
                                               reconfig_cx => reconfig_cx_faulty, 
                                               flit_type => flit_type, 
                                               empty => empty, 
                                               grants => grants_faulty, 
                                               Cx_in => Cx_in_faulty, 
                                               Temp_Cx => Temp_Cx_faulty, 
                                               reconfig_cx_in => reconfig_cx_in_faulty, 
                                               Cx => Cx_faulty, 
                                               Cx_reconf_PE => Cx_reconf_PE, 
                                               Reconfig_command => Reconfig_command,                                                
                                               Faulty_C_N => Faulty_C_N, 
                                               Faulty_C_E => Faulty_C_E, 
                                               Faulty_C_W => Faulty_C_W, 
                                               Faulty_C_S => Faulty_C_S, 
                                               Temp_Cx_in => Temp_Cx_in_faulty, 
   
                                               -- Checker Outputs
                                               err_reconfig_cx_flit_type_Tail_not_empty_grants_Cx_in_Temp_Cx_equal => err_reconfig_cx_flit_type_Tail_not_empty_grants_Cx_in_Temp_Cx_equal, 
                                               err_reconfig_cx_flit_type_Tail_not_empty_grants_not_reconfig_cx_in => err_reconfig_cx_flit_type_Tail_not_empty_grants_not_reconfig_cx_in, 
                                               err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Cx_in_Cx_equal => err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Cx_in_Cx_equal, 
                                               err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_reconfig_cx_in => err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_reconfig_cx_in, 
                                               err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_Temp_Cx_in => err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_Faulty_C_Temp_Cx_in, 
                                               err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Reconfig_command_reconfig_cx_in => err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Reconfig_command_reconfig_cx_in, 
                                               err_reconfig_cx_flit_type_Tail_not_empty_grants_Temp_Cx_in_Temp_Cx_equal => err_reconfig_cx_flit_type_Tail_not_empty_grants_Temp_Cx_in_Temp_Cx_equal, 
                                               err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Temp_Cx_in_Cx_reconf_PE_equal => err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_Temp_Cx_in_Cx_reconf_PE_equal, 
                                               err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_reconfig_cx_in_reconfig_cx_equal => err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_reconfig_cx_in_reconfig_cx_equal, 
                                               err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_Temp_Cx_in_Temp_Cx_equal => err_not_reconfig_cx_flit_type_not_Tail_empty_not_grants_not_Faulty_C_not_Reconfig_command_Temp_Cx_in_Temp_Cx_equal
                                             );

-- LBDR packet drop Rxy Reconfiguration checkers instantiation
Rxy_Reconf_checkers : Rxy_Reconf_pseudo_checkers 
                             port map (
                                        ReConf_FF_out => ReConf_FF_out_faulty, 
                                        Rxy => Rxy_faulty,                                                        
                                        Rxy_tmp => Rxy_tmp_faulty,
                                        Reconfig_command => Reconfig_command,                                                                                                 
                                        flit_type => flit_type, 
                                        grants => grants_faulty, 
                                        empty => empty, 
                                        Rxy_reconf_PE => Rxy_reconf_PE,                                         
                                        Rxy_in => Rxy_in_faulty, 
                                        Rxy_tmp_in => Rxy_tmp_in_faulty, 
                                        ReConf_FF_in => ReConf_FF_in_faulty, 

                                        err_ReConf_FF_out_flit_type_Tail_not_empty_grants_Rxy_in_Rxy_tmp => err_ReConf_FF_out_flit_type_Tail_not_empty_grants_Rxy_in_Rxy_tmp, 
                                        err_ReConf_FF_out_flit_type_Tail_not_empty_grants_not_ReConf_FF_in => err_ReConf_FF_out_flit_type_Tail_not_empty_grants_not_ReConf_FF_in, 
                                        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Rxy_in_Rxy_equal => err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Rxy_in_Rxy_equal, 
                                        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_ReConf_FF_in => err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_ReConf_FF_in, 
                                        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_Rxy_tmp_in_Rxy_reconf_PE_equal => err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_Reconfig_command_Rxy_tmp_in_Rxy_reconf_PE_equal, 
                                        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_Rxy_tmp_in_Rxy_tmp_equal => err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_Rxy_tmp_in_Rxy_tmp_equal, 
                                        err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_ReConf_FF_in_ReConf_FF_out_equal => err_not_ReConf_FF_out_flit_type_not_Tail_empty_not_grants_not_Reconfig_command_ReConf_FF_in_ReConf_FF_out_equal
                                      );

  grants <= grant_N or grant_E or grant_W or grant_S or grant_L;
 
  cur_addr <= std_logic_vector(to_unsigned(cur_addr_rst, cur_addr'length));

  N1 <= '1' when  dst_addr(NoC_size-1 downto NoC_size/2) < cur_addr(NoC_size-1 downto NoC_size/2) else '0';
  E1 <= '1' when  cur_addr((NoC_size/2)-1 downto 0) < dst_addr((NoC_size/2)-1 downto 0) else '0';
  W1 <= '1' when  dst_addr((NoC_size/2)-1 downto 0) < cur_addr((NoC_size/2)-1 downto 0) else '0';
  S1 <= '1' when  cur_addr(NoC_size-1 downto NoC_size/2) < dst_addr(NoC_size-1 downto NoC_size/2) else '0';


process(clk, reset)
begin
if reset = '0' then 
  Rxy <= std_logic_vector(to_unsigned(Rxy_rst, Rxy'length));
  Rxy_tmp <= (others => '0');

  Req_N_FF <= '0';
  Req_E_FF <= '0';
  Req_W_FF <= '0';
  Req_S_FF <= '0';
  Req_L_FF <= '0';
  Cx <= std_logic_vector(to_unsigned(Cx_rst, Cx'length));
  Temp_Cx <= (others => '0');
  ReConf_FF_out <= '0';
  reconfig_cx <= '0';
  packet_drop <= '0';

elsif clk'event and clk = '1' then
  Rxy <= Rxy_in;	
  Rxy_tmp <=  Rxy_tmp_in;

  Req_N_FF <= Req_N_in;
  Req_E_FF <= Req_E_in;
  Req_W_FF <= Req_W_in;
  Req_S_FF <= Req_S_in;
  Req_L_FF <= Req_L_in;
  ReConf_FF_out <= ReConf_FF_in;
  Cx <= Cx_in;
  reconfig_cx <= reconfig_cx_in;
  Temp_Cx <= Temp_Cx_in;
  packet_drop <= packet_drop_in;
end if;
end process;
 

-- The combionational part
 
process(Reconfig_command, Rxy_reconf_PE, Rxy_tmp, ReConf_FF_out, Rxy, flit_type, grants, empty)begin
  if ReConf_FF_out= '1' and flit_type = "100" and empty = '0' and grants = '1' then
	  	Rxy_in <= Rxy_tmp;
	  	ReConf_FF_in <= '0';
  else
  	Rxy_in <= Rxy;
    if Reconfig_command = '1'then 
      Rxy_tmp_in <= Rxy_reconf_PE;
  		ReConf_FF_in <= '1';
  	else
      Rxy_tmp_in <= Rxy_tmp;
  		ReConf_FF_in <= ReConf_FF_out;
  	end if;
  end if; 
end process;


process(Faulty_C_N, Faulty_C_E, Faulty_C_W, Faulty_C_S, Cx, Temp_Cx, flit_type, reconfig_cx, empty, grants, Cx_reconf_PE, Reconfig_command) begin
  Temp_Cx_in <= Temp_Cx;
  if reconfig_cx = '1' and flit_type = "100" and empty = '0' and grants = '1' then
    Cx_in <= Temp_Cx;
    reconfig_cx_in <= '0';
  else
    Cx_in <= Cx;
    if (Faulty_C_N or Faulty_C_E or Faulty_C_W or Faulty_C_S) = '1' then 
      reconfig_cx_in <= '1';
      Temp_Cx_in <= not(Faulty_C_S & Faulty_C_W & Faulty_C_E & Faulty_C_N) and Cx;

    elsif Reconfig_command = '1' then
      reconfig_cx_in <= '1';
      Temp_Cx_in <=  Cx_reconf_PE;

    else 
      reconfig_cx_in <= reconfig_cx;
    end if;
  end if;
end process;

Req_N <= Req_N_FF;
Req_E <= Req_E_FF;
Req_W <= Req_W_FF;
Req_S <= Req_S_FF;
Req_L <= Req_L_FF;

process(N1, E1, W1, S1, Rxy, Cx, flit_type, empty, Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF, grants, packet_drop, faulty) begin
 packet_drop_in <= packet_drop;
 if flit_type = "001" and empty = '0' then
        Req_N_in <= ((N1 and not E1 and not W1) or (N1 and E1 and Rxy(0)) or (N1 and W1 and Rxy(1))) and Cx(0);
        Req_E_in <= ((E1 and not N1 and not S1) or (E1 and N1 and Rxy(2)) or (E1 and S1 and Rxy(3))) and Cx(1);
        Req_W_in <= ((W1 and not N1 and not S1) or (W1 and N1 and Rxy(4)) or (W1 and S1 and Rxy(5))) and Cx(2);
        Req_S_in <= ((S1 and not E1 and not W1) or (S1 and E1 and Rxy(6)) or (S1 and W1 and Rxy(7))) and Cx(3);
        Req_L_in <= not N1 and  not E1 and not W1 and not S1;
        if faulty = '1' then
          packet_drop_in <= '1';
          Req_N_in <= '0';
          Req_E_in <= '0';
          Req_W_in <= '0';
          Req_S_in <= '0';
          Req_L_in <= '0';
        end if;
  elsif flit_type = "100" and empty = '0' and grants = '1' then
        Req_N_in <= '0';
        Req_E_in <= '0';
        Req_W_in <= '0';
        Req_S_in <= '0';
        Req_L_in <= '0';
  else
        Req_N_in <= Req_N_FF;
        Req_E_in <= Req_E_FF;
        Req_W_in <= Req_W_FF;
        Req_S_in <= Req_S_FF;
        Req_L_in <= Req_L_FF;
  end if;

   if flit_type = "100" and empty = '0' then 
    if packet_drop = '1' then
          packet_drop_in <= '0';
    end if;
  end if;
end process;
   
 
packet_drop_order_sig <= packet_drop;

END;