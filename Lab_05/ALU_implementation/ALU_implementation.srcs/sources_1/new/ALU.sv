`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2025 09:25:36 PM
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    input logic [31:0] A,
    input logic [31:0] B,
    input logic [3:0] AluOp,
    output logic Zero,
    output logic [31:0] Result
    );
    
    logic [31:0] tmp;
    
    always_comb begin
        case (AluOp)
            4'b0000: Result = A + B;
            4'b0010: Result = A - B;
            4'b0100: Result = A & B;
            4'b0101: Result = A | B;         
            4'b0110: Result = A ^ B;
            4'b0111: Result = ~(A | B);
            4'b1010: begin
                tmp = A - B;
                Result = (tmp[31]) ? 32'b1 : 32'b0;
            end
        endcase
        Zero = (Result == 32'b0);
    end
endmodule
