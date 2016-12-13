library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity LBDR_packet_drop_routing_part_pseudo_checkers is
	generic (
	         cur_addr_rst: integer := 5;
	         NoC_size: integer := 4
            );
    port (  
            empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;
            grant_N, grant_E, grant_W, grant_S, grant_L: in std_logic;            
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);
            Cx: in std_logic_vector(3 downto 0);
            Rxy: in std_logic_vector(7 downto 0);
            packet_drop: in std_logic;

            N1_out, E1_out, W1_out, S1_out: in std_logic;
            Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: in std_logic;
            grants: in std_logic;
            packet_drop_order: in std_logic;
            packet_drop_in: in std_logic;

            -- Checker outputs
            --err_header_not_empty_Requests_in_onehot, 
            err_header_empty_Requests_FF_Requests_in, 
            err_tail_Requests_in_all_zero, 
            err_tail_empty_Requests_FF_Requests_in, 
            err_tail_not_empty_not_grants_Requests_FF_Requests_in,
            err_grants_onehot,
            err_grants_mismatch, 
            err_header_tail_Requests_FF_Requests_in, 
            err_dst_addr_cur_addr_N1,
            err_dst_addr_cur_addr_not_N1,
            err_dst_addr_cur_addr_E1,
            err_dst_addr_cur_addr_not_E1,
            err_dst_addr_cur_addr_W1,
            err_dst_addr_cur_addr_not_W1,
            err_dst_addr_cur_addr_S1,
            err_dst_addr_cur_addr_not_S1, 
            err_dst_addr_cur_addr_not_Req_L_in, 
            err_dst_addr_cur_addr_Req_L_in, 
            err_header_not_empty_Req_N_in,
            err_header_not_empty_Req_E_in,
            err_header_not_empty_Req_W_in,
            err_header_not_empty_Req_S_in, 
            err_header_not_empty_packet_drop_in, 
            err_header_not_empty_dst_addr_cur_addr_equal_packet_drop_in_packet_drop_equal, 
            err_header_empty_packet_drop_in_packet_drop_equal, 
            err_tail_not_empty_packet_drop_not_packet_drop_in, 
            err_tail_not_empty_not_packet_drop_packet_drop_in_packet_drop_equal, 
            err_invalid_or_body_flit_packet_drop_in_packet_drop_equal, 
            err_packet_drop_order : out std_logic
            );
end LBDR_packet_drop_routing_part_pseudo_checkers;

architecture behavior of LBDR_packet_drop_routing_part_pseudo_checkers is


signal cur_addr:  std_logic_vector(NoC_size-1 downto 0);  
signal Requests_FF: std_logic_vector(4 downto 0);
signal Requests_in: std_logic_vector(4 downto 0);
signal grant_signals: std_logic_vector(4 downto 0);

begin 

  cur_addr <= std_logic_vector(to_unsigned(cur_addr_rst, cur_addr'length));

  Requests_FF <= Req_N_FF & Req_E_FF & Req_W_FF & Req_S_FF & Req_L_FF;
  Requests_in <= Req_N_in & Req_E_in & Req_W_in & Req_S_in & Req_L_in;
  grant_signals <= grant_N & grant_E & grant_W & grant_S & grant_L;

-- Implementing checkers in form of concurrent assignments (combinational assertions)


--process (flit_type, empty, Requests_in)
--begin
--    if (flit_type = "001" and empty = '0' and Requests_in /= "00001" and Requests_in /= "00010" and 
--    	Requests_in /= "00100" and Requests_in /= "01000" and Requests_in /= "10000") then
--        err_header_not_empty_Requests_in_onehot <= '1';
--    else 
--        err_header_not_empty_Requests_in_onehot <= '0';
--    end if;
--end process;

-- Checked !

process (flit_type, empty, Requests_FF, Requests_in)
begin
    if (flit_type = "001" and empty = '1' and Requests_FF /= Requests_in) then
        err_header_empty_Requests_FF_Requests_in <= '1';
    else 
        err_header_empty_Requests_FF_Requests_in <= '0';
    end if;
end process;

-- Checked !

process (flit_type, empty, grants, Requests_in)
begin
    if (flit_type = "100" and empty = '0' and grants = '1' and Requests_in /= "00000") then
        err_tail_Requests_in_all_zero <= '1';
    else 
        err_tail_Requests_in_all_zero <= '0';
    end if;
end process;

-- Checked !

process (flit_type, empty, Requests_FF, Requests_in)
begin
    if (flit_type = "100" and empty = '1' and Requests_FF /= Requests_in) then
        err_tail_empty_Requests_FF_Requests_in <= '1';
    else 
        err_tail_empty_Requests_FF_Requests_in <= '0';
    end if;
end process;

-- Checked !

process (flit_type, empty, grants, Requests_FF, Requests_in)
begin
    if (flit_type = "100" and empty = '0' and grants = '0' and Requests_FF /= Requests_in) then
        err_tail_not_empty_not_grants_Requests_FF_Requests_in <= '1';
    else 
        err_tail_not_empty_not_grants_Requests_FF_Requests_in <= '0';
    end if;
end process;

-- Checked !

process (grant_signals, grants)
begin
    if ( (grant_signals = "00001" or grant_signals = "00010" or grant_signals = "00100" or
        grant_signals = "01000" or grant_signals = "10000") and grants = '0') then
        err_grants_onehot <= '1';
    else 
        err_grants_onehot <= '0';
    end if;
end process;

-- Checked !

process (grant_signals, grants)
begin
    if ( grant_signals = "00000" and grants = '1') then
        err_grants_mismatch <= '1';
    else 
        err_grants_mismatch <= '0';
    end if;
end process;

-- Checked !

process (flit_type, Requests_FF, Requests_FF, Requests_in)
begin
    if (flit_type /= "001" and flit_type /= "100" and Requests_FF /= Requests_in) then
        err_header_tail_Requests_FF_Requests_in <= '1';
    else 
        err_header_tail_Requests_FF_Requests_in <= '0';
    end if;
end process;

-- Checked !

process (cur_addr, dst_addr, N1_out)
begin
    if ( dst_addr(NoC_size-1 downto NoC_size/2) < cur_addr(NoC_size-1 downto NoC_size/2) and N1_out = '0') then
        err_dst_addr_cur_addr_N1 <= '1';
    else 
        err_dst_addr_cur_addr_N1 <= '0';
    end if;
end process;

-- Checked !

process (cur_addr, dst_addr, N1_out)
begin
    if ( dst_addr(NoC_size-1 downto NoC_size/2) >= cur_addr(NoC_size-1 downto NoC_size/2) and N1_out = '1') then
        err_dst_addr_cur_addr_not_N1 <= '1';
    else 
        err_dst_addr_cur_addr_not_N1 <= '0';
    end if;
end process;

-- Checked !

process (cur_addr, dst_addr, E1_out)
begin
    if ( cur_addr((NoC_size/2)-1 downto 0) < dst_addr((NoC_size/2)-1 downto 0) and E1_out = '0') then
        err_dst_addr_cur_addr_E1 <= '1';
    else 
        err_dst_addr_cur_addr_E1 <= '0';
    end if;
end process;

-- Checked !

process (cur_addr, dst_addr, E1_out)
begin
    if ( cur_addr((NoC_size/2)-1 downto 0) >= dst_addr((NoC_size/2)-1 downto 0) and E1_out = '1') then
        err_dst_addr_cur_addr_not_E1 <= '1';
    else 
        err_dst_addr_cur_addr_not_E1 <= '0';
    end if;
end process;

-- Checked !

process (cur_addr, dst_addr, W1_out)
begin
    if ( dst_addr((NoC_size/2)-1 downto 0) < cur_addr((NoC_size/2)-1 downto 0) and W1_out = '0') then
        err_dst_addr_cur_addr_W1 <= '1';
    else 
        err_dst_addr_cur_addr_W1 <= '0';
    end if;
end process;

-- Checked !

process (cur_addr, dst_addr, W1_out)
begin
    if ( dst_addr((NoC_size/2)-1 downto 0) >= cur_addr((NoC_size/2)-1 downto 0) and W1_out = '1') then
        err_dst_addr_cur_addr_not_W1 <= '1';
    else 
        err_dst_addr_cur_addr_not_W1 <= '0';
    end if;
end process;

-- Checked !

process (cur_addr, dst_addr, S1_out)
begin
    if ( cur_addr(NoC_size-1 downto NoC_size/2) < dst_addr(NoC_size-1 downto NoC_size/2) and S1_out = '0') then
        err_dst_addr_cur_addr_S1 <= '1';
    else 
        err_dst_addr_cur_addr_S1 <= '0';
    end if;
end process;

-- Checked !

process (cur_addr, dst_addr, S1_out)
begin
    if ( cur_addr(NoC_size-1 downto NoC_size/2) >= dst_addr(NoC_size-1 downto NoC_size/2) and S1_out = '1') then
        err_dst_addr_cur_addr_not_S1 <= '1';
    else 
        err_dst_addr_cur_addr_not_S1 <= '0';
    end if;
end process;

-- Checked !

process (flit_type, empty, dst_addr, cur_addr, Req_L_in)
begin
    if ( flit_type = "001" and empty = '0' and dst_addr = cur_addr and Req_L_in = '0') then
        err_dst_addr_cur_addr_not_Req_L_in <= '1';
    else 
        err_dst_addr_cur_addr_not_Req_L_in <= '0';
    end if;
end process;

-- Updated !

process (flit_type, empty, cur_addr, dst_addr, Req_L_in, Req_L_FF)
begin
    if ( flit_type = "001" and empty = '0' and cur_addr /= dst_addr and Req_L_in /= Req_L_FF) then
        err_dst_addr_cur_addr_Req_L_in <= '1';
    else 
        err_dst_addr_cur_addr_Req_L_in <= '0';
    end if;
end process;

-- Updated !

process (flit_type, empty, Req_N_in, N1_out, E1_out, W1_out, Rxy, Cx)
begin
    if ( flit_type = "001" and empty = '0' and Req_N_in /= ( ((N1_out and not E1_out and not W1_out) or (N1_out and E1_out and Rxy(0)) or (N1_out and W1_out and Rxy(1))) and Cx(0) ) ) then
        err_header_not_empty_Req_N_in <= '1';
    else 
        err_header_not_empty_Req_N_in <= '0';
    end if;
end process;

-- Updated !

process (flit_type, empty, Req_E_in, N1_out, E1_out, S1_out, Rxy, Cx)
begin
    if ( flit_type = "001" and empty = '0' and Req_E_in /= ( ((E1_out and not N1_out and not S1_out) or (E1_out and N1_out and Rxy(2)) or (E1_out and S1_out and Rxy(3))) and Cx(1) ) ) then
        err_header_not_empty_Req_E_in <= '1';
    else 
        err_header_not_empty_Req_E_in <= '0';
    end if;
end process;

-- Updated !

process (flit_type, empty, Req_W_in, N1_out, W1_out, S1_out, Rxy, Cx)
begin
    if ( flit_type = "001" and empty = '0' and Req_W_in /= ( ((W1_out and not N1_out and not S1_out) or (W1_out and N1_out and Rxy(4)) or (W1_out and S1_out and Rxy(5))) and Cx(2) ) ) then
        err_header_not_empty_Req_W_in <= '1';
    else 
        err_header_not_empty_Req_W_in <= '0';
    end if;
end process;

-- Updated !

process (flit_type, empty, Req_S_in, E1_out, W1_out, S1_out, Rxy, Cx)
begin
    if ( flit_type = "001" and empty = '0' and Req_S_in /= (((S1_out and not E1_out and not W1_out) or (S1_out and E1_out and Rxy(6)) or (S1_out and W1_out and Rxy(7))) and Cx(3)) ) then
        err_header_not_empty_Req_S_in <= '1';
    else 
        err_header_not_empty_Req_S_in <= '0';
    end if;
end process;

-- Updated !

process (flit_type, empty, N1_out, E1_out, W1_out, S1_out, Rxy, Cx, dst_addr, cur_addr, packet_drop_in)
begin
    if (flit_type = "001" and empty = '0' and ( ((((N1_out and not E1_out and not W1_out) or 
       (N1_out and E1_out and Rxy(0)) or (N1_out and W1_out and Rxy(1))) and Cx(0)) or 
       (((E1_out and not N1_out and not S1_out) or (E1_out and N1_out and Rxy(2)) or 
       (E1_out and S1_out and Rxy(3))) and Cx(1)) or (((W1_out and not N1_out and not S1_out) or 
       (W1_out and N1_out and Rxy(4)) or (W1_out and S1_out and Rxy(5))) and Cx(2)) or 
       (((S1_out and not E1_out and not W1_out) or (S1_out and E1_out and Rxy(6)) or 
       (S1_out and W1_out and Rxy(7))) and Cx(3))) ='0' ) and dst_addr /= cur_addr and packet_drop_in <= '0' ) then

        err_header_not_empty_packet_drop_in <= '1';
    else 
        err_header_not_empty_packet_drop_in <= '0';
    end if;
end process;

-- Added !

process (flit_type, empty, N1_out, E1_out, W1_out, S1_out, Rxy, Cx, dst_addr, cur_addr, packet_drop_in, packet_drop)
begin
    if (flit_type = "001" and empty = '0' and ( ( ((((N1_out and not E1_out and not W1_out) or 
       (N1_out and E1_out and Rxy(0)) or (N1_out and W1_out and Rxy(1))) and Cx(0)) or 
       (((E1_out and not N1_out and not S1_out) or (E1_out and N1_out and Rxy(2)) or 
       (E1_out and S1_out and Rxy(3))) and Cx(1)) or (((W1_out and not N1_out and not S1_out) or 
       (W1_out and N1_out and Rxy(4)) or (W1_out and S1_out and Rxy(5))) and Cx(2)) or 
       (((S1_out and not E1_out and not W1_out) or (S1_out and E1_out and Rxy(6)) or 
       (S1_out and W1_out and Rxy(7))) and Cx(3))) ='1' ) or (dst_addr = cur_addr) ) and packet_drop_in /= packet_drop ) then

        err_header_not_empty_dst_addr_cur_addr_equal_packet_drop_in_packet_drop_equal <= '1';
    else 
        err_header_not_empty_dst_addr_cur_addr_equal_packet_drop_in_packet_drop_equal <= '0';
    end if;
end process;

-- Added !

process (flit_type, empty, packet_drop_in, packet_drop)
begin
    if (flit_type = "001" and empty = '1' and packet_drop_in /= packet_drop ) then

        err_header_empty_packet_drop_in_packet_drop_equal <= '1';
    else 
        err_header_empty_packet_drop_in_packet_drop_equal <= '0';
    end if;
end process;

-- Added !

process (flit_type, empty, packet_drop, packet_drop_in)
begin
    if (flit_type = "100" and empty = '0' and packet_drop = '1' and packet_drop_in /= '0' ) then

        err_tail_not_empty_packet_drop_not_packet_drop_in <= '1';
    else 
        err_tail_not_empty_packet_drop_not_packet_drop_in <= '0';
    end if;
end process;

-- Added !

process (flit_type, empty, packet_drop, packet_drop_in)
begin
    if (flit_type = "100" and empty = '0' and packet_drop = '0' and packet_drop_in /= packet_drop ) then

        err_tail_not_empty_not_packet_drop_packet_drop_in_packet_drop_equal <= '1';
    else 
        err_tail_not_empty_not_packet_drop_packet_drop_in_packet_drop_equal <= '0';
    end if;
end process;

-- Added !

process (flit_type, empty, packet_drop_in, packet_drop)
begin
    if ( ((flit_type /= "001" and flit_type /= "100") or empty = '1') and packet_drop_in /= packet_drop ) then

        err_invalid_or_body_flit_packet_drop_in_packet_drop_equal <= '1';
    else 
        err_invalid_or_body_flit_packet_drop_in_packet_drop_equal <= '0';
    end if;
end process;

-- Added !

process (packet_drop_order, packet_drop)
begin
    if (packet_drop_order /= packet_drop) then

        err_packet_drop_order <= '1';
    else 
        err_packet_drop_order <= '0';
    end if;
end process;

-- Added !


end behavior;