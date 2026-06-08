`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2025 10:21:45 AM
// Design Name: 
// Module Name: test
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


module test(
    in,
    out
    );
    input [1:0]in;
    output [5:0]out;
    
    assign out = {in[0] & in[1], in[0] | in[1], ~(in[0] & in[1]), ~(in[0] | in[1]), in[0] ^ in[1], ~(in[0] ^ in[1])};
endmodule
