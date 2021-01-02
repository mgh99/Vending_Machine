#CLK

set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { CLK }]
create_clock -add -name sys_clk_pin -period 10.00 [get_ports {CLK}]

#RST

set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { RST }]; 

#Coin_in

set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { X0 }]; 
set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { X1 }]; 
set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { X2 }]; 

#lata

set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { lata[0] }]; 
