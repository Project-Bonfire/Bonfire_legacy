library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity LBDR_pseudo_TMR is
	generic (
        cur_addr_rst: integer := 5;
        Rxy_rst: integer := 60;
        Cx_rst: integer := 15;
        NoC_size: integer := 4; 
        DATA_WIDTH: integer := 9
    );
    port (  empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);
            Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;
            
            -- LBDR outputs
            N1_out, E1_out, W1_out, S1_out: out std_logic;
            Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: out std_logic
            );
end LBDR_pseudo_TMR;

architecture behavior of LBDR_pseudo_TMR is

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

component voter is
    generic (
        DATA_WIDTH: integer := 9
    );
    port (
        input0: in std_logic_vector(DATA_WIDTH-1 downto 0);
        input1: in std_logic_vector(DATA_WIDTH-1 downto 0);
        input2: in std_logic_vector(DATA_WIDTH-1 downto 0);

        voted_output: out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end component;

signal Voter_input_0_sig, Voter_input_1_sig, Voter_input_2_sig: std_logic_vector(DATA_WIDTH-1 downto 0);
signal final_voted_output_sig: std_logic_vector(DATA_WIDTH-1 downto 0);

begin 

-- LBDR instantiation (For TMR logic)
LBDR0: LBDR_pseudo generic map (cur_addr_rst => 5, Rxy_rst => 60, Cx_rst => 15, NoC_size => 4)
 				     port map (
                       empty=>empty, 
                       flit_type=>flit_type, 
                       dst_addr=>dst_addr, 
      							   Req_N_FF=>Req_N_FF, 
                       Req_E_FF=>Req_E_FF, 
                       Req_W_FF=>Req_W_FF, 
                       Req_S_FF=>Req_S_FF, 
                       Req_L_FF=>Req_L_FF,

                       N1_out => Voter_input_0_sig(0), 
                       E1_out => Voter_input_0_sig(1), 
                       W1_out => Voter_input_0_sig(2), 
                       S1_out => Voter_input_0_sig(3),
       							   Req_N_in=>Voter_input_0_sig(4), 
                       Req_E_in=>Voter_input_0_sig(5), 
                       Req_W_in=>Voter_input_0_sig(6), 
                       Req_S_in=>Voter_input_0_sig(7), 
                       Req_L_in=>Voter_input_0_sig(8)
                      );

LBDR1: LBDR_pseudo generic map (cur_addr_rst => 5, Rxy_rst => 60, Cx_rst => 15, NoC_size => 4)
             port map (
                       empty=>empty, 
                       flit_type=>flit_type, 
                       dst_addr=>dst_addr, 
                       Req_N_FF=>Req_N_FF, 
                       Req_E_FF=>Req_E_FF, 
                       Req_W_FF=>Req_W_FF, 
                       Req_S_FF=>Req_S_FF, 
                       Req_L_FF=>Req_L_FF,

                       N1_out => Voter_input_1_sig(0), 
                       E1_out => Voter_input_1_sig(1), 
                       W1_out => Voter_input_1_sig(2), 
                       S1_out => Voter_input_1_sig(3),
                       Req_N_in=>Voter_input_1_sig(4), 
                       Req_E_in=>Voter_input_1_sig(5), 
                       Req_W_in=>Voter_input_1_sig(6), 
                       Req_S_in=>Voter_input_1_sig(7), 
                       Req_L_in=>Voter_input_1_sig(8)
                      );

LBDR2: LBDR_pseudo generic map (cur_addr_rst => 5, Rxy_rst => 60, Cx_rst => 15, NoC_size => 4)
             port map (
                       empty=>empty, 
                       flit_type=>flit_type, 
                       dst_addr=>dst_addr, 
                       Req_N_FF=>Req_N_FF, 
                       Req_E_FF=>Req_E_FF, 
                       Req_W_FF=>Req_W_FF, 
                       Req_S_FF=>Req_S_FF, 
                       Req_L_FF=>Req_L_FF,

                       N1_out => Voter_input_2_sig(0), 
                       E1_out => Voter_input_2_sig(1), 
                       W1_out => Voter_input_2_sig(2), 
                       S1_out => Voter_input_2_sig(3),
                       Req_N_in=>Voter_input_2_sig(4), 
                       Req_E_in=>Voter_input_2_sig(5), 
                       Req_W_in=>Voter_input_2_sig(6), 
                       Req_S_in=>Voter_input_2_sig(7), 
                       Req_L_in=>Voter_input_2_sig(8)
                      );

-- Voter instantiation
TMR_voter: voter  generic map (DATA_WIDTH => DATA_WIDTH)
                  port map (
                              input0 => Voter_input_0_sig,
                              input1 => Voter_input_1_sig,
                              input2 => Voter_input_2_sig,
 
                              voted_output => final_voted_output_sig
                           );

N1_out <= final_voted_output_sig(0);
E1_out <= final_voted_output_sig(1);
W1_out <= final_voted_output_sig(2);
S1_out <= final_voted_output_sig(3);
Req_N_in <= final_voted_output_sig(4);
Req_E_in <= final_voted_output_sig(5);
Req_W_in <= final_voted_output_sig(6);
Req_S_in <= final_voted_output_sig(7);
Req_L_in <= final_voted_output_sig(8);

end behavior;