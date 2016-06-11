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
            Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;
            Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: in std_logic;
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);

            -- Checker outputs
            err_LBDR_Req_onehot, err_LBDR_Req_onehot1, err_LBDR_dst_addr_checker : out std_logic ;
            err_LBDR_valid_flit_type, err_LBDR_valid_flit_type1, err_LBDR_valid_flit_type2, err_LBDR_valid_flit_type3, err_LBDR_valid_flit_type4, err_LBDR_valid_flit_type5 : out std_logic; 
            err_LBDR_Req_tail_allzero, err_LBDR_Req_Local, err_LBDR_Req_Local1 : out std_logic
            );
end LBDR_checkers;

architecture behavior of LBDR_checkers is

signal cur_addr:  std_logic_vector(NoC_size-1 downto 0);  
signal Requests_FF: std_logic_vector(4 downto 0);
signal Requests: std_logic_vector(4 downto 0);

begin 

  cur_addr <= std_logic_vector(to_unsigned(cur_addr_rst, cur_addr'length));

  Requests_FF <= Req_N_FF & Req_E_FF & Req_W_FF & Req_S_FF & Req_L_FF;
  Requests <= Req_N_in & Req_E_in & Req_W_in & Req_S_in & Req_L_in;

-- Implementing checkers in form of concurrent assignments (combinational assertions)

-- If empty is zero (If FIFO is not empty), Request outputs of LBDR must be one-hot
process(flit_type, empty, Requests)begin
if (flit_type = "001" and empty = '0' and Requests /= "10000" and Requests /= "01000" and Requests /= "00100" and Requests /= "00010" and Requests /= "00001") then
    err_LBDR_Req_onehot <= '1';
else
    err_LBDR_Req_onehot <= '0';
end if;
end process;

-- Body flit
process(flit_type, Requests)begin
if (flit_type = "010" and Requests /= "10000" and Requests /= "01000" and Requests /= "00100" and Requests /= "00010" and Requests /= "00001") then
    err_LBDR_Req_onehot1 <= '1';
else
    err_LBDR_Req_onehot1 <= '0';
end if;
end process;

-- For tail flit, all output requests of LBDR must be zero!
process(flit_type, Requests)begin
    if (flit_type = "100" and Requests /= "00000" ) then
        err_LBDR_Req_tail_allzero <= '1';
    else 
        err_LBDR_Req_tail_allzero <= '0';
    end if;
end process;

-- Checking destination address (Depending on the location of the destination node with respect to the current node, if wrong requests from LBDR
-- go active, there is a fault!)
process (empty, flit_type, dst_addr, cur_addr, Req_N_in, Req_E_in, Req_W_in, Req_S_in)
begin
    -- North-East
    if (empty = '0' and flit_type = "001" and    (dst_addr(NoC_size-1 downto NoC_size/2) < cur_addr(NoC_size-1 downto NoC_size/2)) and (cur_addr((NoC_size/2)-1 downto 0) < dst_addr((NoC_size/2)-1 downto 0)) and Req_E_in = '0') then 
        err_LBDR_dst_addr_checker <= '1';

    -- North-West
    elsif (empty = '0' and flit_type = "001" and (dst_addr(NoC_size-1 downto NoC_size/2) < cur_addr(NoC_size-1 downto NoC_size/2)) and (dst_addr((NoC_size/2)-1 downto 0) < cur_addr((NoC_size/2)-1 downto 0)) and Req_W_in = '0') then 
        err_LBDR_dst_addr_checker <= '1';

    -- South-East
    elsif (empty = '0' and flit_type = "001" and (cur_addr(NoC_size-1 downto NoC_size/2) < dst_addr(NoC_size-1 downto NoC_size/2)) and (cur_addr((NoC_size/2)-1 downto 0) < dst_addr((NoC_size/2)-1 downto 0)) and Req_E_in = '0') then 
        err_LBDR_dst_addr_checker <= '1';

    -- South-West
    elsif (empty = '0' and flit_type = "001" and (cur_addr(NoC_size-1 downto NoC_size/2) < dst_addr(NoC_size-1 downto NoC_size/2)) and (dst_addr((NoC_size/2)-1 downto 0) < cur_addr((NoC_size/2)-1 downto 0)) and Req_W_in = '0') then 
        err_LBDR_dst_addr_checker <= '1';

    -- North
    elsif (empty = '0' and flit_type = "001" and (dst_addr(NoC_size-1 downto NoC_size/2) < cur_addr(NoC_size-1 downto NoC_size/2)) and (cur_addr((NoC_size/2)-1 downto 0) = dst_addr((NoC_size/2)-1 downto 0)) and Req_N_in = '0') then 
        err_LBDR_dst_addr_checker <= '1';

    -- East
    elsif (empty = '0' and flit_type = "001" and (cur_addr((NoC_size/2)-1 downto 0) < dst_addr((NoC_size/2)-1 downto 0)) and (cur_addr(NoC_size-1 downto NoC_size/2) = dst_addr(NoC_size-1 downto NoC_size/2)) and Req_E_in = '0') then 
        err_LBDR_dst_addr_checker <= '1';

    -- West
    elsif (empty = '0' and flit_type = "001" and (dst_addr((NoC_size/2)-1 downto 0) < cur_addr((NoC_size/2)-1 downto 0)) and (cur_addr(NoC_size-1 downto NoC_size/2) = dst_addr(NoC_size-1 downto NoC_size/2)) and Req_W_in = '0') then 
        err_LBDR_dst_addr_checker <= '1';

    -- South
    elsif (empty = '0' and flit_type = "001" and (cur_addr(NoC_size-1 downto NoC_size/2) < dst_addr(NoC_size-1 downto NoC_size/2)) and (cur_addr((NoC_size/2)-1 downto 0) = dst_addr((NoC_size/2)-1 downto 0)) and Req_S_in = '0') then 
        err_LBDR_dst_addr_checker <= '1';

    else
        err_LBDR_dst_addr_checker <= '0';
    end if;

end process;

-- If the header flit has reached its destination node, the L output request of LBDR must go active and others must be zero!
process (empty, flit_type, Req_L_FF, dst_addr, cur_addr, Req_L_in)
begin
    if ( ( (empty = '0' and flit_type = "001") or (flit_type = "010" and Req_L_FF = '1')) and (dst_addr = cur_addr) and (Req_L_in = '0') ) then
        err_LBDR_Req_Local <= '1';
    else
        err_LBDR_Req_Local <= '0';      
    end if;
end process;

process (empty, flit_type, Req_L_FF, dst_addr, cur_addr, Req_L_in)
begin
    if ( ( (empty = '0' and flit_type = "001") or (flit_type /= "001" and flit_type /= "100" and Req_L_FF = '0')) and (dst_addr /= cur_addr) and (Req_L_in = '1') ) then
        err_LBDR_Req_Local1 <= '1';
    else
        err_LBDR_Req_Local1 <= '0';      
    end if;
end process;

process (empty, flit_type, Requests)
begin
    if ( (Requests = "00001" or Requests = "00010" or Requests = "00100" or Requests = "01000" or Requests = "10000") and flit_type /= "001" and flit_type /= "010") then
        err_LBDR_valid_flit_type <= '1';
    else 
        err_LBDR_valid_flit_type <= '0';
    end if;
end process;

process (flit_type, Requests)
begin
    if ( Requests = "00000" and flit_type /= "100") then
        err_LBDR_valid_flit_type1 <= '1';
    else 
        err_LBDR_valid_flit_type1 <= '0';
    end if;
end process;

process (empty, Requests)
begin
    if (empty = '1' and Requests /= "00000" and Requests /= "00001" and Requests /= "00010" and Requests /= "00100" and Requests /= "01000" and Requests /= "10000") then
        err_LBDR_valid_flit_type2 <= '1';
    else 
        err_LBDR_valid_flit_type2 <= '0';
    end if;
end process;

process (empty, flit_type, Requests)
begin
    if ( empty = '0' and flit_type = "001" and Requests /= "00001" and Requests /= "00010" and Requests /= "00100" and Requests /= "01000" and Requests /= "10000" ) then
        err_LBDR_valid_flit_type3 <= '1';
    else 
        err_LBDR_valid_flit_type3 <= '0';
    end if;
end process;

process (empty, flit_type, Requests)
begin
    if ( (empty = '1' or flit_type /= "001") and Requests /= "00000" and Requests /= "00001" and Requests /= "00010" and Requests /= "00100" and Requests /= "01000" and Requests /= "10000" ) then
        err_LBDR_valid_flit_type4 <= '1';
    else 
        err_LBDR_valid_flit_type4 <= '0';
    end if;
end process;

process (empty, flit_type, Requests)
begin
    if ( ( (empty = '1' and flit_type /= "001") or flit_type = "010") and Requests /= Requests_FF) then
        err_LBDR_valid_flit_type5 <= '1';
    else 
        err_LBDR_valid_flit_type5 <= '0';
    end if;
end process;



end behavior;