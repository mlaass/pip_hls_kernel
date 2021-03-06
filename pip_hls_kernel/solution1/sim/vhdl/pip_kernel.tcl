
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set cinoutgroup [add_wave_group "C InOuts" -into $designtopgroup]
set edges__strm_len__return_group [add_wave_group edges__strm_len__return(axi_slave) -into $cinoutgroup]
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/interrupt -into $edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/s_axi_control_BRESP -into $edges__strm_len__return_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/s_axi_control_BREADY -into $edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/s_axi_control_BVALID -into $edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/s_axi_control_RRESP -into $edges__strm_len__return_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/s_axi_control_RDATA -into $edges__strm_len__return_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/s_axi_control_RREADY -into $edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/s_axi_control_RVALID -into $edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/s_axi_control_ARREADY -into $edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/s_axi_control_ARVALID -into $edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/s_axi_control_ARADDR -into $edges__strm_len__return_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/s_axi_control_WSTRB -into $edges__strm_len__return_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/s_axi_control_WDATA -into $edges__strm_len__return_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/s_axi_control_WREADY -into $edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/s_axi_control_WVALID -into $edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/s_axi_control_AWREADY -into $edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/s_axi_control_AWVALID -into $edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/s_axi_control_AWADDR -into $edges__strm_len__return_group -radix hex
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set return_group [add_wave_group return(axis) -into $coutputgroup]
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/out_r_TREADY -into $return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/out_r_TVALID -into $return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/out_r_TDATA -into $return_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set return_group [add_wave_group return(axis) -into $cinputgroup]
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/points_TREADY -into $return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/points_TVALID -into $return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/points_TDATA -into $return_group -radix hex
set edges_group [add_wave_group edges(axi_master) -into $cinputgroup]
set rdata_group [add_wave_group "Read Channel" -into $edges_group]
set wdata_group [add_wave_group "Write Channel" -into $edges_group]
set ctrl_group [add_wave_group "Handshakes" -into $edges_group]
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_BUSER -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_BID -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_BRESP -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_RRESP -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_RUSER -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_RID -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_RDATA -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_ARUSER -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_ARREGION -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_ARQOS -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_ARPROT -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_ARBURST -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_ARLEN -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_ARID -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_ARADDR -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_WUSER -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_WID -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_WSTRB -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_WDATA -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_AWUSER -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_AWREGION -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_AWQOS -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_AWPROT -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_AWBURST -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_AWLEN -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_AWID -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_AWADDR -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/m_axi_gmem_AWVALID -into $ctrl_group -color #ffff00 -radix hex
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_pip_kernel_top/AESL_inst_pip_kernel/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_pip_kernel_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_pip_kernel_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_pip_kernel_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_pip_kernel_top/LENGTH_out_r -into $tb_portdepth_group -radix hex
add_wave /apatb_pip_kernel_top/LENGTH_points -into $tb_portdepth_group -radix hex
add_wave /apatb_pip_kernel_top/LENGTH_edges -into $tb_portdepth_group -radix hex
add_wave /apatb_pip_kernel_top/LENGTH_strm_len -into $tb_portdepth_group -radix hex
add_wave /apatb_pip_kernel_top/LENGTH_gmem -into $tb_portdepth_group -radix hex
set tbcinoutgroup [add_wave_group "C InOuts" -into $testbenchgroup]
set tb_edges__strm_len__return_group [add_wave_group edges__strm_len__return(axi_slave) -into $tbcinoutgroup]
add_wave /apatb_pip_kernel_top/control_INTERRUPT -into $tb_edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/control_BRESP -into $tb_edges__strm_len__return_group -radix hex
add_wave /apatb_pip_kernel_top/control_BREADY -into $tb_edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/control_BVALID -into $tb_edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/control_RRESP -into $tb_edges__strm_len__return_group -radix hex
add_wave /apatb_pip_kernel_top/control_RDATA -into $tb_edges__strm_len__return_group -radix hex
add_wave /apatb_pip_kernel_top/control_RREADY -into $tb_edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/control_RVALID -into $tb_edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/control_ARREADY -into $tb_edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/control_ARVALID -into $tb_edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/control_ARADDR -into $tb_edges__strm_len__return_group -radix hex
add_wave /apatb_pip_kernel_top/control_WSTRB -into $tb_edges__strm_len__return_group -radix hex
add_wave /apatb_pip_kernel_top/control_WDATA -into $tb_edges__strm_len__return_group -radix hex
add_wave /apatb_pip_kernel_top/control_WREADY -into $tb_edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/control_WVALID -into $tb_edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/control_AWREADY -into $tb_edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/control_AWVALID -into $tb_edges__strm_len__return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/control_AWADDR -into $tb_edges__strm_len__return_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(axis) -into $tbcoutputgroup]
add_wave /apatb_pip_kernel_top/out_r_TREADY -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/out_r_TVALID -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/out_r_TDATA -into $tb_return_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(axis) -into $tbcinputgroup]
add_wave /apatb_pip_kernel_top/points_TREADY -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/points_TVALID -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/points_TDATA -into $tb_return_group -radix hex
set tb_edges_group [add_wave_group edges(axi_master) -into $tbcinputgroup]
set rdata_group [add_wave_group "Read Channel" -into $tb_edges_group]
set wdata_group [add_wave_group "Write Channel" -into $tb_edges_group]
set ctrl_group [add_wave_group "Handshakes" -into $tb_edges_group]
add_wave /apatb_pip_kernel_top/gmem_BUSER -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_BID -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_BRESP -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_BREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/gmem_BVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/gmem_RRESP -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_RUSER -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_RID -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_RLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/gmem_RDATA -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_RREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/gmem_RVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/gmem_ARUSER -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_ARREGION -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_ARQOS -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_ARPROT -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_ARCACHE -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_ARLOCK -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_ARBURST -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_ARSIZE -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_ARLEN -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_ARID -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_ARADDR -into $rdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_ARREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/gmem_ARVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/gmem_WUSER -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_WID -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_WLAST -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/gmem_WSTRB -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_WDATA -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_WREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/gmem_WVALID -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/gmem_AWUSER -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_AWREGION -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_AWQOS -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_AWPROT -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_AWCACHE -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_AWLOCK -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_AWBURST -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_AWSIZE -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_AWLEN -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_AWID -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_AWADDR -into $wdata_group -radix hex
add_wave /apatb_pip_kernel_top/gmem_AWREADY -into $ctrl_group -color #ffff00 -radix hex
add_wave /apatb_pip_kernel_top/gmem_AWVALID -into $ctrl_group -color #ffff00 -radix hex
save_wave_config pip_kernel.wcfg
run all
quit

