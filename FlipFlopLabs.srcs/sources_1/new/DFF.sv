`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2024 03:11:23 PM
// Design Name: 
// Module Name: DFF
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

`include "DLatch.sv"
module DFF (

    input  clk,
    input  rst,
    input en,
    input  d,
    output q,
    output nq
);
  logic nclk, qm, ignored,andout1,andout2,nEn,dm;
  not not1(nEn,en);
  and and1(andout1, nEn,q);
  and and2(andout2,en,d);
  or or1(dm,andout1,andout2);
  DLatch master (
      .en (nclk),
      .d  (dm),
      .rst(rst),
      .q  (qm),
      .nq(ignored)
  );
  DLatch slave (
      .en (clk),
      .d  (qm),
      .rst(rst),
      .q  (q),
      .nq(nq)
  );
endmodule
