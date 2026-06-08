`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2025 10:58:02 AM
// Design Name: 
// Module Name: up_dn_cnt
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

/*module t_ff(
    input clk,
    input t,
    input reset,
    output reg q
    );
    
    always@(negedge clk, posedge reset)begin
    if(reset)begin
        q<=0;
    end
    else if(t) begin
        q<=~q;
    end
    end
endmodule

module up_dn_cnt(
    input clk,
    input reset,
    output[3:0] q
    );
    reg t=1;
    reg init=0;
  
    t_ff t0(
        .clk(clk),
        .t(t),
        .reset(reset),
        .q(q[0])
        );
    
    t_ff t1(
        .clk((clk)&(init^q[0])),
        .t(t),
        .reset(reset),
        .q(q[1])
        );
    t_ff t2(
        .clk((clk)&(init^q[0])&(init^q[1])),
        .t(t),
        .reset(reset),
        .q(q[2])
        );
    t_ff t3(
        .clk((clk)&(init^q[0])&(init^q[1])&(init^q[2])),
        .t(t),
        .reset(reset),
        .q(q[3])
        );

    always@(q[0])begin
        if(q==9)begin
            init=1;
            t=~t;
        end
        if(q==0)begin
            init=0;
            t=~t;
        end
    end

    always@(negedge clk)begin
        t=1;
    end
endmodule*/
module up_dn_cnt(
  input clk,
  input rst,
  output reg [3:0] count
);
   reg mode=1;
  always@(posedge clk, posedge rst)begin
    if(rst)begin
      count <= 0;  
    end
    else begin
      if(mode)begin 
        if(count<9)begin
          count<=count + 1;
        end
        else begin
          mode=0;  
        end
      end
      else begin
        if(count>0)begin
          count<=count-1;
        end
        else begin 
          mode=1; 
        end
      end
    end
  end
endmodule