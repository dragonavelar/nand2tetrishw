module Mux16(a,b,sel,out);
	input [15:0] a;
	input [15:0] b;
	input sel;
	output [15:0] out;
	
	Mux m0(a[0],b[0],sel,out[0]);    
	Mux m1(a[1],b[1],sel,out[1]);
	Mux m2(a[2],b[2],sel,out[2]);
	Mux m3(a[3],b[3],sel,out[3]);
	Mux m4(a[4],b[4],sel,out[4]);
	Mux m5(a[5],b[5],sel,out[5]);
	Mux m6(a[6],b[6],sel,out[6]);
	Mux m7(a[7],b[7],sel,out[7]);
	Mux m8(a[8],b[8],sel,out[8]);
	Mux m9(a[9],b[9],sel,out[9]);
	Mux m10(a[10],b[10],sel,out[10]);
	Mux m11(a[11],b[11],sel,out[11]);
	Mux m12(a[12],b[12],sel,out[12]);
	Mux m13(a[13],b[13],sel,out[13]);
	Mux m14(a[14],b[14],sel,out[14]);
	Mux m15(a[15],b[15],sel,out[15]);
	

	

endmodule 
