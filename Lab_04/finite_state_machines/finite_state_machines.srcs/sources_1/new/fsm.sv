`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2025 09:42:37 PM
// Design Name: 
// Module Name: fsm
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


module fsm(
        input   logic clk,
        input   logic reset,
        input   logic l,
        input   logic r,
        output  logic [5:0] lights
    );
    
    logic clk_en;
    
    clock_divider cd(
        clk,
        reset,
        clk_en
    );
    
    typedef enum logic [2:0] {
        S0      = 3'b000,
        SL1     = 3'b001,
        SL2     = 3'b010,
        SL3     = 3'b011,
        SR1     = 3'b100,
        SR2     = 3'b101,
        SR3     = 3'b111
    } state_t;
    
    state_t current_state, next_state;
    
    always_ff @(posedge clk) begin
        if (reset)
            current_state <= S0;
        else if (clk_en)    
            current_state <= next_state;
    end
    
    always_comb begin 
        case (current_state)
            S0: begin
                if (l & r)
                    next_state = S0;
                else if (l)
                    next_state = SL1;
                else if (r)
                    next_state = SR1;
                else
                    next_state = S0;
            end
            
            SL1: next_state = SL2;
            
            SL2: next_state = SL3;
                
            SL3: next_state = S0;
                
            SR1: next_state = SR2;
               
            SR2: next_state = SR3;
    
            SR3: next_state = S0; 
        endcase       
    end 
    
    always_comb begin 
        case (current_state)
            S0: lights = 6'b000000;
            SL1: lights = 6'b001000;
            SL2: lights = 6'b011000;
            SL3: lights = 6'b111000;
            SR1: lights = 6'b000100;
            SR2: lights = 6'b000110;
            SR3: lights = 6'b000111;
        endcase     
    end 
    
endmodule
