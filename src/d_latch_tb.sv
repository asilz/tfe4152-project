`include "../src/latch.sv"

`timescale 1ns/1ns

module d_latch_tb;
    reg E; // enable signal
    reg D; // input data signal

    wire Q, Q_not; // output data signals

    d_latch latch(D, E, Q, Q_not);
    
    initial begin
    $monitor("D=%b, E=%b | Q=%b, Q_not=%b", D, E, Q, Q_not);

    E = 1;
    D = 1;
    #10
    E = 0;
    #10
    D = 0;
    #10
    E = 1;

    $finish;
    end
endmodule