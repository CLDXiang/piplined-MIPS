`timescale 1ns / 1ps

module flopr #(parameter WIDTH = 8)
    (
        input clk, reset,
        input [WIDTH-1:0] d,
        output logic [WIDTH-1:0] q
    );
    always @(posedge clk, posedge reset)
        if (reset) q <=  0;
        else q <=  d;
endmodule
