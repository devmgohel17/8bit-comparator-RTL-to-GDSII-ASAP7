# Virtual clock for combinational timing analysis
create_clock -name virtual_clk -period 1000

# Input arrival delays
set_input_delay 100 -clock virtual_clk [get_ports {A* B*}]

# Output required-time constraints
set_output_delay 100 -clock virtual_clk [get_ports {GT EQ LT}]
