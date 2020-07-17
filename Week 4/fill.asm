// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Use a loop and pointers connected to the whole memory map


(START)
@SCREEN
D=A

//store the address for the first pixel
@addr
M=D

//is KBD > 0?
(LOOP)
@KBD
D=M

//if D is 0 (nothing happening in KBD), 
//it's also pre-set for painting white
@PAINT
D;JEQ

//else, KBD>0 and D should be set to -1 (black)
D=-1

(PAINT)

//sets the address to whatever D is coded to
@addr
A=M
M=D

//move to next pixel
@addr
M=M+1

//see if we've made it to the end of the screen
@KBD
D=A

@addr
D=D-M

//if so, go back to beginning
@START
D;JLE

//else go back to the loop
@LOOP
0;JMP



