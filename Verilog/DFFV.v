module DFFV(in,clock,out);
	input in,clock;
	output out;
	
	reg out;
	
	always @ (posedge clock)
	begin
	out = in;
	end

endmodule 