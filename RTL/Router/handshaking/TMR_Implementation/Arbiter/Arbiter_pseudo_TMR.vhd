library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity Arbiter_pseudo_TMR is
    generic (
        DATA_WIDTH: integer := 23 -- number of Arbiter outputs (pseudo-combinational circuit)
    );
    port   (
            Req_N, Req_E, Req_W,Req_S, Req_L:in std_logic; -- From LBDR modules
            DCTS: in std_logic; -- Getting the CTS signal from the input FIFO of the next router/NI (for hand-shaking)
            RTS_FF: in std_logic;
            state: in std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM

            Grant_N, Grant_E, Grant_W, Grant_S, Grant_L:out std_logic; -- Grants given to LBDR requests (encoded as one-hot)
            Xbar_sel : out std_logic_vector (4 downto 0); -- select lines for XBAR
            RTS_FF_in: out std_logic; -- Valid output which is sent to the next router/NI to specify that the data on the output port is valid
            state_in: out std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM
            next_state_out: out std_logic_vector (5 downto 0) -- 6 states for Arbiter's FSM
           );
end;

architecture behavior of Arbiter_pseudo_TMR is

component Arbiter_pseudo is
    port   (
            Req_N, Req_E, Req_W,Req_S, Req_L:in std_logic; -- From LBDR modules
            DCTS: in std_logic; -- Getting the CTS signal from the input FIFO of the next router/NI (for hand-shaking)
            RTS_FF: in std_logic;
            state: in std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM

            Grant_N, Grant_E, Grant_W, Grant_S, Grant_L:out std_logic; -- Grants given to LBDR requests (encoded as one-hot)
            Xbar_sel : out std_logic_vector (4 downto 0); -- select lines for XBAR
            RTS_FF_in: out std_logic; -- Valid output which is sent to the next router/NI to specify that the data on the output port is valid
            state_in: out std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM
            next_state_out: out std_logic_vector (5 downto 0) -- 6 states for Arbiter's FSM
           );
end component;

component voter is
    generic (
        DATA_WIDTH: integer := 23 -- number of Arbiter outputs (pseudo-combinational circuit)
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

-- Arbiter instantiation (For TMR logic)
ARBITER0: Arbiter_pseudo port map (
                             Req_N =>  Req_N,
                             Req_E =>  Req_E,
                             Req_W =>  Req_W,
                             Req_S =>  Req_S,
                             Req_L =>  Req_L,
                             DCTS =>   DCTS,
                             RTS_FF => RTS_FF,
                             state =>  state,

                             Grant_N => Voter_input_0_sig(0),
                             Grant_E => Voter_input_0_sig(1),
                             Grant_W => Voter_input_0_sig(2),
                             Grant_S => Voter_input_0_sig(3),
                             Grant_L => Voter_input_0_sig(4),
                             Xbar_sel => Voter_input_0_sig(9 downto 5),
                             RTS_FF_in => Voter_input_0_sig(10),
                             state_in => Voter_input_0_sig(16 downto 11),
                             next_state_out => Voter_input_0_sig(22 downto 17)
                            );

ARBITER1: Arbiter_pseudo port map (
                             Req_N =>  Req_N,
                             Req_E =>  Req_E,
                             Req_W =>  Req_W,
                             Req_S =>  Req_S,
                             Req_L =>  Req_L,
                             DCTS =>   DCTS,
                             RTS_FF => RTS_FF,
                             state =>  state,

                             Grant_N => Voter_input_1_sig(0),
                             Grant_E => Voter_input_1_sig(1),
                             Grant_W => Voter_input_1_sig(2),
                             Grant_S => Voter_input_1_sig(3),
                             Grant_L => Voter_input_1_sig(4),
                             Xbar_sel => Voter_input_1_sig(9 downto 5),
                             RTS_FF_in => Voter_input_1_sig(10),
                             state_in => Voter_input_1_sig(16 downto 11),
                             next_state_out => Voter_input_1_sig(22 downto 17)
                            );

ARBITER2: Arbiter_pseudo port map (
                             Req_N =>  Req_N,
                             Req_E =>  Req_E,
                             Req_W =>  Req_W,
                             Req_S =>  Req_S,
                             Req_L =>  Req_L,
                             DCTS =>   DCTS,
                             RTS_FF => RTS_FF,
                             state =>  state,

                             Grant_N => Voter_input_2_sig(0),
                             Grant_E => Voter_input_2_sig(1),
                             Grant_W => Voter_input_2_sig(2),
                             Grant_S => Voter_input_2_sig(3),
                             Grant_L => Voter_input_2_sig(4),
                             Xbar_sel => Voter_input_2_sig(9 downto 5),
                             RTS_FF_in => Voter_input_2_sig(10),
                             state_in => Voter_input_2_sig(16 downto 11),
                             next_state_out => Voter_input_2_sig(22 downto 17)
                            );


-- Voter instantiation
TMR_voter: voter  generic map (DATA_WIDTH => DATA_WIDTH)
                  port map (
                              input0 => Voter_input_0_sig,
                              input1 => Voter_input_1_sig,
                              input2 => Voter_input_2_sig,

                              voted_output => final_voted_output_sig
                           );

Grant_N  <= final_voted_output_sig(0);
Grant_E  <= final_voted_output_sig(1);
Grant_W  <= final_voted_output_sig(2);
Grant_S  <= final_voted_output_sig(3);
Grant_L  <= final_voted_output_sig(4);
Xbar_sel <= final_voted_output_sig(9 downto 5);
RTS_FF_in <= final_voted_output_sig(10);
state_in <= final_voted_output_sig(16 downto 11);
next_state_out <= final_voted_output_sig(22 downto 17);

end behavior;