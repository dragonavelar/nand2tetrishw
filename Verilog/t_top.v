`timescale 10 ns / 10 ps

module t_top; 

  reg CLOCK_50;
  reg [3:0] KEY;
  
	top DUT (.CLOCK_50(CLOCK_50), .KEY(KEY));

  initial
  begin
    CLOCK_50 <= 1'b0;
    KEY[0] <= 1'b0;
    #2
    KEY[0] <= 1'b1;
  end

	always
	begin
		#1
		CLOCK_50 <= ~CLOCK_50;
	end
	
endmodule 
