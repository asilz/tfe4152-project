`include "../src/latch.sv"

module mem_word_tb;
    reg rw;
    reg sel;
    reg[7:0]inp;
    
    wire[7:0] out;

    mem_word word0(rw, sel, inp, out);
    
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