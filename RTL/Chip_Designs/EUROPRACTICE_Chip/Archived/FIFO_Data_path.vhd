library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity FIFO_data_path is
    generic (
           DATA_WIDTH: integer := 32
       );
    port (
    		reset: in  std_logic;
            clk: in  std_logic;
            RX: in std_logic_vector(DATA_WIDTH-1 downto 0);
            read_pointer, write_pointer: in std_logic_vector(3 downto 0);
            write_en : in std_logic;
    		    Data_out: out std_logic_vector(DATA_WIDTH-1 downto 0)
            );

end FIFO_data_path;

architecture behavior of FIFO_data_path is

   signal FIFO_MEM_1 , FIFO_MEM_1_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_MEM_2 , FIFO_MEM_2_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_MEM_3 , FIFO_MEM_3_in : std_logic_vector(DATA_WIDTH-1 downto 0);
   signal FIFO_MEM_4 , FIFO_MEM_4_in : std_logic_vector(DATA_WIDTH-1 downto 0);

begin

 process (clk, reset)begin
    if reset = '0' then
        FIFO_MEM_1 <= (others=>'0');
        FIFO_MEM_2 <= (others=>'0');
        FIFO_MEM_3 <= (others=>'0');
        FIFO_MEM_4 <= (others=>'0');
    elsif clk'event and clk = '1' then
        if write_en = '1' then
            --write into the memory
              FIFO_MEM_1 <= FIFO_MEM_1_in;
              FIFO_MEM_2 <= FIFO_MEM_2_in;
              FIFO_MEM_3 <= FIFO_MEM_3_in;
              FIFO_MEM_4 <= FIFO_MEM_4_in;
        end if;
    end if;
end process;

process(RX, write_pointer, FIFO_MEM_1, FIFO_MEM_2, FIFO_MEM_3, FIFO_MEM_4)begin
      case( write_pointer ) is
          when "0001" => FIFO_MEM_1_in <= RX;         FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
          when "0010" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= RX;         FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
          when "0100" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= RX;         FIFO_MEM_4_in <= FIFO_MEM_4;
          when "1000" => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= RX;
          when others => FIFO_MEM_1_in <= FIFO_MEM_1; FIFO_MEM_2_in <= FIFO_MEM_2; FIFO_MEM_3_in <= FIFO_MEM_3; FIFO_MEM_4_in <= FIFO_MEM_4;
      end case ;
end process;

process(read_pointer, FIFO_MEM_1, FIFO_MEM_2, FIFO_MEM_3, FIFO_MEM_4)begin
        case( read_pointer ) is
          when "0001" => Data_out <= FIFO_MEM_1;
          when "0010" => Data_out <= FIFO_MEM_2;
          when "0100" => Data_out <= FIFO_MEM_3;
          when "1000" => Data_out <= FIFO_MEM_4;
          when others => Data_out <= FIFO_MEM_1;
        end case ;
end process;


end behavior;