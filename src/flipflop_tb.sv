`include "../src/latch.sv"

`timescale 1ns/1ns

module flipflop_tb;
    reg clk; // clock signal
    reg D; // input data signal

    wire Q, Q_not; // output data signals

    always // clock signal 200MHz
    begin
        #5 clk = 1;
        #5 clk = 0;
    end

    flipflop f(D, clk, Q, Q_not);
    
    initial begin
    $monitor("clk=%b, D=%b | Q=%b, Q_not=%b", clk, D, Q, Q_not);

    D = 1;
    #20
    D = 0;
    #20
    D = 1;
    #20

    $finish;
    end

endmodule