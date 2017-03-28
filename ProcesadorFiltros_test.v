`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:14:07 03/28/2017
// Design Name:   ProcesadorFiltros
// Module Name:   C:/Users/Abraham/Documents/Proyectos/procesadorFiltros/ProcesadorFiltros_test.v
// Project Name:  procesadorFiltros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ProcesadorFiltros
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ProcesadorFiltros_test;

	// Inputs
	reg clk;
	reg [7:0] Data_in_RAM;

	// Outputs
	wire mem_RE_RAM;
	wire mem_WE_RAM;
	wire [31:0] Data_Dir_RAM;
	wire [7:0] Data_RAM;
	wire [95:0] R;

	// Instantiate the Unit Under Test (UUT)
	ProcesadorFiltros uut (
		.clk(clk), 
		.Data_in_RAM(Data_in_RAM), 
		.mem_RE_RAM(mem_RE_RAM), 
		.mem_WE_RAM(mem_WE_RAM), 
		.Data_Dir_RAM(Data_Dir_RAM), 
		.Data_RAM(Data_RAM), 
		.R(R)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Data_in_RAM = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

