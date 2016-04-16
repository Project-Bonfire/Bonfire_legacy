library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;

entity LBDR is
    generic (
        cur_addr_rst: integer := 8;
        Rxy_rst: integer := 8;
        Cx_rst: integer := 8
    );
    port (  reset: in  std_logic;
            clk: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            dst_addr: in std_logic_vector(3 downto 0);
            Req_N, Req_E, Req_W, Req_S, Req_L:out std_logic
            );
end LBDR;

architecture behavior of LBDR is

  signal Cx:  std_logic_vector(3 downto 0);
  signal Rxy:  std_logic_vector(7 downto 0);
  signal cur_addr:  std_logic_vector(3 downto 0);  
  signal N1, E1, W1, S1  :std_logic :='0';  

begin 
  Cx       <=  std_logic_vector(to_unsigned(Cx_rst, Cx'length));
  Rxy      <= std_logic_vector(to_unsigned(Rxy_rst, Rxy'length));
  cur_addr <= std_logic_vector(to_unsigned(cur_addr_rst, cur_addr'length));

  N1 <= '1' when  dst_addr(3 downto 2) < cur_addr(3 downto 2) else '0';
  E1 <= '1' when  cur_addr(1 downto 0) < dst_addr(1 downto 0) else '0';
  W1 <= '1' when  dst_addr(1 downto 0) < cur_addr(1 downto 0) else '0';
  S1 <= '1' when  cur_addr(3 downto 2) < dst_addr(3 downto 2) else '0';


  process(clk, reset)
  begin
  if reset = '0' then 
      Req_N <= '0';
      Req_E <= '0';
      Req_W <= '0';
      Req_S <= '0';
      Req_L <= '0';
  elsif clk'event and clk = '1' then
     if flit_type = "001" then
        Req_N <= ((N1 and not E1 and not W1) or (N1 and E1 and Rxy(0)) or (N1 and W1 and Rxy(1))) and Cx(0);
        Req_E <= ((E1 and not N1 and not S1) or (E1 and N1 and Rxy(2)) or (E1 and S1 and Rxy(3))) and Cx(1);
        Req_W <= ((W1 and not N1 and not S1) or (W1 and N1 and Rxy(4)) or (W1 and S1 and Rxy(5))) and Cx(2);
        Req_S <= ((S1 and not E1 and not W1) or (S1 and E1 and Rxy(6)) or (S1 and W1 and Rxy(7))) and Cx(3);
        Req_L <= not N1 and  not E1 and not W1 and not S1;
      end if;
  end if;
  end process;
 
   
END;