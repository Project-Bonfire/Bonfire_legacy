library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SIB_mux_pre_FCX is
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
           fromC : in STD_LOGIC  -- From an AND of all C flags in the underlying network segment
           );
end SIB_mux_pre_FCX;

architecture SIB_mux_pre_FCX_arch of SIB_mux_pre_FCX is

component ScanRegister_for_SIBFCX is
 Generic (Size : positive;
          BitOrder : string; -- MSBLSB / LSBMSB
          SOSource : natural;
          ResetValue : STD_LOGIC_VECTOR);
    Port ( SI : in STD_LOGIC;
           CE : in STD_LOGIC;
           SE : in STD_LOGIC;
           UE : in STD_LOGIC;
           SEL : in STD_LOGIC;
           RST : in STD_LOGIC;
           TCK : in STD_LOGIC;
           SO : out STD_LOGIC;
           CaptureSource : in STD_LOGIC_VECTOR (Size-1 downto 0);
           ScanRegister_out : out STD_LOGIC_VECTOR (Size-1 downto 0);
           ue_mux_out : out STD_LOGIC_VECTOR (Size-1 downto 0));
end component;

component ScanMux is
 Generic (ControlSize : positive);
    Port ( ScanMux_in : in STD_LOGIC_VECTOR((2**ControlSize)-1 downto 0);
           SelectedBy : in STD_LOGIC_VECTOR(ControlSize-1 downto 0);
           ScanMux_out : out STD_LOGIC);
end component;


signal SIBmux_out : STD_LOGIC;
signal SR_so : STD_LOGIC;
signal SR_do : STD_LOGIC_VECTOR (3 downto 0);
signal SR_ci : STD_LOGIC_VECTOR (3 downto 0);
signal sr_update_mux_out : STD_LOGIC_VECTOR (3 downto 0);
signal C_sync, F_sync : STD_LOGIC;
signal C_sync_first, F_sync_first : STD_LOGIC;
signal F_sync_delayed_copy, sticky_f_posedge : STD_LOGIC;

begin

SO <= SR_so; -- Source SR
toCE <= CE;
toSE <= SE;
toUE <= UE;
toSEL <= SEL and SR_do(3); -- SEL & S bit
toRST <= RST;
toTCK <= TCK;
toSI <= SI; -- Source SI

SR_ci(3) <= SR_do(3); -- Sxcf
SR_ci(2) <= SR_do(2); -- sXcf
SR_ci(1) <= C_sync;   -- sxCf
SR_ci(0) <= sticky_f_posedge;   -- sxcF

toF <= fromF and SR_do(2); -- F flag from lower levels AND X bit
toC <= fromC or not SR_do(2); -- C flag from lower levels OR NOT X bit

f_edge_detector : process (TCK, RST)
begin
  if RST = '1' then
    sticky_f_posedge <= '0';
  elsif TCK'event and TCK = '0' then
    if F_sync_delayed_copy = '0' and F_sync = '1' then -- edge detector
      sticky_f_posedge <= '1';
    elsif UE = '1' and SEL = '1' and sr_update_mux_out(0) = '0' then -- clear sticky F flag when F is updated with 0
      sticky_f_posedge <= '0';
    end if;
  end if;

end process; -- f_edge_detector

synchronizer : process( TCK )
begin
  if  TCK'event and TCK = '0' then
    F_sync_first <= fromF;
    F_sync <= F_sync_first;
    F_sync_delayed_copy <= F_sync;
    C_sync_first <= fromC;
    C_sync <= C_sync_first;
  end if ;
end process ; -- synchronizer

SR : ScanRegister_for_SIBFCX
 Generic map (Size => 4,
              BitOrder => "MSBLSB", -- MSBLSB / LSBMSB
              SOSource => 0,
              ResetValue => "0110") -- ResetValue S=0, X=1, C=1, F=0
    Port map ( SI => SIBmux_out, -- ScanInSource SIBmux_out
               CE => CE,
               SE => SE,
               UE => UE,
               SEL => SEL,
               RST => RST,
               TCK => TCK,
               SO => SR_so,
               CaptureSource => SR_ci, -- CaptureSource SR
               ScanRegister_out => SR_do,
               ue_mux_out => sr_update_mux_out);
			   
SIBmux : ScanMux
 Generic map ( ControlSize => 1)
    Port map ( ScanMux_in(0) => SI, -- 1'b0 : SI
	           ScanMux_in(1) => fromSO, -- 1'b1 : fromSO
               SelectedBy => SR_do(3 downto 3), --SelectedBy SR
               ScanMux_out => SIBmux_out);

end SIB_mux_pre_FCX_arch;