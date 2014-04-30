module DMux(in,sel,outA,outB);
	input in;
	input sel;
	output outA;
	output outB;

	NotBinario ns(sel,notSel);
	AndBinario aa(in,notSel,outA);
	AndBinario ab(in,sel,outB);
endmodule
	
