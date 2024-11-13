`ifndef MY_MODULE_SV
`define MY_MODULE_SV

module AND3(input a,b,c, output out); // AND gate with three inputs
    assign out = a & b & c;
endmodule

module NAND(input a, b, output out); // NAND gate
    assign out = !(a & b);
endmodule

module INVERT(input a, output out); // inverter gate
    assign out = !a;
endmodule

module AND(input a,b, output out); // AND gate
    assign out = a & b;
endmodule

module NAND4(input a, b, c, d, output out);
    assign out = !(a & b & c & d);
endmodule

module NAND8(input a,b,c,d,e,f,g,h, output out); // NAND gate with 8 inputs. The project description prohibits using 8 input gates, therefore we use multiple gates to design an 8 input gate
    wire nand0_output, nand1_output;
    NAND4 nand0(a,b,c,d, nand0_output);
    NAND4 nand1(e,f,g,h, nand1_output);
    OR or0(nand0_output, nand1_output, out);
endmodule

module NOR(input a, b, output out); // NOR gate
    assign out = !(a | b);
endmodule

module NOR4(input a, b, c, d, output out); // NOR gate with 4 inputs
    assign out = !(a | b | c | d);
endmodule

module OR(input a, b, output out); // OR gate
    assign out = a | b;
endmodule

`endif