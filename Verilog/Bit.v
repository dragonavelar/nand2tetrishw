module Bit(in,load,clock,out);
	input in,load,clock;
	output out;
	
	wire out;
	wire out1, outMux;
	
		Mux m1(out1,in,load,outMux);
		DFFV d1(outMux, clock,out1);
		OuBinario b1(out1,1'b 0,out);
	

	
endmodule 