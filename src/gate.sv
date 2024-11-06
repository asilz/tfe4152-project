`ifndef MY_MODULE_SV
`define MY_MODULE_SV

module AND3(input a,b,c, output out);
    assign out = a & b & c;
endmodule

module NAND(input a, b, output out);
    assign out = !(a & b);
endmodule

module INVERT(input a, output out);
    assign out = !a;
endmodule

module AND(input a,b, output out);
    assign out = a & b;
endmodule

module NAND8(input a,b,c,d,e,f,g,h, output out);
    assign out = !(a & b & c & d & e & f & g & h);
endmodule

module NOR(input a, b, output out);
    assign out = !(a | b);
endmodule

module NOR4(input a, b, c, d, output out);
    assign out = !(a | b | c | d);
endmodule

module OR(input a, b, output out);
    assign out = a | b;
endmodule

`endif