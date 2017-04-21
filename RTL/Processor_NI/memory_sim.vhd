library ieee;
use ieee.std_logic_1164.all;
use work.mlite_pack.all;
use ieee.std_logic_unsigned.all;

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
    signal data    : std_logic_vector(31 downto 0);
    signal index   : integer := 0;

    type storage_array is
        array(natural range 0 to (2 ** address_width) / 4 - 1) of
        std_logic_vector(31 downto 0);
    signal storage : storage_array;

    begin

        index <= conv_integer(address(address_width-1 downto 2));

        data(7 downto 0) <=
            data_write(7 downto 0) when byte_we(0) = '1' else
            storage(index)(7 downto 0) when byte_we(0) = '0';

        data(15 downto 8) <=
            data_write(15 downto 8) when byte_we(1) = '1' else
            storage(index)(15 downto 8) when byte_we(1) = '0';

        data(23 downto 16) <=
            data_write(23 downto 16) when byte_we(2) = '1' else
            storage(index)(23 downto 16) when byte_we(2) = '0';

        data(31 downto 24) <=
            data_write(31 downto 24) when byte_we(3) = '1' else
            storage(index)(31 downto 24) when byte_we(3) = '0';

        dram_proc: process(clk, address, byte_we, pause, data)

        begin
            if rising_edge(clk) then
                if address(30 downto 28) = "001" and byte_we /= "0000" then
                    storage(index) <= data;
                end if;

                if pause = '0' then
                    data_read <= data;
                end if;
                
            end if;

        end process;

end; --architecture logic
