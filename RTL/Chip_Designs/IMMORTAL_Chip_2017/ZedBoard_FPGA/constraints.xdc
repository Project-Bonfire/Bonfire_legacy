# IJTAG
#set_property PACKAGE_PIN AB6    [get_ports IJTAG_TCK]
set_property PACKAGE_PIN AB6    [get_ports IJTAG_SEL]
set_property PACKAGE_PIN AB7    [get_ports IJTAG_SI]
set_property PACKAGE_PIN AA4     [get_ports IJTAG_SE]
set_property PACKAGE_PIN Y4     [get_ports IJTAG_UE]
set_property PACKAGE_PIN T6     [get_ports IJTAG_CE]
set_property PACKAGE_PIN R6     [get_ports IJTAG_SO]

set_property PACKAGE_PIN U4    [get_ports toF]
set_property PACKAGE_PIN T4    [get_ports toC]

# UART
set_property PACKAGE_PIN W12    [get_ports UART_0_IN]
set_property PACKAGE_PIN W11    [get_ports UART_0_OUT]
set_property PACKAGE_PIN V10    [get_ports UART_1_IN]
set_property PACKAGE_PIN W8     [get_ports UART_1_OUT]
set_property PACKAGE_PIN V12    [get_ports UART_2_IN]
set_property PACKAGE_PIN W10    [get_ports UART_2_OUT]
set_property PACKAGE_PIN V9     [get_ports UART_3_IN]
set_property PACKAGE_PIN V8     [get_ports UART_3_OUT]

# GPIO_in
set_property PACKAGE_PIN F22    [get_ports GPIO_in[0]]
set_property PACKAGE_PIN G22    [get_ports GPIO_in[1]]
set_property PACKAGE_PIN H22    [get_ports GPIO_in[2]]
set_property PACKAGE_PIN F21    [get_ports GPIO_in[3]]
set_property PACKAGE_PIN H19    [get_ports GPIO_in[4]]
set_property PACKAGE_PIN H18    [get_ports GPIO_in[5]]
set_property PACKAGE_PIN H17    [get_ports GPIO_in[6]]
set_property PACKAGE_PIN M15    [get_ports GPIO_in[7]]
set_property PACKAGE_PIN V7     [get_ports GPIO_in[8]]
set_property PACKAGE_PIN V4     [get_ports GPIO_in[9]]

set_property PACKAGE_PIN V5    [get_ports GPIO_in[10]]
set_property PACKAGE_PIN W5    [get_ports GPIO_in[11]]
set_property PACKAGE_PIN W6    [get_ports GPIO_in[12]]
set_property PACKAGE_PIN U5    [get_ports GPIO_in[13]]
set_property PACKAGE_PIN U6    [get_ports GPIO_in[14]]
#set_property PACKAGE_PIN A6    [get_ports GPIO_in[15]]
#set_property PACKAGE_PIN G7    [get_ports GPIO_in[16]]
#set_property PACKAGE_PIN B4    [get_ports GPIO_in[17]]
#set_property PACKAGE_PIN C5    [get_ports GPIO_in[18]]
#set_property PACKAGE_PIN G6    [get_ports GPIO_in[19]]

#set_property PACKAGE_PIN C4    [get_ports GPIO_in[20]]
#set_property PACKAGE_PIN B6    [get_ports GPIO_in[21]]

# GPIO_out
set_property PACKAGE_PIN T22    [get_ports GPIO_out[0]]
set_property PACKAGE_PIN T21    [get_ports GPIO_out[1]]
set_property PACKAGE_PIN U22    [get_ports GPIO_out[2]]
set_property PACKAGE_PIN U21    [get_ports GPIO_out[3]]
set_property PACKAGE_PIN V22    [get_ports GPIO_out[4]]
set_property PACKAGE_PIN W22    [get_ports GPIO_out[5]]
set_property PACKAGE_PIN V19    [get_ports GPIO_out[6]]
set_property PACKAGE_PIN V14    [get_ports GPIO_out[7]]
set_property PACKAGE_PIN Y11    [get_ports GPIO_out[8]]
set_property PACKAGE_PIN AA11    [get_ports GPIO_out[9]]

set_property PACKAGE_PIN Y10    [get_ports GPIO_out[10]]
set_property PACKAGE_PIN AA9    [get_ports GPIO_out[11]]
set_property PACKAGE_PIN AB11   [get_ports GPIO_out[12]]
set_property PACKAGE_PIN AB10   [get_ports GPIO_out[13]]
set_property PACKAGE_PIN AB9    [get_ports GPIO_out[14]]
set_property PACKAGE_PIN AA8    [get_ports GPIO_out[15]]




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
