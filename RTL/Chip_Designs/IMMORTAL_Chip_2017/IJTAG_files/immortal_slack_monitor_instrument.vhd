--Copyright (C) 2017 Konstantin Shibin
------------------------------------------------------------
-- File name: immortal_slack_monitor_instrument.vhd
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity immortal_slack_monitor_instrument is
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
      data        : in std_logic_vector(31 downto 0)
    );

end immortal_slack_monitor_instrument;

architecture rtl of immortal_slack_monitor_instrument is

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

signal update_strobe          : std_logic;
signal shiftreg_update        : std_logic_vector (31 downto 0);
signal threshold_H            : std_logic_vector (4 downto 0);
signal threshold_L            : std_logic_vector (4 downto 0);
signal monitor_controls       : std_logic_vector (2 downto 0);
signal threshold_compare_dir  : std_logic;
signal f_output_enable        : std_logic;

signal threshold_H_active     : std_logic;
signal threshold_L_active     : std_logic;
signal threshold_H_GT         : std_logic;
signal threshold_H_LE         : std_logic;
signal threshold_L_GT         : std_logic;
signal threshold_L_LE         : std_logic;

signal data_sync, data_sync_first : std_logic_vector (31 downto 0);
signal xored_edges            : std_logic_vector (30 downto 0);
signal edge_loc_binary        : std_logic_vector (4 downto 0);

signal UE_prev                : std_logic;


function one_hot_to_binary (onehot : std_logic_vector; size : natural) return std_logic_vector is
  variable binary_vector : std_logic_vector (size-1 downto 0);
begin
  binary_vector := (others => '0');
  for i in onehot'range loop
    if onehot(i) = '1' then
      binary_vector := std_logic_vector(to_unsigned(i, size));
    end if ;
  end loop;
  return binary_vector;
end function;

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
               DI => data_sync,
               DO => shiftreg_update);

-- shiftreg_update description:
-- [4:0]    threshold H
-- [9:5]    threshold L
-- [10]     threshold comparison direction: 0: slack >= threshold; 1: slack < threshold
-- [11]     F flag output enabled
-- [12]     threshold value update enable
-- [30:28]  control signals
-- [31]     control signals update enable

synchronizer_data : process(TCK,RST)
begin
  if RST = '1' then
    data_sync_first <= (others => '0');
    data_sync <= (others => '0');
  elsif  TCK'event and TCK = '1' then
    data_sync_first <= data;
    data_sync <= data_sync_first;
  end if ;
end process ; -- synchronizer

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
      if shiftreg_update(12) = '1' then                      -- update thresholds only when bit 12 allows it
        threshold_H           <= shiftreg_update(4 downto 0);
        threshold_L           <= shiftreg_update(9 downto 5);
        threshold_compare_dir <= shiftreg_update(10);
        f_output_enable       <= shiftreg_update(11);
      end if;
      if shiftreg_update(31) = '1' then                      -- update controls only when bit 31 allows it
        monitor_controls      <= shiftreg_update(30 downto 28);
      end if;      
    end if;
  end if;
end process;

control <= monitor_controls;

xor_edge_detector: for i in 0 to 30 generate
  xored_edges(i) <= data_sync(i) xnor data_sync(i+1);
end generate;

edge_loc_binary <= one_hot_to_binary(xored_edges, edge_loc_binary'length);

threshold_H_GT <= '1' when (to_integer(unsigned(threshold_H)) >  to_integer(unsigned(edge_loc_binary))) else '0';
threshold_H_LE <= '1' when (to_integer(unsigned(threshold_H)) <= to_integer(unsigned(edge_loc_binary))) else '0';
threshold_L_GT <= '1' when (to_integer(unsigned(threshold_L)) >  to_integer(unsigned(edge_loc_binary))) else '0';
threshold_L_LE <= '1' when (to_integer(unsigned(threshold_L)) <= to_integer(unsigned(edge_loc_binary))) else '0';

threshold_H_active <= (threshold_H_GT and threshold_compare_dir) or (threshold_H_LE and not threshold_compare_dir);
threshold_L_active <= (threshold_L_GT and threshold_compare_dir) or (threshold_L_LE and not threshold_compare_dir);

toF <= (threshold_H_active or threshold_L_active) and f_output_enable;
toC <= not (threshold_H_active and f_output_enable);

end;
