
    @2    // 存入A寄存器 oooo000o00000010   A = 2；



    // # 111 0 101010 001 000
    M = 0   // Memory[2]  = 0  这个好算 用c指令    -> RAM[2] = 0


    // #oo00000000000000 
    @0    //   A寄存器位0

    // #111 1 110000 010 000    M D
    D = M   //  c 指令   D = M[0]  

    //  # ooooooooo0o100o1    -> 17   a= 17
    @END  


    // 111 0 001100 000 100
    D;JLT    //     D存储器值小于0 跳出

(LOOP)
    @1  // oooo000o00000001

    M = M - 1  // M[1] - 1   111 1 110010 001 000

    D = M    // 111 1 110000 010 000   M存储到D

    @END   //  # ooooooooo0o100o1    如果要跳转 就跳转到M[17]
    D;JLT   // 小于0 跳转  111 0 001100 000 100


    //  RAM[2] = RAM [0] + RAM[2]
    @0     // 0000000000000000
    D = M   // 111 1 110000 010 000

    @2
    M = M + D   // 111 1 000010 001 00o

    @LOOP   // 0o00000000000110
    0;JMP  // 111 0 101010 000 111
(END)
    @END
    0;JMP


