set_global_assignment -entity "CORDIC_FFT" -library "lib_CORDIC_FFT" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "CORDIC_FFT" -library "lib_CORDIC_FFT" -name IP_TOOL_VERSION "23.1"
set_global_assignment -entity "CORDIC_FFT" -library "lib_CORDIC_FFT" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_CORDIC_FFT" -name SPD_FILE [file join $::quartus(sip_path) "../CORDIC_FFT.spd"]
set_global_assignment -library "lib_CORDIC_FFT" -name MISC_FILE [file join $::quartus(sip_path) "../../CORDIC_FFT.qsys"]

set_global_assignment -library "lib_CORDIC_FFT" -name MISC_FILE [file join $::quartus(sip_path) "CORDIC_FFT.v"]
set_global_assignment -library "lib_CORDIC_FFT" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dspba_library_package.vhd"]
set_global_assignment -library "lib_CORDIC_FFT" -name MISC_FILE [file join $::quartus(sip_path) "submodules/dspba_library.vhd"]
set_global_assignment -library "lib_CORDIC_FFT" -name MISC_FILE [file join $::quartus(sip_path) "submodules/CORDIC_FFT_CORDIC_0.vhd"]
