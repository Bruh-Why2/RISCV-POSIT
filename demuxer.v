`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2025 04:04:55 PM
// Design Name: 
// Module Name: demuxer
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


module demuxer(
    in,
    select,
    out
    );
    input in;
    input[2:0] select;
    output[7:0] out;
    
    assign out={in&(select==3'b111),in&(select==3'b110),in&(select==3'b101),in&(select==3'b100),in&(select==3'b011),in&(select==3'b010),in&(select==3'b001),in&(select==3'b000)};
endmodule
