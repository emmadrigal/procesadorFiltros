module Register_REG_EXE(	input EN, 
			input [16:0] i_ctrl,
			input [3:0] i_Ra,
			input [3:0] i_Rb,
			input [31:0] i_DatA,
			input [31:0] i_DatB,
			input [31:0] i_Off21,
			input [31:0] i_OffStore,
			input [3:0] i_Robj,
			input [31:0] i_imm,
			input clk,	
			
			output reg [16:0] o_ctrl,
			output reg [3:0] o_Ra,
			output reg [3:0] o_Rb,
			output reg [31:0] o_DatA,
			output reg [31:0] o_DatB,
			output reg [31:0] o_Off21,
			output reg [31:0] o_OffStore,
			output reg [3:0] o_Robj,
			output reg [31:0] o_imm
			);

reg [16:0] r_o_ctrl;
reg [3:0] r_o_Ra;
reg [3:0] r_o_Rb;
reg [3:0] r_o_DatA;
reg [31:0] r_o_DatB;
reg [31:0] r_o_Off21;
reg [31:0] r_o_OffStore;
reg [3:0] r_o_Robj;
reg [31:0] r_o_imm;

always@(negedge clk) begin 
		r_o_ctrl = i_ctrl;
		r_o_Ra = i_Ra;
		r_o_Rb = i_Rb;
		r_o_DatA = i_DatA;
		r_o_DatB = i_DatB;
		r_o_Off21 = i_Off21;
		r_o_OffStore = i_OffStore;
		r_o_Robj = i_Robj;
		r_o_imm = i_imm;
end

always@(posedge clk) begin
	o_ctrl = r_o_ctrl;
	o_Ra = r_o_Ra ;
	o_Rb = r_o_Rb;
	o_DatA = r_o_DatA;
	o_DatB = r_o_DatB;
	o_Off21 = r_o_Off21;
	o_OffStore = r_o_OffStore;
	o_Robj = r_o_Robj;
	o_imm = r_o_imm;
end
			
endmodule 