// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module pip_kernel_pip_edges (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        px,
        py,
        edges_Addr_A,
        edges_EN_A,
        edges_WEN_A,
        edges_Din_A,
        edges_Dout_A,
        edges_Addr_B,
        edges_EN_B,
        edges_WEN_B,
        edges_Din_B,
        edges_Dout_B,
        div_table_V_address0,
        div_table_V_ce0,
        div_table_V_q0,
        ap_return,
        ap_ce
);

parameter    ap_ST_fsm_state1 = 15'd1;
parameter    ap_ST_fsm_state2 = 15'd2;
parameter    ap_ST_fsm_state3 = 15'd4;
parameter    ap_ST_fsm_state4 = 15'd8;
parameter    ap_ST_fsm_state5 = 15'd16;
parameter    ap_ST_fsm_state6 = 15'd32;
parameter    ap_ST_fsm_state7 = 15'd64;
parameter    ap_ST_fsm_state8 = 15'd128;
parameter    ap_ST_fsm_state9 = 15'd256;
parameter    ap_ST_fsm_state10 = 15'd512;
parameter    ap_ST_fsm_state11 = 15'd1024;
parameter    ap_ST_fsm_state12 = 15'd2048;
parameter    ap_ST_fsm_state13 = 15'd4096;
parameter    ap_ST_fsm_state14 = 15'd8192;
parameter    ap_ST_fsm_state15 = 15'd16384;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [17:0] px;
input  [17:0] py;
output  [31:0] edges_Addr_A;
output   edges_EN_A;
output  [3:0] edges_WEN_A;
output  [31:0] edges_Din_A;
input  [31:0] edges_Dout_A;
output  [31:0] edges_Addr_B;
output   edges_EN_B;
output  [3:0] edges_WEN_B;
output  [31:0] edges_Din_B;
input  [31:0] edges_Dout_B;
output  [9:0] div_table_V_address0;
output   div_table_V_ce0;
input  [17:0] div_table_V_q0;
output  [5:0] ap_return;
input   ap_ce;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg edges_EN_A;
reg edges_EN_B;

(* fsm_encoding = "none" *) reg   [14:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [17:0] edges_load_reg_140;
wire    ap_CS_fsm_state2;
reg   [17:0] edges_load_1_reg_145;
reg   [17:0] edges_load_2_reg_160;
wire    ap_CS_fsm_state3;
reg   [17:0] edges_load_3_reg_165;
wire    ap_CS_fsm_state4;
wire   [0:0] grp_pip_crossing2_fu_93_ap_return;
reg   [0:0] acc_reg_175;
wire    ap_CS_fsm_state14;
reg   [17:0] ap_port_reg_px;
reg   [17:0] ap_port_reg_py;
wire    grp_pip_crossing2_fu_93_ap_start;
wire    grp_pip_crossing2_fu_93_ap_done;
wire    grp_pip_crossing2_fu_93_ap_idle;
wire    grp_pip_crossing2_fu_93_ap_ready;
wire   [9:0] grp_pip_crossing2_fu_93_div_table_V_address0;
wire    grp_pip_crossing2_fu_93_div_table_V_ce0;
reg    grp_pip_crossing2_fu_93_ap_ce;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
wire    ap_CS_fsm_state7;
wire    ap_CS_fsm_state8;
wire    ap_CS_fsm_state9;
wire    ap_CS_fsm_state10;
wire    ap_CS_fsm_state11;
wire    ap_CS_fsm_state12;
wire    ap_CS_fsm_state13;
wire    ap_CS_fsm_state15;
reg    grp_pip_crossing2_fu_93_ap_start_reg;
reg   [14:0] ap_NS_fsm;
wire    ap_NS_fsm_state4;
reg   [31:0] edges_Addr_B_orig;
reg   [31:0] edges_Addr_A_orig;
wire   [1:0] tmp_fu_107_p3;
wire   [5:0] select_ln886_fu_117_p3;
wire   [5:0] tmp_cast_fu_113_p1;
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
reg    ap_ST_fsm_state12_blk;
reg    ap_ST_fsm_state13_blk;
reg    ap_ST_fsm_state14_blk;
reg    ap_ST_fsm_state15_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 15'd1;
#0 grp_pip_crossing2_fu_93_ap_start_reg = 1'b0;
end

pip_kernel_pip_crossing2 grp_pip_crossing2_fu_93(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_pip_crossing2_fu_93_ap_start),
    .ap_done(grp_pip_crossing2_fu_93_ap_done),
    .ap_idle(grp_pip_crossing2_fu_93_ap_idle),
    .ap_ready(grp_pip_crossing2_fu_93_ap_ready),
    .p_x(ap_port_reg_px),
    .p_y(ap_port_reg_py),
    .e1_x(edges_load_reg_140),
    .e1_y(edges_load_1_reg_145),
    .e2_x(edges_load_2_reg_160),
    .e2_y(edges_load_3_reg_165),
    .div_table_V_address0(grp_pip_crossing2_fu_93_div_table_V_address0),
    .div_table_V_ce0(grp_pip_crossing2_fu_93_div_table_V_ce0),
    .div_table_V_q0(div_table_V_q0),
    .ap_return(grp_pip_crossing2_fu_93_ap_return),
    .ap_ce(grp_pip_crossing2_fu_93_ap_ce)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_pip_crossing2_fu_93_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state3) & (1'b1 == ap_NS_fsm_state4))) begin
            grp_pip_crossing2_fu_93_ap_start_reg <= 1'b1;
        end else if ((grp_pip_crossing2_fu_93_ap_ready == 1'b1)) begin
            grp_pip_crossing2_fu_93_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        acc_reg_175 <= grp_pip_crossing2_fu_93_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_port_reg_px <= px;
        ap_port_reg_py <= py;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        edges_load_1_reg_145 <= edges_Dout_A;
        edges_load_reg_140 <= edges_Dout_B;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        edges_load_2_reg_160 <= edges_Dout_B;
        edges_load_3_reg_165 <= edges_Dout_A;
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
    if ((1'b0 == ap_ce)) begin
        ap_ST_fsm_state12_blk = 1'b1;
    end else begin
        ap_ST_fsm_state12_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce)) begin
        ap_ST_fsm_state13_blk = 1'b1;
    end else begin
        ap_ST_fsm_state13_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce)) begin
        ap_ST_fsm_state14_blk = 1'b1;
    end else begin
        ap_ST_fsm_state14_blk = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce)) begin
        ap_ST_fsm_state15_blk = 1'b1;
    end else begin
        ap_ST_fsm_state15_blk = 1'b0;
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
    if ((((1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state15)) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state15))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        edges_Addr_A_orig = 64'd3;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        edges_Addr_A_orig = 64'd1;
    end else begin
        edges_Addr_A_orig = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        edges_Addr_B_orig = 64'd2;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        edges_Addr_B_orig = 64'd0;
    end else begin
        edges_Addr_B_orig = 'bx;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b1) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state1)) | ((1'b1 == ap_CS_fsm_state2) & (1'b1 == ap_ce)))) begin
        edges_EN_A = 1'b1;
    end else begin
        edges_EN_A = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b1) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state1)) | ((1'b1 == ap_CS_fsm_state2) & (1'b1 == ap_ce)))) begin
        edges_EN_B = 1'b1;
    end else begin
        edges_EN_B = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_ce) | (1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state1) | (1'b1 == ap_CS_fsm_state15))) begin
        grp_pip_crossing2_fu_93_ap_ce = 1'b0;
    end else begin
        grp_pip_crossing2_fu_93_ap_ce = 1'b1;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state1))) begin
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
            if (((1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state7))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state8 : begin
            if (((1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state8))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state9 : begin
            if (((1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state9))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        ap_ST_fsm_state10 : begin
            if (((1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state10))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state11 : begin
            if (((1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state11))) begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end
        end
        ap_ST_fsm_state12 : begin
            if (((1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state12))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end
        end
        ap_ST_fsm_state13 : begin
            if (((1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state13))) begin
                ap_NS_fsm = ap_ST_fsm_state14;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end
        end
        ap_ST_fsm_state14 : begin
            if (((1'b1 == ap_CS_fsm_state14) & (1'b1 == ap_ce))) begin
                ap_NS_fsm = ap_ST_fsm_state15;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state14;
            end
        end
        ap_ST_fsm_state15 : begin
            if (((1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_state15))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state15;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_state15 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

assign ap_NS_fsm_state4 = ap_NS_fsm[32'd3];

assign ap_return = (select_ln886_fu_117_p3 + tmp_cast_fu_113_p1);

assign div_table_V_address0 = grp_pip_crossing2_fu_93_div_table_V_address0;

assign div_table_V_ce0 = grp_pip_crossing2_fu_93_div_table_V_ce0;

assign edges_Addr_A = edges_Addr_A_orig << 32'd2;

assign edges_Addr_B = edges_Addr_B_orig << 32'd2;

assign edges_Din_A = 32'd0;

assign edges_Din_B = 32'd0;

assign edges_WEN_A = 4'd0;

assign edges_WEN_B = 4'd0;

assign grp_pip_crossing2_fu_93_ap_start = grp_pip_crossing2_fu_93_ap_start_reg;

assign select_ln886_fu_117_p3 = ((acc_reg_175[0:0] == 1'b1) ? 6'd29 : 6'd0);

assign tmp_cast_fu_113_p1 = tmp_fu_107_p3;

assign tmp_fu_107_p3 = {{acc_reg_175}, {acc_reg_175}};

endmodule //pip_kernel_pip_edges
