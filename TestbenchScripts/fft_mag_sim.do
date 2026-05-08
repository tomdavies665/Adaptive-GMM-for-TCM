quit -sim
.main clear

# Navigate to your IP simulation directory (Leave this if you need other IP compiled)
cd "C:/FPGA_Projects/GMM/ip/CORDIC_FFT/simulation/mentor"
source msim_setup.tcl

# Compile the Altera IP libraries (Only need to do this occasionally)
dev_com
com

# 1. Compile the Verilog FIFO wrapper (Removed the -sc flag)
vlog "C:/FPGA_Projects/GMM/IP/dc_offset_fifo.v"

# 2. Compile the SystemVerilog design and testbench
vlog -sv "C:/FPGA_Projects/GMM/src/dc_offset.sv"
vlog -sv "C:/FPGA_Projects/GMM/Testbenches/dc_offset_tb.sv"

# 3. Launch the simulation using standard vsim, linking the Altera MegaFunction library
vsim -t 1ps -L altera_mf_ver -L lpm_ver -L sgate_ver work.dc_offset_tb

# 4. Add the waveforms to the viewer
add wave -position insertpoint sim:/dc_offset_tb/*
add wave -position insertpoint sim:/dc_offset_tb/dut/*
radix -decimal

# 5. Run the simulation
run -all
wave zoom full