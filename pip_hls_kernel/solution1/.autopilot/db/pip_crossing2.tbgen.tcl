set moduleName pip_crossing2
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
set C_modelName {pip_crossing2}
set C_modelType { int 1 }
set C_modelArgList {
	{ p_x int 18 regular  }
	{ p_y int 18 regular  }
	{ e1_x int 18 regular  }
	{ e1_y int 18 regular  }
	{ e2_x int 18 regular  }
	{ e2_y int 18 regular  }
	{ div_table_V int 18 regular {array 1024 { 1 3 } 1 1 } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "p_x", "interface" : "wire", "bitwidth" : 18, "direction" : "READONLY"} , 
 	{ "Name" : "p_y", "interface" : "wire", "bitwidth" : 18, "direction" : "READONLY"} , 
 	{ "Name" : "e1_x", "interface" : "wire", "bitwidth" : 18, "direction" : "READONLY"} , 
 	{ "Name" : "e1_y", "interface" : "wire", "bitwidth" : 18, "direction" : "READONLY"} , 
 	{ "Name" : "e2_x", "interface" : "wire", "bitwidth" : 18, "direction" : "READONLY"} , 
 	{ "Name" : "e2_y", "interface" : "wire", "bitwidth" : 18, "direction" : "READONLY"} , 
 	{ "Name" : "div_table_V", "interface" : "memory", "bitwidth" : 18, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ p_x sc_in sc_lv 18 signal 0 } 
	{ p_y sc_in sc_lv 18 signal 1 } 
	{ e1_x sc_in sc_lv 18 signal 2 } 
	{ e1_y sc_in sc_lv 18 signal 3 } 
	{ e2_x sc_in sc_lv 18 signal 4 } 
	{ e2_y sc_in sc_lv 18 signal 5 } 
	{ div_table_V_address0 sc_out sc_lv 10 signal 6 } 
	{ div_table_V_ce0 sc_out sc_logic 1 signal 6 } 
	{ div_table_V_q0 sc_in sc_lv 18 signal 6 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
	{ ap_ce sc_in sc_logic 1 ce -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "p_x", "direction": "in", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "p_x", "role": "default" }} , 
 	{ "name": "p_y", "direction": "in", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "p_y", "role": "default" }} , 
 	{ "name": "e1_x", "direction": "in", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "e1_x", "role": "default" }} , 
 	{ "name": "e1_y", "direction": "in", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "e1_y", "role": "default" }} , 
 	{ "name": "e2_x", "direction": "in", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "e2_x", "role": "default" }} , 
 	{ "name": "e2_y", "direction": "in", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "e2_y", "role": "default" }} , 
 	{ "name": "div_table_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "div_table_V", "role": "address0" }} , 
 	{ "name": "div_table_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "div_table_V", "role": "ce0" }} , 
 	{ "name": "div_table_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "div_table_V", "role": "q0" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }} , 
 	{ "name": "ap_ce", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "ce", "bundle":{"name": "ap_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_mul_18s_18s_36_4_1_U4", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.am_submul_18s_18s_18s_37_4_1_U5", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
	{"Name" : "Latency", "Min" : "10", "Max" : "10"}
	, {"Name" : "Interval", "Min" : "11", "Max" : "11"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	p_x { ap_none {  { p_x in_data 0 18 } } }
	p_y { ap_none {  { p_y in_data 0 18 } } }
	e1_x { ap_none {  { e1_x in_data 0 18 } } }
	e1_y { ap_none {  { e1_y in_data 0 18 } } }
	e2_x { ap_none {  { e2_x in_data 0 18 } } }
	e2_y { ap_none {  { e2_y in_data 0 18 } } }
	div_table_V { ap_memory {  { div_table_V_address0 mem_address 1 10 }  { div_table_V_ce0 mem_ce 1 1 }  { div_table_V_q0 in_data 0 18 } } }
}
