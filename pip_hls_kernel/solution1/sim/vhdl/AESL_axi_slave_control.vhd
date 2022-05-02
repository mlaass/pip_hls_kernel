-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Tool Version Limit: 2022.04
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;


entity AESL_axi_slave_control is
  generic (
      constant    TV_IN_edges : STRING (1 to 47) := "../tv/cdatafile/c.pip_kernel.autotvin_edges.dat";
      constant    TV_IN_strm_len : STRING (1 to 50) := "../tv/cdatafile/c.pip_kernel.autotvin_strm_len.dat";
constant ADDR_WIDTH : INTEGER := 6;
constant DATA_WIDTH : INTEGER := 32;
constant edges_DEPTH : INTEGER := 1;
constant edges_c_bitwidth : INTEGER := 64;
constant strm_len_DEPTH : INTEGER := 1;
constant strm_len_c_bitwidth : INTEGER := 16;
constant START_ADDR : INTEGER := 0;
constant pip_kernel_continue_addr : INTEGER := 0;
constant pip_kernel_auto_start_addr : INTEGER := 0;
constant edges_data_in_addr : INTEGER := 16;
constant strm_len_data_in_addr : INTEGER := 28;
constant STATUS_ADDR : INTEGER := 0;
      constant    INTERFACE_TYPE : STRING (1 to 7) := "control"

  );
  port (
clk   :   IN STD_LOGIC;
reset :   IN STD_LOGIC;
TRAN_s_axi_control_AWADDR  : OUT STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0);
TRAN_s_axi_control_AWVALID  : OUT STD_LOGIC;
TRAN_s_axi_control_AWREADY  : IN STD_LOGIC;
TRAN_s_axi_control_WVALID  : OUT STD_LOGIC;
TRAN_s_axi_control_WREADY  : IN STD_LOGIC;
TRAN_s_axi_control_WDATA  : OUT STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
TRAN_s_axi_control_WSTRB  : OUT STD_LOGIC_VECTOR(DATA_WIDTH/8 - 1 downto 0);
TRAN_s_axi_control_ARADDR  : OUT STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0);
TRAN_s_axi_control_ARVALID  : OUT STD_LOGIC;
TRAN_s_axi_control_ARREADY  : IN STD_LOGIC;
TRAN_s_axi_control_RVALID  : IN STD_LOGIC;
TRAN_s_axi_control_RREADY  : OUT STD_LOGIC;
TRAN_s_axi_control_RDATA  : IN STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
TRAN_s_axi_control_RRESP  : IN STD_LOGIC_VECTOR(2 - 1 downto 0);
TRAN_s_axi_control_BVALID  : IN STD_LOGIC;
TRAN_s_axi_control_BREADY  : OUT STD_LOGIC;
TRAN_s_axi_control_BRESP  : IN STD_LOGIC_VECTOR(2 - 1 downto 0);
TRAN_control_interrupt   : IN STD_LOGIC;
TRAN_control_write_data_finish   : OUT STD_LOGIC;
TRAN_control_start_in   : IN STD_LOGIC;
TRAN_control_done_out   : OUT STD_LOGIC;
TRAN_control_ready_out   : OUT STD_LOGIC;
TRAN_control_ready_in   : IN STD_LOGIC;
TRAN_control_idle_out   : OUT STD_LOGIC;
TRAN_control_write_start_in   : IN STD_LOGIC;
TRAN_control_write_start_finish   : OUT STD_LOGIC;
TRAN_control_transaction_done_in   : IN STD_LOGIC

  );
end AESL_axi_slave_control;

architecture behav of AESL_axi_slave_control is
------------------------Local signal-------------------
shared variable edges_OPERATE_DEPTH : INTEGER;
shared variable strm_len_OPERATE_DEPTH : INTEGER;
signal AWADDR_reg : STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0) := (others => '0');
signal process_0_AWADDR_var : STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0) := (others => '0');
signal process_1_AWADDR_var : STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0) := (others => '0');
signal process_2_AWADDR_var : STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0) := (others => '0');
signal process_3_AWADDR_var : STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0) := (others => '0');
signal AWVALID_reg : STD_LOGIC := '0';
signal process_0_AWVALID_var : STD_LOGIC := '0';
signal process_1_AWVALID_var : STD_LOGIC := '0';
signal process_2_AWVALID_var : STD_LOGIC := '0';
signal process_3_AWVALID_var : STD_LOGIC := '0';
signal WVALID_reg : STD_LOGIC := '0';
signal process_0_WVALID_var : STD_LOGIC := '0';
signal process_1_WVALID_var : STD_LOGIC := '0';
signal process_2_WVALID_var : STD_LOGIC := '0';
signal process_3_WVALID_var : STD_LOGIC := '0';
signal WDATA_reg : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := (others => '0');
signal process_0_WDATA_var : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := (others => '0');
signal process_1_WDATA_var : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := (others => '0');
signal process_2_WDATA_var : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := (others => '0');
signal process_3_WDATA_var : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := (others => '0');
signal WSTRB_reg : STD_LOGIC_VECTOR(DATA_WIDTH/8 - 1 downto 0) := (others => '0');
signal process_0_WSTRB_var : STD_LOGIC_VECTOR(DATA_WIDTH/8 - 1 downto 0) := (others => '0');
signal process_1_WSTRB_var : STD_LOGIC_VECTOR(DATA_WIDTH/8 - 1 downto 0) := (others => '0');
signal process_2_WSTRB_var : STD_LOGIC_VECTOR(DATA_WIDTH/8 - 1 downto 0) := (others => '0');
signal process_3_WSTRB_var : STD_LOGIC_VECTOR(DATA_WIDTH/8 - 1 downto 0) := (others => '0');
signal ARADDR_reg : STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0) := (others => '0');
signal process_0_ARADDR_var : STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0) := (others => '0');
signal process_1_ARADDR_var : STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0) := (others => '0');
signal process_2_ARADDR_var : STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0) := (others => '0');
signal process_3_ARADDR_var : STD_LOGIC_VECTOR(ADDR_WIDTH - 1 downto 0) := (others => '0');
signal ARVALID_reg : STD_LOGIC := '0';
signal process_0_ARVALID_var : STD_LOGIC := '0';
signal process_1_ARVALID_var : STD_LOGIC := '0';
signal process_2_ARVALID_var : STD_LOGIC := '0';
signal process_3_ARVALID_var : STD_LOGIC := '0';
signal RREADY_reg : STD_LOGIC := '0';
signal process_0_RREADY_var : STD_LOGIC := '0';
signal process_1_RREADY_var : STD_LOGIC := '0';
signal process_2_RREADY_var : STD_LOGIC := '0';
signal process_3_RREADY_var : STD_LOGIC := '0';
signal RDATA_reg : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := (others => '0');
signal process_0_RDATA_var : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := (others => '0');
signal process_1_RDATA_var : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := (others => '0');
signal process_2_RDATA_var : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := (others => '0');
signal process_3_RDATA_var : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := (others => '0');
signal BREADY_reg : STD_LOGIC := '0';
signal process_0_BREADY_var : STD_LOGIC := '0';
signal process_1_BREADY_var : STD_LOGIC := '0';
signal process_2_BREADY_var : STD_LOGIC := '0';
signal process_3_BREADY_var : STD_LOGIC := '0';
  type    mem_edges_arr2D is array(0 to edges_DEPTH - 1) of STD_LOGIC_VECTOR(edges_c_bitwidth - 1 downto 0);
shared variable mem_edges : mem_edges_arr2D := (others => (others => '0'));
  type    image_mem_edges_arr2D is array(0 to (edges_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * edges_DEPTH -1) of STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
  shared variable image_mem_edges : image_mem_edges_arr2D := (others => (others => '0'));
signal edges_write_data_finish : STD_LOGIC := '0';
  type    mem_strm_len_arr2D is array(0 to strm_len_DEPTH - 1) of STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
shared variable mem_strm_len : mem_strm_len_arr2D := (others => (others => '0'));
  type    image_mem_strm_len_arr2D is array(0 to (strm_len_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * strm_len_DEPTH -1) of STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
  shared variable image_mem_strm_len : image_mem_strm_len_arr2D := (others => (others => '0'));
signal strm_len_write_data_finish : STD_LOGIC := '0';
signal AESL_ready_out_index_reg : STD_LOGIC := '0';
signal AESL_write_start_finish : STD_LOGIC := '0';
signal AESL_ready_reg : STD_LOGIC;
signal ready_initial : STD_LOGIC;
signal AESL_done_index_reg : STD_LOGIC := '0';
signal AESL_idle_index_reg : STD_LOGIC := '0';
signal AESL_auto_restart_index_reg : STD_LOGIC;
signal process_0_finish : STD_LOGIC := '0';
signal process_1_finish : STD_LOGIC := '0';
signal process_2_finish : STD_LOGIC := '0';
signal process_3_finish : STD_LOGIC := '0';
--write edges reg
shared variable write_edges_count : INTEGER;
signal write_edges_run_flag : STD_LOGIC := '0';
signal write_one_edges_data_done : STD_LOGIC := '0';
--write strm_len reg
shared variable write_strm_len_count : INTEGER;
signal write_strm_len_run_flag : STD_LOGIC := '0';
signal write_one_strm_len_data_done : STD_LOGIC := '0';
shared variable write_start_count : INTEGER;
signal write_start_run_flag : STD_LOGIC := '0';

--===================process control=================
signal ongoing_process_number : INTEGER;
-- Process number depends on how much processes needed.
shared variable process_busy : STD_LOGIC := '0';

      function esl_icmp_eq(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
          variable res : STD_LOGIC_VECTOR(0 downto 0);
      begin
          if v1 = v2 then
              res := "1";
          else
              res := "0";
          end if;
          return res;
      end function;
      procedure esl_read_token (file textfile: TEXT; textline: inout LINE; token: out STRING; token_len: out INTEGER) is
          variable whitespace : CHARACTER;
          variable i : INTEGER;
          variable ok: BOOLEAN;
          variable buff: STRING(1 to token'length);
      begin
          ok := false;
          i := 1;
          loop_main: while not endfile(textfile) loop
              if textline = null or textline'length = 0 then
                  readline(textfile, textline);
              end if;
              loop_remove_whitespace: while textline'length > 0 loop
                  if textline(textline'left) = ' ' or
                      textline(textline'left) = HT or
                      textline(textline'left) = CR or
                      textline(textline'left) = LF then
                      read(textline, whitespace);
                  else 
                      exit loop_remove_whitespace;
                  end if;
              end loop;
              loop_aesl_read_token: while textline'length > 0 and i <= buff'length loop
                  if textline(textline'left) = ' ' or
                     textline(textline'left) = HT or
                     textline(textline'left) = CR or
                     textline(textline'left) = LF then
                      exit loop_aesl_read_token;
                  else 
                      read(textline, buff(i));
                      i := i + 1;
                  end if;
                  ok := true;
              end loop;
              if ok = true then
                  exit loop_main;
              end if;
          end loop;
          buff(i) := ' ';
          token := buff;
          token_len:= i-1;
      end procedure esl_read_token;

      procedure esl_read_token (file textfile: TEXT; 
                                textline: inout LINE; 
                                token: out STRING) is
          variable i : INTEGER;
      begin
          esl_read_token (textfile, textline, token, i);
      end procedure esl_read_token;

      function esl_add(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
          variable res : unsigned(v1'length-1 downto 0);
      begin
          res := unsigned(v1) + unsigned(v2);
          return std_logic_vector(res);
      end function;

      function esl_icmp_ult(v1, v2 : STD_LOGIC_VECTOR) return STD_LOGIC_VECTOR is
          variable res : STD_LOGIC_VECTOR(0 downto 0);
      begin
          if unsigned(v1) < unsigned(v2) then
              res := "1";
          else
              res := "0";
          end if;
          return res;
      end function;

      function esl_str2lv_hex (RHS : STRING; data_width : INTEGER) return STD_LOGIC_VECTOR is
          variable    ret :   STD_LOGIC_VECTOR(data_width - 1 downto 0);
          variable    idx :   integer := 3;
      begin
          ret := (others => '0');
          if(RHS(1) /= '0' and (RHS(2) /= 'x' or RHS(2) /= 'X')) then
              report "Error! The format of hex number is not initialed by 0x";
          end if;
          while true loop
              if (data_width > 4) then
                  case RHS(idx)  is
                      when '0'    =>  ret := ret(data_width - 5 downto 0) & "0000";
                      when '1'    =>  ret := ret(data_width - 5 downto 0) & "0001";
                      when '2'    =>  ret := ret(data_width - 5 downto 0) & "0010";
                      when '3'    =>  ret := ret(data_width - 5 downto 0) & "0011";
                      when '4'    =>  ret := ret(data_width - 5 downto 0) & "0100";
                      when '5'    =>  ret := ret(data_width - 5 downto 0) & "0101";
                      when '6'    =>  ret := ret(data_width - 5 downto 0) & "0110";
                      when '7'    =>  ret := ret(data_width - 5 downto 0) & "0111";
                      when '8'    =>  ret := ret(data_width - 5 downto 0) & "1000";
                      when '9'    =>  ret := ret(data_width - 5 downto 0) & "1001";
                      when 'a' | 'A'  =>  ret := ret(data_width - 5 downto 0) & "1010";
                      when 'b' | 'B'  =>  ret := ret(data_width - 5 downto 0) & "1011";
                      when 'c' | 'C'  =>  ret := ret(data_width - 5 downto 0) & "1100";
                      when 'd' | 'D'  =>  ret := ret(data_width - 5 downto 0) & "1101";
                      when 'e' | 'E'  =>  ret := ret(data_width - 5 downto 0) & "1110";
                      when 'f' | 'F'  =>  ret := ret(data_width - 5 downto 0) & "1111";
                      when 'x' | 'X'  =>  ret := ret(data_width - 5 downto 0) & "XXXX";
                      when ' '    =>  return ret;
                      when others    =>  report "Wrong hex char " & RHS(idx);   return ret;
                  end case;
              elsif (data_width = 4) then
                  case RHS(idx)  is
                      when '0'    =>  ret := "0000";
                      when '1'    =>  ret := "0001";
                      when '2'    =>  ret := "0010";
                      when '3'    =>  ret := "0011";
                      when '4'    =>  ret := "0100";
                      when '5'    =>  ret := "0101";
                      when '6'    =>  ret := "0110";
                      when '7'    =>  ret := "0111";
                      when '8'    =>  ret := "1000";
                      when '9'    =>  ret := "1001";
                      when 'a' | 'A'  =>  ret := "1010";
                      when 'b' | 'B'  =>  ret := "1011";
                      when 'c' | 'C'  =>  ret := "1100";
                      when 'd' | 'D'  =>  ret := "1101";
                      when 'e' | 'E'  =>  ret := "1110";
                      when 'f' | 'F'  =>  ret := "1111";
                      when 'x' | 'X'  =>  ret := "XXXX";
                      when ' '    =>  return ret;
                      when others    =>  report "Wrong hex char " & RHS(idx);   return ret;
                  end case;
              elsif (data_width = 3) then
                  case RHS(idx)  is
                      when '0'    =>  ret := "000";
                      when '1'    =>  ret := "001";
                      when '2'    =>  ret := "010";
                      when '3'    =>  ret := "011";
                      when '4'    =>  ret := "100";
                      when '5'    =>  ret := "101";
                      when '6'    =>  ret := "110";
                      when '7'    =>  ret := "111";
                      when 'x' | 'X'  =>  ret := "XXX";
                      when ' '    =>  return ret;
                      when others    =>  report "Wrong hex char " & RHS(idx);   return ret;
                  end case;
              elsif (data_width = 2) then
                  case RHS(idx)  is
                      when '0'    =>  ret := "00";
                      when '1'    =>  ret := "01";
                      when '2'    =>  ret := "10";
                      when '3'    =>  ret := "11";
                      when 'x' | 'X'  =>  ret := "XX";
                      when ' '    =>  return ret;
                      when others    =>  report "Wrong hex char " & RHS(idx);   return ret;
                  end case;
              elsif (data_width = 1) then
                  case RHS(idx)  is
                      when '0'    =>  ret := "0";
                      when '1'    =>  ret := "1";
                      when 'x' | 'X'  =>  ret := "X";
                      when ' '    =>  return ret;
                      when others    =>  report "Wrong hex char " & RHS(idx);   return ret;
                  end case;
              else
                  report string'("Wrong data_width.");
                  return ret;
              end if;
              idx := idx + 1;
          end loop;
          return ret;
      end function;

      function esl_conv_string_hex (lv : STD_LOGIC_VECTOR) return STRING is
          constant str_len : integer := (lv'length + 3)/4;
          variable ret : STRING (1 to str_len);
          variable i, tmp: INTEGER;
          variable normal_lv : STD_LOGIC_VECTOR(lv'length - 1 downto 0);
          variable tmp_lv : STD_LOGIC_VECTOR(3 downto 0);
      begin
          normal_lv := lv;
          for i in 1 to str_len loop
              if(i = 1) then
                  if((lv'length mod 4) = 3) then
                      tmp_lv(2 downto 0) := normal_lv(lv'length - 1 downto lv'length - 3);
                      case tmp_lv(2 downto 0) is
                          when "000" => ret(i) := '0';
                          when "001" => ret(i) := '1';
                          when "010" => ret(i) := '2';
                          when "011" => ret(i) := '3';
                          when "100" => ret(i) := '4';
                          when "101" => ret(i) := '5';
                          when "110" => ret(i) := '6';
                          when "111" => ret(i) := '7';
                          when others  => ret(i) := 'X';
                      end case;
                  elsif((lv'length mod 4) = 2) then
                      tmp_lv(1 downto 0) := normal_lv(lv'length - 1 downto lv'length - 2);
                      case tmp_lv(1 downto 0) is
                          when "00" => ret(i) := '0';
                          when "01" => ret(i) := '1';
                          when "10" => ret(i) := '2';
                          when "11" => ret(i) := '3';
                          when others => ret(i) := 'X';
                      end case;
                  elsif((lv'length mod 4) = 1) then
                      tmp_lv(0 downto 0) := normal_lv(lv'length - 1 downto lv'length - 1);
                      case tmp_lv(0 downto 0) is
                          when "0" => ret(i) := '0';
                          when "1" => ret(i) := '1';
                          when others=> ret(i) := 'X';
                      end case;
                  elsif((lv'length mod 4) = 0) then
                      tmp_lv(3 downto 0) := normal_lv(lv'length - 1 downto lv'length - 4);
                      case tmp_lv(3 downto 0) is
                          when "0000" => ret(i) := '0';
                          when "0001" => ret(i) := '1';
                          when "0010" => ret(i) := '2';
                          when "0011" => ret(i) := '3';
                          when "0100" => ret(i) := '4';
                          when "0101" => ret(i) := '5';
                          when "0110" => ret(i) := '6';
                          when "0111" => ret(i) := '7';
                          when "1000" => ret(i) := '8';
                          when "1001" => ret(i) := '9';
                          when "1010" => ret(i) := 'a';
                          when "1011" => ret(i) := 'b';
                          when "1100" => ret(i) := 'c';
                          when "1101" => ret(i) := 'd';
                          when "1110" => ret(i) := 'e';
                          when "1111" => ret(i) := 'f';
                          when others   => ret(i) := 'X';
                      end case;
                  end if;
              else
                  tmp_lv(3 downto 0) := normal_lv((str_len - i) * 4 + 3 downto (str_len - i) * 4);
                  case tmp_lv(3 downto 0) is
                      when "0000" => ret(i) := '0';
                      when "0001" => ret(i) := '1';
                      when "0010" => ret(i) := '2';
                      when "0011" => ret(i) := '3';
                      when "0100" => ret(i) := '4';
                      when "0101" => ret(i) := '5';
                      when "0110" => ret(i) := '6';
                      when "0111" => ret(i) := '7';
                      when "1000" => ret(i) := '8';
                      when "1001" => ret(i) := '9';
                      when "1010" => ret(i) := 'a';
                      when "1011" => ret(i) := 'b';
                      when "1100" => ret(i) := 'c';
                      when "1101" => ret(i) := 'd';
                      when "1110" => ret(i) := 'e';
                      when "1111" => ret(i) := 'f';
                      when others   => ret(i) := 'X';
                  end case;
              end if;
          end loop;
          return ret;
      end function;

procedure count_c_data_four_byte_num_by_bitwidth (constant bitwidth : IN INTEGER; variable num : OUT INTEGER) is
variable factor : INTEGER;
variable i : INTEGER;
begin
    factor := 32;
    for i in 1 to 1024 loop
        if (bitwidth <= factor and bitwidth > factor - 32) then
            num := i;
        end if;
        factor := factor + 32;
    end loop;
end procedure; 

procedure count_seperate_factor_by_bitwidth(bitwidth : in INTEGER; factor : out INTEGER) is
begin
    if (bitwidth <= 8) then
        factor := 4;
    elsif (bitwidth <= 16 and bitwidth > 8 ) then
        factor := 2;
    elsif (bitwidth <= 32 and bitwidth > 16 ) then
        factor := 1;
    elsif (bitwidth > 32 ) then
        factor := 1;
    end if;
end procedure;

procedure count_operate_depth_by_bitwidth_and_depth(bitwidth : in INTEGER; depth : in INTEGER; operate_depth : out INTEGER) is
variable factor : INTEGER;
variable remain : INTEGER;
variable operate_depth_tmp : INTEGER;
begin
    count_seperate_factor_by_bitwidth (bitwidth , factor);
    operate_depth_tmp := depth / factor;
    remain := depth mod factor;
    if (remain > 0) then
        operate_depth_tmp := operate_depth_tmp + 1;
    end if;
    operate_depth := operate_depth_tmp;
end procedure;

begin
--=================== signal connection ==============
TRAN_s_axi_control_AWADDR <= AWADDR_reg;
TRAN_s_axi_control_AWVALID <= AWVALID_reg;
TRAN_s_axi_control_WVALID <= WVALID_reg;
TRAN_s_axi_control_WDATA <= WDATA_reg;
TRAN_s_axi_control_WSTRB <= WSTRB_reg;
TRAN_s_axi_control_ARADDR <= ARADDR_reg;
TRAN_s_axi_control_ARVALID <= ARVALID_reg;
TRAN_s_axi_control_RREADY <= RREADY_reg;
TRAN_s_axi_control_BREADY <= BREADY_reg;
TRAN_control_done_out <= AESL_done_index_reg;
TRAN_control_ready_out <= AESL_ready_out_index_reg;
TRAN_control_write_start_finish <= AESL_write_start_finish;
TRAN_control_idle_out <= AESL_idle_index_reg;
TRAN_control_write_data_finish <= '1' and edges_write_data_finish and strm_len_write_data_finish;
AESL_ready_reg_proc : process(TRAN_control_ready_in, ready_initial) 
begin
    AESL_ready_reg <= TRAN_control_ready_in or ready_initial;
end process;
gen_ready_initial_proc : process
begin
    ready_initial <= '0';
    wait until reset = '1';
        wait until clk'event and clk = '1';
    ready_initial <= '1';
    wait until clk'event and clk = '1';
    ready_initial <= '0';
    wait;
end process;

ongoing_process_number_gen : process(reset , process_0_finish , process_1_finish , process_2_finish , process_3_finish )
begin
    if (reset = '0') then
        ongoing_process_number <= 0;
    elsif (ongoing_process_number = 0 and process_0_finish = '1') then
            ongoing_process_number <= ongoing_process_number + 1;
    elsif (ongoing_process_number = 1 and process_1_finish = '1') then
            ongoing_process_number <= ongoing_process_number + 1;
    elsif (ongoing_process_number = 2 and process_2_finish = '1') then
            ongoing_process_number <= ongoing_process_number + 1;
    elsif (ongoing_process_number = 3 and process_3_finish = '1') then
            ongoing_process_number <= 0;
    end if;
end process;

output_reg_write_value_function : process
begin
    wait until reset = '1';
        wait until clk'event and clk = '1';
    while (true) loop
        if (ongoing_process_number = 0 ) then
            AWADDR_reg <= process_0_AWADDR_var;
            AWVALID_reg <= process_0_AWVALID_var;
            WVALID_reg <= process_0_WVALID_var;
            WDATA_reg <= process_0_WDATA_var;
            WSTRB_reg <= process_0_WSTRB_var;
            ARADDR_reg <= process_0_ARADDR_var;
            ARVALID_reg <= process_0_ARVALID_var;
            RREADY_reg <= process_0_RREADY_var;
            BREADY_reg <= process_0_BREADY_var;
        elsif (ongoing_process_number = 1 ) then
            AWADDR_reg <= process_1_AWADDR_var;
            AWVALID_reg <= process_1_AWVALID_var;
            WVALID_reg <= process_1_WVALID_var;
            WDATA_reg <= process_1_WDATA_var;
            WSTRB_reg <= process_1_WSTRB_var;
            ARADDR_reg <= process_1_ARADDR_var;
            ARVALID_reg <= process_1_ARVALID_var;
            RREADY_reg <= process_1_RREADY_var;
            BREADY_reg <= process_1_BREADY_var;
        elsif (ongoing_process_number = 2 ) then
            AWADDR_reg <= process_2_AWADDR_var;
            AWVALID_reg <= process_2_AWVALID_var;
            WVALID_reg <= process_2_WVALID_var;
            WDATA_reg <= process_2_WDATA_var;
            WSTRB_reg <= process_2_WSTRB_var;
            ARADDR_reg <= process_2_ARADDR_var;
            ARVALID_reg <= process_2_ARVALID_var;
            RREADY_reg <= process_2_RREADY_var;
            BREADY_reg <= process_2_BREADY_var;
        elsif (ongoing_process_number = 3 ) then
            AWADDR_reg <= process_3_AWADDR_var;
            AWVALID_reg <= process_3_AWVALID_var;
            WVALID_reg <= process_3_WVALID_var;
            WDATA_reg <= process_3_WDATA_var;
            WSTRB_reg <= process_3_WSTRB_var;
            ARADDR_reg <= process_3_ARADDR_var;
            ARVALID_reg <= process_3_ARVALID_var;
            RREADY_reg <= process_3_RREADY_var;
            BREADY_reg <= process_3_BREADY_var;
        end if;
        wait until clk'event and clk = '1';
    end loop;
    wait;
end process;
update_status_proc : process
    variable process_num : INTEGER;
    variable read_status_resp : INTEGER;
    variable write_continue_tmp : STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0) ;
    variable write_continue_resp : INTEGER;
    variable aw_flag : STD_LOGIC;
    variable w_flag : STD_LOGIC;
    variable wstrb_tmp : STD_LOGIC_VECTOR(DATA_WIDTH/8 - 1 downto 0 );
    variable i : INTEGER;
    variable process_0_RDATA_tmp : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
begin
    wait until reset = '1';
        wait until clk'event and clk = '1';
    process_num := 0;
    while (true) loop
        process_0_finish <= '0';
        AESL_done_index_reg         <= '0';
        AESL_ready_out_index_reg        <= '0';
        if (ongoing_process_number = process_num and process_busy = '0') then
            process_busy := '1';
--=======================one single read operate======================
                read_status_resp := 0;
                process_0_ARADDR_var <= STD_LOGIC_VECTOR(to_unsigned(STATUS_ADDR, ADDR_WIDTH));
                process_0_ARVALID_var <= '1';
                while (TRAN_s_axi_control_ARREADY /= '1') loop
                    wait until clk'event and clk = '1';
                end loop;
                wait until clk'event and clk = '1';
                process_0_ARVALID_var <= '0';
                process_0_RREADY_var <= '1';
                while (TRAN_s_axi_control_RVALID /= '1') loop
                    --wait for response 
                    wait until clk'event and clk = '1';
                end loop;
                wait until clk'event and clk = '1';
                process_0_RDATA_tmp := TRAN_s_axi_control_RDATA;
                process_0_RREADY_var <= '0';
                if (TRAN_s_axi_control_RRESP = (2 => '0') ) then
                    read_status_resp := 1;
                    --output success. in fact RRESP is always 2'b00
                end if;
                wait until clk'event and clk = '1';

--=======================one single read operate end======================

                AESL_ready_out_index_reg        <= process_0_RDATA_tmp(1);
                AESL_idle_index_reg         <= process_0_RDATA_tmp(2);
                if (process_0_RDATA_tmp(1) = '1') then
                    wait until clk'event and clk = '1';
                    AESL_ready_out_index_reg        <= '0';
                    write_continue_tmp := (others => '0');
                    write_continue_tmp(4) := '1';
--=======================one single write operate======================
                write_continue_resp := 0;
                aw_flag := '0';
                w_flag := '0';
                process_0_AWADDR_var <= STD_LOGIC_VECTOR(to_unsigned(START_ADDR, ADDR_WIDTH));
                process_0_AWVALID_var <= '1';
                process_0_WDATA_var   <= write_continue_tmp;
                process_0_WVALID_var  <= '1';
                for i in 0 to DATA_WIDTH/8 - 1 loop
                    wstrb_tmp(i) := '1';
                end loop;
                process_0_WSTRB_var <= wstrb_tmp;
                while (aw_flag = '0' or w_flag = '0') loop
                    wait until clk'event and clk = '1';
                    if (aw_flag /= '1') then
                        aw_flag := TRAN_s_axi_control_AWREADY and AWVALID_reg;
                    end if;
                    if (w_flag /= '1') then
                        w_flag := TRAN_s_axi_control_WREADY and WVALID_reg;
                    end if;
                    process_0_AWVALID_var <= not aw_flag;
                    process_0_WVALID_var <= not w_flag;
                end loop;

                process_0_BREADY_var <= '1';
                while (TRAN_s_axi_control_BVALID /= '1') loop
                    --wait for response 
                    wait until clk'event and clk = '1';
                end loop;
                wait until clk'event and clk = '1';
                process_0_BREADY_var <= '0';
                if (TRAN_s_axi_control_BRESP = (2 => '0')) then
                    write_continue_resp := 1;
                    --input success. in fact BRESP is always 2'b00
                end if;
--=======================one single write operate======================

                    AESL_done_index_reg         <= '1';
                    wait until clk'event and clk = '1';
                    AESL_done_index_reg         <= '0';
                end if;
            process_busy := '0';
            process_0_finish <= '1';
        end if;
        wait until clk'event and clk = '1';
    end loop;
    wait;
end process;

gen_write_edges_run_flag : process (reset , clk)
begin
    if (reset = '0') then
        edges_write_data_finish <= '0';
        write_edges_run_flag <= '0'; 
        write_edges_count := 0;
        count_operate_depth_by_bitwidth_and_depth (edges_c_bitwidth, edges_DEPTH, edges_OPERATE_DEPTH);
    elsif (clk'event and clk = '1') then
        if (TRAN_control_start_in = '1') then
            edges_write_data_finish <= '0';
        end if;
        if (AESL_ready_reg = '1') then
            write_edges_run_flag <= '1'; 
            write_edges_count := 0;
        end if;
        if (write_one_edges_data_done = '1') then
            write_edges_count := write_edges_count + 1;
            if (write_edges_count = edges_OPERATE_DEPTH) then
                write_edges_run_flag <= '0'; 
                edges_write_data_finish <= '1';
            end if;
        end if;
    end if;
end process;

write_edges_proc : process
    variable write_edges_resp : INTEGER;
    variable process_num  : INTEGER;
    variable get_ack : INTEGER;
    variable four_byte_num : INTEGER;
    variable c_bitwidth : INTEGER;
    variable i : INTEGER;
    variable j : INTEGER;
    variable process_1_RDATA_tmp : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
    variable edges_data_tmp_reg : STD_LOGIC_VECTOR(31 downto 0);
    variable aw_flag : STD_LOGIC;
    variable w_flag : STD_LOGIC;
    variable wstrb_tmp : STD_LOGIC_VECTOR(DATA_WIDTH/8 - 1 downto 0 );
begin
    wait until reset = '1';
        wait until clk'event and clk = '1';
    c_bitwidth := edges_c_bitwidth;
    process_num := 1;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (true) loop
        process_1_finish <= '0';

        if (ongoing_process_number = process_num and process_busy = '0' ) then
            get_ack := 1;
            if (write_edges_run_flag = '1' and get_ack = 1) then
                process_busy := '1';
                -- write edges data 
                for i in 0 to four_byte_num - 1 loop
                    if (edges_c_bitwidth < 32) then
                        edges_data_tmp_reg := mem_edges(write_edges_count);
                    else 
                        for j in 0 to 32 - 1 loop
                            if (i*32 + j < edges_c_bitwidth) then
                                edges_data_tmp_reg(j) := mem_edges(write_edges_count)(i*32 + j);
                            else 
                                edges_data_tmp_reg(j) := '0';
                            end if;
                        end loop;
                    end if;
                    if(image_mem_edges(write_edges_count * four_byte_num  + i)/=edges_data_tmp_reg) then
--=======================one single write operate======================
                write_edges_resp := 0;
                aw_flag := '0';
                w_flag := '0';
                process_1_AWADDR_var <= STD_LOGIC_VECTOR(to_unsigned(edges_data_in_addr + write_edges_count * four_byte_num * 4 + i * 4, ADDR_WIDTH));
                process_1_AWVALID_var <= '1';
                process_1_WDATA_var   <= edges_data_tmp_reg;
                process_1_WVALID_var  <= '1';
                for i in 0 to DATA_WIDTH/8 - 1 loop
                    wstrb_tmp(i) := '1';
                end loop;
                process_1_WSTRB_var <= wstrb_tmp;
                while (aw_flag = '0' or w_flag = '0') loop
                    wait until clk'event and clk = '1';
                    if (aw_flag /= '1') then
                        aw_flag := TRAN_s_axi_control_AWREADY and AWVALID_reg;
                    end if;
                    if (w_flag /= '1') then
                        w_flag := TRAN_s_axi_control_WREADY and WVALID_reg;
                    end if;
                    process_1_AWVALID_var <= not aw_flag;
                    process_1_WVALID_var <= not w_flag;
                end loop;

                process_1_BREADY_var <= '1';
                while (TRAN_s_axi_control_BVALID /= '1') loop
                    --wait for response 
                    wait until clk'event and clk = '1';
                end loop;
                wait until clk'event and clk = '1';
                process_1_BREADY_var <= '0';
                if (TRAN_s_axi_control_BRESP = (2 => '0')) then
                    write_edges_resp := 1;
                    --input success. in fact BRESP is always 2'b00
                end if;
--=======================one single write operate======================

                    image_mem_edges(write_edges_count * four_byte_num  + i) := edges_data_tmp_reg;
                    end if;
                end loop;
                process_busy := '0';
                write_one_edges_data_done <= '1';
                wait until clk'event and clk = '1';
                write_one_edges_data_done <= '0';
            end if;
            process_1_finish <= '1';
        end if;
        wait until clk'event and clk = '1';
    end loop;
    wait;
end process;
gen_write_strm_len_run_flag : process (reset , clk)
begin
    if (reset = '0') then
        strm_len_write_data_finish <= '0';
        write_strm_len_run_flag <= '0'; 
        write_strm_len_count := 0;
        count_operate_depth_by_bitwidth_and_depth (strm_len_c_bitwidth, strm_len_DEPTH, strm_len_OPERATE_DEPTH);
    elsif (clk'event and clk = '1') then
        if (TRAN_control_start_in = '1') then
            strm_len_write_data_finish <= '0';
        end if;
        if (AESL_ready_reg = '1') then
            write_strm_len_run_flag <= '1'; 
            write_strm_len_count := 0;
        end if;
        if (write_one_strm_len_data_done = '1') then
            write_strm_len_count := write_strm_len_count + 1;
            if (write_strm_len_count = strm_len_OPERATE_DEPTH) then
                write_strm_len_run_flag <= '0'; 
                strm_len_write_data_finish <= '1';
            end if;
        end if;
    end if;
end process;

write_strm_len_proc : process
    variable write_strm_len_resp : INTEGER;
    variable process_num  : INTEGER;
    variable get_ack : INTEGER;
    variable four_byte_num : INTEGER;
    variable c_bitwidth : INTEGER;
    variable i : INTEGER;
    variable j : INTEGER;
    variable process_2_RDATA_tmp : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0);
    variable strm_len_data_tmp_reg : STD_LOGIC_VECTOR(31 downto 0);
    variable aw_flag : STD_LOGIC;
    variable w_flag : STD_LOGIC;
    variable wstrb_tmp : STD_LOGIC_VECTOR(DATA_WIDTH/8 - 1 downto 0 );
begin
    wait until reset = '1';
        wait until clk'event and clk = '1';
    c_bitwidth := strm_len_c_bitwidth;
    process_num := 2;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (true) loop
        process_2_finish <= '0';

        if (ongoing_process_number = process_num and process_busy = '0' ) then
            get_ack := 1;
            if (write_strm_len_run_flag = '1' and get_ack = 1) then
                process_busy := '1';
                -- write strm_len data 
                for i in 0 to four_byte_num - 1 loop
                    if (strm_len_c_bitwidth < 32) then
                        strm_len_data_tmp_reg := mem_strm_len(write_strm_len_count);
                    else 
                        for j in 0 to 32 - 1 loop
                            if (i*32 + j < strm_len_c_bitwidth) then
                                strm_len_data_tmp_reg(j) := mem_strm_len(write_strm_len_count)(i*32 + j);
                            else 
                                strm_len_data_tmp_reg(j) := '0';
                            end if;
                        end loop;
                    end if;
                    if(image_mem_strm_len(write_strm_len_count * four_byte_num  + i)/=strm_len_data_tmp_reg) then
--=======================one single write operate======================
                write_strm_len_resp := 0;
                aw_flag := '0';
                w_flag := '0';
                process_2_AWADDR_var <= STD_LOGIC_VECTOR(to_unsigned(strm_len_data_in_addr + write_strm_len_count * four_byte_num * 4 + i * 4, ADDR_WIDTH));
                process_2_AWVALID_var <= '1';
                process_2_WDATA_var   <= strm_len_data_tmp_reg;
                process_2_WVALID_var  <= '1';
                for i in 0 to DATA_WIDTH/8 - 1 loop
                    wstrb_tmp(i) := '1';
                end loop;
                process_2_WSTRB_var <= wstrb_tmp;
                while (aw_flag = '0' or w_flag = '0') loop
                    wait until clk'event and clk = '1';
                    if (aw_flag /= '1') then
                        aw_flag := TRAN_s_axi_control_AWREADY and AWVALID_reg;
                    end if;
                    if (w_flag /= '1') then
                        w_flag := TRAN_s_axi_control_WREADY and WVALID_reg;
                    end if;
                    process_2_AWVALID_var <= not aw_flag;
                    process_2_WVALID_var <= not w_flag;
                end loop;

                process_2_BREADY_var <= '1';
                while (TRAN_s_axi_control_BVALID /= '1') loop
                    --wait for response 
                    wait until clk'event and clk = '1';
                end loop;
                wait until clk'event and clk = '1';
                process_2_BREADY_var <= '0';
                if (TRAN_s_axi_control_BRESP = (2 => '0')) then
                    write_strm_len_resp := 1;
                    --input success. in fact BRESP is always 2'b00
                end if;
--=======================one single write operate======================

                    image_mem_strm_len(write_strm_len_count * four_byte_num  + i) := strm_len_data_tmp_reg;
                    end if;
                end loop;
                process_busy := '0';
                write_one_strm_len_data_done <= '1';
                wait until clk'event and clk = '1';
                write_one_strm_len_data_done <= '0';
            end if;
            process_2_finish <= '1';
        end if;
        wait until clk'event and clk = '1';
    end loop;
    wait;
end process;

gen_write_start_run_flag : process (reset , clk)
begin
    if (reset = '0') then
        write_start_run_flag <= '0'; 
        write_start_count := 0;
    elsif (clk'event and clk = '1') then
        if (write_start_count >= 1) then
            write_start_run_flag <= '0'; 
        elsif (TRAN_control_write_start_in = '1') then
            write_start_run_flag <= '1'; 
        end if;
        if (AESL_write_start_finish = '1') then
            write_start_count := write_start_count + 1;
            write_start_run_flag <= '0'; 
        end if;
    end if;
end process;

write_start_proc : process
    variable process_num : INTEGER;
    variable write_start_resp : INTEGER;
    variable write_start_tmp : STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0) ;
    variable aw_flag : STD_LOGIC;
    variable w_flag : STD_LOGIC;
    variable wstrb_tmp : STD_LOGIC_VECTOR(DATA_WIDTH/8 - 1 downto 0 );
    variable i : INTEGER;
begin
    wait until reset = '1';
        wait until clk'event and clk = '1';
    process_num := 3;
    while (true) loop
        process_3_finish <= '0';
        if (ongoing_process_number = process_num and process_busy = '0' ) then
            if (write_start_run_flag = '1') then
                process_busy := '1';
                write_start_tmp := (others => '0');
                write_start_tmp(0) := '1';
--=======================one single write operate======================
                write_start_resp := 0;
                aw_flag := '0';
                w_flag := '0';
                process_3_AWADDR_var <= STD_LOGIC_VECTOR(to_unsigned(START_ADDR, ADDR_WIDTH));
                process_3_AWVALID_var <= '1';
                process_3_WDATA_var   <= write_start_tmp;
                process_3_WVALID_var  <= '1';
                for i in 0 to DATA_WIDTH/8 - 1 loop
                    wstrb_tmp(i) := '1';
                end loop;
                process_3_WSTRB_var <= wstrb_tmp;
                while (aw_flag = '0' or w_flag = '0') loop
                    wait until clk'event and clk = '1';
                    if (aw_flag /= '1') then
                        aw_flag := TRAN_s_axi_control_AWREADY and AWVALID_reg;
                    end if;
                    if (w_flag /= '1') then
                        w_flag := TRAN_s_axi_control_WREADY and WVALID_reg;
                    end if;
                    process_3_AWVALID_var <= not aw_flag;
                    process_3_WVALID_var <= not w_flag;
                end loop;

                process_3_BREADY_var <= '1';
                while (TRAN_s_axi_control_BVALID /= '1') loop
                    --wait for response 
                    wait until clk'event and clk = '1';
                end loop;
                wait until clk'event and clk = '1';
                process_3_BREADY_var <= '0';
                if (TRAN_s_axi_control_BRESP = (2 => '0')) then
                    write_start_resp := 1;
                    --input success. in fact BRESP is always 2'b00
                end if;
--=======================one single write operate======================

                process_busy := '0';
                AESL_write_start_finish <= '1';
                wait until clk'event and clk = '1';
                AESL_write_start_finish <= '0';
            end if;
            process_3_finish <= '1';
        end if;
        wait until clk'event and clk = '1';
    end loop;
    wait;
end process;

--------------------------Read file------------------------ 
 
-- Read data from file 
read_edges_file_process : process
  file        fp          :   TEXT;
  variable    fstatus     :   FILE_OPEN_STATUS;
  variable    token_line  :   LINE;
  variable    token       :   STRING(1 to 152);
  variable    token_tmp : STD_LOGIC_VECTOR(edges_c_bitwidth - 1 downto 0) := (others => '0'); 
  variable    tmp_cache_mem : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := (others => '0'); 
  variable    tmp_cache_mem_8 : STD_LOGIC_VECTOR(8 - 1 downto 0) := (others => '0'); 
  variable    tmp_cache_mem_16 : STD_LOGIC_VECTOR(16 - 1 downto 0) := (others => '0'); 
  variable    tmp_cache_mem_32 : STD_LOGIC_VECTOR(32 - 1 downto 0) := (others => '0'); 
  variable    transaction_idx : INTEGER; 
  variable    i : INTEGER; 
  variable    j : INTEGER; 
  variable    factor : INTEGER; 
  variable    remain  :   INTEGER; 
  variable    read_counter :   INTEGER; 
begin
  transaction_idx := 0; 
  count_seperate_factor_by_bitwidth (edges_c_bitwidth , factor);
  file_open(fstatus, fp, TV_IN_edges , READ_MODE);
  if(fstatus /= OPEN_OK) then
      assert false report "Open file " & TV_IN_edges & " failed!!!" severity failure;
  end if;
  esl_read_token(fp, token_line, token);
  if(token(1 to 13) /= "[[[runtime]]]") then
      assert false report "ERROR: Simulation using HLS TB failed." severity failure;
  end if;
  esl_read_token(fp, token_line, token);
  while(token(1 to 14) /= "[[[/runtime]]]") loop
        if(token(1 to 15) /= "[[transaction]]") then
            assert false report "ERROR: Simulation using HLS TB failed." severity failure;
        end if;
        esl_read_token(fp, token_line, token);  -- Skip transaction number
      wait until clk'event and clk = '1';
      wait for 0.2 ns;
      while(AESL_ready_reg /= '1') loop
          wait until clk'event and clk = '1';
          wait for 0.2 ns;
      end loop;
      read_counter := 0;
      for i in 0 to edges_DEPTH - 1 loop
          read_counter := read_counter + 1;
          esl_read_token(fp, token_line, token);
          token_tmp := esl_str2lv_hex(token, edges_c_bitwidth);
          remain := i mod factor;
          if (factor = 4) then
              tmp_cache_mem_8 (7 downto 0) := (others => '0');
              for j in 0 to edges_c_bitwidth - 1 loop
                  tmp_cache_mem_8 (j downto j) := token_tmp (j downto j);
              end loop;
              if (remain = 0) then
                  tmp_cache_mem (7 downto 0) := tmp_cache_mem_8;
              elsif (remain = 1) then
                  tmp_cache_mem (15 downto 8) := tmp_cache_mem_8;
              elsif (remain = 2) then
                  tmp_cache_mem (23 downto 16) := tmp_cache_mem_8;
              elsif (remain = 3) then
                  tmp_cache_mem (31 downto 24) := tmp_cache_mem_8;
                  mem_edges(i/factor)(31 downto 0) := tmp_cache_mem;
                  tmp_cache_mem (DATA_WIDTH - 1 downto 0) := (others => '0');
              end if;
          elsif (factor = 2) then
              tmp_cache_mem_16 (15 downto 0) := (others => '0');
              for j in 0 to edges_c_bitwidth - 1 loop
                  tmp_cache_mem_16 (j downto j) := token_tmp (j downto j);
              end loop;
              if (remain = 0) then
                  tmp_cache_mem (15 downto 0) := tmp_cache_mem_16;
              elsif (remain = 1) then
                  tmp_cache_mem (31 downto 16) := tmp_cache_mem_16;
                  mem_edges(i/factor)(31 downto 0) := tmp_cache_mem;
                  tmp_cache_mem (DATA_WIDTH - 1 downto 0) := (others => '0');
              end if;
          elsif (factor = 1) then
              if (edges_c_bitwidth < 32) then
                  tmp_cache_mem_32 (31 downto 0) := (others => '0');
                  for j in 0 to edges_c_bitwidth - 1 loop
                      tmp_cache_mem_32 (j downto j) := token_tmp (j downto j);
                  end loop;
                  mem_edges(i)(31 downto 0) := tmp_cache_mem_32;
              else
                  mem_edges(i) := token_tmp;
              end if;
          end if;
      end loop;
      remain := read_counter mod factor;
      if (factor = 4) then
          if (remain /= 0) then
              mem_edges(edges_DEPTH/factor)(31 downto 0) := tmp_cache_mem;
          end if;
      elsif (factor = 2) then
          if (remain /= 0) then
              mem_edges(edges_DEPTH/factor)(31 downto 0) := tmp_cache_mem;
          end if;
      end if;
      esl_read_token(fp, token_line, token);
      if(token(1 to 16) /= "[[/transaction]]") then
          assert false report "ERROR: Simulation using HLS TB failed." severity failure;
      end if;
      esl_read_token(fp, token_line, token);
      transaction_idx := transaction_idx + 1; 
  end loop;
  file_close(fp);
    wait;
end process;
 
--------------------------Read file------------------------ 
 
-- Read data from file 
read_strm_len_file_process : process
  file        fp          :   TEXT;
  variable    fstatus     :   FILE_OPEN_STATUS;
  variable    token_line  :   LINE;
  variable    token       :   STRING(1 to 128);
  variable    token_tmp : STD_LOGIC_VECTOR(strm_len_c_bitwidth - 1 downto 0) := (others => '0'); 
  variable    tmp_cache_mem : STD_LOGIC_VECTOR(DATA_WIDTH - 1 downto 0) := (others => '0'); 
  variable    tmp_cache_mem_8 : STD_LOGIC_VECTOR(8 - 1 downto 0) := (others => '0'); 
  variable    tmp_cache_mem_16 : STD_LOGIC_VECTOR(16 - 1 downto 0) := (others => '0'); 
  variable    tmp_cache_mem_32 : STD_LOGIC_VECTOR(32 - 1 downto 0) := (others => '0'); 
  variable    transaction_idx : INTEGER; 
  variable    i : INTEGER; 
  variable    j : INTEGER; 
  variable    factor : INTEGER; 
  variable    remain  :   INTEGER; 
  variable    read_counter :   INTEGER; 
begin
  transaction_idx := 0; 
  count_seperate_factor_by_bitwidth (strm_len_c_bitwidth , factor);
  file_open(fstatus, fp, TV_IN_strm_len , READ_MODE);
  if(fstatus /= OPEN_OK) then
      assert false report "Open file " & TV_IN_strm_len & " failed!!!" severity failure;
  end if;
  esl_read_token(fp, token_line, token);
  if(token(1 to 13) /= "[[[runtime]]]") then
      assert false report "ERROR: Simulation using HLS TB failed." severity failure;
  end if;
  esl_read_token(fp, token_line, token);
  while(token(1 to 14) /= "[[[/runtime]]]") loop
        if(token(1 to 15) /= "[[transaction]]") then
            assert false report "ERROR: Simulation using HLS TB failed." severity failure;
        end if;
        esl_read_token(fp, token_line, token);  -- Skip transaction number
      wait until clk'event and clk = '1';
      wait for 0.2 ns;
      while(AESL_ready_reg /= '1') loop
          wait until clk'event and clk = '1';
          wait for 0.2 ns;
      end loop;
      read_counter := 0;
      for i in 0 to strm_len_DEPTH - 1 loop
          read_counter := read_counter + 1;
          esl_read_token(fp, token_line, token);
          token_tmp := esl_str2lv_hex(token, strm_len_c_bitwidth);
          remain := i mod factor;
          if (factor = 4) then
              tmp_cache_mem_8 (7 downto 0) := (others => '0');
              for j in 0 to strm_len_c_bitwidth - 1 loop
                  tmp_cache_mem_8 (j downto j) := token_tmp (j downto j);
              end loop;
              if (remain = 0) then
                  tmp_cache_mem (7 downto 0) := tmp_cache_mem_8;
              elsif (remain = 1) then
                  tmp_cache_mem (15 downto 8) := tmp_cache_mem_8;
              elsif (remain = 2) then
                  tmp_cache_mem (23 downto 16) := tmp_cache_mem_8;
              elsif (remain = 3) then
                  tmp_cache_mem (31 downto 24) := tmp_cache_mem_8;
                  mem_strm_len(i/factor)(31 downto 0) := tmp_cache_mem;
                  tmp_cache_mem (DATA_WIDTH - 1 downto 0) := (others => '0');
              end if;
          elsif (factor = 2) then
              tmp_cache_mem_16 (15 downto 0) := (others => '0');
              for j in 0 to strm_len_c_bitwidth - 1 loop
                  tmp_cache_mem_16 (j downto j) := token_tmp (j downto j);
              end loop;
              if (remain = 0) then
                  tmp_cache_mem (15 downto 0) := tmp_cache_mem_16;
              elsif (remain = 1) then
                  tmp_cache_mem (31 downto 16) := tmp_cache_mem_16;
                  mem_strm_len(i/factor)(31 downto 0) := tmp_cache_mem;
                  tmp_cache_mem (DATA_WIDTH - 1 downto 0) := (others => '0');
              end if;
          elsif (factor = 1) then
              if (strm_len_c_bitwidth < 32) then
                  tmp_cache_mem_32 (31 downto 0) := (others => '0');
                  for j in 0 to strm_len_c_bitwidth - 1 loop
                      tmp_cache_mem_32 (j downto j) := token_tmp (j downto j);
                  end loop;
                  mem_strm_len(i)(31 downto 0) := tmp_cache_mem_32;
              else
                  mem_strm_len(i) := token_tmp;
              end if;
          end if;
      end loop;
      remain := read_counter mod factor;
      if (factor = 4) then
          if (remain /= 0) then
              mem_strm_len(strm_len_DEPTH/factor)(31 downto 0) := tmp_cache_mem;
          end if;
      elsif (factor = 2) then
          if (remain /= 0) then
              mem_strm_len(strm_len_DEPTH/factor)(31 downto 0) := tmp_cache_mem;
          end if;
      end if;
      esl_read_token(fp, token_line, token);
      if(token(1 to 16) /= "[[/transaction]]") then
          assert false report "ERROR: Simulation using HLS TB failed." severity failure;
      end if;
      esl_read_token(fp, token_line, token);
      transaction_idx := transaction_idx + 1; 
  end loop;
  file_close(fp);
    wait;
end process;
 
end behav;
