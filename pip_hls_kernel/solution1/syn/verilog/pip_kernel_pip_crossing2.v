// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pip_kernel_pip_crossing2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        p_x,
        p_y,
        e1_x,
        e1_y,
        e2_x,
        e2_y,
        div_table_V_address0,
        div_table_V_ce0,
        div_table_V_q0,
        ap_return,
        ap_ce
);

parameter    ap_ST_fsm_state1 = 11'd1;
parameter    ap_ST_fsm_state2 = 11'd2;
parameter    ap_ST_fsm_state3 = 11'd4;
parameter    ap_ST_fsm_state4 = 11'd8;
parameter    ap_ST_fsm_state5 = 11'd16;
parameter    ap_ST_fsm_state6 = 11'd32;
parameter    ap_ST_fsm_state7 = 11'd64;
parameter    ap_ST_fsm_state8 = 11'd128;
parameter    ap_ST_fsm_state9 = 11'd256;
parameter    ap_ST_fsm_state10 = 11'd512;
parameter    ap_ST_fsm_state11 = 11'd1024;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [17:0] p_x;
input  [17:0] p_y;
input  [17:0] e1_x;
input  [17:0] e1_y;
input  [17:0] e2_x;
input  [17:0] e2_y;
output  [9:0] div_table_V_address0;
output   div_table_V_ce0;
input  [17:0] div_table_V_q0;
output  [0:0] ap_return;
input   ap_ce;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg div_table_V_ce0;

(* fsm_encoding = "none" *) reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] icmp_ln1698_fu_129_p2;
reg   [0:0] icmp_ln1698_reg_843;
wire   [0:0] icmp_ln1695_fu_135_p2;
reg   [0:0] icmp_ln1695_reg_848;
wire   [0:0] icmp_ln1695_1_fu_141_p2;
reg   [0:0] icmp_ln1695_1_reg_853;
wire   [0:0] icmp_ln1698_1_fu_147_p2;
reg   [0:0] icmp_ln1698_1_reg_858;
wire   [17:0] a_V_fu_213_p3;
reg  signed [17:0] a_V_reg_863;
wire   [9:0] ret_V_2_fu_327_p3;
reg   [9:0] ret_V_2_reg_868;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire   [17:0] vt_V_1_fu_545_p3;
reg  signed [17:0] vt_V_1_reg_888;
wire    ap_CS_fsm_state6;
reg  signed [17:0] e1_x_read_reg_893;
wire    ap_CS_fsm_state7;
(* use_dsp48 = "no" *) wire   [36:0] ret_V_8_fu_575_p2;
reg   [36:0] ret_V_8_reg_903;
wire    ap_CS_fsm_state10;
reg   [0:0] p_Result_15_reg_908;
reg   [17:0] ix_V_3_reg_914;
reg   [0:0] p_Result_16_reg_919;
reg   [0:0] tmp_10_reg_924;
wire   [0:0] Range2_all_ones_1_fu_623_p2;
reg   [0:0] Range2_all_ones_1_reg_929;
wire   [0:0] Range1_all_ones_3_fu_639_p2;
reg   [0:0] Range1_all_ones_3_reg_934;
wire   [0:0] Range1_all_zeros_1_fu_645_p2;
reg   [0:0] Range1_all_zeros_1_reg_941;
reg   [17:0] ap_port_reg_p_x;
reg  signed [17:0] ap_port_reg_e1_x;
reg  signed [17:0] ap_port_reg_e2_x;
wire  signed [63:0] sext_ln34_fu_335_p1;
wire    ap_CS_fsm_state11;
wire  signed [17:0] icmp_ln1698_fu_129_p0;
wire  signed [17:0] icmp_ln1698_fu_129_p1;
wire  signed [17:0] icmp_ln1695_fu_135_p0;
wire  signed [17:0] icmp_ln1695_fu_135_p1;
wire  signed [17:0] icmp_ln1695_1_fu_141_p0;
wire  signed [17:0] icmp_ln1695_1_fu_141_p1;
wire  signed [17:0] icmp_ln1698_1_fu_147_p0;
wire  signed [17:0] icmp_ln1698_1_fu_147_p1;
wire  signed [17:0] sext_ln859_fu_153_p0;
wire  signed [17:0] sext_ln1394_fu_157_p0;
wire  signed [18:0] sext_ln859_fu_153_p1;
wire  signed [18:0] sext_ln1394_fu_157_p1;
wire   [18:0] ret_V_6_fu_161_p2;
wire   [0:0] p_Result_8_fu_167_p3;
wire   [0:0] p_Result_9_fu_179_p3;
wire   [0:0] xor_ln941_fu_187_p2;
wire   [0:0] overflow_fu_193_p2;
wire   [0:0] xor_ln348_fu_199_p2;
wire   [17:0] select_ln392_fu_205_p3;
wire   [17:0] p_Val2_4_fu_175_p1;
wire  signed [17:0] sext_ln1394_1_fu_221_p0;
wire  signed [18:0] sext_ln1394_1_fu_221_p1;
wire   [18:0] ret_V_7_fu_225_p2;
wire   [0:0] p_Result_10_fu_231_p3;
wire   [0:0] p_Result_11_fu_243_p3;
wire   [0:0] xor_ln941_1_fu_251_p2;
wire   [0:0] overflow_2_fu_257_p2;
wire   [0:0] xor_ln348_1_fu_263_p2;
wire   [17:0] select_ln392_2_fu_269_p3;
wire   [17:0] p_Val2_6_fu_239_p1;
wire   [17:0] b_V_fu_277_p3;
wire   [7:0] trunc_ln1049_fu_303_p1;
wire   [9:0] ret_V_fu_285_p4;
wire   [0:0] icmp_ln1049_fu_307_p2;
wire   [9:0] ret_V_1_fu_313_p2;
wire   [0:0] p_Result_s_fu_295_p3;
wire   [9:0] select_ln1048_fu_319_p3;
wire  signed [35:0] grp_fu_820_p2;
wire   [0:0] tmp_fu_369_p3;
wire   [17:0] zext_ln423_fu_376_p1;
wire   [17:0] p_Val2_8_fu_353_p4;
wire   [17:0] vt_V_fu_380_p2;
wire   [0:0] p_Result_14_fu_386_p3;
wire   [0:0] p_Result_13_fu_362_p3;
wire   [0:0] xor_ln942_fu_394_p2;
wire   [8:0] tmp_s_fu_406_p4;
wire   [9:0] tmp_1_fu_421_p4;
wire   [0:0] carry_1_fu_400_p2;
wire   [0:0] Range1_all_ones_fu_430_p2;
wire   [0:0] Range1_all_zeros_fu_436_p2;
wire   [0:0] tmp_5_fu_450_p3;
wire   [0:0] Range2_all_ones_fu_415_p2;
wire   [0:0] xor_ln936_fu_457_p2;
wire   [0:0] and_ln936_fu_463_p2;
wire   [0:0] deleted_zeros_fu_442_p3;
wire   [0:0] xor_ln941_2_fu_483_p2;
wire   [0:0] p_Result_12_fu_346_p3;
wire   [0:0] or_ln941_fu_489_p2;
wire   [0:0] xor_ln941_3_fu_495_p2;
wire   [0:0] deleted_ones_fu_469_p3;
wire   [0:0] xor_ln942_1_fu_507_p2;
wire   [0:0] and_ln937_fu_477_p2;
wire   [0:0] or_ln942_fu_513_p2;
wire   [0:0] xor_ln942_4_fu_519_p2;
wire   [0:0] overflow_3_fu_501_p2;
wire   [0:0] underflow_fu_525_p2;
wire   [0:0] or_ln392_fu_539_p2;
wire   [17:0] select_ln392_3_fu_531_p3;
wire   [25:0] lhs_V_fu_564_p3;
wire  signed [36:0] sext_ln1393_fu_571_p1;
wire  signed [36:0] grp_fu_833_p3;
wire   [9:0] tmp_8_fu_613_p4;
wire   [10:0] tmp_9_fu_629_p4;
wire   [0:0] xor_ln1698_fu_651_p2;
wire   [0:0] xor_ln1698_1_fu_661_p2;
wire   [0:0] and_ln46_fu_656_p2;
wire   [0:0] and_ln46_1_fu_666_p2;
wire   [17:0] zext_ln423_1_fu_677_p1;
wire   [17:0] ix_V_4_fu_680_p2;
wire   [0:0] p_Result_17_fu_685_p3;
wire   [0:0] xor_ln942_2_fu_693_p2;
wire   [0:0] carry_3_fu_699_p2;
wire   [0:0] tmp_12_fu_710_p3;
wire   [0:0] xor_ln936_1_fu_717_p2;
wire   [0:0] and_ln936_1_fu_723_p2;
wire   [0:0] deleted_zeros_1_fu_704_p3;
wire   [0:0] xor_ln941_4_fu_740_p2;
wire   [0:0] or_ln941_1_fu_746_p2;
wire   [0:0] xor_ln941_5_fu_752_p2;
wire   [0:0] deleted_ones_3_fu_728_p3;
wire   [0:0] xor_ln942_3_fu_763_p2;
wire   [0:0] and_ln937_1_fu_735_p2;
wire   [0:0] or_ln942_1_fu_769_p2;
wire   [0:0] xor_ln942_5_fu_775_p2;
wire   [0:0] overflow_4_fu_757_p2;
wire   [0:0] underflow_1_fu_781_p2;
wire   [0:0] or_ln392_1_fu_794_p2;
wire   [17:0] select_ln392_5_fu_786_p3;
wire   [17:0] ix_V_fu_800_p3;
wire   [0:0] icmp_ln1696_fu_808_p2;
wire   [0:0] or_ln46_fu_671_p2;
reg    grp_fu_820_ce;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
reg    grp_fu_833_ce;
wire    ap_CS_fsm_state8;
wire    ap_CS_fsm_state9;
reg   [10:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
reg    ap_ST_fsm_state7_blk;
reg    ap_ST_fsm_state8_blk;
reg    ap_ST_fsm_state9_blk;
reg    ap_ST_fsm_state10_blk;
reg    ap_ST_fsm_state11_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 11'd1;
end

pip_kernel_mul_mul_18s_18s_36_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 18 ),
    .dout_WIDTH( 36 ))
mul_mul_18s_18s_36_4_1_U4(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(div_table_V_q0),
    .din1(a_V_reg_863),
    .ce(grp_fu_820_ce),
    .dout(grp_fu_820_p2)
);

pip_kernel_am_submul_18s_18s_18s_37_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 18 ),
    .din2_WIDTH( 18 ),
    .dout_WIDTH( 37 ))
am_submul_18s_18s_18s_37_4_1_U5(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(ap_port_reg_e2_x),
    .din1(ap_port_reg_e1_x),
    .din2(vt_V_1_reg_888),
    .ce(grp_fu_833_ce),
    .dout(grp_fu_833_p3)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        Range1_all_ones_3_reg_934 <= Range1_all_ones_3_fu_639_p2;
        Range1_all_zeros_1_reg_941 <= Range1_all_zeros_1_fu_645_p2;
        Range2_all_ones_1_reg_929 <= Range2_all_ones_1_fu_623_p2;
        ix_V_3_reg_914 <= {{ret_V_8_fu_575_p2[25:8]}};
        p_Result_15_reg_908 <= ret_V_8_fu_575_p2[32'd36];
        p_Result_16_reg_919 <= ret_V_8_fu_575_p2[32'd25];
        ret_V_8_reg_903 <= ret_V_8_fu_575_p2;
        tmp_10_reg_924 <= grp_fu_833_p3[32'd7];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        a_V_reg_863 <= a_V_fu_213_p3;
        icmp_ln1695_1_reg_853 <= icmp_ln1695_1_fu_141_p2;
        icmp_ln1695_reg_848 <= icmp_ln1695_fu_135_p2;
        icmp_ln1698_1_reg_858 <= icmp_ln1698_1_fu_147_p2;
        icmp_ln1698_reg_843 <= icmp_ln1698_fu_129_p2;
        ret_V_2_reg_868 <= ret_V_2_fu_327_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        ap_port_reg_e1_x <= e1_x;
        ap_port_reg_e2_x <= e2_x;
        ap_port_reg_p_x <= p_x;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        e1_x_read_reg_893 <= ap_port_reg_e1_x;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        vt_V_1_reg_888 <= vt_V_1_fu_545_p3;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce)) begin
        ap_ST_fsm_state10_blk = 1'b1;
    end else begin
        ap_ST_fsm_state10_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce)) begin
        ap_ST_fsm_state11_blk = 1'b1;
    end else begin
        ap_ST_fsm_state11_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_ce) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce)) begin
        ap_ST_fsm_state7_blk = 1'b1;
    end else begin
        ap_ST_fsm_state7_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce)) begin
        ap_ST_fsm_state8_blk = 1'b1;
    end else begin
        ap_ST_fsm_state8_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce)) begin
        ap_ST_fsm_state9_blk = 1'b1;
    end else begin
        ap_ST_fsm_state9_blk = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state11)) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state11))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (1'b1 == ap_ce))) begin
        div_table_V_ce0 = 1'b1;
    end else begin
        div_table_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & ((1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4)))) begin
        grp_fu_820_ce = 1'b1;
    end else begin
        grp_fu_820_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & ((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8)))) begin
        grp_fu_833_ce = 1'b1;
    end else begin
        grp_fu_833_ce = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_CS_fsm_state6) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == ap_CS_fsm_state7) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state8 : begin
            if (((1'b1 == ap_CS_fsm_state8) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state9 : begin
            if (((1'b1 == ap_CS_fsm_state9) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        ap_ST_fsm_state10 : begin
            if (((1'b1 == ap_CS_fsm_state10) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state11 : begin
            if (((1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state11))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign Range1_all_ones_3_fu_639_p2 = ((tmp_9_fu_629_p4 == 11'd2047) ? 1'b1 : 1'b0);

assign Range1_all_ones_fu_430_p2 = ((tmp_1_fu_421_p4 == 10'd1023) ? 1'b1 : 1'b0);

assign Range1_all_zeros_1_fu_645_p2 = ((tmp_9_fu_629_p4 == 11'd0) ? 1'b1 : 1'b0);

assign Range1_all_zeros_fu_436_p2 = ((tmp_1_fu_421_p4 == 10'd0) ? 1'b1 : 1'b0);

assign Range2_all_ones_1_fu_623_p2 = ((tmp_8_fu_613_p4 == 10'd1023) ? 1'b1 : 1'b0);

assign Range2_all_ones_fu_415_p2 = ((tmp_s_fu_406_p4 == 9'd511) ? 1'b1 : 1'b0);

assign a_V_fu_213_p3 = ((xor_ln348_fu_199_p2[0:0] == 1'b1) ? select_ln392_fu_205_p3 : p_Val2_4_fu_175_p1);

assign and_ln46_1_fu_666_p2 = (xor_ln1698_1_fu_661_p2 & icmp_ln1695_1_reg_853);

assign and_ln46_fu_656_p2 = (xor_ln1698_fu_651_p2 & icmp_ln1695_reg_848);

assign and_ln936_1_fu_723_p2 = (xor_ln936_1_fu_717_p2 & Range2_all_ones_1_reg_929);

assign and_ln936_fu_463_p2 = (xor_ln936_fu_457_p2 & Range2_all_ones_fu_415_p2);

assign and_ln937_1_fu_735_p2 = (carry_3_fu_699_p2 & Range1_all_ones_3_reg_934);

assign and_ln937_fu_477_p2 = (carry_1_fu_400_p2 & Range1_all_ones_fu_430_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

assign ap_return = (or_ln46_fu_671_p2 & icmp_ln1696_fu_808_p2);

assign b_V_fu_277_p3 = ((xor_ln348_1_fu_263_p2[0:0] == 1'b1) ? select_ln392_2_fu_269_p3 : p_Val2_6_fu_239_p1);

assign carry_1_fu_400_p2 = (xor_ln942_fu_394_p2 & p_Result_13_fu_362_p3);

assign carry_3_fu_699_p2 = (xor_ln942_2_fu_693_p2 & p_Result_16_reg_919);

assign deleted_ones_3_fu_728_p3 = ((carry_3_fu_699_p2[0:0] == 1'b1) ? and_ln936_1_fu_723_p2 : Range1_all_ones_3_reg_934);

assign deleted_ones_fu_469_p3 = ((carry_1_fu_400_p2[0:0] == 1'b1) ? and_ln936_fu_463_p2 : Range1_all_ones_fu_430_p2);

assign deleted_zeros_1_fu_704_p3 = ((carry_3_fu_699_p2[0:0] == 1'b1) ? Range1_all_ones_3_reg_934 : Range1_all_zeros_1_reg_941);

assign deleted_zeros_fu_442_p3 = ((carry_1_fu_400_p2[0:0] == 1'b1) ? Range1_all_ones_fu_430_p2 : Range1_all_zeros_fu_436_p2);

assign div_table_V_address0 = sext_ln34_fu_335_p1;

assign icmp_ln1049_fu_307_p2 = ((trunc_ln1049_fu_303_p1 == 8'd0) ? 1'b1 : 1'b0);

assign icmp_ln1695_1_fu_141_p0 = e1_y;

assign icmp_ln1695_1_fu_141_p1 = p_y;

assign icmp_ln1695_1_fu_141_p2 = (($signed(icmp_ln1695_1_fu_141_p0) > $signed(icmp_ln1695_1_fu_141_p1)) ? 1'b1 : 1'b0);

assign icmp_ln1695_fu_135_p0 = e2_y;

assign icmp_ln1695_fu_135_p1 = p_y;

assign icmp_ln1695_fu_135_p2 = (($signed(icmp_ln1695_fu_135_p0) > $signed(icmp_ln1695_fu_135_p1)) ? 1'b1 : 1'b0);

assign icmp_ln1696_fu_808_p2 = (($signed(ix_V_fu_800_p3) > $signed(ap_port_reg_p_x)) ? 1'b1 : 1'b0);

assign icmp_ln1698_1_fu_147_p0 = p_y;

assign icmp_ln1698_1_fu_147_p1 = e2_y;

assign icmp_ln1698_1_fu_147_p2 = (($signed(icmp_ln1698_1_fu_147_p0) < $signed(icmp_ln1698_1_fu_147_p1)) ? 1'b1 : 1'b0);

assign icmp_ln1698_fu_129_p0 = p_y;

assign icmp_ln1698_fu_129_p1 = e1_y;

assign icmp_ln1698_fu_129_p2 = (($signed(icmp_ln1698_fu_129_p0) < $signed(icmp_ln1698_fu_129_p1)) ? 1'b1 : 1'b0);

assign ix_V_4_fu_680_p2 = (zext_ln423_1_fu_677_p1 + ix_V_3_reg_914);

assign ix_V_fu_800_p3 = ((or_ln392_1_fu_794_p2[0:0] == 1'b1) ? select_ln392_5_fu_786_p3 : ix_V_4_fu_680_p2);

assign lhs_V_fu_564_p3 = {{e1_x_read_reg_893}, {8'd0}};

assign or_ln392_1_fu_794_p2 = (underflow_1_fu_781_p2 | overflow_4_fu_757_p2);

assign or_ln392_fu_539_p2 = (underflow_fu_525_p2 | overflow_3_fu_501_p2);

assign or_ln46_fu_671_p2 = (and_ln46_fu_656_p2 | and_ln46_1_fu_666_p2);

assign or_ln941_1_fu_746_p2 = (xor_ln941_4_fu_740_p2 | p_Result_17_fu_685_p3);

assign or_ln941_fu_489_p2 = (xor_ln941_2_fu_483_p2 | p_Result_14_fu_386_p3);

assign or_ln942_1_fu_769_p2 = (xor_ln942_3_fu_763_p2 | xor_ln942_2_fu_693_p2);

assign or_ln942_fu_513_p2 = (xor_ln942_fu_394_p2 | xor_ln942_1_fu_507_p2);

assign overflow_2_fu_257_p2 = (xor_ln941_1_fu_251_p2 & p_Result_11_fu_243_p3);

assign overflow_3_fu_501_p2 = (xor_ln941_3_fu_495_p2 & or_ln941_fu_489_p2);

assign overflow_4_fu_757_p2 = (xor_ln941_5_fu_752_p2 & or_ln941_1_fu_746_p2);

assign overflow_fu_193_p2 = (xor_ln941_fu_187_p2 & p_Result_9_fu_179_p3);

assign p_Result_10_fu_231_p3 = ret_V_7_fu_225_p2[32'd18];

assign p_Result_11_fu_243_p3 = ret_V_7_fu_225_p2[32'd17];

assign p_Result_12_fu_346_p3 = grp_fu_820_p2[32'd35];

assign p_Result_13_fu_362_p3 = grp_fu_820_p2[32'd25];

assign p_Result_14_fu_386_p3 = vt_V_fu_380_p2[32'd17];

assign p_Result_17_fu_685_p3 = ix_V_4_fu_680_p2[32'd17];

assign p_Result_8_fu_167_p3 = ret_V_6_fu_161_p2[32'd18];

assign p_Result_9_fu_179_p3 = ret_V_6_fu_161_p2[32'd17];

assign p_Result_s_fu_295_p3 = b_V_fu_277_p3[32'd17];

assign p_Val2_4_fu_175_p1 = ret_V_6_fu_161_p2[17:0];

assign p_Val2_6_fu_239_p1 = ret_V_7_fu_225_p2[17:0];

assign p_Val2_8_fu_353_p4 = {{grp_fu_820_p2[25:8]}};

assign ret_V_1_fu_313_p2 = (ret_V_fu_285_p4 + 10'd1);

assign ret_V_2_fu_327_p3 = ((p_Result_s_fu_295_p3[0:0] == 1'b1) ? select_ln1048_fu_319_p3 : ret_V_fu_285_p4);

assign ret_V_6_fu_161_p2 = ($signed(sext_ln859_fu_153_p1) - $signed(sext_ln1394_fu_157_p1));

assign ret_V_7_fu_225_p2 = ($signed(sext_ln1394_1_fu_221_p1) - $signed(sext_ln1394_fu_157_p1));

assign ret_V_8_fu_575_p2 = ($signed(sext_ln1393_fu_571_p1) + $signed(grp_fu_833_p3));

assign ret_V_fu_285_p4 = {{b_V_fu_277_p3[17:8]}};

assign select_ln1048_fu_319_p3 = ((icmp_ln1049_fu_307_p2[0:0] == 1'b1) ? ret_V_fu_285_p4 : ret_V_1_fu_313_p2);

assign select_ln392_2_fu_269_p3 = ((overflow_2_fu_257_p2[0:0] == 1'b1) ? 18'd131071 : 18'd131072);

assign select_ln392_3_fu_531_p3 = ((overflow_3_fu_501_p2[0:0] == 1'b1) ? 18'd131071 : 18'd131072);

assign select_ln392_5_fu_786_p3 = ((overflow_4_fu_757_p2[0:0] == 1'b1) ? 18'd131071 : 18'd131072);

assign select_ln392_fu_205_p3 = ((overflow_fu_193_p2[0:0] == 1'b1) ? 18'd131071 : 18'd131072);

assign sext_ln1393_fu_571_p1 = $signed(lhs_V_fu_564_p3);

assign sext_ln1394_1_fu_221_p0 = e2_y;

assign sext_ln1394_1_fu_221_p1 = sext_ln1394_1_fu_221_p0;

assign sext_ln1394_fu_157_p0 = e1_y;

assign sext_ln1394_fu_157_p1 = sext_ln1394_fu_157_p0;

assign sext_ln34_fu_335_p1 = $signed(ret_V_2_reg_868);

assign sext_ln859_fu_153_p0 = p_y;

assign sext_ln859_fu_153_p1 = sext_ln859_fu_153_p0;

assign tmp_12_fu_710_p3 = ret_V_8_reg_903[32'd26];

assign tmp_1_fu_421_p4 = {{grp_fu_820_p2[35:26]}};

assign tmp_5_fu_450_p3 = grp_fu_820_p2[32'd26];

assign tmp_8_fu_613_p4 = {{ret_V_8_fu_575_p2[36:27]}};

assign tmp_9_fu_629_p4 = {{ret_V_8_fu_575_p2[36:26]}};

assign tmp_fu_369_p3 = grp_fu_820_p2[32'd7];

assign tmp_s_fu_406_p4 = {{grp_fu_820_p2[35:27]}};

assign trunc_ln1049_fu_303_p1 = b_V_fu_277_p3[7:0];

assign underflow_1_fu_781_p2 = (xor_ln942_5_fu_775_p2 & p_Result_15_reg_908);

assign underflow_fu_525_p2 = (xor_ln942_4_fu_519_p2 & p_Result_12_fu_346_p3);

assign vt_V_1_fu_545_p3 = ((or_ln392_fu_539_p2[0:0] == 1'b1) ? select_ln392_3_fu_531_p3 : vt_V_fu_380_p2);

assign vt_V_fu_380_p2 = (zext_ln423_fu_376_p1 + p_Val2_8_fu_353_p4);

assign xor_ln1698_1_fu_661_p2 = (icmp_ln1698_1_reg_858 ^ 1'd1);

assign xor_ln1698_fu_651_p2 = (icmp_ln1698_reg_843 ^ 1'd1);

assign xor_ln348_1_fu_263_p2 = (p_Result_11_fu_243_p3 ^ p_Result_10_fu_231_p3);

assign xor_ln348_fu_199_p2 = (p_Result_9_fu_179_p3 ^ p_Result_8_fu_167_p3);

assign xor_ln936_1_fu_717_p2 = (tmp_12_fu_710_p3 ^ 1'd1);

assign xor_ln936_fu_457_p2 = (tmp_5_fu_450_p3 ^ 1'd1);

assign xor_ln941_1_fu_251_p2 = (p_Result_10_fu_231_p3 ^ 1'd1);

assign xor_ln941_2_fu_483_p2 = (deleted_zeros_fu_442_p3 ^ 1'd1);

assign xor_ln941_3_fu_495_p2 = (p_Result_12_fu_346_p3 ^ 1'd1);

assign xor_ln941_4_fu_740_p2 = (deleted_zeros_1_fu_704_p3 ^ 1'd1);

assign xor_ln941_5_fu_752_p2 = (p_Result_15_reg_908 ^ 1'd1);

assign xor_ln941_fu_187_p2 = (p_Result_8_fu_167_p3 ^ 1'd1);

assign xor_ln942_1_fu_507_p2 = (deleted_ones_fu_469_p3 ^ 1'd1);

assign xor_ln942_2_fu_693_p2 = (p_Result_17_fu_685_p3 ^ 1'd1);

assign xor_ln942_3_fu_763_p2 = (deleted_ones_3_fu_728_p3 ^ 1'd1);

assign xor_ln942_4_fu_519_p2 = (or_ln942_fu_513_p2 ^ and_ln937_fu_477_p2);

assign xor_ln942_5_fu_775_p2 = (or_ln942_1_fu_769_p2 ^ and_ln937_1_fu_735_p2);

assign xor_ln942_fu_394_p2 = (p_Result_14_fu_386_p3 ^ 1'd1);

assign zext_ln423_1_fu_677_p1 = tmp_10_reg_924;

assign zext_ln423_fu_376_p1 = tmp_fu_369_p3;

endmodule //pip_kernel_pip_crossing2
