module Control (
	input [3:0] opcode, 
	output wire [1:0] sel_B, 			//Selecciona el segundo dato de la ALU
	output wire [2:0] ALU_control,  
	output wire mem_WE, 				//Memory Write Enable
	output wire mem_RE,  				//Memory Read Enable
	output wire [1:0] sel_data_Out,	//Dato para el WB
	output wire reg_WE					//
);

/*
Falta definir lógica para control de la ALU
*/

//Solo se habilita con un store
assign mem_WE = opcode[3] & opcode[2] & ~opcode[1] & opcode[0];
//Solo se habilita con un load
assign mem_RE  = opcode[3] & opcode[2] & ~opcode[1] & ~opcode[0];

/*
Sel B
0 -> Logic-Aritmethic
1 -> Load offset
2 -> Store offset
*/
assign sel_B[0] = opcode[3] & opcode[2] & ~opcode[1] & ~opcode[0];
assign sel_B[1] = opcode[3] & opcode[2] & ~opcode[1] & opcode[0];


/*
Sel_data_Out
0 -> Logic-Aritmethic
1 -> Immediate
2 -> Load
*/
assign sel_data_Out[0] = opcode[3] & ~opcode[2] & opcode[1] & opcode[0];
assign sel_data_Out[1] = opcode[3] & opcode[2] & ~opcode[1] & ~opcode[0];



//Solo NO se habilita con CMP, Store, BT y NOP
assign reg_WE = ~( mem_WE | (opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0]) |  (opcode[3] & opcode[2] & opcode[1] & ~opcode[0])|(opcode[3] & opcode[2] & opcode[1] & opcode[0]));
endmodule 