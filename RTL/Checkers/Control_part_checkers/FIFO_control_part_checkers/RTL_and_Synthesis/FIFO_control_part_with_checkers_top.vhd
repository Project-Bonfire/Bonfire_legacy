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
            HS_state_out: in std_logic_vector(1 downto 0);

            CTS_in: out std_logic; 
            empty_out: out std_logic; 
            full_out: out std_logic;
            read_pointer_in: out std_logic_vector(3 downto 0); 
            write_pointer_in: out std_logic_vector(3 downto 0);
            read_en_out: out std_logic;
            write_en_out: out std_logic; 
            HS_state_in: out std_logic_vector(1 downto 0);

            -- Checker outputs
            err_FIFO_control_part_DRTS_CTS, err_FIFO_write_pointer_update: out std_logic;
            err_FIFO_read_pointer_not_update, err_FIFO_write_pointer_not_update: out std_logic;
            err_FIFO_full_empty, err_FIFO_empty, err_FIFO_empty1, err_FIFO_full: out std_logic;
            err_FIFO_read_pointer_onehot, err_FIFO_write_pointer_onehot: out std_logic;
            err_FIFO_HS_state_onehot: out std_logic;
            err_FIFO_read_en_onehot: out std_logic; 
            err_FIFO_read_from_empty_FIFO: out std_logic; 
            err_FIFO_write_to_full_FIFO: out std_logic;
            err_FIFO_control_part_CTS_in_CTS_out: out std_logic; 
            err_FIFO_read_en_empty: out std_logic;
            err_FIFO_read_en_empty1: out std_logic
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
            HS_state_out: in std_logic_vector(1 downto 0);

            CTS_in: out std_logic; 
            empty_out: out std_logic; 
            full_out: out std_logic;
            read_pointer_in: out std_logic_vector(3 downto 0); 
            write_pointer_in: out std_logic_vector(3 downto 0);
            read_en_out: out std_logic;
            write_en_out: out std_logic; 
            HS_state_in: out std_logic_vector(1 downto 0)
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
            HS_state_in: in std_logic_vector(1 downto 0);         

            -- Checker outputs
            err_FIFO_control_part_DRTS_CTS, err_FIFO_write_pointer_update: out std_logic;
            err_FIFO_read_pointer_not_update, err_FIFO_write_pointer_not_update: out std_logic;
            err_FIFO_full_empty, err_FIFO_empty, err_FIFO_empty1, err_FIFO_full: out std_logic;
            err_FIFO_read_pointer_onehot, err_FIFO_write_pointer_onehot: out std_logic;
            err_FIFO_HS_state_onehot: out std_logic;
            err_FIFO_read_en_onehot: out std_logic; 
            err_FIFO_read_from_empty_FIFO: out std_logic; 
            err_FIFO_write_to_full_FIFO: out std_logic;
            err_FIFO_control_part_CTS_in_CTS_out: out std_logic; 
            err_FIFO_read_en_empty: out std_logic;
            err_FIFO_read_en_empty1: out std_logic
            );
end component;

signal CTS_in_sig, empty_out_sig, full_out_sig, read_en_out_sig, write_en_out_sig: std_logic;
signal read_pointer_in_sig, write_pointer_in_sig: std_logic_vector(3 downto 0);
signal HS_state_in_sig : std_logic_vector(1 downto 0);

begin 

CTS_in <= CTS_in_sig;
read_pointer_in <= read_pointer_in_sig;
write_pointer_in <= write_pointer_in_sig;
empty_out <= empty_out_sig;
full_out <= full_out_sig;
read_en_out <= read_en_out_sig;
write_en_out <= write_en_out_sig;
HS_state_in <= HS_state_in_sig;

-- FEIFO Control Part instantiation
FIFO_CONTROL_PART: FIFO_control_part_pseudo port map (DRTS => DRTS, 
                                                      read_en_N => read_en_N, read_en_E => read_en_E, read_en_W => read_en_W, read_en_S => read_en_S, read_en_L => read_en_L,
                                                      CTS_out => CTS_out,
                                                      read_pointer => read_pointer, write_pointer => write_pointer, 
                                                      HS_state_out => HS_state_out,

                                                      CTS_in => CTS_in_sig, read_pointer_in => read_pointer_in_sig, write_pointer_in => write_pointer_in_sig,
                                                      empty_out => empty_out_sig, full_out => full_out_sig, 
                                                      read_en_out => read_en_out_sig, write_en_out => write_en_out_sig, 
                                                      HS_state_in => HS_state_in_sig
						                                          );
                                  
-- Checkers instantiation
CHECKERS: FIFO_control_part_checkers port map (DRTS => DRTS,
                                               CTS_in => CTS_in_sig, CTS_out => CTS_out,
                                               read_en_N => read_en_N, read_en_E => read_en_E, read_en_W => read_en_W, read_en_S => read_en_S, read_en_L => read_en_L,
                                               read_pointer => read_pointer, read_pointer_in => read_pointer_in_sig, write_pointer => write_pointer, write_pointer_in => write_pointer_in_sig,
                                               empty_out => empty_out_sig, full_out => full_out_sig, 
                                               read_en_out => read_en_out_sig, write_en_out => write_en_out_sig,
                                               HS_state_in => HS_state_in_sig,

                                               err_FIFO_control_part_DRTS_CTS => err_FIFO_control_part_DRTS_CTS, 
                                               err_FIFO_read_pointer_not_update => err_FIFO_read_pointer_not_update,
                                               err_FIFO_write_pointer_update => err_FIFO_write_pointer_update,
                                               err_FIFO_write_pointer_not_update => err_FIFO_write_pointer_not_update,
                                               err_FIFO_full_empty => err_FIFO_full_empty, 
                                               err_FIFO_empty => err_FIFO_empty, 
                                               err_FIFO_empty1 => err_FIFO_empty1, 
                                               err_FIFO_full => err_FIFO_full, 
                                               err_FIFO_read_pointer_onehot => err_FIFO_read_pointer_onehot,
                                               err_FIFO_write_pointer_onehot => err_FIFO_write_pointer_onehot, 
                                               err_FIFO_HS_state_onehot => err_FIFO_HS_state_onehot, 
                                               err_FIFO_read_en_onehot => err_FIFO_read_en_onehot, 
                                               err_FIFO_read_from_empty_FIFO => err_FIFO_read_from_empty_FIFO, 
                                               err_FIFO_write_to_full_FIFO => err_FIFO_write_to_full_FIFO, 
                                               err_FIFO_control_part_CTS_in_CTS_out => err_FIFO_control_part_CTS_in_CTS_out, 
                                               err_FIFO_read_en_empty => err_FIFO_read_en_empty,
                                               err_FIFO_read_en_empty1 => err_FIFO_read_en_empty1
                                               );

end behavior;