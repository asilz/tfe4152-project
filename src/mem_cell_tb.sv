`include "../src/latch.sv"

module mem_cell_tb;
    reg rw;
    reg sel;
    reg inp;
    
    wire out;

    mem_cell cell0(rw, sel, inp, out);
    
    initial begin
    $monitor("rw=%b, sel=%b, input=%b | output=%b", rw, sel, inp, out);

    rw = 1;
    sel = 1;
    inp = 1;
    #10
    rw = 0;
    inp = 0;
    #10
    sel = 0;
    rw = 1;
    #10
    sel = 1;

    $finish;
    end

endmodule