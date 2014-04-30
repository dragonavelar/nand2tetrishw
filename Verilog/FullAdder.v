module FullAdder(a,b,cin,sum,cout);
	input a,b,cin;
	output sum,cout;
	
	HalfAdder h0(a,b,outSum,outC);
	HalfAdder h1(cin,outSum,sum,outC2);
	OuBinario o(outC,outC2,cout);
	
endmodule
	
