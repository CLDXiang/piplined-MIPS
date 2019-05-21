`timescale 1ns / 1ps

module floprc #(parameter WIDTH = 8)
    (
        input clk, reset, clear,
        input [WIDTH-1:0] d,
        output logic [WIDTH-1:0] q
    );
    always @(posedge clk, posedge reset)
        if (reset) q <= #1 0;
        else if (clear) q <= #1 0;
        else q <= #1 d;
endmodule
