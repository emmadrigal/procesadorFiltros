module Register_REG_EXE(	input EN, 
			input [14:0] i_ctrl,
			input [3:0] i_Ra,
			input [3:0] i_Rb,
			input [31:0] i_DatA,
			input [31:0] i_DatB,
			input [31:0] i_Off21,
			input [31:0] i_OffStore,
			input [31:0] i_Robj,
			input [3:0] i_imm,
			input clk,	
			
			output [14:0] o_ctrl,
			output [3:0] o_Ra,
			output [3:0] o_Rb,
			output [31:0] o_DatA,
			output [31:0] o_DatB,
			output [31:0] o_Off21,
			output [31:0] o_OffStore,
			output [31:0] o_Robj,
			output [3:0] o_imm
			);

reg [14:0] r_o_ctrl;
reg [3:0] r_o_Ra;
reg [3:0] r_o_Rb;
reg [3:0] r_o_DatA;
reg [31:0] r_o_DatB;
reg [31:0] r_o_Off21;
reg [31:0] r_o_OffStore;
reg [31:0] r_o_Robj;
reg [3:0] r_o_imm;

always@(posedge clk) begin 
	if(!EN)begin
		r_o_ctrl <= i_ctrl;
		r_o_Ra <= i_Ra;
		r_o_Rb <= i_Rb;
		r_o_DatA <= i_DatA;
		r_o_DatB <= i_DatB;
		r_o_Off21 <= i_Off21;
		r_o_OffStore <= i_OffStore;
		r_o_Robj <= i_Robj;
		r_o_imm <= i_imm;
	end
end

assign o_ctrl = r_o_ctrl;
assign o_Ra = r_o_Ra ;
assign o_Rb = r_o_Rb;
assign o_DatA = r_o_DatA;
assign o_DatB = r_o_DatB;
assign o_Off21 = r_o_Off21;
assign o_OffStore = r_o_OffStore;
assign o_Robj = r_o_Robj;
assign o_imm = r_o_imm;
			
endmodule 