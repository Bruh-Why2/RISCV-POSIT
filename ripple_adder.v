`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2025 10:44:47 AM
// Design Name: 
// Module Name: ripple_adder
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

module ripple_adder(
    a,
    b,
    out,
    car
    );
    input[3:0] a;
    input[3:0] b;
    output[3:0] out;
    wire[3:0] carry;
    output car;
    
    assign carry[0]=0;
    full_adder add_0(
        .in({a[0],b[0]}),
        .carry_in(carry[0]),
        .out(out[0]),
        .carry_out(carry[1])
        );
    full_adder add_1(
        .in({a[1],b[1]}),
        .carry_in(carry[1]),
        .out(out[1]),
        .carry_out(carry[2])
        );
    full_adder add_2(
        .in({a[2],b[2]}),
        .carry_in(carry[2]),
        .out(out[2]),
        .carry_out(carry[3])
        );
    full_adder add_3(
        .in({a[3],b[3]}),
        .carry_in(carry[3]),
        .out(out[3]),
        .carry_out(car)
        );
endmodule
