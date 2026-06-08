`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2025 10:55:20 AM
// Design Name: 
// Module Name: flip_flops
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
        q = d;
    end
endmodule

module t_ff(
    input clk,
    input t,
    input reset,
    output reg q
    );
    
    always@(posedge clk )begin
        q = ((q&~t)|(~q&t))&~reset;
    end
endmodule

module sr_ff(
    input clk,
    input s,
    input r,
    input reset,
    output reg q
    );
    
    always@(posedge clk)begin
        q = (((q&~(s&r))|(s))&(~r))&~reset;
    end
endmodule

module jk_ff(
    input clk,
    input j,
    input k,
    input reset,
    output reg q
    );
    
    always@(posedge clk)begin
        q = (((q&~(j|k))|(~j&k)|(~q&(j&k)))&(~j|k))&~reset;
    end
endmodule

module flip_flops(
    input clk,
    input d,
    input reset,
    input t,
    input s,
    input r,
    input j,
    input k,
    output q_d,
    output q_t,
    output q_sr,
    output q_jk
    );
    
    d_ff d_(
        .clk(clk),
        .d(d),
        .q(q_d)
        );
    t_ff t_(
        .clk(clk),
        .t(t),
        .q(q_t),
        .reset(reset)
        );
    sr_ff sr_(
        .clk(clk),
        .s(s),
        .r(r),
        .q(q_sr),
        .reset(reset)
        );
    jk_ff jk_(
        .clk(clk),
        .j(j),
        .k(k),
        .q(q_jk),
        .reset(reset)
        );
    
endmodule
