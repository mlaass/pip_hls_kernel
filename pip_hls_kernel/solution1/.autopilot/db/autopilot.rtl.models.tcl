set SynModuleInfo {
  {SRCNAME pip_kernel_Pipeline_LOOP_INIT_DIV_TABLE MODELNAME pip_kernel_Pipeline_LOOP_INIT_DIV_TABLE RTLNAME pip_kernel_pip_kernel_Pipeline_LOOP_INIT_DIV_TABLE
    SUBMODULES {
      {MODELNAME pip_kernel_sdiv_11ns_18ns_18_15_1 RTLNAME pip_kernel_sdiv_11ns_18ns_18_15_1 BINDTYPE op TYPE sdiv IMPL auto LATENCY 14 ALLOW_PRAGMA 1}
      {MODELNAME pip_kernel_flow_control_loop_pipe_sequential_init RTLNAME pip_kernel_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME pip_kernel_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME pip_crossing2 MODELNAME pip_crossing2 RTLNAME pip_kernel_pip_crossing2
    SUBMODULES {
      {MODELNAME pip_kernel_mul_mul_18s_18s_36_4_1 RTLNAME pip_kernel_mul_mul_18s_18s_36_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME pip_kernel_am_submul_18s_18s_18s_37_4_1 RTLNAME pip_kernel_am_submul_18s_18s_18s_37_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME pip_edges MODELNAME pip_edges RTLNAME pip_kernel_pip_edges}
  {SRCNAME pip_kernel MODELNAME pip_kernel RTLNAME pip_kernel IS_TOP 1
    SUBMODULES {
      {MODELNAME pip_kernel_div_table_V_RAM_AUTO_1R1W RTLNAME pip_kernel_div_table_V_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME pip_kernel_gmem_m_axi RTLNAME pip_kernel_gmem_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME pip_kernel_control_s_axi RTLNAME pip_kernel_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME pip_kernel_regslice_both RTLNAME pip_kernel_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME pip_kernel_regslice_both_U}
    }
  }
}
