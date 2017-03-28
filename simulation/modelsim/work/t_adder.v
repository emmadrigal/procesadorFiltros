
`timescale 1ps / 1ps
module t_adder  ; 
 
  reg  [31:0]  opA   ; 
  wire  [31:0]  sum   ; 
  reg  [31:0]  opB   ; 
  adder  
   DUT  ( 
       .opA (opA ) ,
      .sum (sum ) ,
      .opB (opB ) ); 



// "Constant Pattern"
// Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  initial
  begin
	  opA  = 32'b00000000000000000000000000000000  ;
	 # 1000 ;
// dumped values till 1 ns
  end


// "Constant Pattern"
// Start Time = 0 ps, End Time = 1 ns, Period = 0 ps
  initial
  begin
	  opB  = 32'b00000000000000000000000000000000  ;
	 # 1000 ;
// dumped values till 1 ns
  end

  initial
	#2000 $stop;
endmodule
