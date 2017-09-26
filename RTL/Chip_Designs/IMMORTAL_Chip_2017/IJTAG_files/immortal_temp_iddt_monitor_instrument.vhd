--Copyright (C) 2017 Konstantin Shibin
------------------------------------------------------------
-- File name: immortal_temp_iddt_monitor_instrument.vhd
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity immortal_temp_iddt_monitor_instrument is
    port (
      -- IJTAG connection
      TCK         : in std_logic;
      RST         : in std_logic;
      SEL         : in std_logic;
      SI          : in std_logic;
      SE          : in std_logic;
      UE          : in std_logic;
      CE          : in std_logic;
      SO          : out std_logic;
      toF         : out std_logic;
      toC         : out std_logic;

      -- Monitor connections
      control     : out std_logic_vector(2 downto 0);
      adc_data    : in std_logic_vector(11 downto 0);
      adc_drdy    : in std_logic
    );

end immortal_temp_iddt_monitor_instrument;

architecture rtl of immortal_temp_iddt_monitor_instrument is

component SReg is
 Generic ( Size : positive := 32);
    Port ( -- Scan Interface scan_client ----------
          SI : in STD_LOGIC; -- ScanInPort 
           SO : out STD_LOGIC; -- ScanOutPort
           SEL : in STD_LOGIC; -- SelectPort
           ----------------------------------------   
           SE : in STD_LOGIC; -- ShiftEnPort
           CE : in STD_LOGIC; -- CaptureEnPort
           UE : in STD_LOGIC; -- UpdateEnPort
           RST : in STD_LOGIC; -- ResetPort
           TCK : in STD_LOGIC; -- TCKPort
           DI : in STD_LOGIC_VECTOR (Size-1 downto 0); --DataInPort
           DO : out STD_LOGIC_VECTOR (Size-1 downto 0)); --DataOutPort
end component;

signal shiftreg_update        : std_logic_vector (31 downto 0);
signal threshold_H            : std_logic_vector (11 downto 0);
signal threshold_L            : std_logic_vector (11 downto 0);
signal monitor_controls       : std_logic_vector (2 downto 0);
signal threshold_compare_dir  : std_logic;
signal f_output_enable        : std_logic;

signal threshold_H_active     : std_logic;
signal threshold_L_active     : std_logic;
signal threshold_H_GT         : std_logic;
signal threshold_H_LE         : std_logic;
signal threshold_L_GT         : std_logic;
signal threshold_L_LE         : std_logic;

signal adc_data_sync, adc_data_sync_first : std_logic_vector (11 downto 0);
signal adc_data_local_copy                : std_logic_vector (11 downto 0);
signal adc_data_local_copy_32b            : std_logic_vector (31 downto 0);
signal adc_drdy_sync, adc_drdy_sync_first : std_logic;
signal adc_drdy_prev, adc_drdy_strobe     : std_logic;

signal UE_prev, update_strobe           : std_logic;

begin

-- Shift register for capturing data from monitor and updating control and compare threshold
shiftreg : SReg 
 Generic map ( Size => 32)
    Port map ( -- Scan Interface scan_client ----------
              SI => SI, -- Input Port SI = SI
               SO => SO,
               SEL => SEL,
               SE => SE,
               CE => CE,
               UE => UE,
               RST => RST,
               TCK => TCK,
               DI => adc_data_local_copy_32b,
               DO => shiftreg_update);

-- shiftreg_update description:
-- [11:0]   threshold A
-- [23:12]  threshold B
-- [24]     threshold comparison direction: 0: adc data >= threshold; 1: adc data < threshold
-- [25]     F flag output enabled
-- [26]     update enable for threshold values, comp direction, f enable
-- [30:28]  control signals
-- [31]     control signals update enable

synchronizer_adc : process(TCK,RST)
begin
  if RST = '1' then
    adc_data_sync_first <= (others => '0');
    adc_data_sync <= (others => '0');
  elsif  TCK'event and TCK = '1' then
    adc_data_sync_first <= adc_data;
    adc_data_sync <= adc_data_sync_first;
  end if;
end process; -- synchronizer

adc_data_copy: process(TCK, RST)
begin
  if RST = '1' then
    adc_data_local_copy  <= (others => '0');
    adc_drdy_sync_first  <= '0';
    adc_drdy_sync        <= '0';
    adc_drdy_prev        <= '0';
    adc_drdy_strobe      <= '0';
  elsif TCK'event and TCK = '1' then
    adc_drdy_sync_first  <= adc_drdy;
    adc_drdy_sync        <= adc_drdy_sync_first;
    adc_drdy_prev        <= adc_drdy_sync;
    adc_drdy_strobe      <= not adc_drdy_prev and adc_drdy_sync;
    if adc_drdy_strobe = '1' then
      adc_data_local_copy <= adc_data_sync;
    end if;
  end if;
end process;

adc_data_local_copy_32b <= "00000000000000000000" & adc_data_local_copy;

update_strobes: process(TCK)
begin
  if TCK'event and TCK = '0' then
    UE_prev <= UE;
    update_strobe <= not UE_prev and UE and SEL;
  end if;
end process;

threshold_controls_set: process(TCK, RST)
begin
  if RST = '1' then
      threshold_H             <= (others => '0');
      threshold_L             <= (others => '0');
      threshold_compare_dir   <= '0';
      f_output_enable         <= '0';
      monitor_controls        <= (others => '0');
  elsif TCK'event and TCK = '0' then
    if update_strobe = '1' then
      if shiftreg_update(26) = '1' then -- update thresholds only when bit 26 allows it
        threshold_H           <= shiftreg_update(11 downto 0);
        threshold_L           <= shiftreg_update(23 downto 12);
        threshold_compare_dir <= shiftreg_update(24);
        f_output_enable       <= shiftreg_update(25);
      end if;
      if shiftreg_update(31) = '1' then -- update controls only when bit 31 allows it
        monitor_controls      <= shiftreg_update(30 downto 28);
      end if;
    end if;
  end if;
end process;

control <= monitor_controls;

threshold_H_GT <= '1' when (to_integer(unsigned(threshold_H)) >  to_integer(unsigned(adc_data_local_copy))) else '0';
threshold_H_LE <= '1' when (to_integer(unsigned(threshold_H)) <= to_integer(unsigned(adc_data_local_copy))) else '0';
threshold_L_GT <= '1' when (to_integer(unsigned(threshold_L)) >  to_integer(unsigned(adc_data_local_copy))) else '0';
threshold_L_LE <= '1' when (to_integer(unsigned(threshold_L)) <= to_integer(unsigned(adc_data_local_copy))) else '0';

threshold_H_active <= (threshold_H_GT and threshold_compare_dir) or (threshold_H_LE and not threshold_compare_dir);
threshold_L_active <= (threshold_L_GT and threshold_compare_dir) or (threshold_L_LE and not threshold_compare_dir);

toF <= (threshold_H_active or threshold_L_active) and f_output_enable;
toC <= not (threshold_H_active and f_output_enable);

end;