riesgoCarga riesgoCarga_inst(
	.Ra_F_Exe(Ra_F_Exe_sig), 								//input [3:0] Ra_F_Exe, 
	.RE_A_F_Exe(RE_A_F_Exe_sig),						//input RE_A_F_Exe,
	.Rb_F_Exe(Rb_F_Exe_sig), 								//input [3:0] Rb_F_Exe,
	.RE_B_F_Exe(RE_B_F_Exe_sig), 						//input RE_B_F_Exe,

	.Robj_Reg_Exe(Robj_Reg_Exe_sig),				//input [3:0] Robj_Reg_Exe, 
	.mem_RE_Reg_Exe(mem_RE_Reg_Exe_sig),	//input mem_RE_Reg_Exe,
	
	.NOP_Mux(NOP_Mux_sig), 								//output NOP_Mux,
	.F_Reg_EN(F_Reg_EN_sig),								//output F_Reg_EN,
	.PC_EN(PC_EN_sig), 										//output PC_EN
);