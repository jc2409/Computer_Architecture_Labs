`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2025 11:44:23 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
        input logic clk,
        input logic rst,
        output logic clk_en
    );
    
    logic [24:0] clk_count;
    
    always @(posedge clk) begin
        if (rst)
            clk_count <= 0;
        else
            clk_count <= clk_count + 1;
    end
    
    assign clk_en = &clk_count;
    
endmodule
