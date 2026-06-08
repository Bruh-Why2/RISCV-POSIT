`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2025 08:25:01 PM
// Design Name: 
// Module Name: piso_reg
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


module d_ff(
    input clk,
    input d,
    input reset,
    output reg q 
    );
    always@(posedge clk)begin
        q=d&~reset;     
    end
endmodule

module piso_reg(
    input clk,
    input[7:0] in,
    input reset,
    input load,
    output out
    );
    wire[7:0] q;
    d_ff f0(
        .clk(clk),
        .d(in[0]),
        .reset(reset),
        .q(q[0])
    );
    d_ff f1(
        .clk(clk),
        .d(q[0]|(load&in[1])),
        .reset(reset),
        .q(q[1])
    );
    d_ff f2(
        .clk(clk),
        .d(q[1]|(load&in[2])),
        .reset(reset),
        .q(q[2])
    );
    d_ff f3(
        .clk(clk),
        .d(q[2]|(load&in[3])),
        .reset(reset),
        .q(q[3])
    );
    d_ff f4(
        .clk(clk),
        .d(q[3]|(load&in[4])),
        .reset(reset),
        .q(q[4])
    );
    d_ff f5(
        .clk(clk),
        .d(q[4]|(load&in[5])),
        .reset(reset),
        .q(q[5])
    );
    d_ff f6(
        .clk(clk),
        .d(q[5]|(load&in[6])),
        .reset(reset),
        .q(q[6])
    );
    d_ff f7(
        .clk(clk),
        .d(q[6]|(load&in[7])),
        .reset(reset),
        .q(q[7])
    );
    assign out=q[7];
endmodule
