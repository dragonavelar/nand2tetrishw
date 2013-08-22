//-----------------------------------------------------
// Design Name : ram_dp_sr_sw
// File Name   : ram_dp_sr_sw.v
// Function    : Synchronous read write RAM
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module ram (
clock       , // Clock Input
address , // 
data_in    , 
data_out    , 
we      , // Write Enable/Read Enable
address_video , // address_1 Input
data_video     // data_1 bi-directional
); 

parameter data_WIDTH = 16 ;
parameter ADDR_WIDTH = 14 ;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;

//--------------Input Ports----------------------- 
input [ADDR_WIDTH-1:0] address ;
input clock ;
input we ;
input [ADDR_WIDTH-1:0] address_video ;
input [data_WIDTH-1:0] data_in ; 

//--------------out Ports----------------------- 
output [data_WIDTH-1:0] data_out ;
output [data_WIDTH-1:0] data_video ;

//--------------Internal variables---------------- 
reg [data_WIDTH-1:0] data_int ; 
reg [data_WIDTH-1:0] data_int_video ;
reg [data_WIDTH-1:0] mem [0:RAM_DEPTH-1];

always @ (posedge clock)
begin : MEM_WRITE
  if ( we ) begin
     mem[address] <= data_in;
  end
end

always @ (posedge clock)
begin : MEM_READ
    data_int <= mem[address]; 
end 

always @ (posedge clock)
begin : MEM_READ_VIDEO
    data_int_video <= mem[address_video]; 
end 

assign data_out = data_int;
assign data_out_video = data_int_video;

endmodule 