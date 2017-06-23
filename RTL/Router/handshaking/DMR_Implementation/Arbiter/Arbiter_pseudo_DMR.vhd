library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity Arbiter_pseudo_DMR is
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
            next_state_out: out std_logic_vector (5 downto 0); -- 6 states for Arbiter's FSM

            error_out: out std_logic -- added for error detection (but not possible to localize the error)
           );
end;

architecture behavior of Arbiter_pseudo_DMR is

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

component comparator is
    generic (
        DATA_WIDTH: integer := 9
    );
    port (
        input0: in std_logic_vector(DATA_WIDTH-1 downto 0);
        input1: in std_logic_vector(DATA_WIDTH-1 downto 0);

        error_out: out std_logic
    );
end component;

signal Comparator_input_0_sig, Comparator_input_1_sig: std_logic_vector(DATA_WIDTH-1 downto 0);

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

                             Grant_N   => Comparator_input_0_sig(0),
                             Grant_E   => Comparator_input_0_sig(1),
                             Grant_W   => Comparator_input_0_sig(2),
                             Grant_S   => Comparator_input_0_sig(3),
                             Grant_L   => Comparator_input_0_sig(4),
                             Xbar_sel  => Comparator_input_0_sig(9 downto 5),
                             RTS_FF_in => Comparator_input_0_sig(10),
                             state_in  => Comparator_input_0_sig(16 downto 11),
                             next_state_out => Comparator_input_0_sig(22 downto 17)
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

                             Grant_N => Comparator_input_1_sig(0),
                             Grant_E => Comparator_input_1_sig(1),
                             Grant_W => Comparator_input_1_sig(2),
                             Grant_S => Comparator_input_1_sig(3),
                             Grant_L => Comparator_input_1_sig(4),
                             Xbar_sel =>  Comparator_input_1_sig(9 downto 5),
                             RTS_FF_in => Comparator_input_1_sig(10),
                             state_in =>  Comparator_input_1_sig(16 downto 11),
                             next_state_out => Comparator_input_1_sig(22 downto 17)
                            );

-- Comparator instantiation
DMR_comparator: comparator  generic map (DATA_WIDTH => DATA_WIDTH)
                  port map (
                              input0 => Comparator_input_0_sig,
                              input1 => Comparator_input_1_sig,

                              error_out => error_out
                           );

Grant_N  <= Comparator_input_0_sig(0);
Grant_E  <= Comparator_input_0_sig(1);
Grant_W  <= Comparator_input_0_sig(2);
Grant_S  <= Comparator_input_0_sig(3);
Grant_L  <= Comparator_input_0_sig(4);
Xbar_sel <= Comparator_input_0_sig(9 downto 5);
RTS_FF_in <= Comparator_input_0_sig(10);
state_in <= Comparator_input_0_sig(16 downto 11);
next_state_out <= Comparator_input_0_sig(22 downto 17);

end behavior;