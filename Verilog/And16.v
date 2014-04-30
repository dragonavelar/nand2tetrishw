module And16(a,b,out);
	input [15:0] a;
	input [15:0] b;
	output [15:0] out;

	AndBinario a00(a[0],b[0],out[0]);
	AndBinario a01(a[1],b[1],out[1]);
	AndBinario a02(a[2],b[2],out[2]);
	AndBinario a03(a[3],b[3],out[3]);
	AndBinario a04(a[4],b[4],out[4]);
	AndBinario a05(a[5],b[5],out[5]);
	AndBinario a06(a[6],b[6],out[6]);
	AndBinario a07(a[7],b[7],out[7]);
	AndBinario a08(a[8],b[8],out[8]);
	AndBinario a09(a[9],b[9],out[9]);
	AndBinario a10(a[10],b[10],out[10]);
	AndBinario a11(a[11],b[11],out[11]);
	AndBinario a12(a[12],b[12],out[12]);
	AndBinario a13(a[13],b[13],out[13]);
	AndBinario a14(a[14],b[14],out[14]);
	AndBinario a15(a[15],b[15],out[15]);


	
endmodule 
