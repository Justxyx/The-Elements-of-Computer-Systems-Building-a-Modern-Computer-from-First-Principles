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

// Put your code here.

// 24576为键盘的地址 16384-24575 刚好8K 为屏幕的地址
    @24575  // 0101111111111111
    D = A  // 111 0 110000 010 000     

    // R0存储屏幕最大地址
    @0   // 00000000000000000
    M = D   // 111 0 001100 001 000  把D加载进来存储到M[0]中


    // R1存储屏幕当前地址
    @SCREEN  //010 0 000000 000 000   => 16384
    D = A  // 111 0 110000 010 00o

    @1   //0000000000000001 
    M = D  // 1110001100001000

(LOOP)  
    @KBD  //0110000000000000    => 24576
    D = M  // 111 1 110000 010 00o

    @FILL  // 0000000000001110
    D;JGT  // 111 0 001100 000 001   D大于0 跳出

 
    @CLEAR
    0;JMP // 1110101010000111   无条件跳出
(FILL)
    // 判断屏幕是否为满
    @0
    D = M
    @1
    D = D - M
    @LOOP
    D;JLT  // D 小于0跳出。

    @1
    // 缓存当前地址
    D = M     // 111 1 110000 010 000
    // 将当前地址推入A
    A = M    //  111 1 110000 100 000

    // 将地址对应的屏幕位置变黑
    // 如果使用 1，翻译成二进制是 0000000000000001
    // -1 翻译成二进制是 1111111111111111
    // 如果表示在屏幕上，1 有 15 位是空白的，1位是黑的
    // -1 则屏幕上的 16 位全是黑色
    M = -1    //  111 0 111010 001 000


    // 当前地址+1
    @1
    M = D + 1

    @LOOP
    0;JMP
(CLEAR)
    // 判断屏幕是否为空
    @SCREEN
    D = A
    @1
    D = D - M
    @LOOP
    D;JGT

    @1
    // 缓存当前地址
    D = M
    // 将当前地址推入A
    A = M
    // 将地址对应的屏幕位置变白
    M = 0

    // 当前地址-1
    @1
    M = D - 1

    @LOOP
    0;JMP