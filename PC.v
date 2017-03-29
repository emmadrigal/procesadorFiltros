module PC(input EN, input [31:0] i_dir, input clk, output [31:0] o_dir);

reg [31:0] dir=32'd0;

always@(posedge clk)begin
	if(!EN)begin
		dir=i_dir;
	end 
	else begin
		dir=dir;//?, no es reudunante? -> Evitar Latches
	end
end

assign o_dir=dir;

endmodule 