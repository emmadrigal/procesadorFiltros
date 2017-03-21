module Instructions_Mem(	input EN, 
			input [31:0] i_dir,
			input clk,
			output [31:0] o_dir
			);

reg [31:0] mem_inst [0:7]; //[wordsize:0] a [0:arraysize]
reg [31:0] reg_o_dir;

always@(posedge clk) begin
	if(!EN) begin				//Enable
		reg_o_dir = mem_inst[i_dir];
	end else begin					//Not Enable
		reg_o_dir = 32'd4294967295;
	end
end 


assign o_dir = reg_o_dir;


endmodule 