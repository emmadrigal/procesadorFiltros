module Register_F_REG(	input EN, 
			input [15:0] i_inst,
			input clk,	
			output [15:0] o_inst
			);

reg [15:0] reg_o_inst;

always@(posedge clk) begin 
	if(!EN)begin
		reg_o_inst = i_inst;
	end else begin
		reg_o_inst = 16'b1111111111111111;
	end
end

assign o_inst = reg_o_inst;


endmodule 