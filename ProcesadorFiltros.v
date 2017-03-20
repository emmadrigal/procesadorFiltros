// Copyright (C) 2016  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Intel and sold by Intel or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"
// CREATED		"Mon Mar 20 14:46:29 2017"

module ProcesadorFiltros(
	EN,
	clk
);


input wire	EN;
input wire	clk;

wire	[11:0] inst;
wire	[31:28] int;
wire	[31:0] ints;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_52;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	[3:0] SYNTHESIZED_WIRE_4;
wire	[3:0] SYNTHESIZED_WIRE_53;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	[31:0] SYNTHESIZED_WIRE_7;
wire	[3:0] SYNTHESIZED_WIRE_8;
wire	[31:0] SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	[31:0] SYNTHESIZED_WIRE_11;
wire	[31:0] SYNTHESIZED_WIRE_54;
wire	[31:0] SYNTHESIZED_WIRE_55;
wire	[31:0] SYNTHESIZED_WIRE_15;
wire	[31:0] SYNTHESIZED_WIRE_16;
wire	[31:0] SYNTHESIZED_WIRE_17;
wire	[31:0] SYNTHESIZED_WIRE_18;
wire	[31:0] SYNTHESIZED_WIRE_19;
wire	[31:0] SYNTHESIZED_WIRE_56;
wire	[31:0] SYNTHESIZED_WIRE_57;
wire	[31:0] SYNTHESIZED_WIRE_24;
wire	[31:0] SYNTHESIZED_WIRE_25;
wire	[31:0] SYNTHESIZED_WIRE_26;
wire	[3:0] SYNTHESIZED_WIRE_29;
wire	[31:0] SYNTHESIZED_WIRE_30;
wire	[31:0] SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_34;
wire	[31:0] SYNTHESIZED_WIRE_58;
wire	[31:0] SYNTHESIZED_WIRE_59;
wire	[3:0] SYNTHESIZED_WIRE_38;
wire	[31:0] SYNTHESIZED_WIRE_39;
wire	[3:0] SYNTHESIZED_WIRE_40;
wire	[31:0] SYNTHESIZED_WIRE_43;
wire	[3:0] SYNTHESIZED_WIRE_44;
wire	[31:0] SYNTHESIZED_WIRE_46;
wire	[31:0] SYNTHESIZED_WIRE_47;
wire	[31:0] SYNTHESIZED_WIRE_48;
wire	[31:0] SYNTHESIZED_WIRE_49;

wire	[1:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_0 = {inst[9],inst[10]};


adder	b2v_adder_2(
	.opA(SYNTHESIZED_WIRE_0),
	.opB(SYNTHESIZED_WIRE_52),
	.sum(SYNTHESIZED_WIRE_43));


adder	b2v_adder_3(
	.opA(SYNTHESIZED_WIRE_2),
	.opB(SYNTHESIZED_WIRE_3),
	.sum(SYNTHESIZED_WIRE_30));


Regi	b2v_EXE/MEM(
	
	.clk(clk),
	
	.ib4(SYNTHESIZED_WIRE_4),
	.ic4(SYNTHESIZED_WIRE_53),
	.id32(SYNTHESIZED_WIRE_6),
	.ie32(SYNTHESIZED_WIRE_7),
	
	
	.ih4(SYNTHESIZED_WIRE_8),
	.ii32(SYNTHESIZED_WIRE_9),
	
	
	.oc4(SYNTHESIZED_WIRE_38),
	.od32(SYNTHESIZED_WIRE_54),
	.oe32(SYNTHESIZED_WIRE_57),
	
	
	.oh4(SYNTHESIZED_WIRE_40),
	.oi32(SYNTHESIZED_WIRE_24));


ext2	b2v_Ext_1_2(
	.i(inst[2:1]),
	.o(SYNTHESIZED_WIRE_47));


Ext12	b2v_Ext_Imm(
	.i(inst),
	.o(SYNTHESIZED_WIRE_2));


Ext8	b2v_Extend_Imm(
	.i(inst[7:0]),
	.o(SYNTHESIZED_WIRE_49));


ext	b2v_Extend_Offset_Store(
	.i(GDFX_TEMP_SIGNAL_0),
	.o(SYNTHESIZED_WIRE_48));


Regi	b2v_Fetch/Reg(
	
	.clk(clk),
	
	
	
	.id32(SYNTHESIZED_WIRE_10)
	
	
	
	
	
	
	
	
	
	
	
	
	
	);


R_1	b2v_inst1(
	.o_reg(SYNTHESIZED_WIRE_31));


risk	b2v_inst10(
	
	
	.OPCode(int),
	.ctrl(SYNTHESIZED_WIRE_34)
	);


mux4_1	b2v_inst11(
	
	.I0(SYNTHESIZED_WIRE_11),
	.I1(SYNTHESIZED_WIRE_54),
	.I2(SYNTHESIZED_WIRE_55),
	
	
	.y(SYNTHESIZED_WIRE_15));


ALU	b2v_inst12(
	.code(SYNTHESIZED_WIRE_53),
	.X(SYNTHESIZED_WIRE_15),
	.Y(SYNTHESIZED_WIRE_16),
	.Z(SYNTHESIZED_WIRE_7));


mux4_1	b2v_inst13(
	
	.I0(SYNTHESIZED_WIRE_17),
	.I1(SYNTHESIZED_WIRE_18),
	.I2(SYNTHESIZED_WIRE_19),
	
	
	.y(SYNTHESIZED_WIRE_16));


mux4_1	b2v_inst14(
	
	.I0(SYNTHESIZED_WIRE_56),
	.I1(SYNTHESIZED_WIRE_54),
	.I2(SYNTHESIZED_WIRE_55),
	
	
	.y(SYNTHESIZED_WIRE_17));


mux4_1	b2v_inst15(
	
	.I0(SYNTHESIZED_WIRE_57),
	.I1(SYNTHESIZED_WIRE_24),
	.I2(SYNTHESIZED_WIRE_25),
	
	
	.y(SYNTHESIZED_WIRE_39));


Control	b2v_inst18(
	
	
	
	
	
	
	.ALU_control(SYNTHESIZED_WIRE_44)
	
	);


R__2	b2v_inst2(
	.o_reg(SYNTHESIZED_WIRE_3));





DataMemory	b2v_inst25(
	
	
	.clk(clk),
	.Data(SYNTHESIZED_WIRE_26),
	.Dir(SYNTHESIZED_WIRE_57),
	.Data_out(SYNTHESIZED_WIRE_25));


Register_Mem	b2v_inst3(
	.clk(clk),
	.DI(SYNTHESIZED_WIRE_55),
	.Dir_WRA(SYNTHESIZED_WIRE_29),
	.DirA(inst[7:4]),
	.DirB(inst[3:0]),
	.DatA(SYNTHESIZED_WIRE_58),
	.DataB(SYNTHESIZED_WIRE_59));


\2x32mux 	b2v_inst5(
	
	.A(SYNTHESIZED_WIRE_30),
	.B(SYNTHESIZED_WIRE_31),
	.Y(SYNTHESIZED_WIRE_0));


\2x32mux 	b2v_inst7(
	
	.A(SYNTHESIZED_WIRE_55),
	.B(SYNTHESIZED_WIRE_54),
	.Y(SYNTHESIZED_WIRE_26));


CMP_Combina	b2v_inst9(
	.ctrl(SYNTHESIZED_WIRE_34),
	.DatA(SYNTHESIZED_WIRE_58),
	.DatB(SYNTHESIZED_WIRE_59)
	);


Instructions_Mem	b2v_Instructions_register(
	
	.clk(clk),
	.i_dir(SYNTHESIZED_WIRE_52),
	.o_dir(SYNTHESIZED_WIRE_10));


Regi	b2v_MEM/WB(
	
	.clk(clk),
	
	
	.ic4(SYNTHESIZED_WIRE_38),
	.id32(SYNTHESIZED_WIRE_39),
	
	
	
	.ih4(SYNTHESIZED_WIRE_40),
	
	
	
	
	.od32(SYNTHESIZED_WIRE_55),
	
	
	
	.oh4(SYNTHESIZED_WIRE_29)
	);


\2x32mux 	b2v_mux_sel_risk3(
	
	.A(SYNTHESIZED_WIRE_59),
	.B(SYNTHESIZED_WIRE_55),
	.Y(SYNTHESIZED_WIRE_46));


PC	b2v_PC_Reg(
	.EN(EN),
	.clk(clk),
	.i_dir(SYNTHESIZED_WIRE_43),
	.o_dir(SYNTHESIZED_WIRE_52));


Regi	b2v_Reg/Exe(
	
	.clk(clk),
	.ia4(inst[7:4]),
	.ib4(inst[3:0]),
	.ic4(SYNTHESIZED_WIRE_44),
	.id32(SYNTHESIZED_WIRE_58),
	.ie32(SYNTHESIZED_WIRE_46),
	.if32(SYNTHESIZED_WIRE_47),
	.ig32(SYNTHESIZED_WIRE_48),
	.ih4(inst[11:8]),
	.ii32(SYNTHESIZED_WIRE_49),
	
	.ob4(SYNTHESIZED_WIRE_4),
	.oc4(SYNTHESIZED_WIRE_53),
	.od32(SYNTHESIZED_WIRE_11),
	.oe32(SYNTHESIZED_WIRE_56),
	.of32(SYNTHESIZED_WIRE_18),
	.og32(SYNTHESIZED_WIRE_19),
	.oh4(SYNTHESIZED_WIRE_8),
	.oi32(SYNTHESIZED_WIRE_9));


\2x32mux 	b2v_SrcReg(
	
	.A(SYNTHESIZED_WIRE_56),
	.B(SYNTHESIZED_WIRE_55),
	.Y(SYNTHESIZED_WIRE_6));


endmodule
