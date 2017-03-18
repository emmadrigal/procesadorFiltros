module PC(input EN, input [31:0] i_dir, input clk, output [31:0] o_dir);

reg dir;

always@(posedge clk)begin
	if(!EN)begin
		dir=i_dir;
	end else begin
		dir=dir;
	end
end

assign o_dir=dir;

endmodule 