module Register_Mem(input [3:0] DirA, 
						input [3:0] DirB, 
						input [3:0] Dir_WRA,  
						input [31:0]DI,
						input RE_A,
						input RE_B,
						input reg_WE,
						input clk,
						output [31:0] DataA, 
						output [31:0] DataB,
						output [31:0] Reg_0, //Registros de prueba 
						output [31:0] Reg_1,
						output [31:0] Reg_2
);

reg [31:0] register_memory [0:15]; //[wordsize:0] a [0:arraysize]
reg [31:0] reg_DataA;
reg [31:0] reg_DataB;

assign Reg_0 = register_memory[1];
assign Reg_1 = register_memory[2];
assign Reg_2 = register_memory[3];
	
reg initialized = 0;
	
always@(*)begin//Read
	if (!RE_B) begin
		reg_DataB=register_memory[DirB];
	end else begin
		reg_DataB=16'd65535;
	end
end

always@(*)begin 	//Read
	if(!RE_A) begin
		reg_DataA=register_memory[DirA];
	end else begin
		reg_DataA=16'd65535;
	end
end


always@(negedge clk)begin 	//Write
	if(initialized == 0) begin
		register_memory[1] = 4'd0;
		register_memory[2] = 4'd0;
		register_memory[3] = 4'd0;
		initialized <= 1;
	end
	if(!reg_WE) begin
		register_memory[Dir_WRA]=DI;
	end	
end

assign DataA = reg_DataA;
assign DataB = reg_DataB;

endmodule 