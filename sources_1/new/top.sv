`timescale 1ns / 1ps

module top(
    input clk, reset,
    output [31:0] writedata, dataadr,
    output memwrite
    );

    logic [31:0] pc, instr, readdata;

    mips mips(clk, reset, pc, instr, memwrite, dataadr, writedata, readdata);
    imem imem(pc[9:2], instr);
    dmem dmem(clk, memwrite, dataadr, writedata, readdata);    
endmodule
