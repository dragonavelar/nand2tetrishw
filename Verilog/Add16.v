module Add16(A,B,out);
	input [15:0] A,B;
	output [15:0] out;
	
	wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14;
	
	HalfAdder a00(A[0],B[0],out[0],c0);
	FullAdder a01(A[1],B[1],c0,out[1],c1);
	FullAdder a02(A[2],B[2],c1,out[2],c2);
	FullAdder a03(A[3],B[3],c2,out[3],c3);
	FullAdder a04(A[4],B[4],c3,out[4],c4);
	FullAdder a05(A[5],B[5],c4,out[5],c5);
	FullAdder a06(A[6],B[6],c5,out[6],c6);
	FullAdder a07(A[7],B[7],c6,out[7],c7);
	FullAdder a08(A[8],B[8],c7,out[8],c8);
	FullAdder a09(A[9],B[9],c8,out[9],c9);
	FullAdder a10(A[10],B[10],c9,out[10],c10);
	FullAdder a11(A[11],B[11],c10,out[11],c11);
	FullAdder a12(A[12],B[12],c11,out[12],c12);
	FullAdder a13(A[13],B[13],c12,out[13],c13);
	FullAdder a14(A[14],B[14],c13,out[14],c14);
	FullAdder a15(A[15],B[15],c14,out[15]);
	
	
endmodule 
