`timescale 1ns / 1ps

module eqcmp(
    input [31:0] a, b,
    output eq
    );
    assign eq = (a == b);
endmodule
