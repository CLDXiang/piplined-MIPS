`timescale 1ns / 1ps

module eqcmp(
    input logic [31:0] a, b,
    output logic eq
    );
    assign eq = (a == b);
endmodule
