`include "../src/gate.sv"

module sr_latch(input R, S, output Q, Q_not);
sr_port sr0(R, Q_not, Q);
sr_port sr1(S, Q, Q_not);
endmodule

module sr_port(input a, b, output c);
NAND nand0(a, b, c);
endmodule

module d_latch(input D, E, output Q, Q_not);
wire nand1_out;
wire nand2_out;
wire d_not;
NAND n1(D, E, nand1_out);
INVERT i1(D, d_not);
NAND n2(d_not, E, nand2_out);
sr_latch sr(nand1_out, nand2_out, Q, Q_not);
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
    

    d_latch D_1(D_1_input, clk, D_1_output, rw);
    d_latch D_2(D_2_input, clk, D_2_output, valid);
    

endmodule

module Simple_FSM(input clk, reset, output valid, rw);
    wire valid_;
    wire rw_;
    wire a;
    wire b;

    OR or0(reset, valid, valid_);
    OR or1(reset, rw, rw_);

    d_latch latch0(valid_, clk, valid, a);
    d_latch latch1(rw_, clk, rw, b);
endmodule

module Bad_FSM(input clk, op, select, reset, output valid, rw);
    wire D_1_input_;
    wire D_2_input_;
    wire D_1_output;
    wire D_2_output;

    wire op_not;
    wire select_not;

    wire or0_output;
    wire and0_output;
    wire and1_output;

    INVERT inv0(op, op_not);
    INVERT inv1(select, select_not);

    OR or0(D_1_output, D_2_output, or0_output);
    AND and0(op_not, or0_output, and0_output);

    AND and1(or0_output, select_not, and1_output);
    OR or1(and0_output, and1_output, D_1_input_);
    NOR nor2(D_1_input_, reset, D_1_input);

    AND and2(rw, valid, and2_output);
    OR or3(select_not, and2_output, D_2_input_);
    NOR nor4(D_2_input_, reset, D_2_input);

    d_latch D_1(D_1_input, clk, D_1_output, rw);
    d_latch D_2(D_2_input, clk, D_2_output, valid);
endmodule
    