module Ext12(input [11:0] i,
				output [31:0] o
				);


assign o = {20'd0,i};
				
endmodule 