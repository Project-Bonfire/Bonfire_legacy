--Copyright (C) 2016 Siavoosh Payandeh Azad

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;
 use ieee.math_real.all;
 use std.textio.all;
 use ieee.std_logic_misc.all;

package TB_Package is
   procedure NI_control(network_size, frame_length, current_address, initial_delay, min_packet_size, max_packet_size: in integer;
                      finish_time: in time; 
                      signal clk:                      in std_logic;
                      -- NI configuration
                      signal reserved_address :        in std_logic_vector(29 downto 0);
                      signal flag_address :            in std_logic_vector(29 downto 0) ; -- reserved address for the memory mapped I/O
                      signal counter_address :         in std_logic_vector(29 downto 0);
                      signal reconfiguration_address : in std_logic_vector(29 downto 0);  -- reserved address for reconfiguration register
                      signal self_diagnosis_address :  in std_logic_vector(29 downto 0);
                      -- NI signals
                      signal enable:                   out std_logic; 
                      signal write_byte_enable:        out std_logic_vector(3 downto 0);
                      signal address:                  out std_logic_vector(31 downto 2); 
                      signal data_write:               out std_logic_vector(31 downto 0);
                      signal data_read:                in std_logic_vector(31 downto 0);
                      signal test:                out std_logic_vector(31 downto 0)); 
 
end TB_Package;

package body TB_Package is
  constant Header_type : std_logic_vector := "001";
  constant Body_type : std_logic_vector := "010";
  constant Tail_type : std_logic_vector := "100";


  procedure NI_control(network_size, frame_length, current_address, initial_delay, min_packet_size, max_packet_size: in integer;
                      finish_time: in time; 
                      signal clk:                      in std_logic;
                      -- NI configuration
                      signal reserved_address :        in std_logic_vector(29 downto 0);
                      signal flag_address :            in std_logic_vector(29 downto 0) ; -- reserved address for the memory mapped I/O
                      signal counter_address :         in std_logic_vector(29 downto 0);
                      signal reconfiguration_address : in std_logic_vector(29 downto 0);  -- reserved address for reconfiguration register
                      signal self_diagnosis_address :  in std_logic_vector(29 downto 0);
                      -- NI signals
                      signal enable:                   out std_logic; 
                      signal write_byte_enable:        out std_logic_vector(3 downto 0);
                      signal address:                  out std_logic_vector(31 downto 2); 
                      signal data_write:               out std_logic_vector(31 downto 0);
                      signal data_read:                in std_logic_vector(31 downto 0);
                      signal test:                out std_logic_vector(31 downto 0)) is
    -- variables for random functions
    constant DATA_WIDTH : integer := 32;
    variable seed1 :positive ;
    variable seed2 :positive ;
    variable rand : real ;
    --file handling variables
    variable SEND_LINEVARIABLE : line; 
    file SEND_FILE : text;

    variable RECEIVED_LINEVARIABLE : line; 
    file RECEIVED_FILE : text;

    variable DIAGNOSIS_LINEVARIABLE : line; 
    file DIAGNOSIS_FILE : text;
    -- receiving variables 
    variable receive_source_node, receive_destination_node, receive_packet_id, receive_counter, receive_packet_length: integer;
    variable diagnosis_source_node, diagnosis_destination_node, diagnosis_packet_id, diagnosis_counter, diagnosis_packet_length: integer;
    
    -- sending variables
    variable send_destination_node, send_counter, send_id_counter: integer:= 0;
    variable send_packet_length: integer:= 8;
    type state_type is (Idle, Header_flit, Body_flit, Tail_flit);
    variable  state : state_type;

    variable  frame_starting_delay : integer:= 0;
    variable frame_counter: integer:= 0;
    variable diagnosis : std_logic := '0';
    variable diagnosis_data: std_logic_vector(24 downto 0);

    begin

    file_open(DIAGNOSIS_FILE,"diagnosis.txt",WRITE_MODE);  
    file_open(RECEIVED_FILE,"received.txt",WRITE_MODE);  
    file_open(SEND_FILE,"sent.txt",WRITE_MODE);  

    enable <= '1';
    state :=  Idle;
    send_packet_length := min_packet_size;
    uniform(seed1, seed2, rand);
    frame_starting_delay := integer(((integer(rand*100.0)*(frame_length - 2*max_packet_size)))/100);

    wait until clk'event and clk ='0';
    address <= reconfiguration_address;
    wait until clk'event and clk ='0';
    write_byte_enable <= "1111";
    if current_address = 0 then 
      data_write <= "00000000000000000000" & std_logic_vector(to_unsigned(10, 4)) & std_logic_vector(to_unsigned(60, 8));
    elsif current_address = 1 then 
      data_write <= "00000000000000000000" & std_logic_vector(to_unsigned(12, 4)) & std_logic_vector(to_unsigned(60, 8));
    elsif current_address = 2 then 
      data_write <= "00000000000000000000" & std_logic_vector(to_unsigned(3, 4)) & std_logic_vector(to_unsigned(60, 8));
    elsif current_address = 3 then  
      data_write <= "00000000000000000000" & std_logic_vector(to_unsigned(5, 4)) & std_logic_vector(to_unsigned(60, 8));
    end if;
    wait until clk'event and clk ='0';
    write_byte_enable <= "0000";
    data_write <= (others =>'0');

    while true loop 
      -- read the flag status
      address <= flag_address;  
      write_byte_enable <= "0000";  
      wait until clk'event and clk ='0';

      --flag register is organized like this:
      --       .-------------------------------------------------.
      --       | N2P_empty | P2N_full | self_diagnosis_flag | ...| 
      --       '-------------------------------------------------'

      if data_read(29) = '1' then  -- self diagnosis data is ready!
              -- read the received self diagnosis data status
              address <= self_diagnosis_address;
              write_byte_enable <= "0000";
              wait until clk'event and clk ='0';
              test <= data_read;

              write(DIAGNOSIS_LINEVARIABLE, string'("Self diagnosis of SHMU Node:"));
              writeline(DIAGNOSIS_FILE, DIAGNOSIS_LINEVARIABLE);

              if data_read(0) = '1' then 
                  write(DIAGNOSIS_LINEVARIABLE, string'("Local input is link broken!"));
                  writeline(DIAGNOSIS_FILE, DIAGNOSIS_LINEVARIABLE);
                end if;            
                
                if data_read(1) = '1' then 
                  write(DIAGNOSIS_LINEVARIABLE, string'("South input is link broken!"));
                  writeline(DIAGNOSIS_FILE, DIAGNOSIS_LINEVARIABLE);
                end if;  

                if data_read(2) = '1' then 
                  write(DIAGNOSIS_LINEVARIABLE, string'("West input is link broken!"));
                  writeline(DIAGNOSIS_FILE, DIAGNOSIS_LINEVARIABLE);
                end if;  

                if data_read(3) = '1' then 
                  write(DIAGNOSIS_LINEVARIABLE, string'("East input is link broken!"));
                  writeline(DIAGNOSIS_FILE, DIAGNOSIS_LINEVARIABLE);
                end if;  

                if data_read(4) = '1' then 
                  write(DIAGNOSIS_LINEVARIABLE, string'("North input is link broken!"));
                  writeline(DIAGNOSIS_FILE, DIAGNOSIS_LINEVARIABLE);
                end if;  

              write(DIAGNOSIS_LINEVARIABLE, string'("--------------------------------"));
              writeline(DIAGNOSIS_FILE, DIAGNOSIS_LINEVARIABLE);

              wait until clk'event and clk ='0';
              
      elsif data_read(31) = '0' then  -- N2P is not empty, can receive flit
          -- read the received data status
          address <= counter_address;
          write_byte_enable <= "0000";
          wait until clk'event and clk ='0';
          
          
          -- read the received data status
          address <= reserved_address;
          write_byte_enable <= "0000";
          wait until clk'event and clk ='0';
          
          if (data_read(DATA_WIDTH-1 downto DATA_WIDTH-3) = "001") then -- got header flit
              receive_packet_length := to_integer(unsigned(data_read(28 downto 17)));
              receive_destination_node := to_integer(unsigned(data_read(16 downto 13)));
              receive_source_node := to_integer(unsigned(data_read(12 downto 9)));
              receive_packet_id := to_integer(unsigned(data_read(8 downto 1)));
              receive_counter := 1; 
              diagnosis :=  '0';
              diagnosis_data := (others => '0');
          end if;  
          
          if  (data_read(DATA_WIDTH-1 downto DATA_WIDTH-3) = "010") then  -- got body flit
              receive_counter := receive_counter+1; 
              if data_read(28 downto 13) =  "0100011001000100" then 
                  diagnosis :=  '1';
                  diagnosis_data(11 downto 0) := data_read(12 downto 1); 
              end if;
          end if; 
          
          if (data_read(DATA_WIDTH-1 downto DATA_WIDTH-3) = "100") then -- got tail flit
              receive_counter := receive_counter+1; 
              if diagnosis = '0' then 
                write(RECEIVED_LINEVARIABLE, "Packet received at " & time'image(now) & " From: " & integer'image(receive_source_node) & " to: " & integer'image(receive_destination_node) & " length: "& integer'image(receive_packet_length) & " actual length: "& integer'image(receive_counter)  & " id: "& integer'image(receive_packet_id));
                writeline(RECEIVED_FILE, RECEIVED_LINEVARIABLE);
              else
                diagnosis_data(24 downto 12) := data_read(28 downto 16); 

                write(DIAGNOSIS_LINEVARIABLE, "Packet received at " & time'image(now) & " From: " & integer'image(receive_source_node) & " to: " & integer'image(receive_destination_node) & " length: "& integer'image(receive_packet_length) & " actual length: "& integer'image(receive_counter)  & " id: "& integer'image(receive_packet_id) & " diagnosis: " );
                writeline(DIAGNOSIS_FILE, DIAGNOSIS_LINEVARIABLE);
                
                write(DIAGNOSIS_LINEVARIABLE, to_bitvector(diagnosis_data));
                writeline(DIAGNOSIS_FILE, DIAGNOSIS_LINEVARIABLE);

                if diagnosis_data(0) = '1' then 
                  write(DIAGNOSIS_LINEVARIABLE, string'("Local input is link broken!"));
                  writeline(DIAGNOSIS_FILE, DIAGNOSIS_LINEVARIABLE);
                end if;            
                
                if diagnosis_data(1) = '1' then 
                  write(DIAGNOSIS_LINEVARIABLE, string'("South input is link broken!"));
                  writeline(DIAGNOSIS_FILE, DIAGNOSIS_LINEVARIABLE);
                end if;  

                if diagnosis_data(2) = '1' then 
                  write(DIAGNOSIS_LINEVARIABLE, string'("West input is link broken!"));
                  writeline(DIAGNOSIS_FILE, DIAGNOSIS_LINEVARIABLE);
                end if;  

                if diagnosis_data(3) = '1' then 
                  write(DIAGNOSIS_LINEVARIABLE, string'("East input is link broken!"));
                  writeline(DIAGNOSIS_FILE, DIAGNOSIS_LINEVARIABLE);
                end if;  

                if diagnosis_data(4) = '1' then 
                  write(DIAGNOSIS_LINEVARIABLE, string'("North input is link broken!"));
                  writeline(DIAGNOSIS_FILE, DIAGNOSIS_LINEVARIABLE);
                end if;  
                write(DIAGNOSIS_LINEVARIABLE, string'("--------------------------------"));
                writeline(DIAGNOSIS_FILE, DIAGNOSIS_LINEVARIABLE);
              end if;
          end if;

      elsif data_read(30) = '0' then -- P2N is not full, can send flit
          
          
          if frame_counter >= frame_starting_delay  then
              
              if state = Idle and now  < finish_time then
                  if frame_counter < frame_starting_delay+1 then
                    
                    state :=  Header_flit;
                    send_counter := send_counter+1;
                    -- generating the destination address
                    uniform(seed1, seed2, rand);
                    send_destination_node := integer(rand*real((network_size**2)-1));
                    while (send_destination_node = current_address) loop 
                        uniform(seed1, seed2, rand);
                        send_destination_node := integer(rand*real((network_size**2)-1));
                    end loop;
                    --generating the packet length
                    uniform(seed1, seed2, rand);
                    send_packet_length := integer((integer(rand*100.0)*frame_length)/300);
                    if (send_packet_length < min_packet_size) then 
                        send_packet_length:=min_packet_size;
                    end if;
                    if (send_packet_length > max_packet_size) then 
                        send_packet_length:=max_packet_size;
                    end if;
                    -- this is the header flit
                    address <= reserved_address;
                    write_byte_enable <= "1111";
                    data_write <= std_logic_vector(to_unsigned(send_destination_node, 4)) & "0000" & std_logic_vector(to_unsigned(send_packet_length, 8)) & "0000000000000000";
                    write(SEND_LINEVARIABLE, "Packet generated at " & time'image(now) & " From " & integer'image(current_address) & " to " & integer'image(send_destination_node) & " with length: "& integer'image(send_packet_length)  & " id: " & integer'image(send_id_counter));
                    writeline(SEND_FILE, SEND_LINEVARIABLE);
                  else
                    state :=  Idle;
                  end if;
              elsif state = Header_flit then
                  -- first body flit
                  address <= reserved_address;
                  write_byte_enable <= "1111";
                  data_write <= "0000" & std_logic_vector(to_unsigned(integer(rand*1000.0), 28));
                  send_counter := send_counter+1;
                  state :=  Body_flit;
              elsif state = Body_flit then
                  -- rest of body flits
                  address <= reserved_address;
                  write_byte_enable <= "1111";
                  data_write <= "0000" & std_logic_vector(to_unsigned(integer(rand*1000.0), 28));
                  send_counter := send_counter+1;
                  if send_counter = send_packet_length-1 then 
                      state :=  Tail_flit;
                  else
                      state :=  Body_flit;
                  end if;
              elsif state = Tail_flit then
                  -- tail flit
                  address <= reserved_address;
                  write_byte_enable <= "1111";
                  data_write <= "0000" & std_logic_vector(to_unsigned(integer(rand*1000.0), 28));
                  send_counter := 0;
                  state :=  Idle;
                  send_id_counter := send_id_counter + 1;
              end if;
            end if;

            frame_counter := frame_counter + 1;
            if frame_counter = frame_length then
                frame_counter := 0;
                frame_starting_delay := integer(((integer(rand*100.0)*(frame_length - 2*max_packet_size)))/100);
            end if;

            wait until clk'event and clk ='0';
   
      end if;

     
    end loop;
    file_close(SEND_FILE);
    file_close(RECEIVED_FILE);
    file_close(DIAGNOSIS_FILE);
  end NI_control;


end TB_Package;
