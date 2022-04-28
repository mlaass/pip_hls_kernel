############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project pip_hls_kernel
set_top pip_kernel
add_files pip_kernel.cpp
add_files -tb test_pip_kernel.cpp
open_solution "solution1" -flow_target vitis
set_part {xczu9eg-ffvb1156-2-e}
create_clock -period 25 -name default
source "./pip_hls_kernel/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format xo
