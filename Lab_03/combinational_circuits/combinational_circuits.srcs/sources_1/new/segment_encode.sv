`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2025 10:05:02 PM
// Design Name: 
// Module Name: 7segment_encode
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


module segment_encode(
    input logic [3:0] num_in,
    output logic [6:0] num_out
    );
    
    always_comb begin
        case(num_in)
            4'h0    : num_out = 7'b0000001;
            4'h1    : num_out = 7'b1001111;
            4'h2    : num_out = 7'b0010010;
            4'h3    : num_out = 7'b0000110;
            4'h4    : num_out = 7'b1001100;
            4'h5    : num_out = 7'b0100100;
            4'h6    : num_out = 7'b0100000;
            4'h7    : num_out = 7'b0001111;
            4'h8    : num_out = 7'b0000000;
            4'h9    : num_out = 7'b0000100;
            4'ha    : num_out = 7'b0001000;
            4'hb    : num_out = 7'b1100000;
            4'hc    : num_out = 7'b0110001;
            4'hd    : num_out = 7'b1000010;
            4'he    : num_out = 7'b0110000;
            4'hf    : num_out = 7'b0111000;
        endcase
    end
endmodule
