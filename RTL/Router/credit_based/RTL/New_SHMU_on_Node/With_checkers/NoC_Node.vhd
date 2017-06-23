---------------------------------------------------------------------
-- TITLE: NoC_Node
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 4/21/01
-- ORIGNAL FILENAME: tbench.vhd
-- PROJECT: Plasma CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    This entity provides a simple NoC node with plasma as its processor
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use work.mlite_pack.all;
use ieee.std_logic_unsigned.all;

entity NoC_Node is
generic( current_address : integer := 0;
         stim_file: string :="code.txt";
         log_file  : string := "output.txt");

port( reset        : in std_logic;
      clk          : in std_logic;

        credit_in : in std_logic;
        valid_out: out std_logic;
        TX: out std_logic_vector(31 downto 0);

        credit_out : out std_logic;
        valid_in: in std_logic;
        RX: in std_logic_vector(31 downto 0);

        link_faults: in std_logic_vector(4 downto 0);
        turn_faults: in std_logic_vector(19 downto 0);

        Rxy_reconf_PE: out  std_logic_vector(7 downto 0);
        Cx_reconf_PE: out  std_logic_vector(3 downto 0);
        Reconfig_command : out std_logic

   );
end; --entity NoC_Node

architecture messed_up of NoC_Node is
   constant memory_type : string :=
   "TRI_PORT_X";
--   "DUAL_PORT_";
--   "ALTERA_LPM";
--   "XILINX_16X";

   signal interrupt   : std_logic := '0';
   signal mem_write   : std_logic;
   signal address     : std_logic_vector(31 downto 2);
   signal data_write  : std_logic_vector(31 downto 0);
   signal data_read   : std_logic_vector(31 downto 0);
   signal pause1      : std_logic := '0';
   signal pause2      : std_logic := '0';
   signal pause       : std_logic;
   signal no_ddr_start: std_logic;
   signal no_ddr_stop : std_logic;
   signal byte_we     : std_logic_vector(3 downto 0);
   signal uart_write  : std_logic;
   signal gpioA_in    : std_logic_vector(31 downto 0) := (others => '0');

   --signal credit_in, valid_in: std_logic := '0';
   --signal credit_out, valid_out: std_logic := '0';
   --signal RX: std_logic_vector(31 downto 0) := (others => '0');
   --signal TX: std_logic_vector(31 downto 0) := (others => '0');

   -- signal credit_counter_out_0:  std_logic_vector (1 downto 0);


begin  --architecture

   --pause1 <= '1' after 700 ns when pause1 = '0' else '0' after 200 ns;
   pause1 <= '0';
   --pause2 <= '1' after 300 ns when pause2 = '0' else '0' after 200 ns;
   pause2 <= '0';
   pause <= pause1 or pause2;
   --gpioA_in(20) <= not gpioA_in(20) after 200 ns; --E_RX_CLK
   --gpioA_in(19) <= not gpioA_in(19) after 20 us;  --E_RX_DV
   --gpioA_in(18 downto 15) <= gpioA_in(18 downto 15) + 1 after 400 ns; --E_RX_RXD
   --gpioA_in(14) <= not gpioA_in(14) after 200 ns; --E_TX_CLK

   u1_plasma: plasma
      generic map (memory_type => memory_type,
                   ethernet    => '0',
                   use_cache   => '0',
                   log_file    => log_file,
                   current_address => current_address,
                   stim_file => stim_file)
      PORT MAP (
         clk               => clk,
         reset             => reset,
         uart_read         => uart_write,
         uart_write        => uart_write,

         address           => address,
         byte_we           => byte_we,
         data_write        => data_write,
         data_read         => data_read,
         mem_pause_in      => pause,
         no_ddr_start      => no_ddr_start,
         no_ddr_stop       => no_ddr_stop,

         gpio0_out         => open,
         gpioA_in          => gpioA_in,

         credit_in         => credit_in,
         valid_out         => valid_out,
         TX                => TX,

         credit_out        => credit_out,
         valid_in          => valid_in,
         RX                => RX,

         link_faults       => link_faults,
         turn_faults       => turn_faults,
         Rxy_reconf_PE     => Rxy_reconf_PE,
         Cx_reconf_PE      => Cx_reconf_PE,
         Reconfig_command  => Reconfig_command

         );

   dram_proc: process(clk, address, byte_we, data_write, pause)
      constant ADDRESS_WIDTH : natural := 16;
      type storage_array is
         array(natural range 0 to (2 ** ADDRESS_WIDTH) / 4 - 1) of
         std_logic_vector(31 downto 0);
      variable storage : storage_array;
      variable data    : std_logic_vector(31 downto 0);
      variable index   : natural := 0;
   begin
      index := conv_integer(address(ADDRESS_WIDTH-1 downto 2));
      data := storage(index);

      if byte_we(0) = '1' then
         data(7 downto 0) := data_write(7 downto 0);
      end if;
      if byte_we(1) = '1' then
         data(15 downto 8) := data_write(15 downto 8);
      end if;
      if byte_we(2) = '1' then
         data(23 downto 16) := data_write(23 downto 16);
      end if;
      if byte_we(3) = '1' then
         data(31 downto 24) := data_write(31 downto 24);
      end if;

      if rising_edge(clk) then
         if address(30 downto 28) = "001" and byte_we /= "0000" then
            storage(index) := data;
         end if;
      end if;

      if pause = '0' then
         data_read <= data;
      end if;
   end process;

end; --architecture logic
