quit -sim
.main clear

cd "C:/FPGA_Projects/GMM/ip/CORDIC_FFT/simulation/mentor"
source msim_setup.tcl

# --- COMPILE DESIGN AND TESTBENCH ---
vlog -sv "C:/FPGA_Projects/GMM/src/Mahalanobis_Distance.sv"
vlog -sv "C:/FPGA_Projects/GMM/Testbenches/tb_Mahalanobis_Distance.sv"

# --- START SIMULATION WITH LPM LIBRARIES ---
# Using vsim with -L flags links the pre-compiled Altera simulation models
vsim -t 1ps -L altera_mf_ver -L lpm_ver -L sgate_ver -L altera_ver work.tb_Mahalanobis_Distance

# --- ADD WAVES ---
add wave -position insertpoint sim:/tb_Mahalanobis_Distance/*
add wave -position insertpoint sim:/tb_Mahalanobis_Distance/dut/*
radix -decimal

# --- RUN ---
run -all
wave zoom full