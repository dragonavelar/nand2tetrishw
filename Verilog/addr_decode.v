module addr_decode(
  input [9:0] row,
  input [9:0] column,
  output [13:0] address
);

//por enquanto coloca o quadro virtual no canto superior esquerdo
//depois precisa calcular a posicao e colocar no meio da tela
assign address = (row << 6) + (column >> 3);

endmodule