`include "../src/latch.sv"

`timescale 1ns/1ns

module mem_cell_tb;
    reg rw; // read-write signal
    reg sel; // sel signal, ordinarily based on decoder
    reg inp; // input data signal
    
    wire out; // output data signal

    mem_cell cell0(rw, sel, inp, out);
    
    initial begin
    $monitor("rw=%b, sel=%b, input=%b | output=%b", rw, sel, inp, out);

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