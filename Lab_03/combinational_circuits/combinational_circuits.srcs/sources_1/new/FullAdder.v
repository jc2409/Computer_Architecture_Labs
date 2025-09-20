`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2025 09:41:41 AM
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(
    input a,
    input b,
    input ci,
    output s,
    output co
    );
    
    assign co = (a&ci)|(b&ci)|(a&b);
    assign s = (~a&~b&ci)|(a&~b&~ci)|(a&b&ci)|(~a&b&~ci);
    
endmodule
