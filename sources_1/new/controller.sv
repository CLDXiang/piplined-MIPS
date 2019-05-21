`timescale 1ns / 1ps

module controller(
    input clk, reset,
    input [5:0] opD, functD,
    input flushE, equalD,
    output memtoregE, memtoregM, memtoregW, memwriteM,
    output pcsrcD, branchD, alusrcE,
    output regdstE, regwriteE, regwriteM, regwriteW,
    output jumpD,
    output [2:0] alucontrolE
    );
    logic [1:0] aluopD;
    logic memtoregD, memwriteD, alusrcD, regdstD, regwriteD;
    logic [2:0] alucontrolD;
    logic memwriteE;

    maindec md(opD, memtoregD, memwriteD, branchD,
        alusrcD, regdstD, regwriteD, jumpD, aluopD);
    aludec ad(functD, aluopD, alucontrolD);

    assign pcsrcD = branchD & equalD;

    floprc #(8) regE(clk, reset, flushE,
        {memtoregD, memwriteD, alusrcD, regdstD, regwriteD, alucontrolD},
        {memtoregE, memwriteE, alusrcE, regdstE, regwriteE, alucontrolE});
    flopr #(3) regM(clk, reset,
        {memtoregE, memwriteE, regwriteE},
        {memtoregM, memwriteM, regwriteM});
    flopr #(2) regW(clk, reset,
        {memtoregM, regwriteM},
        {memtoregW, regwriteW});
endmodule
