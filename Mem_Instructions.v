module Mem_Instructions( 
			input [31:0] i_dir,
			input clk,
			output [15:0] o_dir
			);

reg [15:0] mem_inst [0:3]; //[wordsize:0] a [0:arraysize]
reg [15:0] reg_o_dir;

reg initialized = 0;

always@(posedge clk) begin
	reg_o_dir = mem_inst[i_dir];
	
	if(initialized == 0) begin
		mem_inst[0] = 16'h2111;
		mem_inst[1] = 16'h2111;
		mem_inst[2] = 16'h2111;
		mem_inst[3] = 16'h2111;
		initialized <= 1;
	end
	
end 


assign o_dir = reg_o_dir;


endmodule 