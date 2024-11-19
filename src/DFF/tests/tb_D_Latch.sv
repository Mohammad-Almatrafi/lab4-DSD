`timescale 1ns / 1ps

//`include "FlipFlopLabs.srcs/sources_1/new/D_Latch.sv"
module tb_D_Latch ();
  logic en, d, rst, q,nq;

  DLatch test (
      .en (en),
      .d  (d),
      .rst(rst),
      .q  (q),
      .nq(nq)
  );

  initial begin
    en  = 1'b1;
    d   = 1'b1;
    rst = 1'b1;
    #5;
    en  = 1'b1;
    d   = 1'b0;
    rst = 1'b1;
    #5;
    en  = 1'b0;
    d   = 1'b1;
    rst = 1'b1;
    #5;
    en  = 1'b0;
    d   = 1'b0;
    rst = 1'b1;
    #5;
    en  = 1'b1;
    d   = 1'b1;
    rst = 1'b1;
    #5;
    en  = 1'b1;
    d   = 1'b1;
    rst = 1'b0;
    #5;
    en  = 1'b1;
    d   = 1'b1;
    rst = 1'b1;
    #5;
    en  = 1'b1;
    d   = 1'b0;
    rst = 1'b0;
    #5;
    $finish;
  end


endmodule
