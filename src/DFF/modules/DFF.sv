`timescale 1ns / 1ps

//`include "DLatch.sv"
module DFF (

    input  clk,
    input  rst,
    input en,
    input  d,
    output q,
    output nq
);
logic clkM,nclkM,qm,ignored;
assign clkM = en & clk;
assign nclkM = ~clkM;
  DLatch master (
      .en (nclkM),
      .d  (d),
      .rst(rst),
      .q  (qm),
      .nq(ignored)
  );
  DLatch slave (
      .en (clkM),
      .d  (qm),
      .rst(rst),
      .q  (q),
      .nq(nq)
  );
endmodule
