`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2025 09:55:50 AM
// Design Name: 
// Module Name: half_adder
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


module half_adder(
    in,
    out,
    carry
    );
    
    input[1:0] in;
    output out;
    output carry;
 
    assign out = in[0]^in[1];
    assign carry = in[0]&in[1];
    
endmodule

module half_subtract(
    in,
    out,
    borrow
    );
    input[1:0] in;
    output out;
    output borrow;
    
    assign out = in[1]^in[0];
    assign borrow = ~in[1]&in[0];

endmodule