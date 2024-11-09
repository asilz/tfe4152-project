`include "../src/latch.sv"

module flipflop_tb;
    reg clk;
    reg D;

    wire Q;
    wire Q_not;

    always
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