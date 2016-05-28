library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity LBDR_checkers is
	generic (
        cur_addr_rst: integer := 5;
        NoC_size: integer := 4
    );
    port (  empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            Req_N, Req_E, Req_W, Req_S, Req_L: in std_logic;
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);

            -- Checker outputs
            err_LBDR_Req_onehot, err_LBDR_Req_allzero, err_LBDR_dst_addr_checker, err_LBDR_Req_Local: out std_logic
            );
end LBDR_checkers;

architecture behavior of LBDR_checkers is

signal cur_addr:  std_logic_vector(NoC_size-1 downto 0);  

begin 

  cur_addr <= std_logic_vector(to_unsigned(cur_addr_rst, cur_addr'length));

-- Implementing checkers in form of concurrent assignments (combinational assertions)

-- If empty is zero (If FIFO is not empty), Request outputs of LBDR must be one-hot
process(flit_type, empty, Req_N, Req_E, Req_W, Req_S, Req_L)begin
if (flit_type = "010" or flit_type = "001") then
	err_LBDR_Req_onehot <= not ( empty or (
							((	  Req_N) and (not Req_E) and (not Req_W) and (not Req_S) and (not Req_L)) or 
							((not Req_N) and (    Req_E) and (not Req_W) and (not Req_S) and (not Req_L)) or 
							((not Req_N) and (not Req_E) and (    Req_W) and (not Req_S) and (not Req_L)) or 
							((not Req_N) and (not Req_E) and (not Req_W) and (    Req_S) and (not Req_L)) or 
							((not Req_N) and (not Req_E) and (not Req_W) and (not Req_S) and (    Req_L))));
else
	err_LBDR_Req_onehot <= '0';
end if;
end process;

-- If empty is one (If FIFO is empty), all the Request outputs of LBDR must be zero   
err_LBDR_Req_allzero <= empty and (Req_N or Req_E or Req_W or Req_S or Req_L);

-- Checking destination address (Depending on the location of the destination node with respect to the current node, if wrong requests from LBDR
-- go active, there is a fault!)
process (dst_addr, Req_N, Req_E, Req_W, cur_addr, empty, flit_type)
begin
	-- North
	if (empty = '0') and (flit_type = "001") and (dst_addr(3 downto 2) < cur_addr(3 downto 2)) and (Req_N = '0' and Req_E = '0' and Req_W = '0') then 
		err_LBDR_dst_addr_checker <= '1';
	-- East
	elsif (empty = '0') and (flit_type = "001") and (cur_addr((4/2)-1 downto 0) < dst_addr((4/2)-1 downto 0)) and (Req_E = '0') then 
		err_LBDR_dst_addr_checker <= '1';
	-- West
	elsif (empty = '0') and (flit_type = "001") and (dst_addr((4/2)-1 downto 0) < cur_addr((4/2)-1 downto 0)) and (Req_W = '0') then 
		err_LBDR_dst_addr_checker <= '1';
	-- South
	elsif (empty = '0') and (flit_type = "001") and (cur_addr(4-1 downto 4/2) < dst_addr(4-1 downto 4/2)) and (Req_S = '0' and Req_E = '0' and Req_W = '0') then 
		err_LBDR_dst_addr_checker <= '1';
	else
		err_LBDR_dst_addr_checker <= '0';
	end if;
end process;

-- If the header flit has reached its destination node, the L output request of LBDR must go active and others must be zero!
process (dst_addr, Req_N, Req_E, Req_W, cur_addr, empty, flit_type, empty)
begin
	if ( (empty = '0') and (flit_type = "001") and (dst_addr = cur_addr) and (Req_L = '0') ) then
		err_LBDR_Req_Local <= '1';
	else
		err_LBDR_Req_Local <= '0';		
	end if;
end process;

end behavior;