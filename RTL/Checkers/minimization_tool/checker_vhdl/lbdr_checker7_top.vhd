library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity LBDR_with_checkers_top is
    generic (
        cur_addr_rst: integer := 5;
        Rxy_rst: integer := 60;
        Cx_rst: integer := 15;
        NoC_size: integer := 4
    );
    port (  empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);
            Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;
            
            -- LBDR outputs
            N1_out, E1_out, W1_out, S1_out: out std_logic;
            Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: out std_logic;

            -- Checker outputs
err_dst_addr_cur_addr_E1 : out std_logic
            );
end LBDR_with_checkers_top;

architecture behavior of LBDR_with_checkers_top is

component LBDR_pseudo is
    generic (
        cur_addr_rst: integer := 5;
        Rxy_rst: integer := 60;
        Cx_rst: integer := 15;
        NoC_size: integer := 4
    );
    port (  empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);
            Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;

            N1_out, E1_out, W1_out, S1_out: out std_logic;
            Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: out std_logic
            );
end component;

component LBDR_checkers is
    generic (
        cur_addr_rst: integer := 5;
        NoC_size: integer := 4
    );
    port (  empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;
            Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: in std_logic;
            N1_out, E1_out, W1_out, S1_out: in std_logic;
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);

            -- Checker outputs
err_dst_addr_cur_addr_E1 : out std_logic
            );
end component;

signal Req_N_in_sig, Req_E_in_sig, Req_W_in_sig, Req_S_in_sig, Req_L_in_sig: std_logic;
signal N1_out_sig, E1_out_sig, W1_out_sig, S1_out_sig: std_logic;

begin 

Req_N_in <= Req_N_in_sig;
Req_E_in <= Req_E_in_sig;
Req_W_in <= Req_W_in_sig;
Req_S_in <= Req_S_in_sig;
Req_L_in <= Req_L_in_sig;

N1_out <= N1_out_sig;
E1_out <= E1_out_sig;
W1_out <= W1_out_sig;
S1_out <= S1_out_sig;

-- LBDR instantiation
LBDR: LBDR_pseudo generic map (cur_addr_rst => 5, Rxy_rst => 60, Cx_rst => 15, NoC_size => 4)
                     port map (
                       empty=>empty, 
                       flit_type=>flit_type, 
                       dst_addr=>dst_addr, 
                       Req_N_FF=>Req_N_FF, 
                       Req_E_FF=>Req_E_FF, 
                       Req_W_FF=>Req_W_FF, 
                       Req_S_FF=>Req_S_FF, 
                       Req_L_FF=>Req_L_FF,

                       N1_out => N1_out_sig, 
                       E1_out => E1_out_sig, 
                       W1_out => W1_out_sig, 
                       S1_out => S1_out_sig,
                       Req_N_in=>Req_N_in_sig, 
                       Req_E_in=>Req_E_in_sig, 
                       Req_W_in=>Req_W_in_sig, 
                       Req_S_in=>Req_S_in_sig, 
                       Req_L_in=>Req_L_in_sig
                      );

-- Checkers instantiation
CHECKERS: LBDR_checkers  generic map (cur_addr_rst => 5, NoC_size => 4)
                         port map (empty=>empty, flit_type=>flit_type,
                                  Req_N_FF=>Req_N_FF, 
                                  Req_E_FF=>Req_E_FF, 
                                  Req_W_FF=>Req_W_FF, 
                                  Req_S_FF=>Req_S_FF,
                                  Req_L_FF=>Req_L_FF,
                                  N1_out => N1_out_sig, 
                                  E1_out => E1_out_sig, 
                                  W1_out => W1_out_sig, 
                                  S1_out => S1_out_sig, 
                                  Req_N_in=>Req_N_in_sig, 
                                  Req_E_in=>Req_E_in_sig, 
                                  Req_W_in=>Req_W_in_sig, 
                                  Req_S_in=>Req_S_in_sig, 
                                  Req_L_in=>Req_L_in_sig, 
                                  dst_addr => dst_addr,

err_dst_addr_cur_addr_E1 => err_dst_addr_cur_addr_E1);

end behavior;
    
