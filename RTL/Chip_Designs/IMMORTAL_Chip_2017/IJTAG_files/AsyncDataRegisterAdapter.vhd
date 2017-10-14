--Copyright (C) 2017 Konstantin Shibin

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AsyncDataRegisterAdapter is
 Generic ( Size : positive := 8);
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
			  -- Data interface
           DI : in STD_LOGIC_VECTOR (Size-1 downto 0);
           DO : out STD_LOGIC_VECTOR (Size-1 downto 0)
			     );
end AsyncDataRegisterAdapter;

architecture AsyncDataRegisterAdapter_arch of AsyncDataRegisterAdapter is

signal DI_sync_first, DI_sync: STD_LOGIC_VECTOR (Size-1 downto 0);
signal sreg_do: STD_LOGIC_VECTOR (Size-1 downto 0);
signal sreg_so: STD_LOGIC;
signal sticky_flags, sticky_flags_mux: STD_LOGIC_VECTOR (Size-1 downto 0);
signal flag_mask_strobe: STD_LOGIC;

component SReg is
 Generic ( Size : positive := 7);
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

begin

sticky_flags_mux <= (sticky_flags or DI_sync) and not sreg_do when flag_mask_strobe = '1' else sticky_flags or DI_sync;

synchronizer_di : process(TCK,RST)
begin
  if RST = '1' then
    DI_sync_first <= (others => '0');
    DI_sync <= (others => '0');
  elsif  TCK'event and TCK = '1' then
    DI_sync_first <= DI;
    DI_sync <= DI_sync_first;
  end if ;
end process ; -- synchronizer
  
sticky_flag_update : process(TCK,RST)
begin
  if RST = '1' then
    sticky_flags <= (others => '0');
  elsif  TCK'event and TCK = '1' then
    sticky_flags <= sticky_flags_mux;
  end if ;
end process ;

sticky_flag_update_strobe : process(TCK)
begin
  if  TCK'event and TCK = '1' then
    flag_mask_strobe <= SEL and UE;
  end if;
end process;

SO <= sreg_so;
DO <= sreg_do;
			  
shiftreg : SReg 
 Generic map ( Size => Size)
    Port map ( -- Scan Interface scan_client ----------
	            SI => SI, -- Input Port SI = SI
               SO => sreg_so,
               SEL => SEL,
               ----------------------------------------		
               SE => SE,
               CE => CE,
               UE => UE,
               RST => RST,
               TCK => TCK,
			         DI => sticky_flags,
			         DO => sreg_do);		  

end AsyncDataRegisterAdapter_arch;