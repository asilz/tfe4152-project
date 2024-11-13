`include "../src/latch.sv"

`timescale 1ns/1ns

module fsm_tb;
    reg clk; // clock signal
    reg op, select; // input signals to FSM
    reg reset; // reset signal to reset the values contained in the FSM
    
    wire valid, rw; // output signals

    FSM f(clk, op, select, reset, valid, rw);

    always //clock signal 200MHz
    begin
        #5 clk = 1;
        #5 clk = 0;
    end
    
    initial begin
    $monitor("clk=%b, op=%b, select=%b, reset=%b | valid=%b, rw=%b", clk, op, select, reset, valid, rw);

    op = 0;
    select = 0;
    reset = 1;
    #20
    reset = 0;
    select = 1;
    #20
    op = 1;
    #20
    select = 0;
    #10

    $finish;
    end

endmodule