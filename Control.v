module Control (
	input [3:0] opcode, 
	input [1:0] CMP_Flag,
	output wire [1:0] sel_B, 			//Selecciona el segundo dato de la ALU
	output reg [5:0] ALU_control,  
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
0:Add									0
1:Sub									1
2:Mul									2
3:AND									3
4:OR									4
5:XOR									5
6:NOT									6
7:Max									7
8: CMPLT								8
8: CMPE								9
8: CMPLE							  10
9:Shift logical Left			  11
10:Shift logical Right		  12
12:Load							  	0
13:Store							  	0
1111:No Operation			  13 && 14

For the CMP
00:NOP
01:Less than
10: Equal
11:Less than or equal
*/

always @* begin
	case(opcode)
		0 : ALU_control = 0;//ADD
		1 : ALU_control = 1;//SUB
		2 : ALU_control = 2;//MUL
		3 : ALU_control = 3;//AND
		4 : ALU_control = 4;//OR
		5 : ALU_control = 5;//XOR
		6 : ALU_control = 6;//NOT
		7 : ALU_control = 7;//MAX
		8 : begin//CMP
			case(CMP_Flag)
				1 : ALU_control = 8;//LT
				2 : ALU_control = 9;//E
				3 : ALU_control = 10;//LE
				default : ALU_control = 14;//NOP
			endcase
		end
		9 : ALU_control = 11;//SLL
		10 : ALU_control = 12;//SLR
		12 : ALU_control = 0;//LD
		13 : ALU_control = 0;//ST
		default : ALU_control = 14;//NOP
	endcase
end

//Solo se habilita con un store
assign mem_WE = opcode[3] && opcode[2] && ~opcode[1] && opcode[0];
//Solo se habilita con un load
assign mem_RE  = opcode[3] && opcode[2] && ~opcode[1] && ~opcode[0];

/*
Sel B
0 -> Logic-Aritmethic
1 -> Load offset
2 -> Store offset
*/
assign sel_B[0] = opcode[3] && opcode[2] && ~opcode[1] && ~opcode[0];
assign sel_B[1] = opcode[3] && opcode[2] && ~opcode[1] && opcode[0];


/*
Sel_data_Out
0 -> Logic-Aritmethic
1 -> Load
*/
assign sel_data_Out = opcode[3] && opcode[2] && ~opcode[1] && ~opcode[0];
//assign sel_data_Out = 1'b0;

//RE_A NO se habilita en MOV, BT, NOP
assign RE_A = ~( (opcode[3] && ~opcode[2] && opcode[1] && opcode[0]) ||  (opcode[3] && opcode[2] && opcode[1] ));

//RE_B NO se habilita en NOT, MOV, LD, BT, NOP
assign RE_B = ~( mem_RE || (~opcode[3] && opcode[2] && opcode[1] && ~opcode[0]) ||  (opcode[3] && ~opcode[2] && opcode[1] && opcode[0]) || (opcode[3] && opcode[2] && opcode[1]));

//WE NO se habilita con CMP, ST, BT y NOP
assign reg_WE = ~( mem_WE || (opcode[3] && ~opcode[2] && ~opcode[1] && ~opcode[0]) ||  (opcode[3] && opcode[2] && opcode[1]));


//Solo se habilita con el Compare
assign cmp_EN = opcode[3] && ~opcode[2] && ~opcode[1] && ~opcode[0];

assign branch = opcode[3] && opcode[2] && opcode[1] && ~opcode[0];

//Solo se habilita para el inmediato con un MOV (1011)
assign ALU_mux = opcode[3] && ~opcode[2] && opcode[1] && opcode[0];

endmodule 