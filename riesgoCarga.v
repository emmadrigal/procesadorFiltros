module riesgoCarga (
  //F_Exe quiere decir que vienen de la nube de control
  input [3:0] Ra_F_Exe, 
  input RE_A_F_Exe,
  input [3:0] Rb_F_Exe,
  input RE_B_F_Exe,

  //
  input [31:0] Robj_Reg_Exe, 
  input mem_RE_Reg_Exe,
  
  output NOP_Mux,
  output F_Reg_EN,
  output PC_EN
  
);

//No se verifica que la instrucci?n anterior utilice los datos Ra y Rb, solo que los contenga

//Inserta un NOP antes de la instrucci?n de 
assign NOP_Mux = ((((Ra_F_Exe == Robj_Reg_Exe) &&  RE_A_F_Exe) || ((Rb_F_Exe == Robj_Reg_Exe) &&  RE_B_F_Exe) ) && mem_RE_Reg_Exe);

assign F_Reg_EN = NOP_Mux;

assign F_Reg_EN = NOP_Mux;



endmodule