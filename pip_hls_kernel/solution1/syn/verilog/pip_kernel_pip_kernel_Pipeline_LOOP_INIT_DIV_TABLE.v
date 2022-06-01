// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pip_kernel_pip_kernel_Pipeline_LOOP_INIT_DIV_TABLE (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        div_table_V_address0,
        div_table_V_ce0,
        div_table_V_we0,
        div_table_V_d0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [9:0] div_table_V_address0;
output   div_table_V_ce0;
output   div_table_V_we0;
output  [17:0] div_table_V_d0;

reg ap_idle;
reg div_table_V_ce0;
reg div_table_V_we0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg    ap_enable_reg_pp0_iter8;
reg    ap_enable_reg_pp0_iter9;
reg    ap_enable_reg_pp0_iter10;
reg    ap_enable_reg_pp0_iter11;
reg    ap_enable_reg_pp0_iter12;
reg    ap_enable_reg_pp0_iter13;
reg    ap_enable_reg_pp0_iter14;
reg    ap_enable_reg_pp0_iter15;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
wire    ap_block_state6_pp0_stage0_iter5;
wire    ap_block_state7_pp0_stage0_iter6;
wire    ap_block_state8_pp0_stage0_iter7;
wire    ap_block_state9_pp0_stage0_iter8;
wire    ap_block_state10_pp0_stage0_iter9;
wire    ap_block_state11_pp0_stage0_iter10;
wire    ap_block_state12_pp0_stage0_iter11;
wire    ap_block_state13_pp0_stage0_iter12;
wire    ap_block_state14_pp0_stage0_iter13;
wire    ap_block_state15_pp0_stage0_iter14;
wire    ap_block_state16_pp0_stage0_iter15;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln25_fu_85_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [10:0] p_Val2_2_reg_243;
wire    ap_block_pp0_stage0_11001;
reg   [10:0] p_Val2_2_reg_243_pp0_iter1_reg;
reg   [10:0] p_Val2_2_reg_243_pp0_iter2_reg;
reg   [10:0] p_Val2_2_reg_243_pp0_iter3_reg;
reg   [10:0] p_Val2_2_reg_243_pp0_iter4_reg;
reg   [10:0] p_Val2_2_reg_243_pp0_iter5_reg;
reg   [10:0] p_Val2_2_reg_243_pp0_iter6_reg;
reg   [10:0] p_Val2_2_reg_243_pp0_iter7_reg;
reg   [10:0] p_Val2_2_reg_243_pp0_iter8_reg;
reg   [10:0] p_Val2_2_reg_243_pp0_iter9_reg;
reg   [10:0] p_Val2_2_reg_243_pp0_iter10_reg;
reg   [10:0] p_Val2_2_reg_243_pp0_iter11_reg;
reg   [10:0] p_Val2_2_reg_243_pp0_iter12_reg;
reg   [10:0] p_Val2_2_reg_243_pp0_iter13_reg;
reg   [10:0] p_Val2_2_reg_243_pp0_iter14_reg;
wire   [17:0] real_val_V_fu_224_p3;
reg   [17:0] real_val_V_reg_257;
wire   [63:0] v_assign_cast_fu_232_p1;
wire    ap_block_pp0_stage0;
reg   [10:0] p_Val2_1_fu_60;
wire   [10:0] i_fu_91_p2;
wire    ap_loop_init;
reg   [10:0] ap_sig_allocacmp_p_Val2_2;
wire   [9:0] trunc_ln887_fu_97_p1;
wire   [0:0] p_Result_s_fu_109_p3;
wire   [0:0] tmp_fu_117_p3;
wire   [17:0] p_Val2_s_fu_101_p3;
wire   [0:0] overflow_fu_125_p2;
wire   [17:0] xor_ln1349_fu_131_p2;
wire   [10:0] grp_fu_145_p0;
wire   [17:0] grp_fu_145_p1;
wire   [17:0] grp_fu_145_p2;
wire   [1:0] tmp_1_fu_170_p4;
wire   [0:0] p_Result_1_fu_162_p3;
wire   [0:0] icmp_ln924_fu_180_p2;
wire   [0:0] xor_ln941_fu_186_p2;
wire   [0:0] icmp_ln942_fu_198_p2;
wire   [0:0] overflow_1_fu_192_p2;
wire   [0:0] underflow_fu_204_p2;
wire   [0:0] or_ln392_fu_218_p2;
wire   [17:0] select_ln392_fu_210_p3;
wire   [17:0] real_val_V_2_fu_156_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg    ap_loop_exit_ready_pp0_iter5_reg;
reg    ap_loop_exit_ready_pp0_iter6_reg;
reg    ap_loop_exit_ready_pp0_iter7_reg;
reg    ap_loop_exit_ready_pp0_iter8_reg;
reg    ap_loop_exit_ready_pp0_iter9_reg;
reg    ap_loop_exit_ready_pp0_iter10_reg;
reg    ap_loop_exit_ready_pp0_iter11_reg;
reg    ap_loop_exit_ready_pp0_iter12_reg;
reg    ap_loop_exit_ready_pp0_iter13_reg;
reg    ap_loop_exit_ready_pp0_iter14_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
#0 ap_enable_reg_pp0_iter9 = 1'b0;
#0 ap_enable_reg_pp0_iter10 = 1'b0;
#0 ap_enable_reg_pp0_iter11 = 1'b0;
#0 ap_enable_reg_pp0_iter12 = 1'b0;
#0 ap_enable_reg_pp0_iter13 = 1'b0;
#0 ap_enable_reg_pp0_iter14 = 1'b0;
#0 ap_enable_reg_pp0_iter15 = 1'b0;
#0 ap_done_reg = 1'b0;
end

pip_kernel_sdiv_11ns_18ns_18_15_1 #(
    .ID( 1 ),
    .NUM_STAGE( 15 ),
    .din0_WIDTH( 11 ),
    .din1_WIDTH( 18 ),
    .dout_WIDTH( 18 ))
sdiv_11ns_18ns_18_15_1_U1(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_145_p0),
    .din1(grp_fu_145_p1),
    .ce(1'b1),
    .dout(grp_fu_145_p2)
);

pip_kernel_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter14_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter10 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter11 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter11 <= ap_enable_reg_pp0_iter10;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter12 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter12 <= ap_enable_reg_pp0_iter11;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter13 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter13 <= ap_enable_reg_pp0_iter12;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter14 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter14 <= ap_enable_reg_pp0_iter13;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter15 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter15 <= ap_enable_reg_pp0_iter14;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter6 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter7 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter8 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter9 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter9 <= ap_enable_reg_pp0_iter8;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln25_fu_85_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            p_Val2_1_fu_60 <= i_fu_91_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            p_Val2_1_fu_60 <= 11'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter10_reg <= ap_loop_exit_ready_pp0_iter9_reg;
        ap_loop_exit_ready_pp0_iter11_reg <= ap_loop_exit_ready_pp0_iter10_reg;
        ap_loop_exit_ready_pp0_iter12_reg <= ap_loop_exit_ready_pp0_iter11_reg;
        ap_loop_exit_ready_pp0_iter13_reg <= ap_loop_exit_ready_pp0_iter12_reg;
        ap_loop_exit_ready_pp0_iter14_reg <= ap_loop_exit_ready_pp0_iter13_reg;
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
        ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
        ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
        ap_loop_exit_ready_pp0_iter8_reg <= ap_loop_exit_ready_pp0_iter7_reg;
        ap_loop_exit_ready_pp0_iter9_reg <= ap_loop_exit_ready_pp0_iter8_reg;
        p_Val2_2_reg_243_pp0_iter10_reg <= p_Val2_2_reg_243_pp0_iter9_reg;
        p_Val2_2_reg_243_pp0_iter11_reg <= p_Val2_2_reg_243_pp0_iter10_reg;
        p_Val2_2_reg_243_pp0_iter12_reg <= p_Val2_2_reg_243_pp0_iter11_reg;
        p_Val2_2_reg_243_pp0_iter13_reg <= p_Val2_2_reg_243_pp0_iter12_reg;
        p_Val2_2_reg_243_pp0_iter14_reg <= p_Val2_2_reg_243_pp0_iter13_reg;
        p_Val2_2_reg_243_pp0_iter2_reg <= p_Val2_2_reg_243_pp0_iter1_reg;
        p_Val2_2_reg_243_pp0_iter3_reg <= p_Val2_2_reg_243_pp0_iter2_reg;
        p_Val2_2_reg_243_pp0_iter4_reg <= p_Val2_2_reg_243_pp0_iter3_reg;
        p_Val2_2_reg_243_pp0_iter5_reg <= p_Val2_2_reg_243_pp0_iter4_reg;
        p_Val2_2_reg_243_pp0_iter6_reg <= p_Val2_2_reg_243_pp0_iter5_reg;
        p_Val2_2_reg_243_pp0_iter7_reg <= p_Val2_2_reg_243_pp0_iter6_reg;
        p_Val2_2_reg_243_pp0_iter8_reg <= p_Val2_2_reg_243_pp0_iter7_reg;
        p_Val2_2_reg_243_pp0_iter9_reg <= p_Val2_2_reg_243_pp0_iter8_reg;
        real_val_V_reg_257 <= real_val_V_fu_224_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        p_Val2_2_reg_243 <= ap_sig_allocacmp_p_Val2_2;
        p_Val2_2_reg_243_pp0_iter1_reg <= p_Val2_2_reg_243;
    end
end

always @ (*) begin
    if (((icmp_ln25_fu_85_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter14_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter15 == 1'b0) & (ap_enable_reg_pp0_iter14 == 1'b0) & (ap_enable_reg_pp0_iter13 == 1'b0) & (ap_enable_reg_pp0_iter12 == 1'b0) & (ap_enable_reg_pp0_iter11 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_p_Val2_2 = 11'd0;
    end else begin
        ap_sig_allocacmp_p_Val2_2 = p_Val2_1_fu_60;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter15 == 1'b1))) begin
        div_table_V_ce0 = 1'b1;
    end else begin
        div_table_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter15 == 1'b1))) begin
        div_table_V_we0 = 1'b1;
    end else begin
        div_table_V_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state10_pp0_stage0_iter9 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage0_iter10 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage0_iter11 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage0_iter12 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage0_iter13 = ~(1'b1 == 1'b1);

assign ap_block_state15_pp0_stage0_iter14 = ~(1'b1 == 1'b1);

assign ap_block_state16_pp0_stage0_iter15 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter8 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign div_table_V_address0 = v_assign_cast_fu_232_p1;

assign div_table_V_d0 = real_val_V_reg_257;

assign grp_fu_145_p0 = 18'd256;

assign grp_fu_145_p1 = ((overflow_fu_125_p2[0:0] == 1'b1) ? 18'd262143 : xor_ln1349_fu_131_p2);

assign i_fu_91_p2 = (ap_sig_allocacmp_p_Val2_2 + 11'd1);

assign icmp_ln25_fu_85_p2 = ((ap_sig_allocacmp_p_Val2_2 == 11'd1024) ? 1'b1 : 1'b0);

assign icmp_ln924_fu_180_p2 = ((tmp_1_fu_170_p4 != 2'd0) ? 1'b1 : 1'b0);

assign icmp_ln942_fu_198_p2 = ((tmp_1_fu_170_p4 != 2'd3) ? 1'b1 : 1'b0);

assign or_ln392_fu_218_p2 = (underflow_fu_204_p2 | overflow_1_fu_192_p2);

assign overflow_1_fu_192_p2 = (xor_ln941_fu_186_p2 & icmp_ln924_fu_180_p2);

assign overflow_fu_125_p2 = (tmp_fu_117_p3 | p_Result_s_fu_109_p3);

assign p_Result_1_fu_162_p3 = grp_fu_145_p2[32'd9];

assign p_Result_s_fu_109_p3 = ap_sig_allocacmp_p_Val2_2[32'd9];

assign p_Val2_s_fu_101_p3 = {{trunc_ln887_fu_97_p1}, {8'd0}};

assign real_val_V_2_fu_156_p2 = grp_fu_145_p2 << 18'd8;

assign real_val_V_fu_224_p3 = ((or_ln392_fu_218_p2[0:0] == 1'b1) ? select_ln392_fu_210_p3 : real_val_V_2_fu_156_p2);

assign select_ln392_fu_210_p3 = ((overflow_1_fu_192_p2[0:0] == 1'b1) ? 18'd131071 : 18'd131072);

assign tmp_1_fu_170_p4 = {{grp_fu_145_p2[11:10]}};

assign tmp_fu_117_p3 = ap_sig_allocacmp_p_Val2_2[32'd10];

assign trunc_ln887_fu_97_p1 = ap_sig_allocacmp_p_Val2_2[9:0];

assign underflow_fu_204_p2 = (p_Result_1_fu_162_p3 & icmp_ln942_fu_198_p2);

assign v_assign_cast_fu_232_p1 = p_Val2_2_reg_243_pp0_iter14_reg;

assign xor_ln1349_fu_131_p2 = (p_Val2_s_fu_101_p3 ^ 18'd131072);

assign xor_ln941_fu_186_p2 = (p_Result_1_fu_162_p3 ^ 1'd1);

endmodule //pip_kernel_pip_kernel_Pipeline_LOOP_INIT_DIV_TABLE
