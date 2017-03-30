module ALU( input [5:0] code,
				input [31:0] X,
				input [31:0] Y,
				output CMP_Flag,
				output [31:0] Z
				);

reg [31:0] r_z;				
reg reg_CMP_Flag;

always@(*) begin
	case (code)
		0 : r_z = X + Y;//Add
		1 : r_z = X - Y;//Sub
		2 : r_z = X * Y;//Mul
		3 : r_z = X & Y;//And
		4 : r_z = X | Y;//Or
		5 : r_z = X ^ Y;//XOR
		6 : r_z = !X;//Not
		7 : begin	//Max
			if(X>Y) r_z = X;
			else r_z = Y;
		end
		11 : r_z = X << Y;//Shift Logical left
		12 : r_z = X >> Y;//Shift Logical Right
			
		10 : begin		//Compare Less Than or equal
			r_z = 0;
			if(X<=Y) reg_CMP_Flag = 1;
			else reg_CMP_Flag = 0;
		end
		9 : begin		//Compare Equal
			r_z = 0;
			if(X==Y) reg_CMP_Flag = 1;
			else reg_CMP_Flag = 0;
		end
		8 : begin //Less
			r_z = 0;
			if(X<Y) reg_CMP_Flag = 1;
			else reg_CMP_Flag = 0;
		end
		default: r_z = 0;//No Operation
	endcase
end

assign Z = r_z;
assign CMP_Flag = reg_CMP_Flag;

endmodule 