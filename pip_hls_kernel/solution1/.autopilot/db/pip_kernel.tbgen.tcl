set moduleName pip_kernel
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_chain
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {pip_kernel}
set C_modelType { void 0 }
set C_modelArgList {
	{ out_r int 8 regular {axi_s 1 volatile  { out_r Data } }  }
	{ points int 24 regular {axi_s 0 volatile  { points Data } }  }
	{ edges int 18 regular {bram 128 { 1 1 } 1 1 }  }
	{ strm_len uint 16 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "out_r", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "points", "interface" : "axis", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "edges", "interface" : "bram", "bitwidth" : 18, "direction" : "READONLY"} , 
 	{ "Name" : "strm_len", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":23}} ]}
# RTL Port declarations: 
set portNum 40
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ out_r_TDATA sc_out sc_lv 8 signal 0 } 
	{ out_r_TVALID sc_out sc_logic 1 outvld 0 } 
	{ out_r_TREADY sc_in sc_logic 1 outacc 0 } 
	{ points_TDATA sc_in sc_lv 24 signal 1 } 
	{ points_TVALID sc_in sc_logic 1 invld 1 } 
	{ points_TREADY sc_out sc_logic 1 inacc 1 } 
	{ edges_Addr_A sc_out sc_lv 32 signal 2 } 
	{ edges_EN_A sc_out sc_logic 1 signal 2 } 
	{ edges_WEN_A sc_out sc_lv 4 signal 2 } 
	{ edges_Din_A sc_out sc_lv 32 signal 2 } 
	{ edges_Dout_A sc_in sc_lv 32 signal 2 } 
	{ edges_Clk_A sc_out sc_logic 1 signal 2 } 
	{ edges_Rst_A sc_out sc_logic 1 signal 2 } 
	{ edges_Addr_B sc_out sc_lv 32 signal 2 } 
	{ edges_EN_B sc_out sc_logic 1 signal 2 } 
	{ edges_WEN_B sc_out sc_lv 4 signal 2 } 
	{ edges_Din_B sc_out sc_lv 32 signal 2 } 
	{ edges_Dout_B sc_in sc_lv 32 signal 2 } 
	{ edges_Clk_B sc_out sc_logic 1 signal 2 } 
	{ edges_Rst_B sc_out sc_logic 1 signal 2 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"pip_kernel","role":"start","value":"0","valid_bit":"0"},{"name":"pip_kernel","role":"continue","value":"0","valid_bit":"4"},{"name":"pip_kernel","role":"auto_start","value":"0","valid_bit":"7"},{"name":"strm_len","role":"data","value":"16"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"pip_kernel","role":"start","value":"0","valid_bit":"0"},{"name":"pip_kernel","role":"done","value":"0","valid_bit":"1"},{"name":"pip_kernel","role":"idle","value":"0","valid_bit":"2"},{"name":"pip_kernel","role":"ready","value":"0","valid_bit":"3"},{"name":"pip_kernel","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "out_r_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_r", "role": "TDATA" }} , 
 	{ "name": "out_r_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_r", "role": "TVALID" }} , 
 	{ "name": "out_r_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_r", "role": "TREADY" }} , 
 	{ "name": "points_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "points", "role": "TDATA" }} , 
 	{ "name": "points_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "points", "role": "TVALID" }} , 
 	{ "name": "points_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "points", "role": "TREADY" }} , 
 	{ "name": "edges_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "edges", "role": "Addr_A" }} , 
 	{ "name": "edges_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "edges", "role": "EN_A" }} , 
 	{ "name": "edges_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "edges", "role": "WEN_A" }} , 
 	{ "name": "edges_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "edges", "role": "Din_A" }} , 
 	{ "name": "edges_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "edges", "role": "Dout_A" }} , 
 	{ "name": "edges_Clk_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "edges", "role": "Clk_A" }} , 
 	{ "name": "edges_Rst_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "edges", "role": "Rst_A" }} , 
 	{ "name": "edges_Addr_B", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "edges", "role": "Addr_B" }} , 
 	{ "name": "edges_EN_B", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "edges", "role": "EN_B" }} , 
 	{ "name": "edges_WEN_B", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "edges", "role": "WEN_B" }} , 
 	{ "name": "edges_Din_B", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "edges", "role": "Din_B" }} , 
 	{ "name": "edges_Dout_B", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "edges", "role": "Dout_B" }} , 
 	{ "name": "edges_Clk_B", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "edges", "role": "Clk_B" }} , 
 	{ "name": "edges_Rst_B", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "edges", "role": "Rst_B" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "5", "9", "10", "11"],
		"CDFG" : "pip_kernel",
		"Protocol" : "ap_ctrl_chain",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1042", "EstimateLatencyMax" : "1115137",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "out_r", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "out_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "points", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "points_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "edges", "Type" : "Bram", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_pip_edges_fu_108", "Port" : "edges", "Inst_start_state" : "4", "Inst_end_state" : "18"}]},
			{"Name" : "strm_len", "Type" : "None", "Direction" : "I"},
			{"Name" : "div_table_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "grp_pip_kernel_Pipeline_LOOP_INIT_DIV_TABLE_fu_102", "Port" : "div_table_V", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "5", "SubInstance" : "grp_pip_edges_fu_108", "Port" : "div_table_V", "Inst_start_state" : "4", "Inst_end_state" : "18"}]}],
		"Loop" : [
			{"Name" : "LOOP_STREAM", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "20", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state19"], "QuitState" : ["ap_ST_fsm_state19"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state20"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.div_table_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_pip_kernel_Pipeline_LOOP_INIT_DIV_TABLE_fu_102", "Parent" : "0", "Child" : ["3", "4"],
		"CDFG" : "pip_kernel_Pipeline_LOOP_INIT_DIV_TABLE",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1040", "EstimateLatencyMax" : "1040",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "div_table_V", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "LOOP_INIT_DIV_TABLE", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter15", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter15", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pip_kernel_Pipeline_LOOP_INIT_DIV_TABLE_fu_102.sdiv_11ns_18ns_18_15_1_U1", "Parent" : "2"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pip_kernel_Pipeline_LOOP_INIT_DIV_TABLE_fu_102.flow_control_loop_pipe_sequential_init_U", "Parent" : "2"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_pip_edges_fu_108", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "pip_edges",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "15",
		"VariableLatency" : "0", "ExactLatency" : "14", "EstimateLatencyMin" : "14", "EstimateLatencyMax" : "14",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "px", "Type" : "None", "Direction" : "I"},
			{"Name" : "py", "Type" : "None", "Direction" : "I"},
			{"Name" : "edges", "Type" : "Bram", "Direction" : "I"},
			{"Name" : "div_table_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_pip_crossing2_fu_93", "Port" : "div_table_V", "Inst_start_state" : "4", "Inst_end_state" : "14"}]}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pip_edges_fu_108.grp_pip_crossing2_fu_93", "Parent" : "5", "Child" : ["7", "8"],
		"CDFG" : "pip_crossing2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "11",
		"VariableLatency" : "0", "ExactLatency" : "10", "EstimateLatencyMin" : "10", "EstimateLatencyMax" : "10",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "p_x", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_y", "Type" : "None", "Direction" : "I"},
			{"Name" : "e1_x", "Type" : "None", "Direction" : "I"},
			{"Name" : "e1_y", "Type" : "None", "Direction" : "I"},
			{"Name" : "e2_x", "Type" : "None", "Direction" : "I"},
			{"Name" : "e2_y", "Type" : "None", "Direction" : "I"},
			{"Name" : "div_table_V", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pip_edges_fu_108.grp_pip_crossing2_fu_93.mul_mul_18s_18s_36_4_1_U4", "Parent" : "6"},
	{"ID" : "8", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_pip_edges_fu_108.grp_pip_crossing2_fu_93.am_submul_18s_18s_18s_37_4_1_U5", "Parent" : "6"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_r_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_points_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	pip_kernel {
		out_r {Type O LastRead -1 FirstWrite 17}
		points {Type I LastRead 3 FirstWrite -1}
		edges {Type I LastRead 2 FirstWrite -1}
		strm_len {Type I LastRead 1 FirstWrite -1}
		div_table_V {Type IO LastRead -1 FirstWrite -1}}
	pip_kernel_Pipeline_LOOP_INIT_DIV_TABLE {
		div_table_V {Type O LastRead -1 FirstWrite 15}}
	pip_edges {
		px {Type I LastRead 3 FirstWrite -1}
		py {Type I LastRead 3 FirstWrite -1}
		edges {Type I LastRead 2 FirstWrite -1}
		div_table_V {Type I LastRead 1 FirstWrite -1}}
	pip_crossing2 {
		p_x {Type I LastRead 10 FirstWrite -1}
		p_y {Type I LastRead 0 FirstWrite -1}
		e1_x {Type I LastRead 6 FirstWrite -1}
		e1_y {Type I LastRead 0 FirstWrite -1}
		e2_x {Type I LastRead 6 FirstWrite -1}
		e2_y {Type I LastRead 0 FirstWrite -1}
		div_table_V {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1042", "Max" : "1115137"}
	, {"Name" : "Interval", "Min" : "1043", "Max" : "1115138"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	out_r { axis {  { out_r_TDATA out_data 1 8 }  { out_r_TVALID out_vld 1 1 }  { out_r_TREADY out_acc 0 1 } } }
	points { axis {  { points_TDATA in_data 0 24 }  { points_TVALID in_vld 0 1 }  { points_TREADY in_acc 1 1 } } }
	edges { bram {  { edges_Addr_A MemPortADDR2 1 32 }  { edges_EN_A MemPortCE2 1 1 }  { edges_WEN_A MemPortWE2 1 4 }  { edges_Din_A MemPortDIN2 1 32 }  { edges_Dout_A MemPortDOUT2 0 32 }  { edges_Clk_A mem_clk 1 1 }  { edges_Rst_A mem_rst 1 1 }  { edges_Addr_B MemPortADDR2 1 32 }  { edges_EN_B MemPortCE2 1 1 }  { edges_WEN_B MemPortWE2 1 4 }  { edges_Din_B MemPortDIN2 1 32 }  { edges_Dout_B MemPortDOUT2 0 32 }  { edges_Clk_B mem_clk 1 1 }  { edges_Rst_B mem_rst 1 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
