module Register_MEM_WB(	input EN, 

			input i_WE_MEM_WB,
			input [31:0] i_WB_Data,
			input [3:0] i_WB_Dir,
			input clk,	
			
			output reg o_WE_MEM_WB,
			output reg [31:0] o_WB_Data,
			output reg [3:0] o_WB_Dir
			);

reg reg_o_WE_MEM_WB;
reg [31:0] reg_o_WB_Data;
reg [3:0] reg_o_WB_Dir;

always@(negedge clk) begin 
		reg_o_WB_Data = i_WB_Data;
		reg_o_WB_Dir = i_WB_Dir;
		reg_o_WE_MEM_WB = i_WE_MEM_WB;
end

always@(posedge clk) begin
	o_WE_MEM_WB = reg_o_WE_MEM_WB;
	o_WB_Data = reg_o_WB_Data; 
	o_WB_Dir = reg_o_WB_Dir;
end

endmodule 