---------------------------------------------------------------------
-- TITLE: UART
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 5/29/02
-- FILENAME: uart.vhd
-- PROJECT: Plasma CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    Implements the UART.
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;
use work.mlite_pack.all;

entity uart is
   generic(log_file : string := "UNUSED");
   port(clk          : in std_logic;
        reset        : in std_logic;
        enable_read  : in std_logic;
        enable_write : in std_logic;
        data_in      : in std_logic_vector(7 downto 0);
        data_out     : out std_logic_vector(7 downto 0);
        uart_read    : in std_logic;
        uart_write   : out std_logic;
        busy_write   : out std_logic;
        data_avail   : out std_logic;

        reg_enable            : in std_logic;
        reg_write_byte_enable : in std_logic_vector(3 downto 0);
        reg_address           : in std_logic_vector(31 downto 2);
        reg_data_write        : in std_logic_vector(31 downto 0);
        reg_data_read         : out std_logic_vector(31 downto 0)
        );
end; --entity uart

architecture logic of uart is
   signal delay_write_reg : std_logic_vector(9 downto 0);
   signal bits_write_reg  : std_logic_vector(3 downto 0);
   signal data_write_reg  : std_logic_vector(8 downto 0);
   signal delay_read_reg  : std_logic_vector(9 downto 0);
   signal bits_read_reg   : std_logic_vector(3 downto 0);
   signal data_read_reg   : std_logic_vector(7 downto 0);
   signal data_save_reg   : std_logic_vector(17 downto 0);
   signal busy_write_sig  : std_logic;
   signal read_value_reg  : std_logic_vector(6 downto 0);
   signal uart_read2      : std_logic;
   signal count_value_reg_in, count_value_reg: std_logic_vector(31 downto 0);
   signal old_address     : std_logic_vector(31 downto 2);
   signal count_value_sig : std_logic_vector(9 downto 0);
begin

update_count_value: process(count_value_reg, reg_data_write, reg_write_byte_enable, reg_address, reg_enable)begin
    count_value_reg_in <= count_value_reg ;
    if reg_enable = '1' and reg_address = uart_count_value_address then
       if reg_write_byte_enable(0) = '1' then
          count_value_reg_in(7 downto 0) <= reg_data_write(7 downto 0);
       end if;
       if reg_write_byte_enable(1) = '1' then
          count_value_reg_in(15 downto 8) <= reg_data_write(15 downto 8);
       end if;
       if reg_write_byte_enable(2) = '1' then
          count_value_reg_in(23 downto 16) <= reg_data_write(23 downto 16);
       end if;
       if reg_write_byte_enable(3) = '1' then
          count_value_reg_in(31 downto 24) <= reg_data_write(31 downto 24);
     end if;
    end if;
end process;

process(count_value_reg, old_address) begin
  if old_address = uart_count_value_address then
    reg_data_read <= count_value_reg;
  else
    reg_data_read <= (others => 'U');
  end if;
end process;


  count_value_sig <= count_value_reg(9 downto 0);

uart_proc: process(clk, reset, enable_read, enable_write, data_in,
                   data_write_reg, bits_write_reg, delay_write_reg,
                   data_read_reg, bits_read_reg, delay_read_reg,
                   data_save_reg, read_value_reg, uart_read2,
                   busy_write_sig, uart_read)

-----------------------------------------------
--- MUST BE EDITED BASED ON THE FREQUENCY! ----
-----------------------------------------------


-- constant COUNT_VALUE : std_logic_vector(9 downto 0) :=
--      "0100011110";  --33MHz/2/57600Hz = 0x11e
--      "1101100100";  --50MHz/57600Hz = 0x364
--      "0110110010";  --25MHz/57600Hz = 0x1b2 -- Plasma IF uses div2
--      "0011011001";  --12.5MHz/57600Hz = 0xd9
--      "0000000100";  --for debug (shorten read_value_reg)
begin
   uart_read2 <= read_value_reg(read_value_reg'length - 1);

   if reset = '1' then
      data_write_reg  <= ZERO(8 downto 1) & '1';
      bits_write_reg  <= "0000";
      delay_write_reg <= ZERO(9 downto 0);
      read_value_reg  <= ONES(read_value_reg'length-1 downto 0);
      data_read_reg   <= ZERO(7 downto 0);
      bits_read_reg   <= "0000";
      delay_read_reg  <= ZERO(9 downto 0);
      data_save_reg   <= ZERO(17 downto 0);
      old_address <= (others => '0');
      count_value_reg <= (others => '0');
   elsif rising_edge(clk) then
      old_address <= reg_address;
      count_value_reg <= count_value_reg_in;
      --Write UART
      if bits_write_reg = "0000" then               --nothing left to write?
         if enable_write = '1' then
            delay_write_reg <= ZERO(9 downto 0);    --delay before next bit
            bits_write_reg <= "1010";               --number of bits to write
            data_write_reg <= data_in & '0';        --remember data & start bit
         end if;
      else
         if delay_write_reg /= count_value_sig then
            delay_write_reg <= delay_write_reg + 1; --delay before next bit
         else
            delay_write_reg <= ZERO(9 downto 0);    --reset delay
            bits_write_reg <= bits_write_reg - 1;   --bits left to write
            data_write_reg <= '1' & data_write_reg(8 downto 1);
         end if;
      end if;

      --Average uart_read signal
      if uart_read = '1' then
         if read_value_reg /= ONES(read_value_reg'length - 1 downto 0) then
            read_value_reg <= read_value_reg + 1;
         end if;
      else
         if read_value_reg /= ZERO(read_value_reg'length - 1 downto 0) then
            read_value_reg <= read_value_reg - 1;
         end if;
      end if;

      --Read UART
      if delay_read_reg = ZERO(9 downto 0) then     --done delay for read?
         if bits_read_reg = "0000" then             --nothing left to read?
            if uart_read2 = '0' then                --wait for start bit
               delay_read_reg <= '0' & count_value_sig(9 downto 1);  --half period
               bits_read_reg <= "1001";             --bits left to read
            end if;
         else
            delay_read_reg <= count_value_sig;          --initialize delay
            bits_read_reg <= bits_read_reg - 1;     --bits left to read
            data_read_reg <= uart_read2 & data_read_reg(7 downto 1);
         end if;
      else
         delay_read_reg <= delay_read_reg - 1;      --delay
      end if;

      --Control character buffer
      if bits_read_reg = "0000" and delay_read_reg = count_value_sig then
         if data_save_reg(8) = '0' or
               (enable_read = '1' and data_save_reg(17) = '0') then
            --Empty buffer
            data_save_reg(8 downto 0) <= '1' & data_read_reg;
         else
            --Second character in buffer
            data_save_reg(17 downto 9) <= '1' & data_read_reg;
            if enable_read = '1' then
               data_save_reg(8 downto 0) <= data_save_reg(17 downto 9);
            end if;
         end if;
      elsif enable_read = '1' then
         data_save_reg(17) <= '0';                  --data_available
         data_save_reg(8 downto 0) <= data_save_reg(17 downto 9);
      end if;
   end if;  --rising_edge(clk)

   uart_write <= data_write_reg(0);
   if bits_write_reg /= "0000"
-- Comment out the following line for full UART simulation (much slower)
   --and log_file = "UNUSED"
   then
      busy_write_sig <= '1';
   else
      busy_write_sig <= '0';
   end if;
   busy_write <= busy_write_sig;
   data_avail <= data_save_reg(8);
   data_out <= data_save_reg(7 downto 0);

end process; --uart_proc

-- synthesis_off
--    uart_logger:
--    if log_file /= "UNUSED" generate
--       uart_proc: process(clk, enable_write, data_in)
--          file store_file : text open write_mode is log_file;
--          variable hex_file_line : line;
--          variable c : character;
--          variable index : natural;
--          variable line_length : natural := 0;
--       begin
--          if rising_edge(clk) and busy_write_sig = '0' then
--             if enable_write = '1' then
--                index := conv_integer(data_in(6 downto 0));
--                if index /= 10 then
--                   c := character'val(index);
--                   write(hex_file_line, c);
--                   line_length := line_length + 1;
--                end if;
--                if index = 10 or line_length >= 72 then
-- --The following line may have to be commented out for synthesis
--                   writeline(store_file, hex_file_line);
--                   line_length := 0;
--                end if;
--             end if; --uart_sel
--          end if; --rising_edge(clk)
--       end process; --uart_proc
--    end generate; --uart_logger
-- synthesis_on

end; --architecture logic
