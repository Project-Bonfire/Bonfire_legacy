library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity FIFO_control_part_with_checkers_top is
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
            write_en_out: out std_logic;

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
end FIFO_control_part_with_checkers_top;

architecture behavior of FIFO_control_part_with_checkers_top is

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

component FIFO_control_part_checkers is
    port (  DRTS: in std_logic;
    		CTS_out: in std_logic;
            CTS_in: in std_logic;
            read_en_N : in std_logic;
            read_en_E : in std_logic;
            read_en_W : in std_logic;
            read_en_S : in std_logic;
            read_en_L : in std_logic;
            read_pointer: in std_logic_vector(3 downto 0);
            read_pointer_in: in std_logic_vector(3 downto 0);
            write_pointer: in std_logic_vector(3 downto 0);
            write_pointer_in: in std_logic_vector(3 downto 0);
            empty_out: in std_logic;
            full_out: in std_logic;
            read_en_out: in std_logic;
            write_en_out: in std_logic;

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
end component;

signal CTS_in_sig, empty_out_sig, full_out_sig, read_en_out_sig, write_en_out_sig: std_logic;
signal read_pointer_in_sig, write_pointer_in_sig: std_logic_vector(3 downto 0);

begin

CTS_in <= CTS_in_sig;
read_pointer_in <= read_pointer_in_sig;
write_pointer_in <= write_pointer_in_sig;
empty_out <= empty_out_sig;
full_out <= full_out_sig;
read_en_out <= read_en_out_sig;
write_en_out <= write_en_out_sig;

-- FEIFO Control Part instantiation
FIFO_CONTROL_PART: FIFO_control_part_pseudo port map (DRTS => DRTS,
                                                      read_en_N => read_en_N, read_en_E => read_en_E, read_en_W => read_en_W, read_en_S => read_en_S, read_en_L => read_en_L,
                                                      CTS_out => CTS_out,
                                                      read_pointer => read_pointer, write_pointer => write_pointer,

                                                      CTS_in => CTS_in_sig, read_pointer_in => read_pointer_in_sig, write_pointer_in => write_pointer_in_sig,
                                                      empty_out => empty_out_sig, full_out => full_out_sig,
                                                      read_en_out => read_en_out_sig, write_en_out => write_en_out_sig
 						                             );

-- Checkers instantiation
CHECKERS: FIFO_control_part_checkers port map (DRTS => DRTS,
                                               CTS_in => CTS_in_sig, CTS_out => CTS_out,
                                               read_en_N => read_en_N, read_en_E => read_en_E, read_en_W => read_en_W, read_en_S => read_en_S, read_en_L => read_en_L,
                                               read_pointer => read_pointer, read_pointer_in => read_pointer_in_sig, write_pointer => write_pointer, write_pointer_in => write_pointer_in_sig,
                                               empty_out => empty_out_sig, full_out => full_out_sig,
                                               read_en_out => read_en_out_sig, write_en_out => write_en_out_sig,

											   err_write_en_write_pointer => err_write_en_write_pointer,
											   err_not_write_en_write_pointer => err_not_write_en_write_pointer,
											   err_read_pointer_write_pointer_not_empty => err_read_pointer_write_pointer_not_empty,
											   err_read_pointer_write_pointer_empty => err_read_pointer_write_pointer_empty,
											   err_read_pointer_write_pointer_not_full => err_read_pointer_write_pointer_not_full,
											   err_read_pointer_write_pointer_full => err_read_pointer_write_pointer_full,
											   err_read_pointer_increment => err_read_pointer_increment,
											   err_read_pointer_not_increment => err_read_pointer_not_increment,
											   err_CTS_in => err_CTS_in,
											   err_write_en => err_write_en,
											   err_not_CTS_in => err_not_CTS_in,
											   err_not_write_en => err_not_write_en,
											   err_read_en_mismatch => err_read_en_mismatch
                                               );

end behavior;