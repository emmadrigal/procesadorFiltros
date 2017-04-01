module signedExt4(input [3:0] i,
				output [31:0] o
				);


assign o = { {28{i[3]}} , i };
//assign o = {28'd0,i};
				
endmodule 