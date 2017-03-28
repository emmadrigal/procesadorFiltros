
`timescale 1ps / 1ps
module \t_adder.v   ; 
 
  reg  [31:0]  opA   ; 
  wire  [31:0]  sum   ; 
  reg  [31:0]  opB   ; 
  adder  
   DUT  ( 
       .opA (opA ) ,
      .sum (sum ) ,
      .opB (opB ) ); 


  initial
  begin
	opA  = 32'b00000000000000000000000000000000  ;
	# 1 ;
	opB  = 32'b00000000000000000000000000000000  ;
	#10 ;
	opA = 32'd1;
  end


  initial
	#20400 $stop;
endmodule
