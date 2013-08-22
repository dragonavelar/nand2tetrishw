module RAM512(in,load,address,clock,out);

		input[15:0] in;
		input load,clock;
		input [13:0] address;
		output [15:0] out;
		
		wire loadA,loadB,loadC,loadD,loadE,loadF,loadG,loadH;
		wire [15:0] outA,outB,outC,outD,outE,outF,outG,outH;


	DMux8Way(load, address[8:6], loadA,loadB,loadC,loadD,loadE,loadF,loadG,loadH);
	RAM64(in,loadA,address[5:0],clock,outA);
	RAM64(in,loadB,address[5:0],clock,outB);
	RAM64(in,loadC,address[5:0],clock,outC);
	RAM64(in,loadD,address[5:0],clock,outD);
	RAM64(in,loadE,address[5:0],clock,outE);
	RAM64(in,loadF,address[5:0],clock,outF);
	RAM64(in,loadG,address[5:0],clock,outG);
	RAM64(in,loadH,address[5:0],clock,outH);
	Mux8Way16(outA,outB,outC,outD,outE,outF,outG,outH,address[8:6],out);

endmodule 