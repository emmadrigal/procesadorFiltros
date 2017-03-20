module Ext8(input [7:0] i,
				output [31:0] o
				);
				
assign o = {24'd0,i};
				
endmodule 