module Registrador(in,load,clock,out);
	input[15:0] in;
	input clock,load;
	output[15:0] out;
	
	Bit b1(in[0],load,clock,out[0]);
	Bit b2(in[1],load,clock,out[1]);
	Bit b3(in[2],load,clock,out[2]);
	Bit b4(in[3],load,clock,out[3]);
	Bit b5(in[4],load,clock,out[4]);
	Bit b6(in[5],load,clock,out[5]);
	Bit b7(in[6],load,clock,out[6]);
	Bit b8(in[7],load,clock,out[7]);
	Bit b9(in[8],load,clock,out[8]);
	Bit b10(in[9],load,clock,out[9]);
	Bit b11(in[10],load,clock,out[10]);
	Bit b12(in[11],load,clock,out[11]);
	Bit b13(in[12],load,clock,out[12]);
	Bit b14(in[13],load,clock,out[13]);
	Bit b15(in[14],load,clock,out[14]);
	Bit b16(in[15],load,clock,out[15]);
	
	

endmodule 