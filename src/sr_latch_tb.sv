`include "../src/latch.sv"

`timescale 1ns/1ns

module sr_latch_tb;
    reg R, S; // input data signals
    wire Q, Q_not; // output data signals

    sr_latch sr(R, S, Q, Q_not); // create sr latch instance
    
    initial begin
    $monitor("R=%b, S=%b | Q=%b, Q_not=%b", R, S, Q, Q_not);

    R = 1;
    S = 0;
    #10
    S = 1;
    #10
    R = 0;

    $finish;
    end

endmodule