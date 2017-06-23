--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
 use std.textio.all;

entity PACKETIZER_LV is
    generic (
        DATA_WIDTH: integer := 11;
        current_address : integer := 0;
        SHMU_address : integer := 0
    );
    port (
        reset, clk: in std_logic;

        healthy_link_N, healthy_link_E, healthy_link_W, healthy_link_S, healthy_link_L: in  std_logic;
        faulty_link_N, faulty_link_E, faulty_link_W, faulty_link_S, faulty_link_L: in  std_logic;
        intermittent_link_N, intermittent_link_E, intermittent_link_W, intermittent_link_S, intermittent_link_L: in  std_logic;

        credit_in_LV: in std_logic;
        valid_out_LV : out std_logic;
        TX_LV: out std_logic_vector (DATA_WIDTH-1 downto 0)
    );
end;

architecture behavior of PACKETIZER_LV is




 signal credit_counter_in, credit_counter_out: std_logic;

 type STATE_TYPE IS (IDLE, HEADER_FLIT, BODY_FLIT, TAIL_FLIT);
 signal state, state_in   : STATE_TYPE := IDLE;

 signal FIFO_MEM_1, FIFO_MEM_1_in : std_logic_vector(14 downto 0);


 signal memory_input: std_logic_vector(14 downto 0);
 signal FIFO_Data_out: std_logic_vector(14 downto 0);

 signal grant, all_input_signals: std_logic;

begin

process (clk, reset)begin
        if reset = '0' then
             FIFO_MEM_1 <= (others=>'0');
             credit_counter_out<='1';
             state<=IDLE;
        elsif clk'event and clk = '1' then

            FIFO_MEM_1 <= FIFO_MEM_1_in;
            credit_counter_out <=  credit_counter_in;
            state <= state_in;
        end if;
end process;

all_input_signals <= healthy_link_N or healthy_link_E or healthy_link_W or healthy_link_S or healthy_link_L or
                     faulty_link_N or faulty_link_E or faulty_link_W or faulty_link_S or faulty_link_L or
                     intermittent_link_N or intermittent_link_E or intermittent_link_W or intermittent_link_S or intermittent_link_L;

memory_input <= healthy_link_N & healthy_link_E & healthy_link_W & healthy_link_S & healthy_link_L &
                faulty_link_N & faulty_link_E & faulty_link_W & faulty_link_S & faulty_link_L & intermittent_link_N &
                intermittent_link_E & intermittent_link_W & intermittent_link_S & intermittent_link_L;


process(all_input_signals,  FIFO_MEM_1, memory_input)begin
    if all_input_signals = '1' then
        FIFO_MEM_1_in <= memory_input;
    else
        FIFO_MEM_1_in <= FIFO_MEM_1;
    end if;
end process;

FIFO_Data_out <= FIFO_MEM_1;


process (credit_in_LV, credit_counter_out, grant)begin
    if credit_in_LV = '1' and grant  = '0' then
        credit_counter_in <= '1';
    elsif credit_in_LV = '0' and grant = '1'then
        credit_counter_in <= '0';
    else
        credit_counter_in <= credit_counter_out;
    end if;
end process;


process(all_input_signals, state, credit_counter_out, FIFO_Data_out)
    variable LINEVARIABLE : line;
    file VEC_FILE : text is out "LV_sent.txt";
    begin
        TX_LV <= (others => '0');
        grant<= '0';
         case(state) is

            when IDLE =>
                if all_input_signals= '1' then
                    state_in <= HEADER_FLIT;
                else
                    state_in <= IDLE;
                end if;

            when HEADER_FLIT =>
                if credit_counter_out /= '0' then
                    grant <= '1';
                    TX_LV <= std_logic_vector(to_unsigned(current_address, 4))  & std_logic_vector(to_unsigned(SHMU_address, 4)) &  "001";
                    state_in <= BODY_FLIT;
                else
                    state_in <= HEADER_FLIT;
                end if;


            when BODY_FLIT =>
                if credit_counter_out /= '0' then
                    grant <= '1';
                    TX_LV <= FIFO_Data_out(7 downto 0) &  "010";
                    state_in <= TAIL_FLIT;
                else
                    state_in <= BODY_FLIT;
                end if;

            when TAIL_FLIT =>
                if credit_counter_out /= '0' then
                    grant <= '1';
                    TX_LV <=  '0'& FIFO_Data_out(14 downto 8) &  "100";
                    state_in <= IDLE;
                    write(LINEVARIABLE, "LV_Packet generated at " & time'image(now) & " From " & integer'image(current_address) & " to " & integer'image(SHMU_address) & " with length: 3");
                    writeline(VEC_FILE, LINEVARIABLE);
                else
                    state_in <= TAIL_FLIT;
                end if;
            when others =>
                state_in <= IDLE;
        end case ;

end procesS;

valid_out_LV <= grant;
end;