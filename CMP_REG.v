module CMP_REG(input clk,
					input CMP_EN,
					input CMP_flag,
					output flag
);

reg reg_flag=1'd0;

always@(*)begin
	if(CMP_EN)begin
		reg_flag = CMP_flag;
	end else begin
		reg_flag = reg_flag;
	end
end

assign flag = reg_flag;

endmodule  