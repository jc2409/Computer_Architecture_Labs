`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2025 10:48:42 PM
// Design Name: 
// Module Name: segment_decode
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


module segment_decode(
        input logic [3:0] a,
        input logic [3:0] b,
        output logic [6:0] d,
        output overflow
    );
    
    logic [4:0] sum;
    
    FourBitAdder fa(a, b, sum);  
    segment_encode se(sum[3:0], d);
    assign overflow = sum[4];
    
endmodule
