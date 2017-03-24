module Register_EXE_MEM(	input EN, 

			input [15:0] i_ctrl,
			input [31:0] i_srcReg,
			input [3:0] i_srcRegDir,
			input [31:0] i_alu,
			input [31:0] i_Robj,
			input clk,	
			
			output [15:0] o_ctrl,
			output [31:0] o_srcReg,
			output [3:0] o_srcRegDir,
			output [31:0] o_alu,
			output [31:0] o_Robj
			);

reg [15:0] reg_o_ctrl;
reg [31:0] reg_o_srcReg;
reg [3:0] reg_o_srcRegDir;
reg [31:0] reg_o_alu;
reg [31:0] reg_o_Robj;

always@(posedge clk) begin 
	if(!EN)begin
		reg_o_ctrl = i_ctrl;
		reg_o_srcReg = i_srcReg;
		reg_o_srcRegDir = i_srcRegDir;
		reg_o_alu = i_alu;
		reg_o_Robj = i_Robj;
	end
end

assign o_ctrl = reg_o_ctrl;
assign o_srcReg = reg_o_srcReg;
assign o_srcRegDir = reg_o_srcRegDir;
assign o_alu = reg_o_alu;
assign o_Robj = reg_o_Robj;

endmodule 