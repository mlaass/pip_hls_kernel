############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project pip_hls_kernel
set_top pip_kernel
add_files pip_kernel.cpp
add_files -tb test_pip_kernel.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vitis
set_part {xczu9eg-ffvb1156-2-e}
create_clock -period 10 -name default
config_interface -default_slave_interface s_axilite -m_axi_alignment_byte_size 64 -m_axi_latency 64 -m_axi_max_widen_bitwidth 512
config_rtl -register_reset_num 3
config_export -format xo
source "./pip_hls_kernel/solution1/directives.tcl"
export_design -rtl verilog -format xo
