`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2025 12:04:00 PM
// Design Name: 
// Module Name: multiplier
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
    out);
    input[7:0] a;
    input[7:0] b;
    output[7:0] out;
    wire[8:0] carry;
    
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
        .carry_out(carry[4])
        );
    full_adder add_4(
        .in({a[4],b[4]}),
        .carry_in(carry[4]),
        .out(out[4]),
        .carry_out(carry[5])
        );
    full_adder add_5(
        .in({a[5],b[5]}),
        .carry_in(carry[5]),
        .out(out[5]),
        .carry_out(carry[6])
        );
    full_adder add_6(
        .in({a[6],b[6]}),
        .carry_in(carry[6]),
        .out(out[6]),
        .carry_out(carry[7])
        );
    full_adder add_7(
        .in({a[7],b[7]}),
        .carry_in(carry[7]),
        .out(out[7]),
        .carry_out(carry[8])
        );
endmodule

module multiplier(
    a,
    b,
    out
    );
    
    input[3:0] a;
    input[3:0] b;
    output[7:0] out;
    
    wire[7:0] p0, p1, p2, p3, p_sum1, p_sum2, p_sum3;
    
    assign p0 = a&{8{b[0]}};
    assign p1 = (a&{8{b[1]}})<<1;
    assign p2 = (a&{8{b[2]}})<<2;
    assign p3 = (a&{8{b[3]}})<<3;
    
    ripple_adder s1(
        .a(p0),
        .b(p1),
        .out(p_sum1)
        );
    ripple_adder s2(
        .a(p_sum1),
        .b(p2),
        .out(p_sum2)
        );
    ripple_adder s3(
        .a(p_sum2),
        .b(p3),
        .out(p_sum3)
        );
    assign out = p_sum3;
endmodule
