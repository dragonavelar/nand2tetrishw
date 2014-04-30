module Computer(R, G, B, V, H, clock, reset); 

    input reset;
	 input clock;             

    output R, G, B, V, H;
	 
    wire [15:0] RAMout, ROMout, RAMin, data_video;
    wire [14:0] RAMaddress, address_video;
    wire [13:0] ROMaddress;
    wire loadRAM;

	 // cpu
    CPU (RAMout, ROMout, clock, reset, loadRAM, RAMin, RAMaddress, ROMaddress);

    // RAM
    ram (clock, RAMaddress, RAMin, RAMout, loadRAM, address_video, data_video);

    // ROM
    rom (clock, ROMaddress, ROMout);
	 
	 // video
	 video(R, G, B, V, H, clock, address_video, data_video);
	 
endmodule
