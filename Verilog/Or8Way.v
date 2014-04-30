module Or8Way(in,out);
	input [7:0] in;
	output out;
	
	wire out1,out2,out3,out4,out5,out6;
	
	OuBinario o1(in[0],in[1],out1);
	OuBinario o2(in[2],in[3],out2);
	OuBinario o3(in[4],in[5],out3);
	OuBinario o4(in[6],in[7],out4);
	OuBinario o5(out1,out2,out5);
	OuBinario o6(out3,out4,out6);
	OuBinario o7(out5,out6,out);
	
	
endmodule 
	
