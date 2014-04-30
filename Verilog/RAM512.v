module RAM512(in,load,address,clock,out);

		input[15:0] in;
		input load,clock;
		input [13:0] address;
		output [15:0] out;
		
		wire loadA,loadB,loadC,loadD,loadE,loadF,loadG,loadH;
		wire [15:0] outA,outB,outC,outD,outE,outF,outG,outH;


	DMux8Way dmux1(load, address[8:6], loadA,loadB,loadC,loadD,loadE,loadF,loadG,loadH);
	RAM64 r1(in,loadA,address[5:0],clock,outA);
	RAM64 r2(in,loadB,address[5:0],clock,outB);
	RAM64 r3(in,loadC,address[5:0],clock,outC);
	RAM64 r4(in,loadD,address[5:0],clock,outD);
	RAM64 r5(in,loadE,address[5:0],clock,outE);
	RAM64 r6(in,loadF,address[5:0],clock,outF);
	RAM64 r7(in,loadG,address[5:0],clock,outG);
	RAM64 r8(in,loadH,address[5:0],clock,outH);
	Mux8Way16 mux1(outA,outB,outC,outD,outE,outF,outG,outH,address[8:6],out);

endmodule 