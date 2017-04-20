# IJTAG
set_property PACKAGE_PIN AB6    [get_ports IJTAG_TCK]   #JC1_N
set_property PACKAGE_PIN AB7    [get_ports IJTAG_SEL]   #JC1_P
set_property PACKAGE_PIN AA4    [get_ports IJTAG_SI]    #JC2_N
set_property PACKAGE_PIN Y4     [get_ports IJTAG_SE]    #JC2_P
set_property PACKAGE_PIN T6     [get_ports IJTAG_UE]    #JC3_N
set_property PACKAGE_PIN R6     [get_ports IJTAG_CE]    #JC3_P
set_property PACKAGE_PIN U4     [get_ports IJTAG_SO]    #JC4_N

set_property PACKAGE_PIN T4    [get_ports toF] #JC4_P
set_property PACKAGE_PIN W7    [get_ports toC] #JD1_N

# UART
set_property PACKAGE_PIN W12    [get_ports UART_0_IN]   #JB1
set_property PACKAGE_PIN W11    [get_ports UART_0_OUT]  #JB2
set_property PACKAGE_PIN V10    [get_ports UART_1_IN]   #JB3
set_property PACKAGE_PIN W8     [get_ports UART_1_OUT]  #JB4
set_property PACKAGE_PIN V12    [get_ports UART_2_IN]   #JB7
set_property PACKAGE_PIN W10    [get_ports UART_2_OUT]  #JB8
set_property PACKAGE_PIN V9     [get_ports UART_3_IN]   JB19
set_property PACKAGE_PIN V8     [get_ports UART_3_OUT]  JB10

# GPIO_in
set_property PACKAGE_PIN F22    [get_ports GPIO_in[0]  #SW0
set_property PACKAGE_PIN G22    [get_ports GPIO_in[1]  #SW1
set_property PACKAGE_PIN H22    [get_ports GPIO_in[2]  #SW2
set_property PACKAGE_PIN F21    [get_ports GPIO_in[3]  #SW3
set_property PACKAGE_PIN H19    [get_ports GPIO_in[4]  #SW4
set_property PACKAGE_PIN H18    [get_ports GPIO_in[5]  #SW5
set_property PACKAGE_PIN H17    [get_ports GPIO_in[6]  #SW6
set_property PACKAGE_PIN M15    [get_ports GPIO_in[7]  #SW7
set_property PACKAGE_PIN V7     [get_ports GPIO_in[8]  #JD1_P
set_property PACKAGE_PIN V4     [get_ports GPIO_in[9]  #JD2_N

set_property PACKAGE_PIN V5    [get_ports GPIO_in[10]]  #JD2_P
set_property PACKAGE_PIN W5    [get_ports GPIO_in[11]]  #JD3_N
set_property PACKAGE_PIN W6    [get_ports GPIO_in[12]]  #JD3_P
set_property PACKAGE_PIN U5    [get_ports GPIO_in[13]]  #JD4_N
set_property PACKAGE_PIN U6    [get_ports GPIO_in[14]]  #JD4_P
set_property PACKAGE_PIN A6    [get_ports GPIO_in[15]]  #JE2
set_property PACKAGE_PIN G7    [get_ports GPIO_in[16]]  #JE3
set_property PACKAGE_PIN B4    [get_ports GPIO_in[17]]  #JE4
set_property PACKAGE_PIN C5    [get_ports GPIO_in[18]]  #JE7
set_property PACKAGE_PIN G6    [get_ports GPIO_in[19]]  #JE8

set_property PACKAGE_PIN C4    [get_ports GPIO_in[20]]  #JE9
set_property PACKAGE_PIN B6    [get_ports GPIO_in[21]]  #JE10

# GPIO_out
set_property PACKAGE_PIN T22    [get_ports GPIO_out[0]]     #LD0
set_property PACKAGE_PIN T21    [get_ports GPIO_out[1]]     #LD1
set_property PACKAGE_PIN U22    [get_ports GPIO_out[2]]     #LD2
set_property PACKAGE_PIN U21    [get_ports GPIO_out[3]]     #LD3
set_property PACKAGE_PIN V22    [get_ports GPIO_out[4]]     #LD4
set_property PACKAGE_PIN W22    [get_ports GPIO_out[5]]     #LD5
set_property PACKAGE_PIN V19    [get_ports GPIO_out[6]]     #LD6
set_property PACKAGE_PIN V14    [get_ports GPIO_out[7]]     #LD7
set_property PACKAGE_PIN Y11    [get_ports GPIO_out[8]]     #JA1
set_property PACKAGE_PIN AA11    [get_ports GPIO_out[9]]    #JA2

set_property PACKAGE_PIN Y10    [get_ports GPIO_out[10]]  #JA3
set_property PACKAGE_PIN AA9    [get_ports GPIO_out[11]]  #JA4
set_property PACKAGE_PIN AB11   [get_ports GPIO_out[12]]  #JA7
set_property PACKAGE_PIN AB10   [get_ports GPIO_out[13]]  #JA8
set_property PACKAGE_PIN AB9    [get_ports GPIO_out[14]]  #JA9
set_property PACKAGE_PIN AA8    [get_ports GPIO_out[15]]  #JA10




# ----------------------------------------------------------------------------
# IOSTANDARD Constraints
#
# Note that these IOSTANDARD constraints are applied to all IOs currently
# assigned within an I/O bank.  If these IOSTANDARD constraints are
# evaluated prior to other PACKAGE_PIN constraints being applied, then
# the IOSTANDARD specified will likely not be applied properly to those
# pins.  Therefore, bank wide IOSTANDARD constraints should be placed
# within the XDC file in a location that is evaluated AFTER all
# PACKAGE_PIN constraints within the target bank have been evaluated.
#
# Un-comment one or more of the following IOSTANDARD constraints according to
# the bank pin assignments that are required within a design.
# ----------------------------------------------------------------------------

# Note that the bank voltage for IO Bank 33 is fixed to 3.3V on ZedBoard.
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]];

# Set the bank voltage for IO Bank 34 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 34]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 34]];
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 34]];

# Set the bank voltage for IO Bank 35 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 35]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 35]];
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 35]];

# Note that the bank voltage for IO Bank 13 is fixed to 3.3V on ZedBoard.
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]];
