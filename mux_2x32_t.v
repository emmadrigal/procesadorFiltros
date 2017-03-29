`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:29:13 03/28/2017
// Design Name:   mux_2x32
// Module Name:   C:/Users/Abraham/Documents/Proyectos/procesadorFiltros/mux_2x32_t.v
// Project Name:  procesadorFiltros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_2x32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_2x32_t;

	// Inputs
	reg SEL;
	reg [31:0] A;
	reg [31:0] B;

	// Outputs
	wire [31:0] Y;

	// Instantiate the Unit Under Test (UUT)
	mux_2x32 uut (
		.SEL(SEL), 
		.A(A), 
		.B(B), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		SEL = 0;
		A = 0;
		B = 0;

		// Wait 100 ns for global reset to finish
		#100;
      A=32'd1;
		#1;
		B=32'd3;
		#3;
		SEL=1'd1;
		// Add stimulus here

	end
      
endmodule

