module Not16(in,out);
	input [15:0] in;
	output [15:0] out;

	NotBinario n00(in[0],out[0]);   
	NotBinario n01(in[1],out[1]);
	NotBinario n02(in[2],out[2]);
	NotBinario n03(in[3],out[3]);
	NotBinario n04(in[4],out[4]);
	NotBinario n05(in[5],out[5]);
	NotBinario n06(in[6],out[6]);
	NotBinario n07(in[7],out[7]);
	NotBinario n08(in[8],out[8]);
	NotBinario n09(in[9],out[9]);
	NotBinario n10(in[10],out[10]);
	NotBinario n11(in[11],out[11]);
	NotBinario n12(in[12],out[12]);
	NotBinario n13(in[13],out[13]);
	NotBinario n14(in[14],out[14]);
	NotBinario n15(in[15],out[15]);
	

endmodule 
