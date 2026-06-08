`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2025 02:17:23 PM
// Design Name: 
// Module Name: decoder
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


module decoder(
    in,
    out
    );
    input[1:0] in;
    output[3:0] out;
    
    assign out={in[1]&in[0],in[1]&~(in[0]),~in[1]&in[0],~(in[1]|in[0])};
endmodule
