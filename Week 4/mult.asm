// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

//i = number of loop iterations 
@i
M=0

//setting the product at R2
@R2
M=0

(LOOP)

//load i
@i
D=M

//see if R0 has been multiplied as many times as R1
@R1
D=D-M

//if so (-1), jump to the end
@END
D;JEQ


//else, continue with the multiplication: 
//adding R0 to itself R1 times
@R2
D=M

//D = D + R0
@R0
D=D+M

//R2 = D
@R2
M=D

//i++
@i
M=M+1

@LOOP
0;JMP

(END)
@END
0;JMP
