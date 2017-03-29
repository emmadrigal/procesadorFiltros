`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:07:45 03/28/2017
// Design Name:   mux4_1
// Module Name:   C:/Users/Abraham/Documents/Proyectos/procesadorFiltros/mux4_1_t.v
// Project Name:  procesadorFiltros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux4_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux4_1_t;

	// Inputs
	reg [1:0] s;
	reg [31:0] I0;
	reg [31:0] I1;
	reg [31:0] I2;
	reg [31:0] I3;

	// Outputs
	wire [31:0] y;

	// Instantiate the Unit Under Test (UUT)
	mux4_1 uut (
		.s(s), 
		.I0(I0), 
		.I1(I1), 
		.I2(I2), 
		.I3(I3), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		s = 0;
		I0 = 0;
		I1 = 0;
		I2 = 0;
		I3 = 0;

		// Wait 100 ns for global reset to finish
		#100;
      I0 = 32'd0;
		I1 = 32'd1;
		I2 = 32'd2;
		I3 = 32'd3;
		#1;
		s=2'd0;
		#1;
		s=2'd1;
		#1;
		s=2'd2;
		#1
		s=2'd3;
		// Add stimulus here

	end
      
endmodule

