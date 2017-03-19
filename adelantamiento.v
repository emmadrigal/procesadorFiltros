module adelantamiento (
	input [3:0] Ra_F_Reg,
	input mem_WE_F_Reg,
	
	input [3:0] Ra_Reg_Exe, 
	input RE_A_Reg_Exe,
	input [3:0] Rb_Reg_Exe, 
	input RE_B_Reg_Exe,
	input mem_WE_Reg_Exe,
	
	input [3:0] Robj_Exe_Mem, 
	input WE_Exe_Mem,
	input mem_WE,
	input [3:0] SrcRegDir,
	
	input [3:0] Robj_Mem_WB, 
	input  WE_Mem_WB, 
	
	output reg [1:0] sel_risk_A, 
	output reg [1:0] sel_risk_B,  
	output wire sel_risk_mem,
	output wire sel_risk_mem2,
	output wire sel_risk_mem3
);

/*
Soluciona el riesgo
ADD R1, R2, R3
ST R1, R5, R6
*/
assign sel_risk_mem = ((SrcRegDir == Robj_Mem_WB) && WE_Mem_WB && mem_WE);

/*
Soluciona el riesgo
ADD R1, R2, R3
NOP
ST R1, R5, R6
*/
assign sel_risk_mem2 = ((Ra_Reg_Exe == Robj_Mem_WB) && WE_Mem_WB && mem_WE_Reg_Exe);

/*
Soluciona el riesgo
ADD R1, R2, R3
NOP
NOP
ST R1, R5, R6
*/
assign sel_risk_mem3 = ((Rb_F_Reg == Robj_Mem_WB) && WE_Mem_WB && mem_WE_F_Reg);

always @* begin
	//Riesgo de Datos en la ALU, dato A
	if((Ra_Reg_Exe == Robj_Exe_Mem) && RE_A_Reg_Exe && WE_Exe_Mem)//Dato desde instruccion en mem
		sel_risk_A = 2'b01;
	else if((Ra_Reg_Exe == Robj_Mem_WB) && RE_A_Reg_Exe && WE_Mem_WB)//Dato desde instruccion en WB
		sel_risk_A = 2'b10;
	else
		sel_risk_A = 2'b00;
		
	//Riesgo de Datos en la ALU, dato A
	if((Rb_Reg_Exe == Robj_Exe_Mem) && RE_B_Reg_Exe && WE_Exe_Mem)//Dato desde instruccion en mem
		sel_risk_B = 2'b01;
	else if((Rb_Reg_Exe == Robj_Mem_WB)  && RE_B_Reg_Exe && WE_Mem_WB)//Dato desde instruccion en WB
		sel_risk_B = 2'b10;
	else
		sel_risk_B = 2'b00;		
end


endmodule 