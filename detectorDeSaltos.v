module detectorDeSaltos (
	input cmpFlag,
	input [3:0] opcode,//Puede ser una salida de la nube de control
	
	output pc_Mux,
	
	output NOP_Mux,
	output NOP_Mux_F,
	
	output PC_EN
	
);

//Este diseño asume el uso del cambio en la organización

assign pc_Mux = ((opcode == 4'b1110) && cmpFlag);
assign NOP_Mux = pc_Mux;
assign NOP_Mux_F = pc_Mux;

//Se debe verificar el funcionamiento de los enable, en este caso un 1 lo apaga
assign PC_EN = pc_Mux;

endmodule 