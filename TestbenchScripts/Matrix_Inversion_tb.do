quit -sim
.main clear

cd "C:/FPGA_Projects/GMM/ip/CORDIC_FFT/simulation/mentor"
source msim_setup.tcl

# --- COMPILE QUARTUS IP WRAPPERS ---
# UPDATE THESE PATHS to point to wherever your MegaWizard saved the IP files.
# Usually, they are .v or .sv files in your src or ip folder.
vlog "C:/FPGA_Projects/GMM/ip/mult32.v"
vlog "C:/FPGA_Projects/GMM/ip/div32.v"

# --- COMPILE DESIGN AND TESTBENCH ---
vlog -sv "C:/FPGA_Projects/GMM/src/Matrix_Inversion.sv"
vlog -sv "C:/FPGA_Projects/GMM/Testbenches/Matrix_Inversion_tb.sv"

# --- START SIMULATION WITH LPM LIBRARIES ---
# Using vsim with -L flags links the pre-compiled Altera simulation models
vsim -t 1ps -L altera_mf_ver -L lpm_ver -L sgate_ver -L altera_ver work.tb_Matrix_Inversion

# --- ADD WAVES ---
add wave -position insertpoint sim:/tb_Matrix_Inversion/*
add wave -position insertpoint sim:/tb_Matrix_Inversion/dut/*
radix -decimal

# --- RUN ---
run -all
wave zoom full