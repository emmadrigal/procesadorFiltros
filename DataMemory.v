module DataMemory(input mem_WE,
						input mem_RE,
						input [7:0] Data,
						input [31:0] Dir,
						input clk,
						output [7:0] Data_out
						);

reg [31:0] data_memory [7:0]; //[wordsize:0] a [0:arraysize]
reg [7:0] reg_data_out;

always@(posedge clk)begin	//Read
	if(!mem_RE)begin
		reg_data_out = data_memory[Dir];
	end
end

always@(negedge clk)begin	//Write
	if(!mem_WE)begin
		data_memory[Dir] = Data;
	end
end


assign Data_out = reg_data_out;

endmodule 