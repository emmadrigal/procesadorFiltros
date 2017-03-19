adelantamiento adelantamiento_inst(
	.Ra_F_Reg(Ra_F_Reg_sig), 								//input [3:0] Ra_F_Reg,
	.mem_WE_F_Reg(mem_WE_F_Reg_sig), 			//input mem_WE_F_Reg,
	
	.Ra_Reg_Exe(Ra_Reg_Exe_sig),							//input [3:0] Ra_Reg_Exe, 
	.RE_A_Reg_Exe(RE_A_Reg_Exe_sig),					//input RE_A_Reg_Exe,
	.Rb_Reg_Exe(Rb_Reg_Exe_sig), 						//input [3:0] Rb_Reg_Exe, 
	.RE_B_Reg_Exe(RE_B_Reg_Exe_sig),					//input RE_B_Reg_Exe,
	.mem_WE_Reg_Exe(mem_WE_Reg_Exe_sig),	//input mem_WE_Reg_Exe,
	
	.Robj_Exe_Mem(Robj_Exe_Mem_sig),					//input [3:0] Robj_Exe_Mem, 
	.WE_Exe_Mem(WE_Exe_Mem_sig), 					//input WE_Exe_Mem,
	.mem_WE(mem_WE_sig), 									//input mem_WE,
	.SrcRegDir(SrcRegDir_sig), 									//input [3:0] SrcRegDir,
	
	.Robj_Mem_WB(Robj_Mem_WB_sig),					//input [3:0] Robj_Mem_WB, 
	.WE_Mem_WB(WE_Mem_WB_sig), 					//input  WE_Mem_WB, 
	
	.sel_risk_A(sel_risk_A_sig), 								//output [1:0] sel_risk_A, 
	.sel_risk_B(sel_risk_B_sig),									//output [1:0] sel_risk_B,  
	.sel_risk_mem(sel_risk_mem_sig), 						//output sel_risk_mem,
	.sel_risk_mem2(sel_risk_mem2_sig),					//output sel_risk_mem2,
	.sel_risk_mem3(sel_risk_mem3_sig),					//output sel_risk_mem3
);