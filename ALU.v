module ALU( input [3:0] code,
				input [31:0] X,
				input [31:0] Y,
				output CMP_Flag,
				output [31:0] Z
				);

reg [31:0] r_z;				
reg reg_CMP_Flag;

always@(*) begin
	case (code)
		4'b0000:begin		//Add
			r_z = X + Y;
			reg_CMP_Flag = 1'b0;
		end 4'b0001:begin		//Sub
			r_z = X - Y;
			reg_CMP_Flag = 1'b0;
		end 4'b0010:begin		//Mul
			r_z = X * Y;
			reg_CMP_Flag = 1'b0;
		end 4'b0011:begin		//And
			r_z = X & Y;
			reg_CMP_Flag = 1'b0;
		end 4'b0100:begin		//Or
			r_z = X | Y;
			reg_CMP_Flag = 1'b0;
		end 4'b0101:begin		//XOr
			r_z = X ^ Y;
			reg_CMP_Flag = 1'b0;
		end 4'b0110:begin		//Not
			r_z = !X;
			reg_CMP_Flag = 1'b0;
		end 4'b0111:	begin	//Max
			reg_CMP_Flag = 1'b0;
			if(X>Y) begin
				r_z = X;
			end else begin
				r_z = Y;
			end
		end 4'b1000:begin		//Shift Logical left
			r_z = X << Y;
		end 4'b1001:begin		//Shift Logical Right
			r_z = X >> Y;
			reg_CMP_Flag = 1'b0;
		end 4'b1010:begin		//Compare Less Than
			r_z = 32'd0;
			if(X<Y) begin
				reg_CMP_Flag = 1'b1;
			end else begin
				reg_CMP_Flag = 1'b0;
			end
		end 4'b1011: begin		//Compare Equal
			r_z = 32'd0;
			if(X==Y) begin
				reg_CMP_Flag = 1'b1;
			end else begin
				reg_CMP_Flag = 1'b0;
			end
		end default: begin 	//No Operation
			r_z = 32'd0;
			reg_CMP_Flag = 1'b0;
		end
	endcase
end

assign Z = r_z;
assign CMP_Flag = reg_CMP_Flag;

endmodule 