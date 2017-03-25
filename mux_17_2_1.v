module mux_17_2_1(input s,
					input [16:0] I0,
					input [16:0] I1,
					output [16:0] y
					); 

assign y = (s) ? I1 : I0;

endmodule 