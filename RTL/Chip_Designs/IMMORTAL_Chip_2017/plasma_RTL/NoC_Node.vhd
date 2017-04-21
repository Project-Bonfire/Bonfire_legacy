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
generic(current_address : integer := 0;
        stim_file: string :="code.txt";
        log_file  : string := "output.txt";
        mem_address_width : natural := 16;
        address_width : natural := 16;
        memory_type : string :=
        "TRI_PORT_X"
        --   "DUAL_PORT_"
        --   "ALTERA_LPM"
        --   "XILINX_16X"
);

port(
    reset : in std_logic;
    clk   : in std_logic;

    uart_write : out std_logic;
    uart_read  : in std_logic;

    credit_in : in std_logic;
    valid_out : out std_logic;
    TX : out std_logic_vector(31 downto 0);

    credit_out : out std_logic;
    valid_in : in std_logic;
    RX: in std_logic_vector(31 downto 0);
    link_faults : in std_logic_vector(4 downto 0);
    turn_faults : in std_logic_vector(19 downto 0);

    Rxy_reconf_PE : out  std_logic_vector(7 downto 0);
    Cx_reconf_PE  : out  std_logic_vector(3 downto 0);    -- if you are not going to update Cx you should write all ones! (it will be and will the current Cx bits)
    Reconfig_command : out std_logic;

    GPIO_out: out  std_logic_vector(15 downto 0);
    GPIO_in: in  std_logic_vector(21 downto 0)
   );

end; --entity NoC_Node

architecture updated of NoC_Node is

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

    signal GPIO_out_tmp    : std_logic_vector(31 downto 0);
    signal GPIO_in_tmp     : std_logic_vector(31 downto 0);


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

    --GPIO connections
    GPIO_out <= GPIO_out_tmp(15 downto 0);
    GPIO_in_tmp <= (31 downto 22 => '0') & GPIO_in;

    u1_plasma: plasma
        generic map (
            memory_type => memory_type,
            ethernet    => '0',
            use_cache   => '0',
            log_file    => log_file,
            current_address => current_address,
            stim_file => stim_file
            )

        PORT MAP (
            clk              => clk,
            reset            => reset,
            uart_read        => uart_read,
            uart_write       => uart_write,

            address          => address,
            byte_we          => byte_we,
            data_write       => data_write,
            data_read        => data_read,
            mem_pause_in     => pause,
            no_ddr_start     => no_ddr_start,
            no_ddr_stop      => no_ddr_stop,

            gpio0_out        => GPIO_out_tmp,
            gpioA_in         => GPIO_in_tmp,

            credit_in        => credit_in,
            valid_out        => valid_out,
            TX               => TX,

            credit_out       => credit_out,
            valid_in         => valid_in,
            RX               => RX,
            link_faults      => link_faults,
            turn_faults      => turn_faults,

            Rxy_reconf_PE    => Rxy_reconf_PE,
            Cx_reconf_PE     => Cx_reconf_PE ,
            Reconfig_command => Reconfig_command
        );

        memory_impl: memory
            generic map (address_width => mem_address_width)

            port map (
                clk         => clk,
                address     => address,
                data_write  => data_write,
                pause       => pause,
                byte_we     => byte_we,
                data_read   => data_read
            );

end; --architecture logic
