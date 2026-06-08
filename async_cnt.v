`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2025 04:09:32 PM
// Design Name: 
// Module Name: async_cnt
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

module t_ff(
    input clk,
    input t,
    input reset,
    output reg q
    );
    
    always@(negedge clk , posedge reset)begin
        if(reset)begin
            q<=0;
        end
        else if(t)begin
            q<=~q;
        end
    end
endmodule

module async_cnt(
    input clk,
    input reset,
    output[3:0] q
    );
    wire t=1;
    wire init;
    t_ff t0(
        .clk(clk),
        .t(t),
        .reset(reset|init),
        .q(q[0])
        );
    
    t_ff t1(
        .clk(q[0]),
        .t(t),
        .reset(reset|init),
        .q(q[1])
        );
    t_ff t2(
        .clk(q[1]),
        .t(t),
        .reset(reset|init),
        .q(q[2])
        );
    t_ff t3(
        .clk(q[2]),
        .t(t),
        .reset(reset|init),
        .q(q[3])
        );
    
    assign init = q[3]&q[1];
    
    
endmodule
