`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:14:56 03/28/2017
// Design Name:   adder
// Module Name:   C:/Users/Abraham/Documents/Proyectos/procesadorFiltros/adder_t.v
// Project Name:  procesadorFiltros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder_t;

	// Inputs
	reg [31:0] opA;
	reg [31:0] opB;

	// Outputs
	wire [31:0] sum;

	// Instantiate the Unit Under Test (UUT)
	adder uut (
		.opA(opA), 
		.opB(opB), 
		.sum(sum)
	);

	initial begin
		// Initialize Inputs
		opA = 0;
		opB = 0;

		// Wait 100 ns for global reset to finish
		#100;
      opA=32'd2;
		opB=32'd4;
		// Add stimulus here

	end
      
endmodule

