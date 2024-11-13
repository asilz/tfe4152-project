`include "../src/gate.sv"

module sr_latch(input R, S, output Q, Q_not);
    NAND nand0(R, Q_not, Q);
    NAND nand1(S, Q, Q_not);
endmodule

module d_latch(input D, E, output Q, Q_not);
    wire nand0_out;
    wire nand1_out;
    wire d_not;

    NAND nand0(D, E, nand0_out);
    INVERT i1(D, d_not);
    NAND nand1(d_not, E, nand1_out);
    sr_latch sr(nand0_out, nand1_out, Q, Q_not);
endmodule

module flipflop(input D, clk, output Q, Q_not);
    wire S;
    wire R;
    wire clk_not;
    wire sr0;
    wire sr1;

    d_latch latch0(D, clk, S, R);
    INVERT inv(clk, clk_not);
    NAND n0(S, clk_not, sr0);
    NAND n1(R, clk_not, sr1);

    sr_latch latch1(sr0, sr1, Q, Q_not);
endmodule

module mem_cell(input rw, sel, inp, output outp);
    wire E;
    wire Q_not;
    wire out;
    AND and1(rw, sel, E);
    d_latch latch(inp, E, out, Q_not);
    NAND nand1(sel, out, outp);
endmodule

module mem_word(input rw, sel, input[7:0] inp, output[7:0] outp);
    mem_cell cell0(rw, sel, inp[0], outp[0]);
    mem_cell cell1(rw, sel, inp[1], outp[1]);
    mem_cell cell2(rw, sel, inp[2], outp[2]);
    mem_cell cell3(rw, sel, inp[3], outp[3]);
    mem_cell cell4(rw, sel, inp[4], outp[4]);
    mem_cell cell5(rw, sel, inp[5], outp[5]);
    mem_cell cell6(rw, sel, inp[6], outp[6]);
    mem_cell cell7(rw, sel, inp[7], outp[7]);
endmodule

module FSM(input clk, op, select, reset, output valid, rw);
    wire D_1_input_;
    wire D_2_input_;
    wire D_1_output;
    wire D_2_output;
    wire D_1_input;
    wire D_2_input;

    wire nor0_output;
    wire nor1_output;
    wire nor2_output;

    wire nand0_output;


    NOR nor0(D_1_output, D_2_output, nor0_output);

    NOR nor1(op, nor0_output, nor1_output);
    NOR nor2(select, nor0_output, nor2_output);
    
    NAND nand0(valid, rw, nand0_output);

    NOR or0(nor1_output, nor2_output, D_1_input_);
    AND nand1(nand0_output, select, D_2_input_);

    NOR nor3(reset, D_1_input_, D_1_input);
    NOR nor4(reset, D_2_input_, D_2_input);
    

    flipflop D_1(D_1_input, clk, D_1_output, rw);
    flipflop D_2(D_2_input, clk, D_2_output, valid);

endmodule
    