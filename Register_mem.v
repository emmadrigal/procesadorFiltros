module Register_Mem(input [3:0] DirA, 
						input [3:0] DirB, 
						input [3:0] Dir_WRA,  
						input [31:0]DI,
						input RE_A,
						input RE_B,
						input reg_WE,
						input clk,
						output [31:0]DatA, 
						output [31:0] DataB,
						output [31:0] Reg_0, //Registros de prueba 
						output [31:0] Reg_1,
						output [31:0] Reg_2
);

reg [31:0] register_memory [31:0]; //[wordsize:0] a [0:arraysize]
reg [31:0] reg_DataA;
reg [31:0] reg_DataB;
						
always@(posedge clk)begin 	//Read
	if(!RE_A) begin
		reg_DataA=register_memory[DirA];
	end else begin
		reg_DataA=16'd65535;
	end
	if (!RE_B) begin
		reg_DataB=register_memory[DirB];
	end else begin
		reg_DataB=16'd65535;
	end
end


always@(negedge clk)begin 	//Write
	if(!reg_WE) begin
		register_memory[Dir_WRA]=DI;
	end	
end

assign DataA = reg_DataA;
assign DataB = reg_DataB;

endmodule 