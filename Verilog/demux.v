module demux(
  input [7:0] din,
  input [2:0] sel,
  output reg dout);

always @ (din or sel)
  case (sel)
    0 : dout = din[7];
    1 : dout = din[6];
    2 : dout = din[5];
    3 : dout = din[4];
    4 : dout = din[3];
    5 : dout = din[2];
    6 : dout = din[1];
    7 : dout = din[0];
  endcase

endmodule