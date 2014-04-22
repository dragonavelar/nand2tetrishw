module vga(
  input clk,
  input reset,
  input vga_in,
  output video_on,
  output reg vga_out,
  output reg VGA_HS,
  output reg VGA_VS,
  output reg [9:0] pixel_row,
  output reg [9:0] pixel_column
);

localparam h_end_count     = 800;
localparam h_sync_high     = 760;
localparam h_sync_low      = 664;
localparam h_pixels_across = 640;
localparam v_end_count     = 525;
localparam v_sync_high     = 493;
localparam v_sync_low      = 491;
localparam v_pixels_down   = 480;

reg [9:0] h_count;
reg [9:0] v_count;
reg horiz_sync;
reg vert_sync;
reg video_on_h;
reg video_on_v;
    
assign video_on = ( video_on_h & video_on_v);

always @ (posedge clk or posedge reset)
  if (reset==1)
  begin
    h_count <= 0;
    v_count <= 0;
  end
  else
  begin
    if ( h_count == 800 ) 
      h_count <= 10'b0000000000;
    else
      h_count <= ( h_count + 1 );
    if ((h_count <= 760) & (h_count >= 664)) 
      horiz_sync <= 1'b0;
    else
      horiz_sync <= 1'b1;
    if ((v_count >= 525) & (h_count >= 664)) 
      v_count <= 10'b0000000000;
    else
      if (h_count == 664) 
         v_count <= ( v_count + 1 );
    if ((v_count <= 493) & (v_count >= 491)) 
      vert_sync <= 1'b0;
    else
      vert_sync <= 1'b1;
    if (h_count < 640) 
    begin
      video_on_h <= 1'b1;
      pixel_column <= h_count;
    end
    else
      video_on_h <= 1'b0;
    if (v_count <= 480) 
    begin
      video_on_v <= 1'b1;
      pixel_row <= v_count;
    end
    else
      video_on_v <= 1'b0;
    VGA_HS <= horiz_sync;
    VGA_VS <= vert_sync;
    vga_out <= ( vga_in & video_on );
  end
endmodule 
