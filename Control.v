module Control (
	input [3:0] opcode, 
	input [1:0] CMP_Flag,
	output wire [1:0] sel_B, 			//Selecciona el segundo dato de la ALU
	output wire [5:0] ALU_control,  
	output wire mem_WE, 				//Memory Write Enable
	output wire mem_RE,  				//Memory Read Enable
	output wire sel_data_Out,	//Dato para el WB
	output wire reg_WE,					//habilita el Write en los registros
	output wire RE_A,					//habilita el Write en los registros
	output wire RE_B,					//habilita el Write en los registros
	output wire cmp_EN,				//
	output wire branch,				//
	output wire ALU_mux
);

/*
l�gica para control de la ALU
Opcode 							ALU Code
0000:Add							00000
0001:Sub							00001
0010:Mul							00010
0011:AND							00011
0100:OR							00100
0101:XOR							00101
0110:NOT							00110
0111:Max							00111
1000: CMPLT						01000
1000: CMPE						11000
1001:Shift logical Left		01001
1010:Shift logical Right	01010
1011:Move						01011
1100:Load						01100
1101:Store						01101
1110:Branch on true			01110
1111:No Operation				01111 

For the CMP
00:NOP
01:Less than
10: Equal
11:Less than or equal
*/
assign ALU_control = {opcode,CMP_Flag};

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
1 -> Load
*/
assign sel_data_Out = opcode[3] & opcode[2] & ~opcode[1] & ~opcode[0];
//assign sel_data_Out = 1'b0;

//RE_A NO se habilita en MOV, BT, NOP
assign RE_A = ~( (opcode[3] & ~opcode[2] & opcode[1] & opcode[0]) |  (opcode[3] & opcode[2] & opcode[1] ));

//RE_B NO se habilita en NOT, MOV, LD, BT, NOP
assign RE_B = ~( mem_RE | (~opcode[3] & opcode[2] & opcode[1] & ~opcode[0]) |  (opcode[3] & ~opcode[2] & opcode[1] & opcode[0]) | (opcode[3] & opcode[2] & opcode[1]));

//WE NO se habilita con CMP, Store, BT y NOP
//assign reg_WE = ~( mem_WE | (opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0]) |  (opcode[3] & opcode[2] & opcode[1] & ~opcode[0])|(opcode[3] & opcode[2] & opcode[1] & opcode[0]));
assign reg_WE = ( mem_WE | (opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0]) |  (opcode[3] & opcode[2] & opcode[1] & ~opcode[0])|(opcode[3] & opcode[2] & opcode[1] & opcode[0]));


//Solo se habilita con el Compare
assign cmp_EN = opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0];

assign branch = opcode[3] & opcode[2] & opcode[1] & ~opcode[0];

//Solo se habilita para el inmediato con un MOV (1011)
assign ALU_mux = opcode[3] & ~opcode[2] & opcode[1] & opcode[0];

endmodule 