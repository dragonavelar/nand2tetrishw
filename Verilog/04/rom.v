//-----------------------------------------------------
// Design Name : ram_dp_sr_sw
// File Name   : ram_dp_sr_sw.v
// Function    : Synchronous read write RAM
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module rom (
clock       , // Clock Input
address   , // address Input
data       //  data Output
); 

parameter data_WIDTH = 16 ;
parameter ADDR_WIDTH = 13 ;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;

//--------------Input Ports----------------------- 
input [ADDR_WIDTH-1:0] address ;
input clock ;

//--------------Inout Ports----------------------- 
inout [data_WIDTH-1:0] data ; 

//--------------Internal variables---------------- 
reg [data_WIDTH-1:0] data_out ; 
reg [data_WIDTH-1:0] mem [0:RAM_DEPTH-1];

// Memory Read Block 
// Read Operation : When we_0 = 0, oe_0 = 1, cs_0 = 1
always @ (posedge clock)
begin : MEM_READ
    data_out <= mem[address]; 
end 

endmodule // End of Module ram_dp_sr_sw
