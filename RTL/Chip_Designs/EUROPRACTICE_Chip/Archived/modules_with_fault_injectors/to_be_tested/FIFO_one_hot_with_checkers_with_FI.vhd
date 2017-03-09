--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FIFO is
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
            -- fault injector signals
            shift: in std_logic;
            fault_clk: in std_logic;
            data_in_serial: in std_logic;
            data_out_serial: out std_logic;
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
end FIFO;

architecture behavior of FIFO is
   signal read_pointer, read_pointer_in, write_pointer, write_pointer_in: std_logic_vector(3 downto 0);
   signal full, empty: std_logic;
   signal read_en, write_en: std_logic;
   signal CTS_in, CTS_out: std_logic;

   signal DRTS_faulty, read_en_N_faulty, read_en_E_faulty, read_en_W_faulty, read_en_S_faulty, read_en_L_faulty: std_logic;
   signal CTS_out_faulty, CTS_in_faulty: std_logic;
   signal read_pointer_faulty, read_pointer_in_faulty, write_pointer_faulty, write_pointer_in_faulty: std_logic_vector (3 downto 0);
   signal empty_faulty, full_faulty, read_en_faulty, write_en_faulty: std_logic;
   
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
            --err_CTS_in, 
            err_write_en, 
            err_not_CTS_in, 
            --err_not_write_en, 
            err_read_en_mismatch : out std_logic
            );
end component;


component fault_injector is 
  generic(DATA_WIDTH : integer := 32; 
    ADDRESS_WIDTH : integer := 5);
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

signal FI_add_sta: std_logic_vector(34 downto 0); -- 28 bits for inputs and internal signals
                                                  -- 5 bits for fault injection location address (ceil of log2(36) = 6)
                                                  -- 2 bits for type of fault (SA0 or SA1)
signal non_faulty_signals: std_logic_vector (27 downto 0);                                                
signal faulty_signals: std_logic_vector(27 downto 0); -- 28 bits for inputs and internal signals (with one fault injected in one of them)

begin

non_faulty_signals <= DRTS & read_en_N & read_en_E & read_en_W & read_en_S & read_en_L &
                      CTS_out & CTS_in & read_pointer & read_pointer_in & write_pointer & write_pointer_in &
                      empty & full & read_en & write_en;

FI: fault_injector generic map(DATA_WIDTH => 28, ADDRESS_WIDTH => 5) 
           port map (data_in=> non_faulty_signals , address=> FI_add_sta(6 downto 2), sta_0=> FI_add_sta(1), sta_1=> FI_add_sta(0), data_out=> faulty_signals
            );

-- Extracting faulty values for input, internal and output signals
DRTS_faulty                <= faulty_signals(27);
read_en_N_faulty           <= faulty_signals(26);
read_en_E_faulty           <= faulty_signals(25);
read_en_W_faulty           <= faulty_signals(24);
read_en_S_faulty           <= faulty_signals(23);
read_en_L_faulty           <= faulty_signals(22);
CTS_out_faulty             <= faulty_signals(21);
CTS_in_faulty              <= faulty_signals(20);
read_pointer_faulty        <= faulty_signals(19 downto 16);
read_pointer_in_faulty     <= faulty_signals(15 downto 12);
write_pointer_faulty       <= faulty_signals(11 downto 8);
write_pointer_in_faulty    <= faulty_signals(7 downto 4);
empty_faulty               <= faulty_signals(3);
full_faulty                <= faulty_signals(2);
read_en_faulty             <= faulty_signals(1);
write_en_faulty            <= faulty_signals(0);


SR: shift_register_serial_in generic map(REG_WIDTH => 35)
          port map( clk=> fault_clk, reset=>reset, shift=> shift,data_in_serial=> data_in_serial, 
                data_out_parallel=> FI_add_sta, data_out_serial=> data_out_serial
              );


-- FIFO Control Part checkers instantiation
FIFOCONTROLPARTCHECKERS: FIFO_control_part_checkers port map (
                                                              DRTS => DRTS,
                                                              CTS_out => CTS_out, CTS_in => CTS_in,
                                                              read_en_N => read_en_N, read_en_E => read_en_E, read_en_W => read_en_W, read_en_S => read_en_S, read_en_L => read_en_L,
                                                              read_pointer => read_pointer, read_pointer_in => read_pointer_in, 
                                                              write_pointer => write_pointer, write_pointer_in => write_pointer_in,
                                                              empty_out => empty, full_out => full, 
                                                              read_en_out => read_en, write_en_out => write_en,

                                                              err_write_en_write_pointer => err_write_en_write_pointer,
                                                              err_not_write_en_write_pointer => err_not_write_en_write_pointer,
                                                              err_read_pointer_write_pointer_not_empty => err_read_pointer_write_pointer_not_empty,
                                                              err_read_pointer_write_pointer_empty => err_read_pointer_write_pointer_empty,
                                                              err_read_pointer_write_pointer_not_full => err_read_pointer_write_pointer_not_full,
                                                              err_read_pointer_write_pointer_full => err_read_pointer_write_pointer_full,
                                                              err_read_pointer_increment => err_read_pointer_increment,
                                                              err_read_pointer_not_increment => err_read_pointer_not_increment,
                                                              err_write_en => err_write_en,
                                                              err_not_CTS_in => err_not_CTS_in,
                                                              err_read_en_mismatch => err_read_en_mismatch
                                                             );

   process (clk, reset)begin
        if reset = '0' then
            read_pointer <= "0001";
            write_pointer <= "0001";
            CTS_out<='0';
 
        elsif clk'event and clk = '1' then
            write_pointer <= write_pointer_in_faulty;
            read_pointer <=  read_pointer_in_faulty;
            CTS_out<=CTS_in_faulty;
        end if;
    end process;

 -- anything below here is pure combinational
 
   -- combinatorial part
    
 

   write_pointer_out <= write_pointer;
   read_pointer_out <= read_pointer;
   write_en_out <= write_en;

   read_en <= (read_en_N_faulty or read_en_E_faulty or read_en_W_faulty or read_en_S_faulty or read_en_L_faulty) and not empty_faulty; 
   empty_out <= empty;
   CTS <= CTS_out;

   process(write_en_faulty, write_pointer_faulty)begin
     if write_en_faulty = '1'then
        write_pointer_in <= write_pointer_faulty(2 downto 0)&write_pointer_faulty(3); 
     else
        write_pointer_in <= write_pointer_faulty; 
     end if;
   end process;

   process(read_en_faulty, empty_faulty, read_pointer_faulty) begin
        if (read_en_faulty = '1' and empty_faulty = '0') then
            read_pointer_in <= read_pointer_faulty(2 downto 0)&read_pointer_faulty(3); 
        else 
            read_pointer_in <= read_pointer_faulty; 
        end if;
   end process;

   process(full_faulty, DRTS_faulty, CTS_out_faulty) begin
      if CTS_out_faulty = '0' and DRTS_faulty = '1' and full_faulty ='0' then
          CTS_in <= '1';
          write_en <= '1';
      else
          CTS_in <= '0';
          write_en <= '0';
      end if;        
   end process;
                        
    process(write_pointer_faulty, read_pointer_faulty) begin
        if read_pointer_faulty = write_pointer_faulty  then
                empty <= '1';
            else
                empty <= '0';
            end if;
--      if write_pointer = read_pointer>>1 then
  if write_pointer_faulty = read_pointer_faulty(0)&read_pointer_faulty(3 downto 1) then
                full <= '1';
            else
                full <= '0'; 
            end if; 

    end process;

end;
