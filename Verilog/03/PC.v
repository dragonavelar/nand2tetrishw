module PC(in,load,reset,inc,clock,out);
	input [15:0] in;
	input load,reset,inc,clock;
	output [15:0] out;
	
	wire[15:0] outReg,outInc;
	wire [2:0] seletor = inc + load*2 + reset*4;	
	
	Inc16(outReg,outInc);
	Mux8Way16(outReg,outInc,in,in,16'h 0000,16'h 0000,16'h 0000,16'h 0000,seletor,outMux);	
	Registrador(outMux,1'b 1,clock, outReg);
	Or16(outReg,16'h 0000,out);

endmodule 