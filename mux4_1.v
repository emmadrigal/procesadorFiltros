module mux4_1(input en,
					input [1:0] s,
					input [31:0] I0,
					input [31:0] I1,
					input [31:0] I2,
					input [31:0] I3,
					output [31:0] y
					); 

assign y = ((~s[1])&(~s[0])&en&I0) | ((~s[1])&(s[0])&en&I1) | (s[1]&(~s[0])&en&I2) | (s[1]&s[0]&en&I3);

endmodule 