// This is an example of a simple 32 bit up-counter called simple_counter.v
// It has a single clock input and a 32-bit output port
module simple_counter (input clock, input rst , output reg [25:0] counter_out);

always @ (posedge clock)begin// on positive clock edge
	if(rst)begin
		counter_out <= #1 0;
	end else begin
		counter_out <= #1 counter_out + 1;// increment counter
	end
end
endmodule// end of module counter