--Copyright (C) 2017 Konstantin Shibin

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RAMAccessInstrument is
 Generic ( DataSize : positive := 8;
           AddressSize : positive := 8);
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
           MEM_SIB_SEL : out STD_LOGIC;
        -- RAM interface
           RAM_data_read : in STD_LOGIC_VECTOR (DataSize-1 downto 0);
           RAM_data_write : out STD_LOGIC_VECTOR (DataSize-1 downto 0);
           RAM_address_out : out STD_LOGIC_VECTOR (AddressSize-1 downto 0);
           RAM_write_enable : out STD_LOGIC
           );
end RAMAccessInstrument;

architecture RAMAccessInstrument_arch of RAMAccessInstrument is

signal RAM_address: STD_LOGIC_VECTOR (AddressSize downto 0);
signal RAM_address_update: STD_LOGIC_VECTOR (AddressSize downto 0);
signal RAM_addr_inc_reg: STD_LOGIC;
signal RAM_data_write_internal: STD_LOGIC_VECTOR (DataSize-1 downto 0);
signal sib_addr_update_strobe, sib_data_update_strobe: STD_LOGIC;
signal sib_addr_toUE_prev, sib_data_toUE_prev: STD_LOGIC;

signal sib_mem_so, sib_data_so, sib_addr_so, addr_sreg_so: STD_LOGIC;
signal data_sreg_so: STD_LOGIC;
signal sib_mem_toCE, sib_data_toCE, sib_addr_toCE: STD_LOGIC;
signal sib_mem_toSE, sib_data_toSE, sib_addr_toSE: STD_LOGIC;
signal sib_mem_toUE, sib_data_toUE, sib_addr_toUE: STD_LOGIC;
signal sib_mem_toSEL, sib_data_toSEL, sib_addr_toSEL: STD_LOGIC;
signal sib_mem_toRST, sib_data_toRST, sib_addr_toRST: STD_LOGIC;
signal sib_mem_toTCK, sib_data_toTCK, sib_addr_toTCK: STD_LOGIC;
signal sib_mem_toSI, sib_data_toSI, sib_addr_toSI: STD_LOGIC;

component SReg is
 Generic ( Size : positive := 33);
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

component SIB_mux_pre is
    Port ( -- Scan Interface  client --------------
         SI : in  STD_LOGIC; -- ScanInPort 
           CE : in STD_LOGIC; -- CaptureEnPort
           SE : in STD_LOGIC; -- ShiftEnPort
           UE : in STD_LOGIC; -- UpdateEnPort
           SEL : in STD_LOGIC; -- SelectPort
           RST : in STD_LOGIC; -- ResetPort
           TCK : in STD_LOGIC; -- TCKPort
           SO : out STD_LOGIC; -- ScanOutPort
       -- Scan Interface  host ----------------
           fromSO : in  STD_LOGIC; -- ScanInPort
           toCE : out  STD_LOGIC; -- ToCaptureEnPort
           toSE : out  STD_LOGIC; -- ToShiftEnPort
           toUE : out  STD_LOGIC; -- ToUpdateEnPort
           toSEL : out  STD_LOGIC; -- ToSelectPort
           toRST : out  STD_LOGIC; -- ToResetPort
           toTCK : out  STD_LOGIC; -- ToTCKPort
           toSI : out  STD_LOGIC); -- ScanOutPort
end component;

begin

RAM_address_out <= RAM_address(AddressSize-1 downto 0);
RAM_data_write <= RAM_data_write_internal;
RAM_write_enable <= sib_data_update_strobe;

--          .-------.     
--  SI -----|sib_mem|-- SO      
--          '-------'  
--            |    |_________________________________________________.
--            |                                                      |
--            |  .----------.                      .------------.    |
--            '--| sib_data |--------------------->| sib_addr   |----' 
--               '----------'                      '------------'   
--                |      |_____________               |      |_____________           
--                |     _____________  |              |     _____________  |          
--                '--->|   data      |-'              '--->|inc + address|-'              
--                     '-------------'                     '-------------'
-- Auto increment bit is MSb in Address shift register

SO <= sib_mem_so;
MEM_SIB_SEL <= sib_mem_toSEL;

-- Top-level SIB for integration into system's IJTAG network
sib_mem : SIB_mux_pre
    port map (
              SI => SI,
              SE => SE,
              UE => UE,
              CE => CE,
              SEL => SEL,
              RST => RST,
              TCK => TCK,
              SO => sib_mem_so,
              fromSO => sib_addr_so,
              toCE => sib_mem_toCE,
              toSE => sib_mem_toSE,
              toUE => sib_mem_toUE,
              toSEL => sib_mem_toSEL,
              toRST => sib_mem_toRST,
              toTCK => sib_mem_toTCK,
              toSI => sib_mem_toSI);

-- Underlying SIB for efficient access to RAM data
sib_data : SIB_mux_pre
    port map (
              SI => sib_mem_toSI,
              SE => sib_mem_toSE,
              UE => sib_mem_toUE,
              CE => sib_mem_toCE,
              SEL => sib_mem_toSEL,
              RST => sib_mem_toRST,
              TCK => sib_mem_toTCK,
              SO => sib_data_so,
              fromSO => data_sreg_so,
              toCE => sib_data_toCE,
              toSE => sib_data_toSE,
              toUE => sib_data_toUE,
              toSEL => sib_data_toSEL,
              toRST => sib_data_toRST,
              toTCK => sib_data_toTCK,
              toSI => sib_data_toSI);

-- Shift register for RAM data
data_shiftreg : SReg 
 Generic map ( Size => DataSize)
    Port map ( -- Scan Interface scan_client ----------
              SI => sib_data_toSI, -- Input Port SI = SI
               SO => data_sreg_so,
               SEL => sib_data_toSEL,
               SE => sib_data_toSE,
               UE => sib_data_toUE,
               CE => sib_data_toCE,
               RST => sib_data_toRST,
               TCK => sib_data_toTCK,
               DI => RAM_data_read,
               DO => RAM_data_write_internal);

-- Underlying SIB for setting access address
sib_addr : SIB_mux_pre
    port map (
              SI => sib_data_so,
              SE => sib_mem_toSE,
              UE => sib_mem_toUE,
              CE => sib_mem_toCE,
              SEL => sib_mem_toSEL,
              RST => sib_mem_toRST,
              TCK => sib_mem_toTCK,
              SO => sib_addr_so,
              fromSO => addr_sreg_so,
              toCE => sib_addr_toCE,
              toSE => sib_addr_toSE,
              toUE => sib_addr_toUE,
              toSEL => sib_addr_toSEL,
              toRST => sib_addr_toRST,
              toTCK => sib_addr_toTCK,
              toSI => sib_addr_toSI);

-- Shift register for RAM address and address increment bit
addr_shiftreg : SReg 
 Generic map ( Size => AddressSize+1)
    Port map ( -- Scan Interface scan_client ----------
              SI => sib_addr_toSI, -- Input Port SI = SI
               SO => addr_sreg_so,
               SEL => sib_addr_toSEL,
               SE => sib_addr_toSE,
               CE => sib_addr_toCE,
               UE => sib_addr_toUE,
               RST => sib_addr_toRST,
               TCK => sib_addr_toTCK,
               DI => RAM_address,
               DO => RAM_address_update);
               

update_strobes: process(TCK)
begin
  if TCK'event and TCK = '0' then
    sib_addr_toUE_prev <= sib_addr_toUE;
    sib_data_toUE_prev <= sib_data_toUE;
    sib_addr_update_strobe <= not sib_addr_toUE_prev and sib_addr_toUE and sib_addr_toSEL;
    sib_data_update_strobe <= not sib_data_toUE_prev and sib_data_toUE and sib_data_toSEL;
  end if;
end process;

address_set: process(TCK, RST)
begin
  if RST = '1' then
      RAM_address <= (others => '0');
      RAM_addr_inc_reg <= '0';
  elsif TCK'event and TCK = '0' then
    if sib_addr_update_strobe = '1' then
      RAM_address <= '0' & RAM_address_update(AddressSize-1 downto 0);
      RAM_addr_inc_reg <= RAM_address_update(AddressSize);  -- Auto increment bit is MSb in Address shift register
    elsif sib_data_update_strobe = '1' and RAM_addr_inc_reg = '1' then
      RAM_address <= std_logic_vector(unsigned(RAM_address) + 1);
    end if;
  end if;
end process;

end RAMAccessInstrument_arch;