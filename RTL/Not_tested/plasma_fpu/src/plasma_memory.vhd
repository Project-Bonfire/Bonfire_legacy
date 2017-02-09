-- --------------------------------------------------------------------------
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<
-- --------------------------------------------------------------------------
-- TITLE:       Plasma MEMORY MODEL
-- AUTHOR:      Alex Schoenberger (Alex.Schoenberger@ies.tu-darmstadt.de)
-- COMMENT:     This project is based on Plasma CPU core by Steve Rhoads

-- www.ies.tu-darmstadt.de
-- TU Darmstadt
-- Institute for Integrated Systems
-- Merckstr. 25

-- 64283 Darmstadt - GERMANY
-- --------------------------------------------------------------------------
-- PROJECT:       Plasma CPU core with FPU
-- FILENAME:      plasma_memory.vhd
-- --------------------------------------------------------------------------
-- COPYRIGHT:
--  This project is distributed by GPLv2.0
--  Software placed into the public domain by the author.
--  Software 'as is' without warranty.  Author liable for nothing.
-- --------------------------------------------------------------------------
-- DESCRIPTION:
--    memory interface

--    NOT SYNTHESIZABLE

-- --------------------------------------------------------------------------
-- Revision History
-- --------------------------------------------------------------------------
-- Revision   Date    Author     CHANGES
-- 1.0      4/2014    AS         initial
-- --------------------------------------------------------------------------
library IEEE;
   use IEEE.std_logic_1164.ALL;
   use IEEE.numeric_std.ALL;

library STD;
  use STD.textio.ALL;

library PLASMA;
   use PLASMA.plasma_pack.ALL;

package plasma_memory_pack is

  constant PLASMA_MEM_RANGE           : natural         := 25;
  constant PLASMA_MEM_SIZE            : std_logic_vector(PLASMA_MEM_RANGE     - 1 downto 0) := '1' & x"a2_0014";
  constant PLASMA_MEM_SIZE_RANGE      : natural         := to_integer(unsigned(PLASMA_MEM_SIZE));

  type t_plasma_memory                is array(PLASMA_MEM_SIZE_RANGE          - 1 downto 0)   of  t_plasma_mem_word;

  subtype t_prog_addr                 is std_logic_vector(PLASMA_MEM_RANGE    - 1 downto 0);
  subtype t_data_addr                 is std_logic_vector(PLASMA_MEM_RANGE    - 1 downto 0);

  component plasma_memory is
  port(
    clk               : in  std_logic;
    reset             : in  std_logic;
    wr_mask           : in  t_plasma_mask;
    rd_mask           : in  t_plasma_mask;
    prog_addr         : in  t_plasma_word;
    data_addr         : in  t_plasma_word;
    prog_out          : out t_plasma_word;
    data_in           : in  t_plasma_word;
    data_out          : out t_plasma_word
  );
  end component plasma_memory;

  procedure read_instr( signal  instr   : out t_plasma_word;
                                addr    : in  t_prog_addr;
                                memory  :     t_plasma_memory );


  procedure read_heap( signal   data    : out t_plasma_word;
                       signal   data_in : in  t_plasma_word;
                                addr    : in  t_data_addr;
                                mask    : in  t_plasma_mask;
                                memory  :     t_plasma_memory );

  procedure write_heap(signal   data    : in  t_plasma_word;
                                addr    : in  t_data_addr;
                                mask    : in  t_plasma_mask;
                       variable memory  : out t_plasma_memory );

  procedure printf(             memory  : t_plasma_memory );

  function ascii(int: integer) return character;

end package plasma_memory_pack;


package body plasma_memory_pack is

  procedure read_instr( signal instr  : out t_plasma_word;
                               addr   : in  t_prog_addr;
                               memory :     t_plasma_memory ) is
    variable i_addr   : natural := 0;
  begin
    i_addr := to_integer(unsigned(addr));

    instr(31 downto 24)  <= memory(i_addr    );
    instr(23 downto 16)  <= memory(i_addr + 1);
    instr(15 downto  8)  <= memory(i_addr + 2);
    instr( 7 downto  0)  <= memory(i_addr + 3);
  end procedure read_instr;

  procedure read_heap( signal data    : out t_plasma_word;
                       signal data_in : in  t_plasma_word;
                              addr    : in  t_data_addr;
                              mask    : in  t_plasma_mask;
                              memory  :     t_plasma_memory ) is
    variable i_addr    : natural := 0;
  begin
    i_addr := to_integer(unsigned(addr));

    case mask is
      when PLASMA_MASK_READ8   =>
        data(31 downto 24)  <= memory(i_addr  );
        data(23 downto 16)  <= memory(i_addr  );
        data(15 downto  8)  <= memory(i_addr  );
        data( 7 downto  0)  <= memory(i_addr  );

      when PLASMA_MASK_READ16  =>
        data(31 downto 24)  <= memory(i_addr  );
        data(23 downto 16)  <= memory(i_addr + 1);
        data(15 downto  8)  <= memory(i_addr  );
        data( 7 downto  0)  <= memory(i_addr + 1);

      when PLASMA_MASK_READ32L =>
        data(31 downto 24)  <= memory(i_addr  );
        data(23 downto 16)  <= memory(i_addr + 1);
        data(15 downto  0)  <= data_in(15 downto 0);

      when PLASMA_MASK_READ32R  =>
        data(31 downto 16)  <= data_in(31 downto 16);
        data(15 downto  8)  <= memory(i_addr + 2);
        data( 7 downto  0)  <= memory(i_addr + 3);

      when PLASMA_MASK_READ32  =>
        data(31 downto 24)  <= memory(i_addr  );
        data(23 downto 16)  <= memory(i_addr + 1);
        data(15 downto  8)  <= memory(i_addr + 2);
        data( 7 downto  0)  <= memory(i_addr + 3);

      when others     =>
        data                <= (others => '0');
    end case;
  end procedure read_heap;

  procedure write_heap(signal   data    : in  t_plasma_word;
                                addr    : in  t_data_addr;
                                mask    : in  t_plasma_mask;
                       variable memory  : out t_plasma_memory ) is
    variable i_addr     : natural := 0;
  begin
    i_addr := to_integer(unsigned(addr));

    case mask is
      when PLASMA_MASK_WRITE8   =>
        memory(i_addr    ) := data( 7 downto  0);

      when PLASMA_MASK_WRITE16  =>
        memory(i_addr + 1) := data( 7 downto  0);
        memory(i_addr    ) := data(15 downto  8);

      when PLASMA_MASK_WRITE32L =>
        memory(i_addr + 1) := data(23 downto 16);
        memory(i_addr    ) := data(31 downto 24);

      when PLASMA_MASK_WRITE32R =>
        memory(i_addr + 3) := data( 7 downto  0);
        memory(i_addr + 2) := data(15 downto  8);

      when PLASMA_MASK_WRITE32  =>
        memory(i_addr + 3) := data( 7 downto  0);
        memory(i_addr + 2) := data(15 downto  8);
        memory(i_addr + 1) := data(23 downto 16);
        memory(i_addr    ) := data(31 downto 24);

      when others               =>
    end case;

  end procedure write_heap;

  procedure printf( memory : t_plasma_memory ) is

    constant ADDR                 : integer := 27394060;

    variable message_addr         : t_plasma_word;
    variable message_length       : t_plasma_word;

    variable i_addr               : integer;
    variable i_length             : integer;

    variable message              : line;

  begin

    -- get message address and length of the message
    message_addr    := memory(ADDR    ) & memory(ADDR + 1) & memory(ADDR + 2) & memory(ADDR + 3);
    message_length  := memory(ADDR + 4) & memory(ADDR + 5) & memory(ADDR + 6) & memory(ADDR + 7);

    -- and convert the values to integer
    i_addr          := to_integer(unsigned(message_addr));
    i_length        := to_integer(unsigned(message_length));

    -- initialise the message string
    message         := new string(1 to i_length);

    -- read ascii characters, last character is 0
    for i in 0 to i_length - 1 loop
      message(i + 1) := ascii( to_integer(unsigned(memory(i_addr + i))));
    end loop;

    -- print message text
    report message.ALL;

  end procedure printf;


  function ascii(int: integer) return character is
      variable c: character;
    begin
      case int is
        when  10 => c := ' ';
        when  32 => c := ' ';
        when  33 => c := '!';
        when  34 => c := '"';
        when  35 => c := '#';
        when  36 => c := '$';
        when  37 => c := '%';
        when  38 => c := '&';
        when  39 => c := ''';
        when  40 => c := '(';
        when  41 => c := ')';
        when  42 => c := '*';
        when  43 => c := '+';
        when  44 => c := ',';
        when  45 => c := '-';
        when  46 => c := '.';
        when  47 => c := '/';
        when  48 => c := '0';
        when  49 => c := '1';
        when  50 => c := '2';
        when  51 => c := '3';
        when  52 => c := '4';
        when  53 => c := '5';
        when  54 => c := '6';
        when  55 => c := '7';
        when  56 => c := '8';
        when  57 => c := '9';
        when  58 => c := ':';
        when  59 => c := ';';
        when  60 => c := '<';
        when  61 => c := '=';
        when  62 => c := '>';
        when  63 => c := '?';
        when  64 => c := '@';
        when  65 => c := 'A';
        when  66 => c := 'B';
        when  67 => c := 'C';
        when  68 => c := 'D';
        when  69 => c := 'E';
        when  70 => c := 'F';
        when  71 => c := 'G';
        when  72 => c := 'H';
        when  73 => c := 'I';
        when  74 => c := 'J';
        when  75 => c := 'K';
        when  76 => c := 'L';
        when  77 => c := 'M';
        when  78 => c := 'N';
        when  79 => c := 'O';
        when  80 => c := 'P';
        when  81 => c := 'Q';
        when  82 => c := 'R';
        when  83 => c := 'S';
        when  84 => c := 'T';
        when  85 => c := 'U';
        when  86 => c := 'V';
        when  87 => c := 'W';
        when  88 => c := 'X';
        when  89 => c := 'Y';
        when  90 => c := 'Z';
        when  91 => c := '[';
        when  92 => c := '\';
        when  93 => c := ']';
        when  94 => c := '^';
        when  95 => c := '_';
        when  96 => c := '`';
        when  97 => c := 'a';
        when  98 => c := 'b';
        when  99 => c := 'c';
        when 100 => c := 'd';
        when 101 => c := 'e';
        when 102 => c := 'f';
        when 103 => c := 'g';
        when 104 => c := 'h';
        when 105 => c := 'i';
        when 106 => c := 'j';
        when 107 => c := 'k';
        when 108 => c := 'l';
        when 109 => c := 'm';
        when 110 => c := 'n';
        when 111 => c := 'o';
        when 112 => c := 'p';
        when 113 => c := 'q';
        when 114 => c := 'r';
        when 115 => c := 's';
        when 116 => c := 't';
        when 117 => c := 'u';
        when 118 => c := 'v';
        when 119 => c := 'w';
        when 120 => c := 'x';
        when 121 => c := 'y';
        when 122 => c := 'z';
        when 123 => c := '{';
        when 124 => c := '|';
        when 125 => c := '}';
        when 126 => c := '~';
        when others => c := '?'; report "Could not decode this ASCII integer value " & integer'image(int);
      end case;
    return c;
  end ascii;

end package body plasma_memory_pack;


--  _____  _                _____ __  __            __  __ ______ __  __  ____  _______     __
-- |  __ \| |        /\    / ____|  \/  |   /\     |  \/  |  ____|  \/  |/ __ \|  __ \ \   / /
-- | |__) | |       /  \  | (___ | \  / |  /  \    | \  / | |__  | \  / | |  | | |__) \ \_/ /
-- |  ___/| |      / /\ \  \___ \| |\/| | / /\ \   | |\/| |  __| | |\/| | |  | |  _  / \   /
-- | |    | |____ / ____ \ ____) | |  | |/ ____ \  | |  | | |____| |  | | |__| | | \ \  | |
-- |_|    |______/_/    \_\_____/|_|  |_/_/    \_\ |_|  |_|______|_|  |_|\____/|_|  \_\ |_|
library IEEE;
   use IEEE.std_logic_1164.ALL;
   use IEEE.numeric_std.ALL;

library PLASMA;
   use PLASMA.plasma_pack.ALL;

library MEMORY;
  use MEMORY.plasma_memory_pack.ALL;

entity plasma_memory is
  port(
    clk               : in  std_logic;
    reset             : in  std_logic;
    wr_mask           : in  t_plasma_mask;
    rd_mask           : in  t_plasma_mask;
    prog_addr         : in  t_plasma_word;
    data_addr         : in  t_plasma_word;
    prog_out          : out t_plasma_word;
    data_in           : in  t_plasma_word;
    data_out          : out t_plasma_word
  );
end entity plasma_memory;


architecture behav_plasma_memory of plasma_memory is

  shared variable ram             : t_plasma_memory;

  alias inst_addr                 : t_prog_addr is prog_addr(PLASMA_MEM_RANGE - 1 downto 0); --25 downto 0
  alias heap_addr                 : t_data_addr is data_addr(PLASMA_MEM_RANGE - 1 downto 0); --25 downto 0

begin

memory_access:
  process( clk )
  begin
    if falling_edge( clk ) then

      -- ########### READ INSTRUCTION ###################
      read_instr( prog_out,         inst_addr,          ram );

      -- ########### READ HEAP ##########################
      read_heap( data_out, data_in, heap_addr, rd_mask, ram );

      -- ########### WRITE HEAP #########################
      write_heap( data_in,          heap_addr, wr_mask, ram );

      -- ########### PRINTF FUNCTION ####################
      if i_sim_control.print_message = '1' then
        printf( ram );
      end if;

    end if;
  end process;

end behav_plasma_memory;
