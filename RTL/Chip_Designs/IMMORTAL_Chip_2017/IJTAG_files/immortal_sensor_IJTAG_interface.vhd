--Copyright (C) 2017 Konstantin Shibin
------------------------------------------------------------
-- File name: immortal_sensor_IJTAG_interface.vhd
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;

entity immortal_sensor_IJTAG_interface is
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
      temperature_control   : out std_logic_vector(2 downto 0);
      temperature_data      : in std_logic_vector(12 downto 0);
      iddt_control          : out std_logic_vector(2 downto 0);
      iddt_data             : in std_logic_vector(12 downto 0);
      slack_control         : out std_logic_vector(2 downto 0);
      slack_data            : in std_logic_vector(31 downto 0);
      voltage_control       : out std_logic_vector(2 downto 0);
      voltage_data          : in std_logic_vector(31 downto 0)
    );

end immortal_sensor_IJTAG_interface;

architecture rtl of immortal_sensor_IJTAG_interface is

component SIB_mux_pre_FCX_SELgate is
    Port ( -- Scan Interface  client --------------
           SI : in STD_LOGIC; -- ScanInPort 
           CE : in STD_LOGIC; -- CaptureEnPort
           SE : in STD_LOGIC; -- ShiftEnPort
           UE : in STD_LOGIC; -- UpdateEnPort
           SEL : in STD_LOGIC; -- SelectPort
           RST : in STD_LOGIC; -- ResetPort
           TCK : in STD_LOGIC; -- TCKPort
           SO : out STD_LOGIC; -- ScanOutPort
           toF : out STD_LOGIC; -- To F flag of the upper hierarchical level
           toC : out STD_LOGIC; -- To C flag of the upper hierarchical level
       -- Scan Interface  host ----------------
           fromSO : in  STD_LOGIC; -- ScanInPort
           toCE : out  STD_LOGIC; -- ToCaptureEnPort
           toSE : out  STD_LOGIC; -- ToShiftEnPort
           toUE : out  STD_LOGIC; -- ToUpdateEnPort
           toSEL : out  STD_LOGIC; -- ToSelectPort
           toRST : out  STD_LOGIC; -- ToResetPort
           toTCK : out  STD_LOGIC; -- ToTCKPort
           toSI : out  STD_LOGIC; -- ScanOutPort
           fromF : in STD_LOGIC; -- From an OR of all F flags in the underlying network segment
           fromC : in STD_LOGIC);  -- From an AND of all C flags in the underlying network segment
end component;

component immortal_slack_monitor_instrument is
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
end component;


component immortal_volt_monitor_instrument is
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
end component;

component immortal_temp_iddt_monitor_instrument is
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
end component;

signal SIB_temp_SO,  SIB_iddt_SO,  SIB_slack_SO,  SIB_voltage_SO  : std_logic;
signal SIB_temp_toF, SIB_iddt_toF, SIB_slack_toF, SIB_voltage_toF : std_logic;
signal SIB_temp_toC, SIB_iddt_toC, SIB_slack_toC, SIB_voltage_toC : std_logic;

signal SIB_main_toSI,  SIB_temp_toSI,  SIB_iddt_toSI,  SIB_slack_toSI,  SIB_voltage_toSI  : std_logic;
signal SIB_main_toTCK, SIB_temp_toTCK, SIB_iddt_toTCK, SIB_slack_toTCK, SIB_voltage_toTCK : std_logic;
signal SIB_main_toSEL, SIB_temp_toSEL, SIB_iddt_toSEL, SIB_slack_toSEL, SIB_voltage_toSEL : std_logic;
signal SIB_main_toRST, SIB_temp_toRST, SIB_iddt_toRST, SIB_slack_toRST, SIB_voltage_toRST : std_logic;
signal SIB_main_toUE,  SIB_temp_toUE,  SIB_iddt_toUE,  SIB_slack_toUE,  SIB_voltage_toUE  : std_logic;
signal SIB_main_toSE,  SIB_temp_toSE,  SIB_iddt_toSE,  SIB_slack_toSE,  SIB_voltage_toSE  : std_logic;
signal SIB_main_toCE,  SIB_temp_toCE,  SIB_iddt_toCE,  SIB_slack_toCE,  SIB_voltage_toCE  : std_logic;

signal temp_monitor_SO, iddt_monitor_SO, slack_monitor_SO, voltage_monitor_SO : std_logic;
signal temp_monitor_toF, iddt_monitor_toF, slack_monitor_toF, voltage_monitor_toF, toF_SIB_main : std_logic;
signal temp_monitor_toC, iddt_monitor_toC, slack_monitor_toC, voltage_monitor_toC, toC_SIB_main : std_logic;

begin

--            .-----------.                                    
--     SI ----| sib_main  |---------------------------------------------- SO
--            '-----------'                                    
--              |       |_____________________________________________. 
--              |                                                     | 
--              | .----------. .----------. .----------. .----------. | 
--              '-| sib_temp |-| sib_iddt |-| sib_slck |-| sib_volt |-' 
--                '----------' '----------' '----------' '----------'   
--                                                                      
--                                                                      
--                                                                      
--                                                                      
--
--    the order of bits in each sib is: SXCF where S is opening bit!
   

------------------------------------------------------------
-- Main SIB connected to the top interface
------------------------------------------------------------

SIB_main : SIB_mux_pre_FCX_SELgate
    port map ( -- Scan Interface  client --------------
    SI  => SI,
    CE  => CE,
    SE  => SE,
    UE  => UE,
    SEL => SEL,
    RST => RST,
    TCK => TCK,
    SO  => SO,
    toF => toF,
    toC => toC,
     -- Scan Interface  host ----------------
    fromSO => SIB_voltage_SO,
    toCE   => SIB_main_toCE,
    toSE   => SIB_main_toSE,
    toUE   => SIB_main_toUE,
    toSEL  => SIB_main_toSEL,
    toRST  => SIB_main_toRST,
    toTCK  => SIB_main_toTCK,
    toSI   => SIB_main_toSI,
    fromF  => toF_SIB_main,
    fromC  => toC_SIB_main
);

toF_SIB_main <= SIB_temp_toF or SIB_iddt_toF or SIB_slack_toF or SIB_voltage_toF;
toC_SIB_main <= SIB_temp_toC and SIB_iddt_toC and SIB_slack_toC and SIB_voltage_toC;

------------------------------------------------------------
-- Temperature SIB and monitor interface
------------------------------------------------------------

SIB_temp : SIB_mux_pre_FCX_SELgate
    port map ( -- Scan Interface  client --------------
    SI  => SIB_main_toSI,
    CE  => SIB_main_toCE,
    SE  => SIB_main_toSE,
    UE  => SIB_main_toUE,
    SEL => SIB_main_toSEL,
    RST => SIB_main_toRST,
    TCK => SIB_main_toTCK,
    SO  => SIB_temp_SO,
    toF => SIB_temp_toF,
    toC => SIB_temp_toC,
     -- Scan Interface  host ----------------
    fromSO => temp_monitor_SO,
    toCE   => SIB_temp_toCE,
    toSE   => SIB_temp_toSE,
    toUE   => SIB_temp_toUE,
    toSEL  => SIB_temp_toSEL,
    toRST  => SIB_temp_toRST,
    toTCK  => SIB_temp_toTCK,
    toSI   => SIB_temp_toSI,
    fromF  => temp_monitor_toF,
    fromC  => temp_monitor_toC
);

temp_monitor: immortal_temp_iddt_monitor_instrument
    port map (
      -- IJTAG connection
      TCK  => SIB_temp_toTCK,
      RST  => SIB_temp_toRST,
      SEL  => SIB_temp_toSEL,
      SI   => SIB_temp_toSI,
      SE   => SIB_temp_toSE,
      UE   => SIB_temp_toUE,
      CE   => SIB_temp_toCE,
      SO   => temp_monitor_SO,
      toF  => temp_monitor_toF,
      toC  => temp_monitor_toC,

      -- Monitor connections
      control   => temperature_control,
      adc_data  => temperature_data(12 downto 1),
      adc_drdy  => temperature_data(0)
    );

------------------------------------------------------------
-- IDDt SIB and monitor interface
------------------------------------------------------------

SIB_iddt : SIB_mux_pre_FCX_SELgate
    port map ( -- Scan Interface  client --------------
    SI  => SIB_temp_SO,
    CE  => SIB_main_toCE,
    SE  => SIB_main_toSE,
    UE  => SIB_main_toUE,
    SEL => SIB_main_toSEL,
    RST => SIB_main_toRST,
    TCK => SIB_main_toTCK,
    SO  => SIB_iddt_SO,
    toF => SIB_iddt_toF,
    toC => SIB_iddt_toC,
     -- Scan Interface  host ----------------
    fromSO => iddt_monitor_SO,
    toCE   => SIB_iddt_toCE,
    toSE   => SIB_iddt_toSE,
    toUE   => SIB_iddt_toUE,
    toSEL  => SIB_iddt_toSEL,
    toRST  => SIB_iddt_toRST,
    toTCK  => SIB_iddt_toTCK,
    toSI   => SIB_iddt_toSI,
    fromF  => iddt_monitor_toF,
    fromC  => iddt_monitor_toC
);

iddt_monitor: immortal_temp_iddt_monitor_instrument
    port map (
      -- IJTAG connection
      TCK  => SIB_iddt_toTCK,
      RST  => SIB_iddt_toRST,
      SEL  => SIB_iddt_toSEL,
      SI   => SIB_iddt_toSI,
      SE   => SIB_iddt_toSE,
      UE   => SIB_iddt_toUE,
      CE   => SIB_iddt_toCE,
      SO   => iddt_monitor_SO,
      toF  => iddt_monitor_toF,
      toC  => iddt_monitor_toC,

      -- Monitor connections
      control   => iddt_control,
      adc_data  => iddt_data(12 downto 1),
      adc_drdy  => iddt_data(0)
    );

------------------------------------------------------------
-- Slack SIB and monitor interface
------------------------------------------------------------

SIB_slack : SIB_mux_pre_FCX_SELgate
    port map ( -- Scan Interface  client --------------
    SI  => SIB_iddt_SO,
    CE  => SIB_main_toCE,
    SE  => SIB_main_toSE,
    UE  => SIB_main_toUE,
    SEL => SIB_main_toSEL,
    RST => SIB_main_toRST,
    TCK => SIB_main_toTCK,
    SO  => SIB_slack_SO,
    toF => SIB_slack_toF,
    toC => SIB_slack_toC,
     -- Scan Interface  host ----------------
    fromSO => slack_monitor_SO,
    toCE   => SIB_slack_toCE,
    toSE   => SIB_slack_toSE,
    toUE   => SIB_slack_toUE,
    toSEL  => SIB_slack_toSEL,
    toRST  => SIB_slack_toRST,
    toTCK  => SIB_slack_toTCK,
    toSI   => SIB_slack_toSI,
    fromF  => slack_monitor_toF,
    fromC  => slack_monitor_toC
);

slack_monitor : immortal_slack_monitor_instrument
    port map (
      -- IJTAG connection
      TCK  => SIB_slack_toTCK,
      RST  => SIB_slack_toRST,
      SEL  => SIB_slack_toSEL,
      SI   => SIB_slack_toSI,
      SE   => SIB_slack_toSE,
      UE   => SIB_slack_toUE,
      CE   => SIB_slack_toCE,
      SO   => slack_monitor_SO,
      toF  => slack_monitor_toF,
      toC  => slack_monitor_toC,

      -- Monitor connections
      control  => slack_control,
      data     => slack_data
    );

------------------------------------------------------------
-- Voltage SIB and monitor interface
------------------------------------------------------------

SIB_voltage : SIB_mux_pre_FCX_SELgate
    port map ( -- Scan Interface  client --------------
    SI  => SIB_slack_SO,
    CE  => SIB_main_toCE,
    SE  => SIB_main_toSE,
    UE  => SIB_main_toUE,
    SEL => SIB_main_toSEL,
    RST => SIB_main_toRST,
    TCK => SIB_main_toTCK,
    SO  => SIB_voltage_SO,
    toF => SIB_voltage_toF,
    toC => SIB_voltage_toC,
     -- Scan Interface  host ----------------
    fromSO => voltage_monitor_SO,
    toCE   => SIB_voltage_toCE,
    toSE   => SIB_voltage_toSE,
    toUE   => SIB_voltage_toUE,
    toSEL  => SIB_voltage_toSEL,
    toRST  => SIB_voltage_toRST,
    toTCK  => SIB_voltage_toTCK,
    toSI   => SIB_voltage_toSI,
    fromF  => voltage_monitor_toF,
    fromC  => voltage_monitor_toC
);

voltage_monitor : immortal_volt_monitor_instrument
    port map (
      -- IJTAG connection
      TCK  => SIB_voltage_toTCK,
      RST  => SIB_voltage_toRST,
      SEL  => SIB_voltage_toSEL,
      SI   => SIB_voltage_toSI,
      SE   => SIB_voltage_toSE,
      UE   => SIB_voltage_toUE,
      CE   => SIB_voltage_toCE,
      SO   => voltage_monitor_SO,
      toF  => voltage_monitor_toF,
      toC  => voltage_monitor_toC,

      -- Monitor connections
      control  => voltage_control,
      data     => voltage_data
    );

end;