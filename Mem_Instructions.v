module Mem_Instructions( 
			input [31:0] i_dir,
			input clk,
			output [15:0] o_dir
			);

reg [15:0] mem_inst [0:100]; //[wordsize:0] a [0:arraysize]
reg [15:0] reg_o_dir;

reg initialized = 0;

always@(*) begin
	reg_o_dir = mem_inst[i_dir];
	if(initialized == 0) begin
		mem_inst[0] = 16'hffff;
		mem_inst[1] = 16'hb105;
		mem_inst[2] = 16'hb104;
		mem_inst[3] = 16'hb10f;
		mem_inst[4] = 16'hb102;
		mem_inst[5] = 16'h0211;
		mem_inst[6] = 16'hffff;
		mem_inst[7] = 16'hffff;
		mem_inst[8] = 16'hffff;
		mem_inst[9] = 16'hffff;
		mem_inst[10] = 16'hffff;
		mem_inst[11] = 16'hffff;
		initialized <= 1;
	end
	
end 


assign o_dir = reg_o_dir;


endmodule 