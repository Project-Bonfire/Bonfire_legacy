library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity  FIFO_control_part_pseudo_TMR is
    generic (
        DATA_WIDTH: integer := 13 -- number of FIFO Control Part's outputs (pseudo-combinational circuit)
    );
    port (  DRTS: in std_logic;  
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            read_pointer: in std_logic_vector(3 downto 0);
            write_pointer: in std_logic_vector(3 downto 0);
            CTS_out: in std_logic;
 
            CTS_in: out std_logic; 
            empty_out: out std_logic; 
            full_out: out std_logic;
            read_pointer_in: out std_logic_vector(3 downto 0); 
            write_pointer_in: out std_logic_vector(3 downto 0);
            read_en_out: out std_logic;
            write_en_out: out std_logic
         );
end FIFO_control_part_pseudo_TMR;

architecture behavior of FIFO_control_part_pseudo_TMR is

component FIFO_control_part_pseudo is
    port (  DRTS: in std_logic;  
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            read_pointer: in std_logic_vector(3 downto 0);
            write_pointer: in std_logic_vector(3 downto 0);
            CTS_out: in std_logic;
 
            CTS_in: out std_logic; 
            empty_out: out std_logic; 
            full_out: out std_logic;
            read_pointer_in: out std_logic_vector(3 downto 0); 
            write_pointer_in: out std_logic_vector(3 downto 0);
            read_en_out: out std_logic;
            write_en_out: out std_logic
     );
end component;

component voter is
    generic (
        DATA_WIDTH: integer := 13 -- number of FIFO Control Part's outputs (pseudo-combinational circuit)
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

-- FIFO Control Part instantiation (For TMR logic)
FIFO_CONTROL_PART0: FIFO_control_part_pseudo 
              port map (
                        DRTS => DRTS, 
                        read_en_N => read_en_N, 
                        read_en_E => read_en_E, 
                        read_en_W => read_en_W,  
                        read_en_S => read_en_S, 
                        read_en_L  => read_en_L, 
                        read_pointer => read_pointer, 
                        write_pointer => write_pointer, 
                        CTS_out => CTS_out, 

                        CTS_in =>           Voter_input_0_sig(0),
                        empty_out =>        Voter_input_0_sig(1),
                        full_out =>         Voter_input_0_sig(2),
                        read_pointer_in =>  Voter_input_0_sig(6 downto 3),
                        write_pointer_in => Voter_input_0_sig(10 downto 7),
                        read_en_out =>      Voter_input_0_sig(11),
                        write_en_out =>     Voter_input_0_sig(12)
                       );

FIFO_CONTROL_PART1: FIFO_control_part_pseudo 
              port map (
                        DRTS => DRTS, 
                        read_en_N => read_en_N, 
                        read_en_E => read_en_E, 
                        read_en_W => read_en_W,  
                        read_en_S => read_en_S, 
                        read_en_L  => read_en_L, 
                        read_pointer => read_pointer, 
                        write_pointer => write_pointer, 
                        CTS_out => CTS_out, 

                        CTS_in =>           Voter_input_1_sig(0),
                        empty_out =>        Voter_input_1_sig(1),
                        full_out =>         Voter_input_1_sig(2),
                        read_pointer_in =>  Voter_input_1_sig(6 downto 3),
                        write_pointer_in => Voter_input_1_sig(10 downto 7),
                        read_en_out =>      Voter_input_1_sig(11),
                        write_en_out =>     Voter_input_1_sig(12)
                       );

FIFO_CONTROL_PART2: FIFO_control_part_pseudo 
              port map (
                        DRTS => DRTS, 
                        read_en_N => read_en_N, 
                        read_en_E => read_en_E, 
                        read_en_W => read_en_W,  
                        read_en_S => read_en_S, 
                        read_en_L  => read_en_L, 
                        read_pointer => read_pointer, 
                        write_pointer => write_pointer, 
                        CTS_out => CTS_out, 

                        CTS_in =>           Voter_input_2_sig(0),
                        empty_out =>        Voter_input_2_sig(1),
                        full_out =>         Voter_input_2_sig(2),
                        read_pointer_in =>  Voter_input_2_sig(6 downto 3),
                        write_pointer_in => Voter_input_2_sig(10 downto 7),
                        read_en_out =>      Voter_input_2_sig(11),
                        write_en_out =>     Voter_input_2_sig(12)
                       );

-- Voter instantiation
TMR_voter: voter  generic map (DATA_WIDTH => DATA_WIDTH)
                  port map (
                              input0 => Voter_input_0_sig,
                              input1 => Voter_input_1_sig,
                              input2 => Voter_input_2_sig,
 
                              voted_output => final_voted_output_sig
                           );

CTS_in  <= final_voted_output_sig(0);
empty_out  <= final_voted_output_sig(1);
full_out  <= final_voted_output_sig(2);
read_pointer_in  <= final_voted_output_sig(6 downto 3);
write_pointer_in  <= final_voted_output_sig(10 downto 7);
read_en_out <= final_voted_output_sig(11);
write_en_out <= final_voted_output_sig(12);

end behavior;