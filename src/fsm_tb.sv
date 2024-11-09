`include "../src/latch.sv"

module fsm_tb;
    reg clk;
    reg op;
    reg select;
    reg reset;
    
    wire valid;
    wire rw;

    FSM f(clk, op, select, reset, valid, rw);

    always
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