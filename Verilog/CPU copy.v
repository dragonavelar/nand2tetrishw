module CPU (inM, instruction, clock, reset, writeM, outM, addressM, pc);

    input [15:0]inM;         // M value input  (M = contents of RAM[A])
    input [15:0]instruction; // Instruction for execution
    input clock;             // 
    input reset;             // Signals whether to re-start the current
                             // program (reset=1) or continue executing
                             // the current program (reset=0).

    output writeM;           // Write into M? 
    output [15:0]outM;         // M value output
    output [14:0]addressM;     // Address in data memory (of M)
    output [14:0]pc;           // address of next instruction

    wire [14:0]aReg;
	 wire aInst, cInst, srcM, aluZx, aluNx, aluZy, aluNy, aluF, aluNo, destA, destD, writeM, jmpLt, jmpEq, jmpGt, ones;
	 
    // Instruction decode
    NotBinario (instruction[15], aInst);
    AndBinario (instruction[14], instruction[13], ones);
    AndBinario (ones,  instruction[15], cInst);
    AndBinario (cInst, instruction[12], srcM);
    AndBinario (cInst, instruction[11], aluZx);
    AndBinario (cInst, instruction[10], aluNx);
    AndBinario (cInst, instruction[9],  aluZy);
    AndBinario (cInst, instruction[8],  aluNy);
    AndBinario (cInst, instruction[7],  aluF);
    AndBinario (cInst, instruction[6],  aluNo);
    AndBinario (cInst, instruction[5],  destA);
    AndBinario (cInst, instruction[4],  destD);
    AndBinario (cInst, instruction[3],  writeM);   // destM
    AndBinario (cInst, instruction[2],  jmpLt);
    AndBinario (cInst, instruction[1],  jmpEq);
    AndBinario (cInst, instruction[0],  jmpGt);

    // A register and input mux
    Mux16 (aluOut, instruction, aInst, aIn);
    OuBinario (aInst, destA, loadA);
    Registrador (aIn, loadA, clock, aReg);
	 
	 
	 assign addressM = aReg;
    assign outM = aluOut;
	 
    // D register
    Registrador(aluOut, destD, clock, dReg);
    // ALU and input mux
    Mux16 (aReg, inM, srcM, aluY); 
	 //(x=dReg, y=aluY, out=aluOut, out=outM, zr=aluZr, ng=aluNg, zx=aluZx, nx=aluNx, zy=aluZy, ny=aluNy, f=aluF, no=aluNo);

    ALU ula(dReg, aluY, aluZx, aluNx, aluZy, aluNy, aluF, aluNo, aluOut, aluZr, aluNg);

    // PC with jump test
    OuBinario (aluZr, aluNg, zrng);
    NotBinario (zrng, aluPos);
    AndBinario (aluNg, jmpLt, jlt);
    AndBinario (aluZr, jmpEq, jeq);
    AndBinario (aluPos, jmpGt, jgt);
    OuBinario (jlt, jeq, jle);
    OuBinario (jle, jgt, jmp);

    PC (aReg, jmp, reset, 1'b1, clock, pc);

endmodule