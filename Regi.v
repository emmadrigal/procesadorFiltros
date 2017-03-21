module Regi(	input EN, 
			input i_mem_RE,
			input [3:0] ia4,
			input [3:0] ib4,
			input [3:0] ic4,
			input [31:0] id32,
			input [31:0] ie32,
			input [31:0] if32,
			input [31:0] ig32,
			input [3:0] ih4,
			input [31:0] ii32,
			input clk,	
			
			output o_mem_RE,
			output [3:0] oa4,
			output [3:0] ob4,
			output [3:0] oc4,
			output [31:0] od32,
			output [31:0] oe32,
			output [31:0] of32,
			output [31:0] og32,
			output [3:0] oh4,
			output [31:0] oi32
			);

reg r_o_mem_RE;
reg [3:0] r_oa4;
reg [3:0] r_ob4;
reg [3:0] r_oc4;
reg [31:0] r_od32;
reg [31:0] r_oe32;
reg [31:0] r_of32;
reg [31:0] r_og32;
reg [3:0] r_oh4;
reg [31:0] r_oi32;

always@(posedge clk) begin 
	if(!EN)begin
		r_oa4 <= ia4;
		r_ob4 <= ib4;
		r_oc4 <= ic4;
		r_od32 <= id32;
		r_oe32 <= ie32;
		r_of32 <= if32;
		r_og32 <= ig32;
		r_oh4 <= ih4;
		r_oi32 <= ii32;
		r_o_mem_RE <= i_mem_RE;
	end
/*	else begin
		r_oa4 <= 4'd15;
		r_ob4 <= 4'd15;
		r_oc4 <= 4'd15;
		r_od32 <= 32'd4294967295;
		r_oe32 <= 32'd4294967295;
		r_of32 <= 32'd4294967295;
		r_og32 <= 32'd4294967295;
		r_oh4 <= 4'd15;
		r_oi32 <= 32'd4294967295;		
	end
*/
end

assign o_mem_RE = r_o_mem_RE;
assign oa4 = r_oa4 ;
assign ob4 = r_ob4;
assign oc4 = r_oc4;
assign od32 = r_od32;
assign oe32 = r_oe32;
assign of32 = r_of32;
assign og32 = r_og32;
assign oh4 = r_oh4;
assign oi32 = r_oi32;
			
endmodule 