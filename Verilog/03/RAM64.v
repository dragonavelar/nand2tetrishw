module RAM64(in,load,address,clock,out);
		input[15:0] in;
		input load,clock;
		input [5:0] address;
		output [15:0] out;
		
		wire loadA,loadB,loadC,loadD,loadE,loadF,loadG,loadH;
		wire [15:0] outA,outB,outC,outD,outE,outF,outG,outH;

	DMux8Way(load, address[5:3], loadA,loadB,loadC,loadD,loadE,loadF,loadG,loadH);
	RAM8 r1(in,loadA,address[2:0],clock,outA);
	RAM8 r2(in,loadB,address[2:0],clock,outB);
	RAM8 r3(in,loadC,address[2:0],clock,outC);
	RAM8 r4(in,loadD,address[2:0],clock,outD);
	RAM8 r5(in,loadE,address[2:0],clock,outE);
	RAM8 r6(in,loadF,address[2:0],clock,outF);
	RAM8 r7(in,loadG,address[2:0],clock,outG);
	RAM8 r8(in,loadH,address[2:0],clock,outH);
	Mux8Way16(outA,outB,outC,outD,outE,outF,outG,outH,address[5:3],out);
	
endmodule 