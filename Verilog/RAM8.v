module RAM8(in,load,address,clock,out);
	input[15:0] in;
	input [2:0] address;
	input load,clock;
	output[15:0] out;
	
	wire a,b,c,d,e,f,g,h;
	wire [15:0] out0,out1,out2,out3,out4,out5,out6,out7;
	
	DMux8Way dmux1(load,address,a,b,c,d,e,f,g,h);
	Registrador r1(in,a,clock,out0);
	Registrador r2(in,b,clock,out1);
	Registrador r3(in,c,clock,out2);
	Registrador r4(in,d,clock,out3);
	Registrador r5(in,e,clock,out4);
	Registrador r6(in,f,clock,out5);
	Registrador r7(in,g,clock,out6);
	Registrador r8(in,h,clock,out7);
	Mux8Way16 mux1(out0,out1,out2,out3,out4,out5,out6,out7,address,out);
	
endmodule 