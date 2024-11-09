`include "../src/latch.sv"

module sr_latch_tb;
    reg R;
    reg S;

    wire Q;
    wire Q_not;

    sr_latch sr(R, S, Q, Q_not);
    
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