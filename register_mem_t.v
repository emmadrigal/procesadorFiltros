`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:31:24 03/29/2017
// Design Name:   Register_Mem
// Module Name:   C:/Users/Abraham/Documents/Proyectos/procesadorFiltros/register_mem_t.v
// Project Name:  procesadorFiltros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Register_Mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module register_mem_t;

	// Inputs
	reg [3:0] DirA;
	reg [3:0] DirB;
	reg [3:0] Dir_WRA;
	reg [31:0] DI;
	reg RE_A;
	reg RE_B;
	reg reg_WE;
	reg clk;

	// Outputs
	wire [31:0] DataA;
	wire [31:0] DataB;
	wire [31:0] Reg_0;
	wire [31:0] Reg_1;
	wire [31:0] Reg_2;

	// Instantiate the Unit Under Test (UUT)
	Register_Mem uut (
		.DirA(DirA), 
		.DirB(DirB), 
		.Dir_WRA(Dir_WRA), 
		.DI(DI), 
		.RE_A(RE_A), 
		.RE_B(RE_B), 
		.reg_WE(reg_WE), 
		.clk(clk), 
		.DataA(DataA), 
		.DataB(DataB), 
		.Reg_0(Reg_0), 
		.Reg_1(Reg_1), 
		.Reg_2(Reg_2)
	);

	always#1clk=~clk;
	
	initial begin
		// Initialize Inputs
		DirA = 0;
		DirB = 0;
		Dir_WRA = 0;
		DI = 0;
		RE_A = 1;
		RE_B = 1;
		reg_WE = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		reg_WE=1'd0;
		Dir_WRA=4'd1;
		DI=32'd1;
		#2;
		reg_WE=1'd1;
		#3;
		
		RE_A=1'd0;
		DirA=4'd1;
		// Add stimulus here

	end
      
endmodule

