#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3

#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk}        -period 20.000 -waveform { 0.000 10.000 } [get_ports {clk_i}]

# Create a virual clock for IO constraints

create_clock -period 20.000 -name virtual_clock_input -waveform {0.000 10.000}

derive_clock_uncertainty

#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -clock virtual_clock_input -min 0.000 [get_ports {rstn_i}]
set_input_delay -clock virtual_clock_input -max 0.000 [get_ports {rstn_i}]

set_input_delay  -clock virtual_clock_input  -min 0.000 [get_ports {altera_reserved_tdi}] 
set_input_delay  -clock virtual_clock_input  -min 0.000 [get_ports {altera_reserved_tms}] 

set_input_delay  -clock virtual_clock_input  -max 0.000 [get_ports {altera_reserved_tdi}] 
set_input_delay  -clock virtual_clock_input  -max 0.000 [get_ports {altera_reserved_tms}] 

#**************************************************************
# Set Output Delay
#**************************************************************
set_output_delay -clock clk -min 0.000 [get_ports {altera_reserved_tdo}]
set_output_delay -clock clk -max 0.000 [get_ports {altera_reserved_tdo}]


set_output_delay -clock clk -min 0.000 [get_ports {pio_o[0]}]
set_output_delay -clock clk -min 0.000 [get_ports {pio_o[1]}]
set_output_delay -clock clk -min 0.000 [get_ports {pio_o[2]}]
set_output_delay -clock clk -min 0.000 [get_ports {pio_o[3]}]
set_output_delay -clock clk -min 0.000 [get_ports {pio_o[4]}]
set_output_delay -clock clk -min 0.000 [get_ports {pio_o[5]}]
set_output_delay -clock clk -min 0.000 [get_ports {pio_o[6]}]
set_output_delay -clock clk -min 0.000 [get_ports {pio_o[7]}]

set_output_delay -clock clk -max 0.000 [get_ports {pio_o[0]}]
set_output_delay -clock clk -max 0.000 [get_ports {pio_o[1]}]
set_output_delay -clock clk -max 0.000 [get_ports {pio_o[2]}]
set_output_delay -clock clk -max 0.000 [get_ports {pio_o[3]}]
set_output_delay -clock clk -max 0.000 [get_ports {pio_o[4]}]
set_output_delay -clock clk -max 0.000 [get_ports {pio_o[5]}]
set_output_delay -clock clk -max 0.000 [get_ports {pio_o[6]}]
set_output_delay -clock clk -max 0.000 [get_ports {pio_o[7]}]