`timescale 1ns / 1ps

module maindec(
    input logic [5:0] op,
    output logic memtoreg, memwrite,
    output logic branch, alusrc,
    output logic regdst, regwrite,
    output logic jump, immext,
    output logic [1:0] aluop
    );

    logic [9:0] controls;
    assign {regwrite, regdst, alusrc,
        branch, memwrite,
        memtoreg, jump, immext, aluop} = controls;
    
    always @(*)
        case(op)
            6'b000000: begin controls <= 10'b1100000010; $display("OP: 0b%b Rtype", op); end// Rtype
            6'b100011: begin controls <= 10'b1010010000; $display("OP: 0b%b LW", op); end// LW
            6'b101011: begin controls <= 10'b0010100000; $display("OP: 0b%b SW", op); end// SW
            6'b000100: begin controls <= 10'b0001000001; $display("OP: 0b%b BEQ", op); end// BEQ
            6'b001000: begin controls <= 10'b1010000000; $display("OP: 0b%b ADDI", op); end// ADDI
            6'b000010: begin controls <= 10'b0000001000; $display("OP: 0b%b J", op); end// J
            6'b001100: begin controls <= 10'b1010000111; $display("OP: 0b%b ANDI", op); end// ANDI
            default: begin controls <= 10'bxxxxxxxxxx; $display("OP: 0b%b ill", op); end// ???
            // 6'b000000: controls <= 9'b110000010; // Rtype
            // 6'b100011: controls <= 9'b101001000; // LW
            // 6'b101011: controls <= 9'b001010000; // SW
            // 6'b000100: controls <= 9'b000100001; // BEQ
            // 6'b001000: controls <= 9'b101000000; // ADDI
            // 6'b000010: controls <= 9'b000000100; // J
            // default: controls <= 9'bxxxxxxxxx; // ???
        endcase
endmodule
