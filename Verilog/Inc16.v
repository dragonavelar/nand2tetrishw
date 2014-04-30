module Inc16(in,out);
	input [15:0] in;
	output [15:0] out;

	
	Add16 a(in,16'b0000000000000001,out);
endmodule 

