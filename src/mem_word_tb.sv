`include "../src/latch.sv"

`timescale 1ns/1ns

module mem_word_tb;
    reg rw; // read-write input signal
    reg sel; // sel signal, this is received from the decoder
    reg[7:0]inp; // input signals for each bit cell
    
    wire[7:0] out; // output signals for each bit cell

    mem_word word0(rw, sel, inp, out); // create a mem_word instance
    
    initial begin
    $monitor("rw=%b, sel=%b, input=%b,%b,%b,%b,%b,%b,%b,%b | output=%b,%b,%b,%b,%b,%b,%b,%b", rw, sel, inp[0], inp[1], inp[2], inp[3], inp[4], inp[5], inp[6], inp[7], out[0], out[1], out[2], out[3], out[4], out[5], out[6], out[7]);

    rw = 1;
    sel = 1;
    inp = 1;
    #10
    rw = 0;
    inp = 0;
    #10
    sel = 0;
    rw = 1;
    #10
    sel = 1;

    $finish;
    end

endmodule