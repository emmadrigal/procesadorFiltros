module CMP_REG(input clk,
					input CMP_EN,
					input branch,
					input CMP_flag,
					output flag
);

reg reg_flag;

always@(posedge clk)begin
	if(!CMP_EN)begin
		reg_flag = flag;
	end else begin
		reg_flag = 1'b0;
	end
end

assign flag = reg_flag;

endmodule 