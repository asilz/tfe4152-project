module Decoder(input[2:0] address, output[7:0] word_select);
AND x0(address[0],address[1],address[2], word_select[0]);
AND x1(!address[0],address[1],address[2], word_select[1]);
AND x2(address[0],!address[1],address[2], word_select[2]);
AND x3(address[0],address[1],!address[2], word_select[3]);
AND x4(!address[0],!address[1],address[2], word_select[4]);
AND x5(!address[0],address[1],!address[2], word_select[5]);
AND x6(address[0],!address[1],!address[2], word_select[6]);
AND x7(!address[0],!address[1],!address[2], word_select[7]);
endmodule

module AND(input a,b,c, output out);
    assign out = a & b & c;
endmodule

module decoder_tb;
    wire[7:0]y;
    reg[2:0]a;
    Decoder a1(a, y);

    initial begin
    if (! $value$plusargs("a=%d", a)) begin
        $display("ERROR: please specify +a=<value> to start.");
        $finish;
    end
    wait(y) $display("y=%d", y);
    $finish;
    end
endmodule
