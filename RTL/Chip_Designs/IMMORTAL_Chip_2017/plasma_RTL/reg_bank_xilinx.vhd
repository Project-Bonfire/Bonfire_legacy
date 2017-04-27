---------------------------------------------------------------------
-- TITLE: Register Bank
-- AUTHOR: Steve Rhoads (rhoadss@yahoo.com)
-- DATE CREATED: 2/2/01
-- FILENAME: reg_bank.vhd
-- PROJECT: Plasma CPU core
-- COPYRIGHT: Software placed into the public domain by the author.
--    Software 'as is' without warranty.  Author liable for nothing.
-- DESCRIPTION:
--    Implements a register bank with 32 registers that are 32-bits wide.
--    There are two read-ports and one write port.
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.mlite_pack.all;
-- library UNISIM;               --May need to uncomment for ModelSim
-- use UNISIM.vcomponents.all;   --May need to uncomment for ModelSim
Library UNIMACRO;
use UNIMACRO.vcomponents.all;

entity reg_bank is
    port(clk            : in  std_logic;
        reset_in       : in  std_logic;
        pause          : in  std_logic;
        interrupt_in   : in  std_logic; -- modified
        rs_index       : in  std_logic_vector(5 downto 0);
        rt_index       : in  std_logic_vector(5 downto 0);
        rd_index       : in  std_logic_vector(5 downto 0);
        reg_source_out : out std_logic_vector(31 downto 0);
        reg_target_out : out std_logic_vector(31 downto 0);
        reg_dest_new   : in  std_logic_vector(31 downto 0);
        intr_enable    : out std_logic);
end; --entity reg_bank


--------------------------------------------------------------------
-- The ram_block architecture attempts to use TWO dual-port memories.
-- Different FPGAs and ASICs need different implementations.
-- Choose one of the RAM implementations below.
-- I need feedback on this section!
--------------------------------------------------------------------
architecture ram_block of reg_bank is
    signal intr_enable_reg : std_logic;
    --controls access to dual-port memories
    signal addr_read1, addr_read2 : std_logic_vector(4 downto 0);
    signal addr_write             : std_logic_vector(4 downto 0);
    signal data_out1, data_out2   : std_logic_vector(31 downto 0);
    signal write_enable           : std_logic;

    signal data_out1A, data_out1B : std_logic_vector(31 downto 0);
    signal data_out2A, data_out2B : std_logic_vector(31 downto 0);
    signal weA, weB               : std_logic;
    signal no_connect             : std_logic_vector(127 downto 0);

begin

    --------------------------------------
    -- Implements register bank control --
    --------------------------------------

    reg_proc: process(clk, rs_index, rt_index, rd_index, reg_dest_new, intr_enable_reg,
                      data_out1, data_out2, reset_in, pause)
    begin
        --setup for first dual-port memory
        if rs_index = "101110" then  --reg_epc CP0 14
            addr_read1 <= "00000";
        else
            addr_read1 <= rs_index(4 downto 0);
        end if;

        case rs_index is
            when "000000" => reg_source_out <= ZERO;
            when "101100" => reg_source_out <= ZERO(31 downto 1) & intr_enable_reg;
            --interrupt vector address = 0x3c
            when "111111" => reg_source_out <= ZERO(31 downto 8) & "00111100";
            when others   => reg_source_out <= data_out1;
        end case;

        --setup for second dual-port memory
        addr_read2 <= rt_index(4 downto 0);

        case rt_index is
            when "000000" => reg_target_out <= ZERO;
            when others   => reg_target_out <= data_out2;
        end case;

        --setup write port for both dual-port memories
        if rd_index /= "000000" and rd_index /= "101100" and pause = '0' then
            write_enable <= '1';
        else
            write_enable <= '0';
        end if;

        if rd_index = "101110" then  --reg_epc CP0 14
            addr_write <= "00000";--"01110" --"11010"; -- Reg $26 to save PC when interrupt occurs, but is it safe ??

        else
            addr_write <= rd_index(4 downto 0);
        end if;

        if reset_in = '1' then
            intr_enable_reg <= '0';

        elsif rising_edge(clk) then
            if rd_index = "101110" then     --reg_epc CP0 14
                intr_enable_reg <= '0';      --disable interrupts

            elsif rd_index = "101100" then
                intr_enable_reg <= reg_dest_new(0); -- Check the IEc (Interrupt Enable current) bit (bit 0 of the status register)

            end if;
        end if;

        intr_enable <= intr_enable_reg;
    end process;

    -----------------------
    -- Implements memory --
    -----------------------
    weA <= write_enable and not addr_write(4);  --lower 16 registers
    weB <= write_enable and addr_write(4);      --upper 16 registers

    -- RAM16X1D: 16 x 1 positive edge write, asynchronous read dual-port
    -- distributed RAM for all Xilinx FPGAs
    -- From library UNISIM; use UNISIM.vcomponents.all;
    reg_loop: for i in 0 to 31 generate
        begin

            --Read port 1 lower 16 registers
            reg_bit1a : RAM16X1D
                port map (
                    WCLK  => clk,              -- Port A write clock input
                    WE    => weA,              -- Port A write enable input
                    A0    => addr_write(0),    -- Port A address[0] input bit
                    A1    => addr_write(1),    -- Port A address[1] input bit
                    A2    => addr_write(2),    -- Port A address[2] input bit
                    A3    => addr_write(3),    -- Port A address[3] input bit
                    D     => reg_dest_new(i),  -- Port A 1-bit data input
                    DPRA0 => addr_read1(0),    -- Port B address[0] input bit
                    DPRA1 => addr_read1(1),    -- Port B address[1] input bit
                    DPRA2 => addr_read1(2),    -- Port B address[2] input bit
                    DPRA3 => addr_read1(3),    -- Port B address[3] input bit
                    DPO   => data_out1A(i),    -- Port B 1-bit data output
                    SPO   => no_connect(i)     -- Port A 1-bit data output
                );
            --Read port 1 upper 16 registers
            reg_bit1b : RAM16X1D

                port map (
                    WCLK  => clk,              -- Port A write clock input
                    WE    => weB,              -- Port A write enable input
                    A0    => addr_write(0),    -- Port A address[0] input bit
                    A1    => addr_write(1),    -- Port A address[1] input bit
                    A2    => addr_write(2),    -- Port A address[2] input bit
                    A3    => addr_write(3),    -- Port A address[3] input bit
                    D     => reg_dest_new(i),  -- Port A 1-bit data input
                    DPRA0 => addr_read1(0),    -- Port B address[0] input bit
                    DPRA1 => addr_read1(1),    -- Port B address[1] input bit
                    DPRA2 => addr_read1(2),    -- Port B address[2] input bit
                    DPRA3 => addr_read1(3),    -- Port B address[3] input bit
                    DPO   => data_out1B(i),    -- Port B 1-bit data output
                    SPO   => no_connect(32+i)  -- Port A 1-bit data output
                );

            --Read port 2 lower 16 registers
            reg_bit2a : RAM16X1D
                port map (
                    WCLK  => clk,              -- Port A write clock input
                    WE    => weA,              -- Port A write enable input
                    A0    => addr_write(0),    -- Port A address[0] input bit
                    A1    => addr_write(1),    -- Port A address[1] input bit
                    A2    => addr_write(2),    -- Port A address[2] input bit
                    A3    => addr_write(3),    -- Port A address[3] input bit
                    D     => reg_dest_new(i),  -- Port A 1-bit data input
                    DPRA0 => addr_read2(0),    -- Port B address[0] input bit
                    DPRA1 => addr_read2(1),    -- Port B address[1] input bit
                    DPRA2 => addr_read2(2),    -- Port B address[2] input bit
                    DPRA3 => addr_read2(3),    -- Port B address[3] input bit
                    DPO   => data_out2A(i),    -- Port B 1-bit data output
                    SPO   => no_connect(64+i)  -- Port A 1-bit data output
                );
            --Read port 2 upper 16 registers

            reg_bit2b : RAM16X1D
                port map (
                    WCLK  => clk,              -- Port A write clock input
                    WE    => weB,              -- Port A write enable input
                    A0    => addr_write(0),    -- Port A address[0] input bit
                    A1    => addr_write(1),    -- Port A address[1] input bit
                    A2    => addr_write(2),    -- Port A address[2] input bit
                    A3    => addr_write(3),    -- Port A address[3] input bit
                    D     => reg_dest_new(i),  -- Port A 1-bit data input
                    DPRA0 => addr_read2(0),    -- Port B address[0] input bit
                    DPRA1 => addr_read2(1),    -- Port B address[1] input bit
                    DPRA2 => addr_read2(2),    -- Port B address[2] input bit
                    DPRA3 => addr_read2(3),    -- Port B address[3] input bit
                    DPO   => data_out2B(i),    -- Port B 1-bit data output
                    SPO   => no_connect(96+i)  -- Port A 1-bit data output
                );
        end generate; --reg_loop

        data_out1 <= data_out1A when addr_read1(4)='0' else data_out1B;
        data_out2 <= data_out2A when addr_read2(4)='0' else data_out2B;
end; --architecture ram_block
