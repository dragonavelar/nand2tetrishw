module HalfAdder(a,b,sum,cout);
	input a,b;
	output sum,cout;
	
	XorBinario x(a,b,sum);
	AndBinario ab(a,b,cout);
endmodule
	
