--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;

entity PACKETIZER_LV is
    generic (
        DATA_WIDTH: integer := 13;
        current_address : integer := 0;
        SHMU_address : integer := 0
    );
    port (
        reset, clk: in std_logic;
         
        faulty_packet_N, faulty_packet_E, faulty_packet_W, faulty_packet_S, faulty_packet_L: in  std_logic;
        healthy_packet_N, healthy_packet_E, healthy_packet_W, healthy_packet_S, healthy_packet_L: in  std_logic;

        credit_in_L: in std_logic;
        valid_out_L : out std_logic;
        TX_L: out std_logic_vector (DATA_WIDTH-1 downto 0)
    );
end;

architecture behavior of PACKETIZER_LV is
begin

 signal credit_counter_in, credit_counter_out: std_logic_vector(1 downto 0);

process (clk, reset)begin
        if reset = '0' then
             
        elsif clk'event and clk = '1' then
            
        end if;
end process;

process (credit_in_L, credit_counter_out)begin
begin
    credit_counter_in <= credit_counter_out;
    if credit_in_L = '1' and credit_counter_out < 1 then 
        credit_counter_in <= credit_counter_out + 1;
    end if;
end process;
 
end;