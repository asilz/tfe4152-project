`include "../src/gate.sv"

module Decoder(input[2:0] address, input valid, output[7:0] word_select);
    wire valid_not; // inverted valid signal
    wire address_not[2:0]; // inverted address signals
    INVERT i0(valid, valid_not);
    INVERT i1(address[0], address_not[0]);
    INVERT i2(address[1], address_not[1]);
    INVERT i3(address[2], address_not[2]);

    // 8 NOR ports, 1 for each possible address
    NOR4 x0(valid_not,address[0],address[1],address[2], word_select[0]);
    NOR4 x1(valid_not,address_not[0],address[1],address[2], word_select[1]);
    NOR4 x2(valid_not,address[0],address_not[1],address[2], word_select[2]);
    NOR4 x3(valid_not,address_not[0],address_not[1],address[2], word_select[3]);
    NOR4 x4(valid_not,address[0],address[1],address_not[2], word_select[4]);
    NOR4 x5(valid_not,address_not[0],address[1],address_not[2], word_select[5]);
    NOR4 x6(valid_not,address[0],address_not[1],address_not[2], word_select[6]);
    NOR4 x7(valid_not,address_not[0],address_not[1],address_not[2], word_select[7]);
endmodule


