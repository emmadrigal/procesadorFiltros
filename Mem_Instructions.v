module Instructions_Mem(	input EN, 
			input [31:0] i_dir,
			input clk,
			output [31:0] o_dir
			);

reg [31:0] mem_inst [0:7]; //[wordsize:0] a [0:arraysize]
reg [31:0] reg_o_dir;

always@(posedge clk)begin	//Read
//	if(!EN) begin
		reg_o_dir=mem_inst[i_dir];
//	end else begin
//		reg_o_dir=32'd0;
//	end
end


//always@(negedge clk)begin	//Write
//end

assign o_dir = reg_o_dir;


endmodule 