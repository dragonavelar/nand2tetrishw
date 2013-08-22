module Mux(a,b, sel, out);
	input a;
	input b;
	input sel;
	output out;
	wire not1,out1,out2;
		
	NotBinario Not1(sel,not1);
	AndBinario And1(a,not1,out1);
	AndBinario And2(sel,b,out2);
	OuBinario Ou1(out1,out2,out);
endmodule 
