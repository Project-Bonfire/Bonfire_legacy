library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity LBDR_packet_drop_routing_part_pseudo_with_checkers_top is
    generic (
        cur_addr_rst: integer := 5;
        NoC_size: integer := 4
    );
    port (  empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);
            grant_N, grant_E, grant_W, grant_S, grant_L: in std_logic;
            Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;
            Cx: in std_logic_vector(3 downto 0);
            Rxy: in std_logic_vector(7 downto 0);
            packet_drop: in std_logic;

            packet_drop_order_out: out std_logic;
            packet_drop_in_out: out std_logic;
            Req_N_in_out, Req_E_in_out, Req_W_in_out, Req_S_in_out, Req_L_in_out: out std_logic; 
            N1_out, E1_out, W1_out, S1_out: out std_logic;
            grants_out: out std_logic; 

            -- Checker outputs
            --err_header_not_empty_Requests_in_onehot, 
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
            err_dst_addr_cur_addr_not_Req_L_in, 
            err_dst_addr_cur_addr_Req_L_in, 
            err_header_not_empty_Req_N_in,
            err_header_not_empty_Req_E_in,
            err_header_not_empty_Req_W_in,
            err_header_not_empty_Req_S_in, 
            err_header_not_empty_packet_drop_in, 
            err_header_not_empty_dst_addr_cur_addr_equal_packet_drop_in_packet_drop_equal, 
            err_header_empty_packet_drop_in_packet_drop_equal, 
            err_tail_not_empty_packet_drop_not_packet_drop_in, 
            err_tail_not_empty_not_packet_drop_packet_drop_in_packet_drop_equal, 
            err_invalid_or_body_flit_packet_drop_in_packet_drop_equal, 
            err_packet_drop_order : out std_logic
            );
end LBDR_packet_drop_routing_part_pseudo_with_checkers_top;

architecture behavior of LBDR_packet_drop_routing_part_pseudo_with_checkers_top is

component LBDR_packet_drop_routing_part_pseudo is
    generic (
        cur_addr_rst: integer := 5;
        NoC_size: integer := 4
    );
    port (  empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);
            grant_N, grant_E, grant_W, grant_S, grant_L: in std_logic;
            Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;
            Cx: in std_logic_vector(3 downto 0);
            Rxy: in std_logic_vector(7 downto 0);
            packet_drop: in std_logic;

            packet_drop_order: out std_logic;
            packet_drop_in: out std_logic;
            Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: out std_logic; 
            N1_out, E1_out, W1_out, S1_out: out std_logic;
            grants_out: out std_logic
            );
end component;

component LBDR_packet_drop_routing_part_pseudo_checkers is
  generic (
         	  cur_addr_rst: integer := 5;
              NoC_size: integer := 4
            );
    port (  
            empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;
            grant_N, grant_E, grant_W, grant_S, grant_L: in std_logic;            
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);
            Cx: in std_logic_vector(3 downto 0);
            Rxy: in std_logic_vector(7 downto 0);
            packet_drop: in std_logic;

            N1_out, E1_out, W1_out, S1_out: in std_logic;
            Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: in std_logic;
            grants: in std_logic;
            packet_drop_order: in std_logic;
            packet_drop_in: in std_logic;

            -- Checker outputs
            --err_header_not_empty_Requests_in_onehot, 
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
            err_dst_addr_cur_addr_not_Req_L_in, 
            err_dst_addr_cur_addr_Req_L_in, 
            err_header_not_empty_Req_N_in,
            err_header_not_empty_Req_E_in,
            err_header_not_empty_Req_W_in,
            err_header_not_empty_Req_S_in, 
            err_header_not_empty_packet_drop_in, 
            err_header_not_empty_dst_addr_cur_addr_equal_packet_drop_in_packet_drop_equal, 
            err_header_empty_packet_drop_in_packet_drop_equal, 
            err_tail_not_empty_packet_drop_not_packet_drop_in, 
            err_tail_not_empty_not_packet_drop_packet_drop_in_packet_drop_equal, 
            err_invalid_or_body_flit_packet_drop_in_packet_drop_equal, 
            err_packet_drop_order : out std_logic
            );
end component;

signal Req_N_in_sig, Req_E_in_sig, Req_W_in_sig, Req_S_in_sig, Req_L_in_sig: std_logic;
signal N1_out_sig, E1_out_sig, W1_out_sig, S1_out_sig: std_logic;
signal grants_out_sig, packet_drop_order_sig, packet_drop_in_sig: std_logic;

begin 

packet_drop_in_out <= packet_drop_in_sig;
packet_drop_order_out <= packet_drop_order_sig;
Req_N_in_out <= Req_N_in_sig;
Req_E_in_out <= Req_E_in_sig;
Req_W_in_out <= Req_W_in_sig;
Req_S_in_out <= Req_S_in_sig;
Req_L_in_out <= Req_L_in_sig;
N1_out <= N1_out_sig;
E1_out <= E1_out_sig;
W1_out <= W1_out_sig;
S1_out <= S1_out_sig;
grants_out <= grants_out_sig;

-- LBDR packet drop routing part (pseudo-combinational) module instantiation
LBDR_routing_part_pseudo: LBDR_packet_drop_routing_part_pseudo generic map (cur_addr_rst => 5, NoC_size => 4)
                          port map (
                                    empty => empty, 
                                    flit_type => flit_type, 
                                    dst_addr => dst_addr, 
                                    grant_N => grant_N, 
                                    grant_E => grant_E, 
                                    grant_W => grant_W, 
                                    grant_S => grant_S, 
                                    grant_L => grant_L, 
                                    Req_N_FF => Req_N_FF, 
                                    Req_E_FF => Req_E_FF, 
                                    Req_W_FF => Req_W_FF, 
                                    Req_S_FF => Req_S_FF, 
                                    Req_L_FF => Req_L_FF, 
                                    Cx => Cx, 
                                    Rxy => Rxy, 
                                    packet_drop => packet_drop, 

                                    packet_drop_order => packet_drop_order_sig, 
                                    packet_drop_in => packet_drop_in_sig, 
                                    Req_N_in => Req_N_in_sig, 
                                    Req_E_in => Req_E_in_sig, 
                                    Req_W_in => Req_W_in_sig, 
                                    Req_S_in => Req_S_in_sig, 
                                    Req_L_in => Req_L_in_sig, 
                                    N1_out => N1_out_sig, 
                                    E1_out => E1_out_sig, 
                                    W1_out => W1_out_sig, 
                                    S1_out => S1_out_sig, 
                                    grants_out => grants_out_sig
                                   );


-- LBDR packet drop routing part checkers instantiation
CHECKERS: LBDR_packet_drop_routing_part_pseudo_checkers  generic map (cur_addr_rst => 5, NoC_size => 4)
                          port map (
                                    empty       => empty,        
                                    flit_type   => flit_type,        
                                    Req_N_FF => Req_N_FF, 
                                    Req_E_FF => Req_E_FF, 
                                    Req_W_FF => Req_W_FF, 
                                    Req_S_FF  => Req_S_FF, 
                                    Req_L_FF    => Req_L_FF,        
                                    grant_N => grant_N, 
                                    grant_E => grant_E, 
                                    grant_W => grant_W, 
                                    grant_S  => grant_S, 
                                    grant_L     => grant_L,        
                                    dst_addr    => dst_addr,        
                                    Cx          => Cx,        
                                    Rxy         => Rxy,        
                                    packet_drop => packet_drop,        

                                    N1_out => N1_out_sig, 
                                    E1_out => E1_out_sig, 
                                    W1_out => W1_out_sig, 
                                    S1_out => S1_out_sig, 
                                    Req_N_in => Req_N_in_sig, 
                                    Req_E_in => Req_E_in_sig, 
                                    Req_W_in => Req_W_in_sig, 
                                    Req_S_in => Req_S_in_sig, 
                                    Req_L_in => Req_L_in_sig, 
                                    grants   => grants_out_sig, 
                                    packet_drop_order => packet_drop_order_sig, 
                                    packet_drop_in => packet_drop_in_sig, 

                                    -- Checker outputs
                                    --err_header_not_empty_Requests_in_onehot => err_header_not_empty_Requests_in_onehot, 
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
                                    err_dst_addr_cur_addr_not_Req_L_in => err_dst_addr_cur_addr_not_Req_L_in, 
                                    err_dst_addr_cur_addr_Req_L_in => err_dst_addr_cur_addr_Req_L_in, 
                                    err_header_not_empty_Req_N_in => err_header_not_empty_Req_N_in, 
                                    err_header_not_empty_Req_E_in => err_header_not_empty_Req_E_in, 
                                    err_header_not_empty_Req_W_in => err_header_not_empty_Req_W_in, 
                                    err_header_not_empty_Req_S_in => err_header_not_empty_Req_S_in, 
                                    err_header_not_empty_packet_drop_in => err_header_not_empty_packet_drop_in, 
                                    err_header_not_empty_dst_addr_cur_addr_equal_packet_drop_in_packet_drop_equal => err_header_not_empty_dst_addr_cur_addr_equal_packet_drop_in_packet_drop_equal, 
                                    err_header_empty_packet_drop_in_packet_drop_equal => err_header_empty_packet_drop_in_packet_drop_equal, 
                                    err_tail_not_empty_packet_drop_not_packet_drop_in => err_tail_not_empty_packet_drop_not_packet_drop_in, 
                                    err_tail_not_empty_not_packet_drop_packet_drop_in_packet_drop_equal => err_tail_not_empty_not_packet_drop_packet_drop_in_packet_drop_equal, 
                                    err_invalid_or_body_flit_packet_drop_in_packet_drop_equal => err_invalid_or_body_flit_packet_drop_in_packet_drop_equal, 
                                    err_packet_drop_order => err_packet_drop_order
                                                           );


end behavior;