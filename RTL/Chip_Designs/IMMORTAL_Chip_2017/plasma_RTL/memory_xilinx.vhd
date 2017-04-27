library ieee;
use ieee.std_logic_1164.all;
use work.mlite_pack.all;
use ieee.std_logic_unsigned.all;

use IEEE.numeric_std.all;
-- Library UNISIM;
-- use UNISIM.vcomponents.all;
Library UNIMACRO;
use UNIMACRO.vcomponents.all;

entity memory is
    generic(address_width : natural := 16);
    port(clk          : in std_logic;
        address     : in std_logic_vector(31 downto 2);
        data_write  : in std_logic_vector(31 downto 0);
        pause       : in std_logic;
        byte_we     : in std_logic_vector(3 downto 0);
        data_read   : out std_logic_vector(31 downto 0)
   );
end; --entity memory

architecture rtl of memory is
    signal data_out    : std_logic_vector(31 downto 0);
    signal index   : integer := 0;

    begin

        index <= conv_integer(address(16 - 1 downto 2));
        
        BRAM_SINGLE_MACRO_inst : BRAM_SINGLE_MACRO
        generic map(
            BRAM_SIZE   => "36Kb",      -- Target BRAM, "18Kb" or "36Kb"
            DEVICE      => "7SERIES",   -- Target Device: "VIRTEX5", "7SERIES", "VIRTEX6, "SPARTAN6"
            DO_REG      => 0,           -- Optional output register (0 or 1)
            INIT        => X"000000000000000000", --  Initial values on output port
            INIT_FILE   => "NONE",
            WRITE_WIDTH => 32,          -- Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
            READ_WIDTH  => 32,          -- Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
            SRVAL       => X"000000000000000000", -- Set/Reset value for port output
            WRITE_MODE  => "READ_FIRST" -- "WRITE_FIRST", "READ_FIRST" or "NO_CHANGE"
        )

        port map(
            DO    => data_out,          -- Output data, width defined by READ_WIDTH parameter
            ADDR  => STD_logic_vector(to_unsigned(index, 10)), -- Input address, width defined by read/write port depth
            CLK   => CLK,               -- 1-bit input clock
            DI    => data_write,        -- Input data port, width defined by WRITE_WIDTH parameter
            EN    => '1',               -- 1-bit input RAM enable
            REGCE => '0',               -- 1-bit input output register enable
            RST   => '0',               -- 1-bit input reset
            WE    => byte_we            -- Input write enable, width defined by write port depth
        );

        dram_proc : process(clk, address, byte_we, pause)
        begin

          if rising_edge(clk) then
            if pause = '0' then
              data_read <= data_out;
            end if;
          end if;
        end process;

end; --architecture logic
