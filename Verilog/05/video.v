module video (clock, reset, red, green ,blue, r, g, b, hsync, vsync, row, column);
	input clock, reset, red, green, blue;
	output r, g, b, hsync, vsync;
	output [8..0] row;
	output [9..0] column;
	
	reg videoon, videov, videoh;
	reg [9..0] hcount, vcount;


always @ (clock, reset)
	begin: hcounter	
		if (reset=='1')
				then hcount <= (others => '0');
				else if (clock'event && clock=='1')
					then if (hcount==799)
						then hcount <= (others => '0');
						else hcount <= hcount + 1;
					end if;	
				end if;
			end if;
		end;
			
		always @ (hcount)
		begin	
			videoh <= '1';
			column <= hcount;
			if (hcount>639)
				then videoh <= '0';
					 column <= (others => '0');
			end if;
		end;

	
always @ (clock, reset)
	begin: vcounter
	if (reset=='1')
		then vcount <= (others => '0');
		else if (clock'event && clock=='1')
			then if (hcount==699)
				then if (vcount==524)
						then vcount <= (others => '0');
						else vcount <= vcount + 1;
					 end if;
				 end if;
			 end if;
	end if;
	end;

always @ (vcount)
	begin
		videov <= '1';
		row <= [8..0]vcount;
		if (vcount>479)
			then videov <= '0';
				 row <= (others => '0');
	end if;
	end;

always @ (clock, reset)
	begin:sync 
	if (reset=='1')
		then hsync <= '0';
			 vsync <= '0';
		else if (clock'event && clock=='1')
				then if (hcount<=755 && hcount>=659)
						then hsync <= '0';
						else hsync <= '1';
					 end if;
					 if (vcount<=494 && vcount>=493)
						then vsync <= '0';
						else vsync <= '1';
					 end if;
			end if;
	end if;
	end;

videoon <= videoh and videov;

always @ (clock, reset)
	begin:colors
		if (reset=='1')
			then r <= '0';
				 g <= '0';
				 b <= '0';
			elsif (clock'event && clock=='1')
				then r <= red and videoon;
					 g <= green and videoon;
					 b <= blue and videoon;
				end if;
	end;

endmodule 


	