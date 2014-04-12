module top(
  input CLOCK_50,
  input [3:0] KEY,
  input [9:0] SW,
  output [3:0] VGA_R,
  output [3:0] VGA_G,
  output [3:0] VGA_B,
  output VGA_HS,
  output VGA_VS
);
    
reg [13:0] addr_a;
reg [7:0] data_a;
reg clk_25mhz;
reg we_a, we_b;

wire virtual_screen;
wire [13:0] addr_b;
wire [9:0] row;
wire [9:0] column;
wire [7:0] q_b;
wire reset, vga_in, vga_out;

assign reset = ~KEY[0];

always @ (posedge CLOCK_50 or posedge reset)
  if (reset==1)
  begin
    clk_25mhz <= 0;
    addr_a <= 0;
    we_a <= 1;
    we_b <= 0;
  end
  else
  begin
    clk_25mhz <= ~clk_25mhz;
    addr_a <= addr_a + 1;
    data_a <= addr_a[7:0];
  end
    
vga video (.clk(clk_25mhz), 
           .reset(reset),
           .vga_in(vga_in),
           .vga_out(vga_out),
           .pixel_row(row),
           .pixel_column(column),
           .VGA_HS(VGA_HS),
           .VGA_VS(VGA_VS));
               
assign virtual_screen = (column < 512) && (row < 255);
               
ram memory(data_a, data_b, addr_a, addr_b, we_a, we_b, CLOCK_50, q_a, q_b);

demux demux(q_b, column[2:0], vga_in);

addr_decode ad(.row(row), 
               .column(column), 
               .address(addr_b));
        
assign VGA_R[3:0] = virtual_screen ? {4{vga_out}} : 4'hE;
assign VGA_G[3:0] = virtual_screen ? {4{vga_out}} : 4'h0;
assign VGA_B[3:0] = virtual_screen ? {4{vga_out}} : 4'hF;

endmodule 
