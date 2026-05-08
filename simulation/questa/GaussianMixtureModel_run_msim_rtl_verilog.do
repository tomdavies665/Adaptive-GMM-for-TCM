transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/FPGA_Projects/GMM/ip {C:/FPGA_Projects/GMM/ip/pll.v}
vlog -vlog01compat -work work +incdir+C:/FPGA_Projects/GMM/db {C:/FPGA_Projects/GMM/db/pll_altpll.v}
vlib adc
vmap adc adc
vlog -vlog01compat -work adc +incdir+c:/fpga_projects/gmm/db/ip/adc {c:/fpga_projects/gmm/db/ip/adc/adc.v}
vlog -vlog01compat -work adc +incdir+c:/fpga_projects/gmm/db/ip/adc/submodules {c:/fpga_projects/gmm/db/ip/adc/submodules/adc_modular_adc_0.v}
vlog -vlog01compat -work adc +incdir+c:/fpga_projects/gmm/db/ip/adc/submodules {c:/fpga_projects/gmm/db/ip/adc/submodules/altera_modular_adc_control.v}
vlog -vlog01compat -work adc +incdir+c:/fpga_projects/gmm/db/ip/adc/submodules {c:/fpga_projects/gmm/db/ip/adc/submodules/altera_modular_adc_control_avrg_fifo.v}
vlog -vlog01compat -work adc +incdir+c:/fpga_projects/gmm/db/ip/adc/submodules {c:/fpga_projects/gmm/db/ip/adc/submodules/altera_modular_adc_control_fsm.v}
vlog -vlog01compat -work adc +incdir+c:/fpga_projects/gmm/db/ip/adc/submodules {c:/fpga_projects/gmm/db/ip/adc/submodules/altera_modular_adc_sequencer.v}
vlog -vlog01compat -work adc +incdir+c:/fpga_projects/gmm/db/ip/adc/submodules {c:/fpga_projects/gmm/db/ip/adc/submodules/altera_modular_adc_sequencer_csr.v}
vlog -vlog01compat -work adc +incdir+c:/fpga_projects/gmm/db/ip/adc/submodules {c:/fpga_projects/gmm/db/ip/adc/submodules/altera_modular_adc_sequencer_ctrl.v}
vlog -vlog01compat -work adc +incdir+c:/fpga_projects/gmm/db/ip/adc/submodules {c:/fpga_projects/gmm/db/ip/adc/submodules/altera_reset_controller.v}
vlog -vlog01compat -work adc +incdir+c:/fpga_projects/gmm/db/ip/adc/submodules {c:/fpga_projects/gmm/db/ip/adc/submodules/altera_reset_synchronizer.v}
vlog -vlog01compat -work adc +incdir+c:/fpga_projects/gmm/db/ip/adc/submodules {c:/fpga_projects/gmm/db/ip/adc/submodules/chsel_code_converter_sw_to_hw.v}
vlog -vlog01compat -work adc +incdir+c:/fpga_projects/gmm/db/ip/adc/submodules {c:/fpga_projects/gmm/db/ip/adc/submodules/fiftyfivenm_adcblock_primitive_wrapper.v}
vlog -vlog01compat -work adc +incdir+c:/fpga_projects/gmm/db/ip/adc/submodules {c:/fpga_projects/gmm/db/ip/adc/submodules/fiftyfivenm_adcblock_top_wrapper.v}
vlog -sv -work work +incdir+C:/FPGA_Projects/GMM/src {C:/FPGA_Projects/GMM/src/AnalogueFrontEnd.sv}
vlog -sv -work work +incdir+C:/FPGA_Projects/GMM/src {C:/FPGA_Projects/GMM/src/GaussianMixtureModel.sv}

vlog -sv -work work +incdir+C:/FPGA_Projects/GMM/Testbenches {C:/FPGA_Projects/GMM/Testbenches/analogueFrontEnd_tb.sv}
vlog -sv -work work +incdir+C:/FPGA_Projects/GMM/src {C:/FPGA_Projects/GMM/src/AnalogueFrontEnd.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -L adc -voptargs="+acc"  analogueFrontEnd_tb

add wave *
view structure
view signals
run -all
