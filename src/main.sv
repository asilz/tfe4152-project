`include "../src/decoder.sv"
`include "../src/latch.sv"

module main_tb;
    wire[7:0]sel;
    reg[2:0]a;
    reg[7:0]inp;

    wire rw;
    wire valid;
    reg select;
    reg op;
    reg reset;

    reg clk;

    wire[7:0]outp0;
    wire[7:0]outp1;
    wire[7:0]outp2;
    wire[7:0]outp3;
    wire[7:0]outp4;
    wire[7:0]outp5;
    wire[7:0]outp6;
    wire[7:0]outp7;
    wire[7:0]out_;

    FSM f(clk, reset, op, select,valid, rw);

    Decoder a1(a, valid, sel);
    mem_word word0(rw, sel[0], inp, outp0);
    mem_word word1(rw, sel[1], inp, outp1);
    mem_word word2(rw, sel[2], inp, outp2);
    mem_word word3(rw, sel[3], inp, outp3);
    mem_word word4(rw, sel[4], inp, outp4);
    mem_word word5(rw, sel[5], inp, outp5);
    mem_word word6(rw, sel[6], inp, outp6);
    mem_word word7(rw, sel[7], inp, outp7);

    NAND8 nand0(outp0[0],outp1[0], outp2[0], outp3[0], outp4[0], outp5[0], outp6[0], outp7[0], out_[0]);
    NAND8 nand1(outp0[1],outp1[1], outp2[1], outp3[1], outp4[1], outp5[1], outp6[1], outp7[1], out_[1]);
    NAND8 nand2(outp0[2],outp1[2], outp2[2], outp3[2], outp4[2], outp5[2], outp6[2], outp7[2], out_[2]);
    NAND8 nand3(outp0[3],outp1[3], outp2[3], outp3[3], outp4[3], outp5[3], outp6[3], outp7[3], out_[3]);
    NAND8 nand4(outp0[4],outp1[4], outp2[4], outp3[4], outp4[4], outp5[4], outp6[4], outp7[4], out_[4]);
    NAND8 nand5(outp0[5],outp1[5], outp2[5], outp3[5], outp4[5], outp5[5], outp6[5], outp7[5], out_[5]);
    NAND8 nand6(outp0[6],outp1[6], outp2[6], outp3[6], outp4[6], outp5[6], outp6[6], outp7[6], out_[6]);
    NAND8 nand7(outp0[7],outp1[7], outp2[7], outp3[7], outp4[7], outp5[7], outp6[7], outp7[7], out_[7]);

    always
    begin
        #5 clk = 1;
        #5 clk = 0;
    end
    

    initial begin
    $monitor("Time: %0t | input=%b,%b,%b,%b,%b,%b,%b,%b | a=%b,%b,%b | op=%b | select=%b | output=%b,%b,%b,%b,%b,%b,%b,%b | valid=%b | rw=%b | clk=%b | reset=%b | sel=%b,%b,%b,%b,%b,%b,%b,%b", 
              $time,  
              inp[0],inp[1],inp[2],inp[3],inp[4],inp[5],inp[6],inp[7],a[0], a[1], a[2], op, select,
              out_[0],out_[1], out_[2], out_[3], out_[4], out_[5], out_[6], out_[7], valid, rw, clk, reset, sel[0], sel[1], sel[2], sel[3], sel[4], sel[5], sel[6], sel[7]);
    
    #3 

    reset = 1;
    a = 0;
    inp = 0;
    op = 0;
    select = 0;
    #20
    reset = 0;
    #10;

    inp = 65;
    op = 1;
    select = 1;
    #10
    a = 1;
    #10
    inp = 83;
    op = 1;
    select = 1;
    #10
    a = 2;
    #10
    inp = 73;
    op = 1;
    select = 1;
    #10
    a = 3;
    #10

    inp = 73;
    op = 1;
    select = 1;

    #10
    a = 4;
    #10

    inp = 76;
    op = 1;
    select = 1;
    #10
    op = 0;
    select = 1;
    #10
    a = 0;
    inp = 0;
    #10
    a = 1;
    #10
    a = 2;
    #10
    a = 3;

    $finish;
    end

    
endmodule