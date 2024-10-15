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
    