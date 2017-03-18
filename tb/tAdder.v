//
// Copyright 1991-2016 Mentor Graphics Corporation
//
// All Rights Reserved.
//
// THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION WHICH IS THE PROPERTY OF 
// MENTOR GRAPHICS CORPORATION OR ITS LICENSORS AND IS SUBJECT TO LICENSE TERMS.
//   

`timescale 1ns / 1ns
module tAdder;

reg clk;
reg [31:0] opA, opB;
wire [31:0] sum;

adder adder_inst
(
	.opA(opA) ,	// input [31:0] opA_sig
	.opB(opB) ,	// input [31:0] opB_sig
	.sum(sum) 	// output [31:0] sum_sig
);




initial // Clock generator
  
begin
    
clk = 0;
    
forever #10 clk = !clk;
  
end
  
initial	// Test stimulus
  begin
    opA=32'd1;
    #2;
    opB=32'd3;
    #2;
  end
  
//initial
//    $monitor($stime,, EN,, clk,,, out); 
    
endmodule    
