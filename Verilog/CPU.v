// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/05/CPU.hdl

/**
 * The Central Processing unit (CPU).
 * Consists of an ALU and a set of registers, designed to fetch and 
 * execute instructions written in the Hack machine language.
 * In particular, functions as follows:
 * Executes the inputted instruction according to the Hack machine 
 * language specification. The D and A in the language specification
 * refer to CPU-resident registers, while M refers to the external
 * memory location addressed by A, i.e. to Memory[A]. The inM input 
 * holds the value of this location. If the current instruction needs 
 * to write a value to M, the value is placed in outM, the address 
 * of the target location is placed in the addressM output, and the 
 * writeM control bit is asserted. (When writeM=0, any value may 
 * appear in outM). The outM and writeM outputs are combinational: 
 * they are affected instantaneously by the execution of the current 
 * instruction. The addressM and pc outputs are clocked: although they 
 * are affected by the execution of the current instruction, they commit 
 * to their new values only in the next time unit. If reset=1 then the 
 * CPU jumps to address 0 (i.e. sets pc=0 in next time unit) rather 
 * than to the address resulting from executing the current instruction. 
 */

module CPU(inM,instruction,clock,reset,outM,writeM,addressM,pc);

		input[15:0] inM,instruction;
		input clock,reset;
		output [15:0] outM;
		output writeM;
		output [14:0] addressM,pc;
		
		wire aInst,ones,cInst,srcM,aluZx,aluNx,aluZy,aluNy,aluF,aluNo,destA,destD,writeM,jmpLt,jmpEq,jmpGt,loadA,aluZr,aluNg,zrng,aluPos,jlt,jeq,jgt,jle,jmp;
		wire [15:0] aluOut,aIn,aReg,dReg,aluY,pcOut;
		
		// Instruction decode
		NotBinario n1(instruction[15],aInst);
		AndBinario a1(instruction[14],instruction[13],ones);
		AndBinario a2(ones,instruction[15],cInst);
		AndBinario a3(cInst,instruction[12],srcM);
		AndBinario a4(cInst,instruction[11],aluZx);
		AndBinario a5(cInst,instruction[10],aluNx);
		AndBinario a6(cInst,instruction[9],aluZy);
		AndBinario a7(cInst,instruction[8],aluNy);
		AndBinario a8(cInst,instruction[7],aluF);
		AndBinario a9(cInst,instruction[6],aluNo);
		AndBinario a10(cInst,instruction[5],destA);
		AndBinario a11(cInst,instruction[4],destD);
		AndBinario a12(cInst,instruction[3],writeM);
		AndBinario a13(cInst,instruction[2],jmpLt);
		AndBinario a14(cInst,instruction[1],jmpEq);
		AndBinario a15(cInst,instruction[0],jmpGt);
		
		// A register and input mux
		Mux16 m1(aluOut,instruction,aInst,aIn);
		OuBinario o1(aInst,destA,loadA);
		Registrador r1(aIn,loadA,clock,aReg);
		assign addressM = aReg[14:0];
		
		// D register
		Registrador r2(aluOut,destD,clock,dReg);
		
		// ALU and input mux
		Mux16 m2(aReg,inM,srcM,aluY);
		ALU alu1(dReg,aluY,aluZx,aluNx,aluZy,aluNy,aluF,aluNo,aluOut,aluZr,aluNg);
		
		// PC with jump test
		OuBinario o2(aluZr,aluNg,zrng);
		NotBinario n2(zrng,aluPos);
		AndBinario a16(aluNg,jmpLt,jlt);
		AndBinario a17(aluZr,jmpEq,jeq);
		AndBinario a18(aluPos,jmpGt,jgt);				
		OuBinario o3(jlt,jeq,jle);
		OuBinario o4(jle,jgt,jmp);
		PC pc1(aReg,jmp,reset,true,clock,pcOut);
		assign pc = pcOut[14:0];
	
endmodule 