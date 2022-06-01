set moduleName pip_edges
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {pip_edges}
set C_modelType { int 6 }
set C_modelArgList {
	{ px int 18 regular  }
	{ py int 18 regular  }
	{ edges int 18 regular {bram 128 { 1 1 } 1 1 }  }
	{ div_table_V int 18 regular {array 1024 { 1 3 } 1 1 } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "px", "interface" : "wire", "bitwidth" : 18, "direction" : "READONLY"} , 
 	{ "Name" : "py", "interface" : "wire", "bitwidth" : 18, "direction" : "READONLY"} , 
 	{ "Name" : "edges", "interface" : "bram", "bitwidth" : 18, "direction" : "READONLY"} , 
 	{ "Name" : "div_table_V", "interface" : "memory", "bitwidth" : 18, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 6} ]}
# RTL Port declarations: 
set portNum 23
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ px sc_in sc_lv 18 signal 0 } 
	{ py sc_in sc_lv 18 signal 1 } 
	{ edges_Addr_A sc_out sc_lv 32 signal 2 } 
	{ edges_EN_A sc_out sc_logic 1 signal 2 } 
	{ edges_WEN_A sc_out sc_lv 4 signal 2 } 
	{ edges_Din_A sc_out sc_lv 32 signal 2 } 
	{ edges_Dout_A sc_in sc_lv 32 signal 2 } 
	{ edges_Addr_B sc_out sc_lv 32 signal 2 } 
	{ edges_EN_B sc_out sc_logic 1 signal 2 } 
	{ edges_WEN_B sc_out sc_lv 4 signal 2 } 
	{ edges_Din_B sc_out sc_lv 32 signal 2 } 
	{ edges_Dout_B sc_in sc_lv 32 signal 2 } 
	{ div_table_V_address0 sc_out sc_lv 10 signal 3 } 
	{ div_table_V_ce0 sc_out sc_logic 1 signal 3 } 
	{ div_table_V_q0 sc_in sc_lv 18 signal 3 } 
	{ ap_return sc_out sc_lv 6 signal -1 } 
	{ ap_ce sc_in sc_logic 1 ce -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "px", "direction": "in", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "px", "role": "default" }} , 
 	{ "name": "py", "direction": "in", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "py", "role": "default" }} , 
 	{ "name": "edges_Addr_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "edges", "role": "Addr_A" }} , 
 	{ "name": "edges_EN_A", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "edges", "role": "EN_A" }} , 
 	{ "name": "edges_WEN_A", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "edges", "role": "WEN_A" }} , 
 	{ "name": "edges_Din_A", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "edges", "role": "Din_A" }} , 
 	{ "name": "edges_Dout_A", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "edges", "role": "Dout_A" }} , 
 	{ "name": "edges_Addr_B", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "edges", "role": "Addr_B" }} , 
 	{ "name": "edges_EN_B", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "edges", "role": "EN_B" }} , 
 	{ "name": "edges_WEN_B", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "edges", "role": "WEN_B" }} , 
 	{ "name": "edges_Din_B", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "edges", "role": "Din_B" }} , 
 	{ "name": "edges_Dout_B", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "edges", "role": "Dout_B" }} , 
 	{ "name": "div_table_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "div_table_V", "role": "address0" }} , 
 	{ "name": "div_table_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "div_table_V", "role": "ce0" }} , 
 	{ "name": "div_table_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "div_table_V", "role": "q0" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }} , 
 	{ "name": "ap_ce", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "ce", "bundle":{"name": "ap_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
					{"ID" : "1", "SubInstance" : "grp_pip_crossing2_fu_93", "Port" : "div_table_V", "Inst_start_state" : "4", "Inst_end_state" : "14"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_pip_crossing2_fu_93", "Parent" : "0", "Child" : ["2", "3"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pip_crossing2_fu_93.mul_mul_18s_18s_36_4_1_U4", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_pip_crossing2_fu_93.am_submul_18s_18s_18s_37_4_1_U5", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
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
	{"Name" : "Latency", "Min" : "14", "Max" : "14"}
	, {"Name" : "Interval", "Min" : "15", "Max" : "15"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	px { ap_none {  { px in_data 0 18 } } }
	py { ap_none {  { py in_data 0 18 } } }
	edges { bram {  { edges_Addr_A MemPortADDR2 1 32 }  { edges_EN_A MemPortCE2 1 1 }  { edges_WEN_A MemPortWE2 1 4 }  { edges_Din_A MemPortDIN2 1 32 }  { edges_Dout_A MemPortDOUT2 0 32 }  { edges_Addr_B MemPortADDR2 1 32 }  { edges_EN_B MemPortCE2 1 1 }  { edges_WEN_B MemPortWE2 1 4 }  { edges_Din_B MemPortDIN2 1 32 }  { edges_Dout_B MemPortDOUT2 0 32 } } }
	div_table_V { ap_memory {  { div_table_V_address0 mem_address 1 10 }  { div_table_V_ce0 mem_ce 1 1 }  { div_table_V_q0 mem_dout 0 18 } } }
}
