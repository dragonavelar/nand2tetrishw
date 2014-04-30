module DMux8Way(in, sel,a,b,c,d,e,f,g,h);
	input in;
	input [2:0] sel;
	output a,b,c,d,e,f,g,h;
	
	wire out1,out2,out3,out4,out5,out6,out7,out8;

	DMux4Way d1(in,sel[1:0],out1,out2,out3,out4);
	DMux4Way d2(in,sel[2:1],out5,out6,out7,out8);
	AndBinario a1(out1,out5,a);
	AndBinario a2(out2,out5,b);
	AndBinario a3(out3,out6,c);
	AndBinario a4(out4,out6,d);
	AndBinario a5(out1,out7,e);
	AndBinario a6(out2,out7,f);
	AndBinario a7(out3,out8,g);
	AndBinario a8(out4,out8,h);

endmodule 
