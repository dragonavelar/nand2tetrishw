module Mux8Way16(a,b,c,d,e,f,g,h,sel,out);
	input[15:0] a;
	input[15:0] b;
	input[15:0] c;
	input[15:0] d;
	input[15:0] e;
	input[15:0] f;
	input[15:0] g;
	input[15:0] h;
	input[2:0] sel;
	output[15:0] out;
	
	wire[15:0] out1,out2;
	
	Mux4Way16 m1(a,b,c,d,sel[1:0],out1);
	Mux4Way16 m2(e,f,g,h,sel[1:0],out2);
	Mux16 m3(out1,out2,sel[2],out);
	
	
endmodule 
