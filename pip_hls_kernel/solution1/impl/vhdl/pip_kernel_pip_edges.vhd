-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pip_kernel_pip_edges is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    px : IN STD_LOGIC_VECTOR (17 downto 0);
    py : IN STD_LOGIC_VECTOR (17 downto 0);
    edges_Addr_A : OUT STD_LOGIC_VECTOR (31 downto 0);
    edges_EN_A : OUT STD_LOGIC;
    edges_WEN_A : OUT STD_LOGIC_VECTOR (3 downto 0);
    edges_Din_A : OUT STD_LOGIC_VECTOR (31 downto 0);
    edges_Dout_A : IN STD_LOGIC_VECTOR (31 downto 0);
    edges_Addr_B : OUT STD_LOGIC_VECTOR (31 downto 0);
    edges_EN_B : OUT STD_LOGIC;
    edges_WEN_B : OUT STD_LOGIC_VECTOR (3 downto 0);
    edges_Din_B : OUT STD_LOGIC_VECTOR (31 downto 0);
    edges_Dout_B : IN STD_LOGIC_VECTOR (31 downto 0);
    div_table_V_address0 : OUT STD_LOGIC_VECTOR (9 downto 0);
    div_table_V_ce0 : OUT STD_LOGIC;
    div_table_V_q0 : IN STD_LOGIC_VECTOR (17 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (5 downto 0);
    ap_ce : IN STD_LOGIC );
end;


architecture behav of pip_kernel_pip_edges is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (14 downto 0) := "000000000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (14 downto 0) := "000000000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (14 downto 0) := "000000000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (14 downto 0) := "000000001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (14 downto 0) := "000000010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (14 downto 0) := "000000100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (14 downto 0) := "000001000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (14 downto 0) := "000010000000000";
    constant ap_ST_fsm_state12 : STD_LOGIC_VECTOR (14 downto 0) := "000100000000000";
    constant ap_ST_fsm_state13 : STD_LOGIC_VECTOR (14 downto 0) := "001000000000000";
    constant ap_ST_fsm_state14 : STD_LOGIC_VECTOR (14 downto 0) := "010000000000000";
    constant ap_ST_fsm_state15 : STD_LOGIC_VECTOR (14 downto 0) := "100000000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001101";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv32_B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001011";
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv32_E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001110";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv64_1 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000001";
    constant ap_const_lv64_2 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000010";
    constant ap_const_lv64_3 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000011";
    constant ap_const_lv6_1D : STD_LOGIC_VECTOR (5 downto 0) := "011101";
    constant ap_const_lv6_0 : STD_LOGIC_VECTOR (5 downto 0) := "000000";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (14 downto 0) := "000000000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal edges_load_reg_140 : STD_LOGIC_VECTOR (17 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal edges_load_1_reg_145 : STD_LOGIC_VECTOR (17 downto 0);
    signal edges_load_2_reg_160 : STD_LOGIC_VECTOR (17 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal edges_load_3_reg_165 : STD_LOGIC_VECTOR (17 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal grp_pip_crossing2_fu_93_ap_return : STD_LOGIC_VECTOR (0 downto 0);
    signal acc_reg_175 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state14 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state14 : signal is "none";
    signal ap_port_reg_px : STD_LOGIC_VECTOR (17 downto 0);
    signal ap_port_reg_py : STD_LOGIC_VECTOR (17 downto 0);
    signal grp_pip_crossing2_fu_93_ap_start : STD_LOGIC;
    signal grp_pip_crossing2_fu_93_ap_done : STD_LOGIC;
    signal grp_pip_crossing2_fu_93_ap_idle : STD_LOGIC;
    signal grp_pip_crossing2_fu_93_ap_ready : STD_LOGIC;
    signal grp_pip_crossing2_fu_93_div_table_V_address0 : STD_LOGIC_VECTOR (9 downto 0);
    signal grp_pip_crossing2_fu_93_div_table_V_ce0 : STD_LOGIC;
    signal grp_pip_crossing2_fu_93_ap_ce : STD_LOGIC;
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal ap_CS_fsm_state11 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state11 : signal is "none";
    signal ap_CS_fsm_state12 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state12 : signal is "none";
    signal ap_CS_fsm_state13 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state13 : signal is "none";
    signal ap_CS_fsm_state15 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state15 : signal is "none";
    signal grp_pip_crossing2_fu_93_ap_start_reg : STD_LOGIC := '0';
    signal ap_NS_fsm : STD_LOGIC_VECTOR (14 downto 0);
    signal ap_NS_fsm_state4 : STD_LOGIC;
    signal edges_Addr_B_orig : STD_LOGIC_VECTOR (31 downto 0);
    signal edges_Addr_A_orig : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_107_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln886_fu_117_p3 : STD_LOGIC_VECTOR (5 downto 0);
    signal tmp_cast_fu_113_p1 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal ap_ST_fsm_state9_blk : STD_LOGIC;
    signal ap_ST_fsm_state10_blk : STD_LOGIC;
    signal ap_ST_fsm_state11_blk : STD_LOGIC;
    signal ap_ST_fsm_state12_blk : STD_LOGIC;
    signal ap_ST_fsm_state13_blk : STD_LOGIC;
    signal ap_ST_fsm_state14_blk : STD_LOGIC;
    signal ap_ST_fsm_state15_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component pip_kernel_pip_crossing2 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        p_x : IN STD_LOGIC_VECTOR (17 downto 0);
        p_y : IN STD_LOGIC_VECTOR (17 downto 0);
        e1_x : IN STD_LOGIC_VECTOR (17 downto 0);
        e1_y : IN STD_LOGIC_VECTOR (17 downto 0);
        e2_x : IN STD_LOGIC_VECTOR (17 downto 0);
        e2_y : IN STD_LOGIC_VECTOR (17 downto 0);
        div_table_V_address0 : OUT STD_LOGIC_VECTOR (9 downto 0);
        div_table_V_ce0 : OUT STD_LOGIC;
        div_table_V_q0 : IN STD_LOGIC_VECTOR (17 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (0 downto 0);
        ap_ce : IN STD_LOGIC );
    end component;



begin
    grp_pip_crossing2_fu_93 : component pip_kernel_pip_crossing2
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_pip_crossing2_fu_93_ap_start,
        ap_done => grp_pip_crossing2_fu_93_ap_done,
        ap_idle => grp_pip_crossing2_fu_93_ap_idle,
        ap_ready => grp_pip_crossing2_fu_93_ap_ready,
        p_x => ap_port_reg_px,
        p_y => ap_port_reg_py,
        e1_x => edges_load_reg_140,
        e1_y => edges_load_1_reg_145,
        e2_x => edges_load_2_reg_160,
        e2_y => edges_load_3_reg_165,
        div_table_V_address0 => grp_pip_crossing2_fu_93_div_table_V_address0,
        div_table_V_ce0 => grp_pip_crossing2_fu_93_div_table_V_ce0,
        div_table_V_q0 => div_table_V_q0,
        ap_return => grp_pip_crossing2_fu_93_ap_return,
        ap_ce => grp_pip_crossing2_fu_93_ap_ce);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    grp_pip_crossing2_fu_93_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_pip_crossing2_fu_93_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_logic_1 = ap_NS_fsm_state4))) then 
                    grp_pip_crossing2_fu_93_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_pip_crossing2_fu_93_ap_ready = ap_const_logic_1)) then 
                    grp_pip_crossing2_fu_93_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state14)) then
                acc_reg_175 <= grp_pip_crossing2_fu_93_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                ap_port_reg_px <= px;
                ap_port_reg_py <= py;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                edges_load_1_reg_145 <= edges_Dout_A(18 - 1 downto 0);
                edges_load_reg_140 <= edges_Dout_B(18 - 1 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                edges_load_2_reg_160 <= edges_Dout_B(18 - 1 downto 0);
                edges_load_3_reg_165 <= edges_Dout_A(18 - 1 downto 0);
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_ce, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state14, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, ap_CS_fsm_state8, ap_CS_fsm_state9, ap_CS_fsm_state10, ap_CS_fsm_state11, ap_CS_fsm_state12, ap_CS_fsm_state13, ap_CS_fsm_state15)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_logic_1 = ap_ce))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_const_logic_1 = ap_ce))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state4) and (ap_const_logic_1 = ap_ce))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                if (((ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when ap_ST_fsm_state6 => 
                if (((ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state6))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when ap_ST_fsm_state7 => 
                if (((ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state7))) then
                    ap_NS_fsm <= ap_ST_fsm_state8;
                else
                    ap_NS_fsm <= ap_ST_fsm_state7;
                end if;
            when ap_ST_fsm_state8 => 
                if (((ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state8))) then
                    ap_NS_fsm <= ap_ST_fsm_state9;
                else
                    ap_NS_fsm <= ap_ST_fsm_state8;
                end if;
            when ap_ST_fsm_state9 => 
                if (((ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state9))) then
                    ap_NS_fsm <= ap_ST_fsm_state10;
                else
                    ap_NS_fsm <= ap_ST_fsm_state9;
                end if;
            when ap_ST_fsm_state10 => 
                if (((ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state10))) then
                    ap_NS_fsm <= ap_ST_fsm_state11;
                else
                    ap_NS_fsm <= ap_ST_fsm_state10;
                end if;
            when ap_ST_fsm_state11 => 
                if (((ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state11))) then
                    ap_NS_fsm <= ap_ST_fsm_state12;
                else
                    ap_NS_fsm <= ap_ST_fsm_state11;
                end if;
            when ap_ST_fsm_state12 => 
                if (((ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state12))) then
                    ap_NS_fsm <= ap_ST_fsm_state13;
                else
                    ap_NS_fsm <= ap_ST_fsm_state12;
                end if;
            when ap_ST_fsm_state13 => 
                if (((ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state13))) then
                    ap_NS_fsm <= ap_ST_fsm_state14;
                else
                    ap_NS_fsm <= ap_ST_fsm_state13;
                end if;
            when ap_ST_fsm_state14 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state14) and (ap_const_logic_1 = ap_ce))) then
                    ap_NS_fsm <= ap_ST_fsm_state15;
                else
                    ap_NS_fsm <= ap_ST_fsm_state14;
                end if;
            when ap_ST_fsm_state15 => 
                if (((ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state15))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state15;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXXXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(9);
    ap_CS_fsm_state11 <= ap_CS_fsm(10);
    ap_CS_fsm_state12 <= ap_CS_fsm(11);
    ap_CS_fsm_state13 <= ap_CS_fsm(12);
    ap_CS_fsm_state14 <= ap_CS_fsm(13);
    ap_CS_fsm_state15 <= ap_CS_fsm(14);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);
    ap_NS_fsm_state4 <= ap_NS_fsm(3);

    ap_ST_fsm_state10_blk_assign_proc : process(ap_ce)
    begin
        if ((ap_const_logic_0 = ap_ce)) then 
            ap_ST_fsm_state10_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state10_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state11_blk_assign_proc : process(ap_ce)
    begin
        if ((ap_const_logic_0 = ap_ce)) then 
            ap_ST_fsm_state11_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state11_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state12_blk_assign_proc : process(ap_ce)
    begin
        if ((ap_const_logic_0 = ap_ce)) then 
            ap_ST_fsm_state12_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state12_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state13_blk_assign_proc : process(ap_ce)
    begin
        if ((ap_const_logic_0 = ap_ce)) then 
            ap_ST_fsm_state13_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state13_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state14_blk_assign_proc : process(ap_ce)
    begin
        if ((ap_const_logic_0 = ap_ce)) then 
            ap_ST_fsm_state14_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state14_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state15_blk_assign_proc : process(ap_ce)
    begin
        if ((ap_const_logic_0 = ap_ce)) then 
            ap_ST_fsm_state15_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state15_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_ce)
    begin
        if (((ap_const_logic_0 = ap_ce) or (ap_start = ap_const_logic_0))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(ap_ce)
    begin
        if ((ap_const_logic_0 = ap_ce)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state3_blk_assign_proc : process(ap_ce)
    begin
        if ((ap_const_logic_0 = ap_ce)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state4_blk_assign_proc : process(ap_ce)
    begin
        if ((ap_const_logic_0 = ap_ce)) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state5_blk_assign_proc : process(ap_ce)
    begin
        if ((ap_const_logic_0 = ap_ce)) then 
            ap_ST_fsm_state5_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state5_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state6_blk_assign_proc : process(ap_ce)
    begin
        if ((ap_const_logic_0 = ap_ce)) then 
            ap_ST_fsm_state6_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state6_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state7_blk_assign_proc : process(ap_ce)
    begin
        if ((ap_const_logic_0 = ap_ce)) then 
            ap_ST_fsm_state7_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state7_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state8_blk_assign_proc : process(ap_ce)
    begin
        if ((ap_const_logic_0 = ap_ce)) then 
            ap_ST_fsm_state8_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state8_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state9_blk_assign_proc : process(ap_ce)
    begin
        if ((ap_const_logic_0 = ap_ce)) then 
            ap_ST_fsm_state9_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state9_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_ce, ap_CS_fsm_state15)
    begin
        if ((((ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state15)) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_ce, ap_CS_fsm_state15)
    begin
        if (((ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state15))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_return <= std_logic_vector(unsigned(select_ln886_fu_117_p3) + unsigned(tmp_cast_fu_113_p1));
    div_table_V_address0 <= grp_pip_crossing2_fu_93_div_table_V_address0;
    div_table_V_ce0 <= grp_pip_crossing2_fu_93_div_table_V_ce0;
    edges_Addr_A <= std_logic_vector(shift_left(unsigned(edges_Addr_A_orig),to_integer(unsigned('0' & ap_const_lv32_2(31-1 downto 0)))));

    edges_Addr_A_orig_assign_proc : process(ap_CS_fsm_state1, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            edges_Addr_A_orig <= ap_const_lv64_3(32 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            edges_Addr_A_orig <= ap_const_lv64_1(32 - 1 downto 0);
        else 
            edges_Addr_A_orig <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    edges_Addr_B <= std_logic_vector(shift_left(unsigned(edges_Addr_B_orig),to_integer(unsigned('0' & ap_const_lv32_2(31-1 downto 0)))));

    edges_Addr_B_orig_assign_proc : process(ap_CS_fsm_state1, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            edges_Addr_B_orig <= ap_const_lv64_2(32 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            edges_Addr_B_orig <= ap_const_lv64_0(32 - 1 downto 0);
        else 
            edges_Addr_B_orig <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    edges_Din_A <= ap_const_lv32_0;
    edges_Din_B <= ap_const_lv32_0;

    edges_EN_A_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_ce, ap_CS_fsm_state2)
    begin
        if ((((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_logic_1 = ap_ce)))) then 
            edges_EN_A <= ap_const_logic_1;
        else 
            edges_EN_A <= ap_const_logic_0;
        end if; 
    end process;


    edges_EN_B_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_ce, ap_CS_fsm_state2)
    begin
        if ((((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_logic_1 = ap_ce)))) then 
            edges_EN_B <= ap_const_logic_1;
        else 
            edges_EN_B <= ap_const_logic_0;
        end if; 
    end process;

    edges_WEN_A <= ap_const_lv4_0;
    edges_WEN_B <= ap_const_lv4_0;

    grp_pip_crossing2_fu_93_ap_ce_assign_proc : process(ap_CS_fsm_state1, ap_ce, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state15)
    begin
        if (((ap_const_logic_0 = ap_ce) or (ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state1) or (ap_const_logic_1 = ap_CS_fsm_state15))) then 
            grp_pip_crossing2_fu_93_ap_ce <= ap_const_logic_0;
        else 
            grp_pip_crossing2_fu_93_ap_ce <= ap_const_logic_1;
        end if; 
    end process;

    grp_pip_crossing2_fu_93_ap_start <= grp_pip_crossing2_fu_93_ap_start_reg;
    select_ln886_fu_117_p3 <= 
        ap_const_lv6_1D when (acc_reg_175(0) = '1') else 
        ap_const_lv6_0;
    tmp_cast_fu_113_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_fu_107_p3),6));
    tmp_fu_107_p3 <= (acc_reg_175 & acc_reg_175);
end behav;
