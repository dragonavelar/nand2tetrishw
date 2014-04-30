// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/02/ALU.hdl

/**
 * The ALU. Computes one of the following functions:
 * x+y, x-y, y-x, 0, 1, -1, x, y, -x, -y, !x, !y,
 * x+1, y+1, x-1, y-1, x&y, x|y on two 16-bit inputs, 
 * according to 6 input bits denoted zx,nx,zy,ny,f,no.
 * The bit-combinations that yield each function are 
 * documented in the book. In addition, the ALU 
 * computes two 1-bit outputs: if the ALU output
 * is 0, zr is set to 1; otherwise zr is set to 0;
 * If out<0, ng is set to 1; otherwise ng is set to 0.
 */

// Implementation: the ALU manipulates the x and y
// inputs and then operates on the resulting values, 
// as follows:
// if (zx==1) set x = 0        // 16-bit constant
// if (nx==1) set x = ~x       // bitwise "not"
// if (zy==1) set y = 0        // 16-bit constant
// if (ny==1) set y = ~y       // bitwise "not"
// if (f==1)  set out = x + y  // integer 2's complement addition
// if (f==0)  set out = x & y  // bitwise "and"
// if (no==1) set out = ~out   // bitwise "not"
// if (out==0) set zr = 1
// if (out<0) set ng = 1

module ALU(x,y,zx,nx,zy,ny,f,no,out,zr,ng);
	
	
	input [15:0] x,y;
	input zx,nx,zy,ny,f,no;
	output [15:0] out;
	output zr,ng;
	
	wire [15:0] notX1,notY1,outX1,outY1,outX2,outY2,outSum,outAnd,outAdd,notSum,a;
	wire [7:0] b,c;
	wire or1,or2,outNz;

	
	Mux16 m1(x,16'h 0000,zx,outX1);
	Not16 n1(outX1,notX1);
	Mux16 m2(outX1,notX1,nx,outX2);
	
	Mux16 m3(y,16'h 0000,zy,outY1);
	Not16 n2(outY1,notY1);
	Mux16 m4(outY1,notY1,ny,outY2);
	
	And16 a1(outX2,outY2,outAnd);
	Add16 a2(outX2,outY2, outAdd);
	Mux16 m5(outAnd,outAdd,f,outSum);
	
	Not16 n3(outSum,notSum);
	Mux16 m6(outSum,notSum,no,out);
	
	assign ng = out[15:14];
	
	Or8Way o1(out[15:8],or1); //verifica se os ultimos 8 bits sao iguais a 0
	Or8Way o2(out[7:0],or2); //verifica se os primeiros 8 bits sao iguais a 0
	OuBinario ou1(or1,or2,outNz);
	NotBinario not1(outNz,zr);
	
	
	
endmodule

  
