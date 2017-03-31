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
// CREATED		"Tue Mar 28 15:07:59 2017"

module ProcesadorFiltros(
	input clk,
	input Data_in_RAM,
	output mem_RE_RAM,
	output mem_WE_RAM,
	output [31:0] Data_Dir_RAM,
	output [7:0] Data_RAM,
	output [95:0] R
);


wire	[16:0] ctrl;
wire	[15:0] inst;
wire	[15:0] ints;
wire	[3:0] jump;
wire	[16:0] mem_ctrl;
wire	[16:0] o_ctrl;
wire	[95:0] R_ALTERA_SYNTHESIZED;
wire	[2:0] risk;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_69;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_70;
wire	[3:0] SYNTHESIZED_WIRE_8;
wire	[3:0] SYNTHESIZED_WIRE_71;
wire	[3:0] SYNTHESIZED_WIRE_72;
wire	[3:0] SYNTHESIZED_WIRE_11;
wire	[31:0] SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_73;
wire	[31:0] SYNTHESIZED_WIRE_74;
wire	[1:0] SYNTHESIZED_WIRE_15;
wire	[31:0] SYNTHESIZED_WIRE_16;
wire	[31:0] SYNTHESIZED_WIRE_17;
wire	[31:0] SYNTHESIZED_WIRE_18;
wire	[31:0] SYNTHESIZED_WIRE_20;
wire	[15:0] SYNTHESIZED_WIRE_21;
wire	[15:0] SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	[16:0] SYNTHESIZED_WIRE_24;
wire	[31:0] SYNTHESIZED_WIRE_25;
wire	[31:0] SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	[31:0] SYNTHESIZED_WIRE_75;
wire	[31:0] SYNTHESIZED_WIRE_31;
wire	[31:0] SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	[31:0] SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_36;
wire	[31:0] SYNTHESIZED_WIRE_37;
wire	[1:0] SYNTHESIZED_WIRE_43;
wire	[31:0] SYNTHESIZED_WIRE_44;
wire	[31:0] SYNTHESIZED_WIRE_45;
wire	[3:0] SYNTHESIZED_WIRE_77;
wire	[31:0] SYNTHESIZED_WIRE_47;
wire	[15:0] SYNTHESIZED_WIRE_49;
wire	[31:0] SYNTHESIZED_WIRE_50;
wire	[16:0] SYNTHESIZED_WIRE_52;
wire	[31:0] SYNTHESIZED_WIRE_53;
wire	[31:0] SYNTHESIZED_WIRE_54;
wire	[31:0] SYNTHESIZED_WIRE_55;
wire	[31:0] SYNTHESIZED_WIRE_56;
wire	[31:0] SYNTHESIZED_WIRE_57;
wire	[31:0] SYNTHESIZED_WIRE_58;
wire	[3:0] SYNTHESIZED_WIRE_62;
wire	SYNTHESIZED_WIRE_64;
wire	[31:0] SYNTHESIZED_WIRE_65;
wire	[31:0] SYNTHESIZED_WIRE_67;

assign	Data_Dir_RAM = SYNTHESIZED_WIRE_73;
wire	[3:0] GDFX_TEMP_SIGNAL_1;
wire	[1:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_1 = {inst[0],inst[1],inst[2],inst[3]};
assign	GDFX_TEMP_SIGNAL_0 = {inst[9],inst[10]};


adder	b2v_adder_2(
	.opA(SYNTHESIZED_WIRE_0),
	.opB(SYNTHESIZED_WIRE_69),
	.sum(SYNTHESIZED_WIRE_44));


adder	b2v_adder_3(
	.opA(SYNTHESIZED_WIRE_2),
	.opB(SYNTHESIZED_WIRE_3),
	.sum(SYNTHESIZED_WIRE_25));


CMP_REG	b2v_CMP_Register(
	.clk(clk),
	.CMP_EN(o_ctrl[1]),
	.CMP_flag(SYNTHESIZED_WIRE_4),
	.flag(SYNTHESIZED_WIRE_27));


Control	b2v_Control_Unit(
	.CMP_Flag(inst[11:10]),
	.opcode(inst[15:12]),
	.mem_WE(ctrl[8]),
	.mem_RE(ctrl[7]),
	.sel_data_Out(ctrl[5]),
	.reg_WE(ctrl[4]),
	.RE_A(ctrl[3]),
	.RE_B(ctrl[2]),
	.cmp_EN(ctrl[1]),
	.branch(ctrl[0]),
	.ALU_mux(ctrl[6]),
	.ALU_control(ctrl[14:9]),
	.sel_B(ctrl[16:15]));


Ext8	b2v_Ext_Data_Out(
	.i(Data_in_RAM),
	.o(SYNTHESIZED_WIRE_20));


Ext12	b2v_Ext_Imm(
	.i(inst[11:0]),
	.o(SYNTHESIZED_WIRE_2));


ext2	b2v_Ext_Offset_1_2(
	.i(inst[2:1]),
	.o(SYNTHESIZED_WIRE_56));


ext2	b2v_Ext_Offset_Store_9_10(
	.i(GDFX_TEMP_SIGNAL_0),
	.o(SYNTHESIZED_WIRE_57));


Ext4	b2v_Ext_Robj(
	.i(inst[11:8]),
	.o(SYNTHESIZED_WIRE_58));


Ext8	b2v_Extend_Imm(
	.i(inst[7:0]),
	.o(SYNTHESIZED_WIRE_55));


R_1	b2v_inst1(
	.o_reg(SYNTHESIZED_WIRE_26));


ALU	b2v_inst12(
	.code(o_ctrl[14:9]),
	.X(SYNTHESIZED_WIRE_5),
	.Y(SYNTHESIZED_WIRE_6),
	.CMP_Flag(SYNTHESIZED_WIRE_4),
	.Z(SYNTHESIZED_WIRE_31));


R__2	b2v_inst2(
	.o_reg(SYNTHESIZED_WIRE_3));

	
adelantamiento	b2v_inst20(
	.mem_WE_F_Reg(ctrl[8]),
	.RE_A_Reg_Exe(o_ctrl[3]),
	.RE_B_Reg_Exe(o_ctrl[2]),
	.mem_WE_Reg_Exe(ctrl[8]),
	.WE_Exe_Mem(mem_ctrl[4]),
	.mem_WE(mem_ctrl[8]),
	.WE_Mem_WB(SYNTHESIZED_WIRE_70),
	.clk(clk),
	.Ra_F_Reg(inst[3:0]),
	.RE_A_F_Reg(ctrl[3]),
	.Ra_Reg_Exe(SYNTHESIZED_WIRE_8),
	.Rb_F_Reg(inst[7:4]),
	.RE_B_F_Reg(ctrl[2]),
	.Rb_Reg_Exe(SYNTHESIZED_WIRE_71),
	.Robj_Exe_Mem(SYNTHESIZED_WIRE_72),
	.Robj_Mem_WB(SYNTHESIZED_WIRE_62),
	
	.SrcRegDir(SYNTHESIZED_WIRE_11),
	.sel_risk_mem(SYNTHESIZED_WIRE_64),
	.sel_risk_mem2(SYNTHESIZED_WIRE_28),
	.sel_risk_mem3(SYNTHESIZED_WIRE_33),
	.sel_risk_mem4(SYNTHESIZED_WIRE_36),
	.sel_risk_A(SYNTHESIZED_WIRE_15),
	.sel_risk_B(SYNTHESIZED_WIRE_43));


mux4_1	b2v_inst22(
	.I0(SYNTHESIZED_WIRE_12),
	.I1(SYNTHESIZED_WIRE_73),
	.I2(SYNTHESIZED_WIRE_74),
	
	.s(SYNTHESIZED_WIRE_15),
	.y(SYNTHESIZED_WIRE_5));


mux4_1	b2v_inst23(
	.I0(SYNTHESIZED_WIRE_16),
	.I1(SYNTHESIZED_WIRE_17),
	.I2(SYNTHESIZED_WIRE_18),
	
	.s(o_ctrl[16:15]),
	.y(SYNTHESIZED_WIRE_6));

mux_2x32 b2v_inst26 (
    .SEL(mem_ctrl[5]), 
    .A(SYNTHESIZED_WIRE_73), 
    .B(SYNTHESIZED_WIRE_20), 
    .Y(SYNTHESIZED_WIRE_50)
    );
	 

mux_15_2_1	b2v_inst3(
	.s(jump[2]),
	.I0(SYNTHESIZED_WIRE_21),
	.I1(SYNTHESIZED_WIRE_22),
	.y(SYNTHESIZED_WIRE_49));


mux_17_2_1	b2v_inst4(
	.s(SYNTHESIZED_WIRE_23),
	.I0(ctrl),
	.I1(SYNTHESIZED_WIRE_24),
	.y(SYNTHESIZED_WIRE_52));


mux_2x32 mux_2_32 (
    .SEL(jump[3]), 
    .A(SYNTHESIZED_WIRE_26), 
    .B(SYNTHESIZED_WIRE_25), 
    .Y(SYNTHESIZED_WIRE_0)
    );

assign	SYNTHESIZED_WIRE_23 = (jump[2] | risk[2]);


detectorDeSaltos	b2v_Jump_Detector(
	.cmpFlag(SYNTHESIZED_WIRE_27),
	.opcode(inst[15:12]),
	.pc_Mux(jump[3]),
	.NOP_Mux(jump[2]),
	.NOP_Mux_F(jump[1]),
	.PC_EN(jump[0]));


mux_2x32 	b2v_mux_sel_mem_risk_2(
	.SEL(SYNTHESIZED_WIRE_28),
	.A(SYNTHESIZED_WIRE_75),
	.B(SYNTHESIZED_WIRE_74),
	.Y(SYNTHESIZED_WIRE_47));


mux_2x32 	b2v_mux_sel_mem_risk_3(
	.SEL(o_ctrl[6]),
	.A(SYNTHESIZED_WIRE_31),
	.B(SYNTHESIZED_WIRE_32),
	.Y(SYNTHESIZED_WIRE_45));


mux_2x32 	b2v_mux_sel_risk3(
	.SEL(SYNTHESIZED_WIRE_33),
	.A(SYNTHESIZED_WIRE_34),
	.B(SYNTHESIZED_WIRE_74),
	.Y(SYNTHESIZED_WIRE_54));


mux_2x32 	b2v_mux_sel_risk4(
	.SEL(SYNTHESIZED_WIRE_36),
	.A(SYNTHESIZED_WIRE_37),
	.B(SYNTHESIZED_WIRE_74),
	.Y(SYNTHESIZED_WIRE_53));


mux4_1	b2v_mux_sel_risk_B(
	.I0(SYNTHESIZED_WIRE_75),
	.I1(SYNTHESIZED_WIRE_73),
	.I2(SYNTHESIZED_WIRE_74),
	.I3(SYNTHESIZED_WIRE_74),
	.s(SYNTHESIZED_WIRE_43),
	.y(SYNTHESIZED_WIRE_16));


PC	b2v_PC_Reg(
	.EN(risk[0]),
	.clk(clk),
	.i_dir(SYNTHESIZED_WIRE_44),
	.o_dir(SYNTHESIZED_WIRE_69));


R_17_131071	b2v_Reg_17_131071(
	.o_reg(SYNTHESIZED_WIRE_24));


Register_EXE_MEM	b2v_Reg_EXE_MEM(
	
	.clk(clk),
	.i_alu(SYNTHESIZED_WIRE_45),
	.i_ctrl(o_ctrl),
	.i_Robj(SYNTHESIZED_WIRE_77),
	.i_srcReg(SYNTHESIZED_WIRE_47),
	.i_srcRegDir(SYNTHESIZED_WIRE_71),
	.o_alu(SYNTHESIZED_WIRE_73),
	.o_ctrl(mem_ctrl),
	.o_Robj(SYNTHESIZED_WIRE_72),
	.o_srcReg(SYNTHESIZED_WIRE_65),
	.o_srcRegDir(SYNTHESIZED_WIRE_11));


Register_F_REG	b2v_Reg_F_REG(
	.EN(risk[1]|jump[3]),
	.clk(clk),
	.i_inst(SYNTHESIZED_WIRE_49),
	.o_inst(inst));


Register_MEM_WB	b2v_Reg_MEM_WB(
	
	.i_WE_MEM_WB(mem_ctrl[4]),
	.clk(clk),
	.i_WB_Data(SYNTHESIZED_WIRE_50),
	.i_WB_Dir(SYNTHESIZED_WIRE_72),
	.o_WE_MEM_WB(SYNTHESIZED_WIRE_70),
	.o_WB_Data(SYNTHESIZED_WIRE_74),
	.o_WB_Dir(SYNTHESIZED_WIRE_62));


Register_REG_EXE	b2v_Reg_REG_EXE(
	
	.clk(clk),
	.i_ctrl(SYNTHESIZED_WIRE_52),
	.i_DatA(SYNTHESIZED_WIRE_53),
	.i_DatB(SYNTHESIZED_WIRE_54),
	.i_imm(SYNTHESIZED_WIRE_55),
	.i_Off21(SYNTHESIZED_WIRE_56),
	.i_OffStore(SYNTHESIZED_WIRE_57),
	.i_Ra(inst[7:4]),
	.i_Rb(inst[3:0]),
	.i_Robj(inst[11:8]),
	.o_ctrl(o_ctrl),
	.o_DatA(SYNTHESIZED_WIRE_12),
	.o_DatB(SYNTHESIZED_WIRE_75),
	.o_imm(SYNTHESIZED_WIRE_32),
	.o_Off21(SYNTHESIZED_WIRE_17),
	.o_OffStore(SYNTHESIZED_WIRE_18),
	.o_Ra(SYNTHESIZED_WIRE_8),
	.o_Rb(SYNTHESIZED_WIRE_71),
	.o_Robj(SYNTHESIZED_WIRE_77));


R_16_65535	b2v_Register_65535(
	.o_reg(SYNTHESIZED_WIRE_22));


Mem_Instructions	b2v_Register_Mem_Instructions(
	.clk(clk),
	.i_dir(SYNTHESIZED_WIRE_69),
	.o_dir(SYNTHESIZED_WIRE_21));


Register_Mem	b2v_Register_Memory(
	.RE_A(ctrl[3]),
	.RE_B(ctrl[2]),
	.reg_WE(SYNTHESIZED_WIRE_70),
	.clk(clk),
	.DI(SYNTHESIZED_WIRE_74),
	.Dir_WRA(SYNTHESIZED_WIRE_62),
	.DirA(inst[7:4]),
	.DirB(inst[3:0]),
	.DataA(SYNTHESIZED_WIRE_37),
	.DataB(SYNTHESIZED_WIRE_34),
	.Reg_0(R_ALTERA_SYNTHESIZED[31:0]),
	.Reg_1(R_ALTERA_SYNTHESIZED[63:32]),
	.Reg_2(R_ALTERA_SYNTHESIZED[95:64]));


riesgoCarga	b2v_risks(
	.RE_A_F_Exe(ctrl[3]),
	.RE_B_F_Exe(ctrl[2]),
	.mem_RE_Reg_Exe(o_ctrl[7]),
	.Ra_F_Exe(inst[7:4]),
	.Rb_F_Exe(GDFX_TEMP_SIGNAL_1),
	.Robj_Reg_Exe(SYNTHESIZED_WIRE_77),
	.NOP_Mux(risk[2]),
	.F_Reg_EN(risk[1]),
	.PC_EN(risk[0]));


mux_2x32 	b2v_sel_mem_risk_1(
	.SEL(SYNTHESIZED_WIRE_64),
	.A(SYNTHESIZED_WIRE_65),
	.B(SYNTHESIZED_WIRE_74),
	.Y(SYNTHESIZED_WIRE_67));


Truncate8	b2v_truncate_31_8(
	.i(SYNTHESIZED_WIRE_67),
	.o(Data_RAM));


assign	mem_RE_RAM = mem_ctrl[7];
assign	mem_WE_RAM = mem_ctrl[8];
assign	R = R_ALTERA_SYNTHESIZED;

endmodule