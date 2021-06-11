// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.



// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// 3*2 换算成 2个3相加

/*
R2 = 0

判断：
	R0 是否小于0 小于零跳转end

循环：
	R1 = R1 - 1
	D = R1
	
	判断D是否小于0
		小于跳出

	D = R0
	R2 = R2+R0
*/


// 初始化 M2 作为和， 判断M0是否小于0， 如果小于就跳出，

    // 初始化
    @2    // A 寄存器赋值为地址  值为2  RAM[2]  #存入A寄存器 oooo000o00000010

    // # 111 0101010 001 000
    //   c指令  comp为0 存储到M中 不跳转
    M = 0   // Memory[2]  = 0  这个好算 用c指令  
    // RAM[2] = 0

    // 判断是否小于0
    @0    // #oo00000000000000   A寄存器位0
    // #111 1 110000 010 000  
    // c指令 M       存入D寄存器 不跳转
    D = M   // D = M[0]  RAM[0]   

    @END  //  # ooooooooo0o100o1
    D;JLT   // 小于0 跳转，  // 111 0 001100 000 100   RAM[0] 小于0跳出

(LOOP)
    @1  // oooo000o00000001
    M = M - 1  // M[1] - 1   111 1 110010 001 000
    D = M    // 111 1 110000 010 000   M存储到D
    @END   //  # ooooooooo0o100o1
    D;JLT   // 小于0 跳转  111 0 001100 000 100


    //  RAM[2] = RAM [0] + RAM[2]
    @0     // 0000000000000000
    D = M   // 111 1 110000 010 000

    @2
    M = M + D   // 111 1 000010 001 00o

    @LOOP   // 0o00000000000110
    0;JMP  // 1110101010000111
(END)
    @END
    0;JMP


