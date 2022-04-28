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
set_part {xcvu11p-flga2577-1-e}
create_clock -period 10 -name default
config_interface -default_slave_interface s_axilite -m_axi_alignment_byte_size 64 -m_axi_latency 64 -m_axi_max_widen_bitwidth 512
config_rtl -register_reset_num 3
source "./pip_hls_kernel/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -wave_debug -enable_dataflow_profiling -trace_level all -rtl vhdl
export_design -rtl verilog -format xo
