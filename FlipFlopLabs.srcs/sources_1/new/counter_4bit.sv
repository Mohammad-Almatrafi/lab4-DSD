`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 02:20:55 PM
// Design Name: 
// Module Name: counter_4bit
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

`include "DFF.sv"
`include "bit_add_sub.sv"
module counter_4bit (
    input clk,
    input rst,
    input load,
    input up_down,
    input [3:0] d,
    output [3:0] q
);

  logic [3:0] wq, dm, nq,result;
  logic ignore;
  // input m,
  // input [3:0] a,
  // input [3:0] b,
  // output [3:0] s,
  // output cout

  bit_add_sub nn (
      up_down,
      q,
      1'b1,
      result,
      ignore
  );
  assign dm = load ? d:result;
  DFF FF1 (
      .clk(clk),
      .rst(rst),
      .en (1'b1),
      .d  (dm[0]),
      .q  (q[0]),
      .nq (nq[0])
  );
  DFF FF2 (
      .clk(clk),
      .rst(rst),
      .en (1'b1),
      .d  (dm[1]),
      .q  (q[1]),
      .nq (nq[1])
  );
  DFF FF3 (
      .clk(clk),
      .rst(rst),
      .en (1'b1),
      .d  (dm[2]),
      .q  (q[2]),
      .nq (nq[2])
  );
  DFF FF4 (
      .clk(clk),
      .rst(rst),
      .en (1'b1),
      .d  (dm[3]),
      .q  (q[3]),
      .nq (nq[3])
  );
endmodule

// input  clk,
// input  rst,
// input en,
// input  d,
// output q,
// output nq
