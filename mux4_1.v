module mux4_1(input [1:0] s,
					input [31:0] I0,
					input [31:0] I1,
					input [31:0] I2,
					input [31:0] I3,
					output [31:0] y
					);

reg [31:0] reg_o;

always@(*) begin
	if(s == 2'b00)begin
		reg_o = I0;
	end else if (s == 2'b01) begin
		reg_o = I1;
	end else if (s == 2'b10) begin
		reg_o = I2;
	end else begin
		reg_o = I3;
	end
end

assign y = reg_o;

endmodule 