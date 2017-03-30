module Register_EXE_MEM(	input EN, 

			input [16:0] i_ctrl,
			input [31:0] i_srcReg,
			input [3:0] i_srcRegDir,
			input [31:0] i_alu,
			input [3:0] i_Robj,
			input clk,	
			
			output reg [16:0] o_ctrl,
			output reg [31:0] o_srcReg,
			output reg [3:0] o_srcRegDir,
			output reg [31:0] o_alu,
			output reg [3:0] o_Robj
			);

reg [16:0] reg_o_ctrl;
reg [31:0] reg_o_srcReg;
reg [3:0] reg_o_srcRegDir;
reg [31:0] reg_o_alu;
reg [3:0] reg_o_Robj;

always@(negedge clk) begin 
		reg_o_ctrl = i_ctrl;
		reg_o_srcReg = i_srcReg;
		reg_o_srcRegDir = i_srcRegDir;
		reg_o_alu = i_alu;
		reg_o_Robj = i_Robj;
end

always@(posedge clk) begin
	o_ctrl = reg_o_ctrl;
	o_srcReg = reg_o_srcReg;
	o_srcRegDir = reg_o_srcRegDir;
	o_alu = reg_o_alu;
	o_Robj = reg_o_Robj;
end

endmodule 