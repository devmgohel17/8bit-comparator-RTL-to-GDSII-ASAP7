###############################################################################
# Created by write_sdc
###############################################################################
current_design comparator_8bit
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name virtual_clk -period 1000.0000 
set_input_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {A[0]}]
set_input_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {A[1]}]
set_input_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {A[2]}]
set_input_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {A[3]}]
set_input_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {A[4]}]
set_input_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {A[5]}]
set_input_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {A[6]}]
set_input_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {A[7]}]
set_input_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {B[0]}]
set_input_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {B[1]}]
set_input_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {B[2]}]
set_input_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {B[3]}]
set_input_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {B[4]}]
set_input_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {B[5]}]
set_input_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {B[6]}]
set_input_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {B[7]}]
set_output_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {EQ}]
set_output_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {GT}]
set_output_delay 100.0000 -clock [get_clocks {virtual_clk}] -add_delay [get_ports {LT}]
###############################################################################
# Environment
###############################################################################
###############################################################################
# Design Rules
###############################################################################
