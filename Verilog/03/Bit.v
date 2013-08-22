module Bit(in,load,clock,out);
	input in,load,clock;
	output out;
	
	wire out;
	wire out1, outMux;
	
		Mux(out1,in,load,outMux);
		DFFV(outMux, clock,out1);
		OuBinario(out1,1'b 0,out);
	

	
endmodule 