`include "../src/latch.sv"

module d_latch_tb;
    reg E;
    reg D;

    wire Q;
    wire Q_not;

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