module PC (input clock, input EN ,  input [31:0] c_i, output reg [31:0] c_o);

always @ (posedge clock)begin
	if(!EN)begin
		c_o=c_i;
	end
end

endmodule 