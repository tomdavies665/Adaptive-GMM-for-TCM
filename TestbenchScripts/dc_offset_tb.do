quit -sim
.main clear

cd "C:/FPGA_Projects/GMM/ip/CORDIC_FFT/simulation/mentor"
source msim_setup.tcl

# --- ADD THESE TWO LINES ONCE TO UPDATE THE IP ---
dev_com
com

vlog -sv "C:/FPGA_Projects/GMM/src/dcOffset.sv"
vlog -sv "C:/FPGA_Projects/GMM/Testbenches/dc_offset_tb.sv"
vlog -sv "C:/FPGA_Projects/GMM/IP/dc_offset_fifo.v"

# Increase the run time to 150us to capture the full delayed Natural Order burst
#vsim -t 1ps -L altera_mf_ver -L lpm_ver -L sgate_ver work.dc_offset_tb
elab_debug work.dc_offset_tb

add wave -position insertpoint sim:/dc_offset_tb/*
add wave -position insertpoint sim:/dc_offset_tb/dut/*
radix -decimal

run -all
wave zoom full