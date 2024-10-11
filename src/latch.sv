module sr_latch(input R, S, output Q, Q_not);
sr_port(R, Q_not, Q);
sr_port(S, Q, Q_not);
endmodule

module sr_port(input a, b, output c);
nor(a, b, c);
endmodule