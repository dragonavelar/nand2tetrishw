module Or16(a,b,out);
	input [15:0] a;
	input [15:0] b;
	output [15:0] out;
	
	wire[15:0] notA,notB,outAnd;
	
	Not16 n1(a,notA);
	Not16 n2(b,notB);
	And16 a1(notA,notB,outAnd);
	Not16 n3(outAnd,out);
	
	

	
endmodule 
