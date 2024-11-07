`include "../src/latch.sv"

module fsm_tb;
    reg reset;
    reg clk;

    reg op;
    reg select;

    wire valid;
    wire rw;

    wire gamma;
    wire phi;
    wire D_1_output;
    wire D_2_output;

    wire op_not;
    wire select_not;

    wire alpha;
    wire beta;
    wire zeta;
    wire epsilon;

    wire D_1_input;
    wire D_2_input;

    INVERT inv0(op, op_not);
    INVERT inv1(select, select_not);

    OR or0(D_1_output, D_2_output, alpha);
    AND and0(op_not, alpha, beta);

    AND and1(alpha, select_not, zeta);
    OR or1(beta, zeta, gamma);
    NOR nor2(gamma, reset, D_1_input);

    AND and2(rw, valid, epsilon);
    OR or3(select_not, epsilon, phi);
    NOR nor4(phi, reset, D_2_input);

    d_latch D_1(D_1_input, clk, D_1_output, rw);
    d_latch D_2(D_2_input, clk, D_2_output, valid);

    always
    begin
        #5 clk = 1;
        #5 clk = 0;
    end
    

    initial begin
    $monitor("Time %0t | D_1_input = %b | D_2_input = %b | op = %b | select = %b | rw = %b | valid = %b | alpha = %b | beta = %b | gamma = %b | zeta = %b | epsilon = %b | phi = %b", $time, D_1_input, D_2_input, op, select, rw, valid, alpha, beta, gamma, zeta, epsilon, phi);

    #3
    op = 0;
    select = 1;
    reset = 1;
    #20
    reset = 0;
    #20
    op = 1;
    #20
    select = 0;
    #20

    $finish;
    end

endmodule