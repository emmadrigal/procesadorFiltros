module mux_15_2_1(input s,
					input [15:0] I0,
					input [15:0] I1,
					output [15:0] y
					); 

assign y = (s) ? I1 : I0;

endmodule 