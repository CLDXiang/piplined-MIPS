`timescale 1ns / 1ps

module top_IO(
    input logic clk, BTNC,
    input logic [15:0] SW,
    output logic [7:0] AN,
    output logic DP,
    input logic BTNL,
    input logic BTNR,
    output logic [6:0] A2G
    );
    
    logic [31:0] pc, instr, readdata;
    logic [31:0] writedata, dataadr;
    logic memwrite;
    
    mips mips(clk, BTNC, pc, instr, memwrite, dataadr, writedata, readdata);
    imem imem(pc[9:2], instr);
    DataMemoryDecoder dmdec(clk, memwrite, dataadr, writedata, readdata, BTNC, BTNL, BTNR, SW, AN, DP, A2G);
    
endmodule
