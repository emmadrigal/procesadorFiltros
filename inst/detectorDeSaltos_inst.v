detectorDeSaltos Saltos_inst(
	.cmpFlag(cmpFlag_sig),				//input cmpFlag				
	.opcode(opcode_sig), 					//input [3:0] opcode
	
	.pc_Mux(pc_Mux_sig),					//output pc_Mux
	
	.NOP_Mux(NOP_Mux_sig),			//output NOP_Mux
	.NOP_Mux_F(NOP_Mux_F_sig),	//output NOP_Mux_F
	
	.PC_EN(PC_EN_sig)						//output PC_EN
	
);