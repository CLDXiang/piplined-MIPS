`timescale 1ns / 1ps

module flopenr #(parameter WIDTH = 8)
    (
        input clk, reset,
        input en,
        input [WIDTH-1:0] d,
        output logic [WIDTH-1:0] q
    );
    always @(posedge clk, posedge reset)
        if (reset) q <=  0;
        else if (en) q <=  d;
endmodule
