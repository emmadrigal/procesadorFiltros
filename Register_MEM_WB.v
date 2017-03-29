module Register_MEM_WB(	input EN, 

			input i_WE_MEM_WB,
			input [31:0] i_WB_Data,
			input [31:0] i_WB_Dir,
			input clk,	
			
			output o_WE_MEM_WB,
			output [31:0] o_WB_Data,
			output [31:0] o_WB_Dir
			);

reg reg_o_WE_MEM_WB;
reg [31:0] reg_o_WB_Data;
reg [31:0] reg_o_WB_Dir;

always@(posedge clk) begin 
		reg_o_WB_Data = i_WB_Data;
		reg_o_WB_Dir = i_WB_Dir;
		reg_o_WE_MEM_WB = i_WE_MEM_WB;
end

assign o_WE_MEM_WB = reg_o_WE_MEM_WB;
assign o_WB_Data = reg_o_WB_Data; 
assign o_WB_Dir = reg_o_WB_Dir;

endmodule 