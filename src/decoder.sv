`include "../src/gate.sv"

module Decoder(input[2:0] address, output[7:0] word_select);
AND3 x0(address[0],address[1],address[2], word_select[0]);
AND3 x1(!address[0],address[1],address[2], word_select[1]);
AND3 x2(address[0],!address[1],address[2], word_select[2]);
AND3 x3(address[0],address[1],!address[2], word_select[3]);
AND3 x4(!address[0],!address[1],address[2], word_select[4]);
AND3 x5(!address[0],address[1],!address[2], word_select[5]);
AND3 x6(address[0],!address[1],!address[2], word_select[6]);
AND3 x7(!address[0],!address[1],!address[2], word_select[7]);
endmodule


