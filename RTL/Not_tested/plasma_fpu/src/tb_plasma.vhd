-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Plasma TESTBENCH
-- AUTHOR:      Alex Schoenberger (Alex.Schoenberger@ies.tu-darmstadt.de)
-- COMMENT:     This project is based on Plasma CPU core by Steve Rhoads
--
-- www.ies.tu-darmstadt.de
-- TU Darmstadt
-- Institute for Integrated Systems
-- Merckstr. 25
-- 
-- 64283 Darmstadt - GERMANY
-- --------------------------------------------------------------------------
-- PROJECT:       Plasma CPU core with FPU
-- FILENAME:      tb_plasma.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT: 
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION:
--    plasma platform test
--
--    NOT SYNTHESIZABLE
--
----------------------------------------------------------------------------
-- Revision History
-- --------------------------------------------------------------------------
-- Revision   Date    Author     CHANGES
-- 1.0      8/2014    AS         initial
-- --------------------------------------------------------------------------
library IEEE;
  use IEEE.std_logic_1164.ALL;

library PLASMA;
  use PLASMA.plasma_pack.ALL;

library MEMORY;
  use MEMORY.plasma_memory_pack.plasma_memory;

entity tb_plasma is
  generic(
    -- test architecture
    SIM_FLAG          : string := "ON";                   -- simulation model
    FPU_FLAG          : string := "OF";                   -- FPU integrated

    -- debugging
    DEBUG_FLAG        : string := "OF"                    -- verbose debugging output
  );
end entity tb_plasma;


architecture behav_tb_plasma of tb_plasma is
  
  -- -------- SIMULATION CONSTANTS -----
  constant CLK_TIME           : time              := 500 ps;
  constant RST_TIME           : time              := 3 ns;

  constant INIT_RISE          : time              := 1 ns; 
  constant SIGNAl_ACTIVE      : time              := 2 ns;

  -- -------- PLASMA INTERFACE --------
  signal clk                  : std_logic         := '0';
  signal rst                  : std_logic;
  signal instr_addr           : std_logic_vector(31 downto 0);
  signal data_addr            : std_logic_vector(31 downto 0);
  signal rd_mask              : std_logic_vector(3  downto 0);
  signal wr_mask              : std_logic_vector(3  downto 0);
  signal instr_stall          : std_logic;
  signal data_stall           : std_logic;
  signal instr_in             : std_logic_vector(31 downto 0);
  signal data_to_cpu          : std_logic_vector(31 downto 0);
  signal data_from_cpu        : std_logic_vector(31 downto 0);

  -- ------ MEMORY INIT ----------------------
  signal init                 : std_logic := '0';  
  
  -- ------ SIMULATION CONTROL ---------------
  signal sim_enable           : std_logic := '0';
  signal sim_finish           : std_logic;

  signal exec_done            : std_logic;
  signal ff_exec_done         : std_logic;

begin ---------------- BEGIN ------------------ BEGIN -------------------------
  --
  -- GENERAL CONTROL SIGNAL
  --
  clk   <= not clk      after CLK_TIME;
  rst   <= '1', '0'     after RST_TIME;

  --
  -- NO cache -> no external stalls
  --
  instr_stall    <= '0';
  data_stall     <= '0';

  -- ____ ___  _  _ 
  -- |    |__] |  | 
  -- |___ |    |__| 
  u1_cpu: entity PLASMA.plasma
    GENERIC MAP(
      core_idx      => 0, 
      SIM_FLAG      => SIM_FLAG, 
      FPU_FLAG      => FPU_FLAG,      DEBUG_FLAG  => DEBUG_FLAG
    )
    PORT MAP(
      clk           => clk,           rst         => rst,
      instr_in      => instr_in,      data_to_cpu => data_to_cpu,
      instr_stall   => instr_stall,   data_stall  => data_stall,
      instr_addr    => instr_addr,    data_addr   => data_addr,
      rd_mask       => rd_mask,       wr_mask     => wr_mask,
      data_from_cpu => data_from_cpu
    );

  -- _  _ ____ _  _ ____ ____ _   _ 
  -- |\/| |___ |\/| |  | |__/  \_/  
  -- |  | |___ |  | |__| |  \   |   
  u2_memory: entity MEMORY.plasma_memory
    PORT MAP(
      clk         => clk,          reset       => rst,
      wr_mask     => wr_mask,      rd_mask     => rd_mask,
      prog_addr   => instr_addr,   data_addr   => data_addr,
      prog_out    => instr_in,     data_in     => data_from_cpu,
      data_out    => data_to_cpu
    );

  --
  -- debugging
  --
  debug_prog_addr <= instr_addr;

  -- --------------------------------------------------------------------------
  -- ____ _ _  _ _  _ _    ____ ___ _ ____ _  _    ____ ____ _  _ ___ ____ ____ _    
  -- [__  | |\/| |  | |    |__|  |  | |  | |\ |    |    |  | |\ |  |  |__/ |  | |    
  -- ___] | |  | |__| |___ |  |  |  | |__| | \|    |___ |__| | \|  |  |  \ |__| |___ 
  --
  -- activate simulation control
  --
  sim_enable   <= '1' after INIT_RISE;

  --
  -- get simulation control signals
  --
  exec_done  <= sim_enable when i_sim_control.sim_finish  /= '0' else '0';

  --
  -- algorithm execution done signal is synchron to enable flush
  --
  process(clk)
  begin
    if rising_edge( clk ) then
      if rst = '1' then ff_exec_done     <= '0';
      else              ff_exec_done     <= exec_done;
      end if;
    end if;            
  end process;  

  -- --------------------------------------------------------------------------
  -- _  _ ____ _ _  _    ___  ____ ____ ____ ____ ____ ____ 
  -- |\/| |__| | |\ |    |__] |__/ |  | |    |___ [__  [__  
  -- |  | |  | | | \|    |    |  \ |__| |___ |___ ___] ___] 
  test_process:process
  begin
    init         <= '0';
    sim_finish   <= '0';

    -- ------- INITIALISE MEMORY -----------------------
    wait for INIT_RISE;     init        <= '1';    
    wait for SIGNAL_ACTIVE; init        <= '0';
    -- ------- EXECUTION RUN ---------------------------
    wait until ff_exec_done = '1';
    -- ------- FINISH SIMULATION ----------------------
                            sim_finish  <= '1';
    wait;
  end process;

end architecture behav_tb_plasma;
