module t_Mux8Way16;
	reg [15:0] a,b,c,d,e,f,g,h;
	reg [2:0] sel;
	wire [15:0] out;
	integer i = 0;

	Mux8Way16 uut(a,b,c,d,e,f,g,h,sel,out);

	reg [15:0] data[8:0];
	reg [2:0] seletor;

initial begin
	$dumpfile("t_Mux8Way16.vcd");
	$dumpvars;
end

initial begin
	data[0] = 16'h AAAA;
	data[1] = 16'h 0000;
	data[2] = 16'h 1111;
	data[3] = 16'h 4444;
	data[4] = 16'h CCCC;
	data[5] = 16'h FFFF;
	data[6] = 16'h DDDD;
	data[7] = 16'h EEEE;
	seletor = 3'b 000;
end

initial begin
	a = data[0];
	b = data[1];
	c = data[2];
	d = data[3];
	e = data[4];
	f = data[5];
	g = data[6];
	h = data[7];

	for(i=0; i<8; i=i+1)
	begin
		sel = seletor;
		#1
		if (out != data[i])
		begin
			$display ("Valor de saida errado");
			$display("%b,%h",sel,out);
			$finish;
		end
		$display ("Funcionou com sucesso");
		seletor = seletor + 1;
		$display("%b,%h",sel,out);
	end
end

endmodule

