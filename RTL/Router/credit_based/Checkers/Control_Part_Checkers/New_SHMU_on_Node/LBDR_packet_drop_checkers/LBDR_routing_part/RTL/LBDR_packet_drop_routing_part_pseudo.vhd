--Copyright (C) 2016 Siavoosh Payandeh Azad Behrad Niazmand

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.ALL;

entity LBDR_packet_drop_routing_part_pseudo is
    generic (
        cur_addr_rst: integer := 5;
        NoC_size: integer := 4
    );
    port (  empty: in  std_logic;
            flit_type: in std_logic_vector(2 downto 0);
            dst_addr: in std_logic_vector(NoC_size-1 downto 0);
            grant_N, grant_E, grant_W, grant_S, grant_L: in std_logic;
            Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF: in std_logic;
            Cx: in std_logic_vector(3 downto 0);
            Rxy: in std_logic_vector(7 downto 0);
            packet_drop: in std_logic;

            packet_drop_order: out std_logic;
            packet_drop_in: out std_logic;
            Req_N_in, Req_E_in, Req_W_in, Req_S_in, Req_L_in: out std_logic;
            N1_out, E1_out, W1_out, S1_out: out std_logic;
            grants_out: out std_logic
            );
end LBDR_packet_drop_routing_part_pseudo;

architecture behavior of LBDR_packet_drop_routing_part_pseudo is

  signal cur_addr:  std_logic_vector(NoC_size-1 downto 0);
  signal N1, E1, W1, S1  :std_logic;
  signal grants: std_logic;
  --signal packet_drop, packet_drop_in: std_logic;
  --signal ReConf_FF_in, ReConf_FF_out: std_logic;
begin

 grants <= grant_N or grant_E or grant_W or grant_S or grant_L;
 grants_out <= grants;


  cur_addr <= std_logic_vector(to_unsigned(cur_addr_rst, cur_addr'length));

  N1 <= '1' when  dst_addr(NoC_size-1 downto NoC_size/2) < cur_addr(NoC_size-1 downto NoC_size/2) else '0';
  E1 <= '1' when  cur_addr((NoC_size/2)-1 downto 0) < dst_addr((NoC_size/2)-1 downto 0) else '0';
  W1 <= '1' when  dst_addr((NoC_size/2)-1 downto 0) < cur_addr((NoC_size/2)-1 downto 0) else '0';
  S1 <= '1' when  cur_addr(NoC_size-1 downto NoC_size/2) < dst_addr(NoC_size-1 downto NoC_size/2) else '0';

  -- Taking X1 signals to the output interface for checking with checkers
  N1_out <= N1;
  E1_out <= E1;
  W1_out <= W1;
  S1_out <= S1;

--process(clk, reset)
--begin
--if reset = '0' then
--  Rxy <= Rxy_reconf;
--  Req_N_FF <= '0';
--  Req_E_FF <= '0';
--  Req_W_FF <= '0';
--  Req_S_FF <= '0';
--  Req_L_FF <= '0';
--  Cx <= std_logic_vector(to_unsigned(Cx_rst, Cx'length));
--  Temp_Cx <= (others => '0');
--  ReConf_FF_out <= '0';
--  reconfig_cx <= '0';
--  packet_drop <= '0';
--elsif clk'event and clk = '1' then
--  Rxy <= Rxy_in;
--  Req_N_FF <= Req_N_in;
--  Req_E_FF <= Req_E_in;
--  Req_W_FF <= Req_W_in;
--  Req_S_FF <= Req_S_in;
--  Req_L_FF <= Req_L_in;
--  ReConf_FF_out <= ReConf_FF_in;
--  Cx <= Cx_in;
--  reconfig_cx <= reconfig_cx_in;
--  Temp_Cx <= Temp_Cx_in;
--  packet_drop <= packet_drop_in;
--end if;
--end process;


-- The combionational part


process(N1, E1, W1, S1, Rxy, Cx, flit_type, dst_addr, cur_addr, empty, Req_N_FF, Req_E_FF, Req_W_FF, Req_S_FF, Req_L_FF, grants, packet_drop) begin
 packet_drop_in <= packet_drop;

 if flit_type = "001" and empty = '0' then
        Req_N_in <= ((N1 and not E1 and not W1) or (N1 and E1 and Rxy(0)) or (N1 and W1 and Rxy(1))) and Cx(0);
        Req_E_in <= ((E1 and not N1 and not S1) or (E1 and N1 and Rxy(2)) or (E1 and S1 and Rxy(3))) and Cx(1);
        Req_W_in <= ((W1 and not N1 and not S1) or (W1 and N1 and Rxy(4)) or (W1 and S1 and Rxy(5))) and Cx(2);
        Req_S_in <= ((S1 and not E1 and not W1) or (S1 and E1 and Rxy(6)) or (S1 and W1 and Rxy(7))) and Cx(3);

        if dst_addr = cur_addr then
        	Req_L_in <= '1';
        else
        	Req_L_in <= Req_L_FF;
        end if;

        if ((((N1 and not E1 and not W1) or (N1 and E1 and Rxy(0)) or (N1 and W1 and Rxy(1))) and Cx(0)) or
           (((E1 and not N1 and not S1) or (E1 and N1 and Rxy(2)) or (E1 and S1 and Rxy(3))) and Cx(1)) or
           (((W1 and not N1 and not S1) or (W1 and N1 and Rxy(4)) or (W1 and S1 and Rxy(5))) and Cx(2)) or
           (((S1 and not E1 and not W1) or (S1 and E1 and Rxy(6)) or (S1 and W1 and Rxy(7))) and Cx(3))) ='0' and
             (dst_addr /= cur_addr) then
          packet_drop_in <= '1';
        end if;

  elsif flit_type = "100" and empty = '0' and grants = '1' then
        Req_N_in <= '0';
        Req_E_in <= '0';
        Req_W_in <= '0';
        Req_S_in <= '0';
        Req_L_in <= '0';

  else
        Req_N_in <= Req_N_FF;
        Req_E_in <= Req_E_FF;
        Req_W_in <= Req_W_FF;
        Req_S_in <= Req_S_FF;
        Req_L_in <= Req_L_FF;
  end if;

   if flit_type = "100" and empty = '0' then
    if packet_drop = '1' then
          packet_drop_in <= '0';
    end if;
  end if;
end process;

packet_drop_order <= packet_drop;

END;