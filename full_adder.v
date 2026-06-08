`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2025 10:19:22 AM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    in,
    carry_in,
    out,
    carry_out
    );
    input[1:0] in;
    input carry_in;
    output out;
    output carry_out;
    
    assign out = carry_in^in[0]^in[1];
    assign carry_out = carry_in&in[0]|carry_in&in[1]|in[0]&in[1];
endmodule
