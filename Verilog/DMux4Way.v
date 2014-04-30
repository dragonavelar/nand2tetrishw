module DMux4Way(in,sel,a,b,c,d);
	input in;
	input [0:1] sel;
	output a,b,c,d;
	
	wire out1,out2,out3,out4;
	
	DMux d1(in,sel[0],out1,out2);
	DMux d2(in,sel[1],out3,out4);
	AndBinario a1(out1,out3,a);
	AndBinario a2(out2,out3,b);
	AndBinario a3(out1,out4,c);
	AndBinario a4(out2,out4,d);
endmodule 
