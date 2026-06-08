`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2025 10:05:21 PM
// Design Name: 
// Module Name: sqc_dct
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
    output reg q 
    );
    always@(posedge clk)begin
        q=d;
        
    end
endmodule

module sipo_reg(
    input clk,
    input in,
    output[4:0] q
    );
    d_ff f0(
        .clk(clk),
        .d(in),
        .q(q[0])
    );
    d_ff f1(
        .clk(clk),
        .d(q[0]),
        .q(q[1])
    );
    d_ff f2(
        .clk(clk),
        .d(q[1]),
        .q(q[2])
    );
    d_ff f3(
        .clk(clk),
        .d(q[2]),
        .q(q[3])
    );
    d_ff f4(
        .clk(clk),
        .d(q[3]),
        .q(q[4])
    );
endmodule

module sqc_dct(
    input in,
    input clk,
    output reg out
    );
    wire[4:0] q;
    sipo_reg seq(
        .in(in),
        .clk(clk),
        .q(q)
    );
    always@(posedge clk)begin
        if({q,in}==6'b101101)begin
            out=1;
        end
        else begin
            out=0;
        end
    end
    
endmodule

