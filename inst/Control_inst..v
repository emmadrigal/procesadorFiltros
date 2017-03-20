Control Control_inst(
	.opcode(opcode_sig), 						//input [3:0] opcode
	
	.sel_B(sel_B_sig), 							//output [1:0] sel_B
	.ALU_control(ALU_control_sig), 		//output [2:0] ALU_control  
	.mem_WE(mem_WE_sig), 				//output  mem_WE
	.mem_RE(mem_RE_sig),  				//output  mem_RE
	.sel_data_Out(sel_data_Out_sig),	//output [1:0] sel_data_Out
	.reg_WE(reg_WE_sig),					//output  reg_WE
	.RE_A(RE_A_sig),								//output  RE_A
	.RE_B(RE_B_sig),								//output RE_B
	.cmp_EN(cmp_EN_sig),					//output cmp_EN
	.branch(branch_sig)						//output branch
);