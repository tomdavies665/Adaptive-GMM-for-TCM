quit -sim
.main clear

cd "C:/FPGA_Projects/GMM/ip/cordic/simulation/mentor"
source msim_setup.tcl

# --- ADD THESE TWO LINES ONCE TO UPDATE THE IP ---
# You can comment them out later to save time
dev_com
com

vlog -sv "C:/FPGA_Projects/GMM/src/AnalogueFrontEnd.sv"
vlog -sv "C:/FPGA_Projects/GMM/Testbenches/analogueFrontEnd_tb.sv"
vlog -sv "C:/FPGA_Projects/GMM/Testbenches/dummies.sv"

# Increase the run time to 150us to capture the full delayed Natural Order burst
#vsim -t 1ps -L altera_mf_ver -L lpm_ver -L sgate_ver work.analogueFrontEnd_tb
elab_debug work.analogueFrontEnd_tb

add wave -position insertpoint sim:/fft_mag_tb/*
add wave -position insertpoint sim:/fft_mag_tb/dut/*
radix -decimal

run -all
wave zoom full