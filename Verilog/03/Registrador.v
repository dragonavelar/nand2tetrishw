module Registrador(in,load,clock,out);
	input[15:0] in;
	input clock,load;
	output[15:0] out;
	
	Bit(in[0],load,clock,out[0]);
	Bit(in[1],load,clock,out[1]);
	Bit(in[2],load,clock,out[2]);
	Bit(in[3],load,clock,out[3]);
	Bit(in[4],load,clock,out[4]);
	Bit(in[5],load,clock,out[5]);
	Bit(in[6],load,clock,out[6]);
	Bit(in[7],load,clock,out[7]);
	Bit(in[8],load,clock,out[8]);
	Bit(in[9],load,clock,out[9]);
	Bit(in[10],load,clock,out[10]);
	Bit(in[11],load,clock,out[11]);
	Bit(in[12],load,clock,out[12]);
	Bit(in[13],load,clock,out[13]);
	Bit(in[14],load,clock,out[14]);
	Bit(in[15],load,clock,out[15]);
	
	

endmodule 