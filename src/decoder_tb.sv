`include "../src/decoder.sv"

module decoder_tb;
    reg[2:0]address;
    reg valid;
    wire[7:0]sel;

    Decoder dec(address, valid, sel);
    
    initial begin
    $monitor("valid=%b | address=%b,%b,%b | sel=%b,%b,%b,%b,%b,%b,%b,%b", valid, address[0], address[1], address[2],sel[0], sel[1], sel[2], sel[3], sel[4], sel[5], sel[6], sel[7]);

    valid = 1;
    address = 0;
    #5
    address = 1;
    #5
    address = 2;
    #5
    address = 3;
    #5
    address = 4;
    #5
    address = 5;
    #5
    address = 6;
    #5
    address = 7;
    #5
    valid = 0;

    $finish;
    end

endmodule