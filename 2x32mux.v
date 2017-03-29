module mux_2x32(
	input SEL,
   input [31:0] A,
   input [31:0] B,
   output [31:0] Y
); 

assign Y = (SEL) ? B : A;

endmodule