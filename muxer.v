`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2025 02:25:43 PM
// Design Name: 
// Module Name: muxer
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
    input[2:0] in;
    output[7:0] out;
    
    assign out={in[2]&in[1]&in[0] , in[2]&in[1]&~(in[0]) , in[2]&~in[1]&(in[0]) , ~(~in[2]|in[1]|in[0]) , ~in[2]&in[1]&(in[0]) , ~(in[2]|~in[1]|in[0]) , ~(in[2]|in[1]|~in[0]) , ~(in[2]|in[1]|in[0])};
endmodule

module muxer(
    in,
    select,
    out
    );
    input[7:0] in;
    input[2:0] select;
    output out;
    wire[7:0] res;
    decoder result(
        .in(select),
        .out(res)
    );
    assign out = (in[0]&res[0])|(in[1]&res[1])|(in[2]&res[2])|(in[3]&res[3])|(in[4]&res[4])|(in[5]&res[5])|(in[6]&res[6])|(in[7]&res[7]);
    
    
endmodule
