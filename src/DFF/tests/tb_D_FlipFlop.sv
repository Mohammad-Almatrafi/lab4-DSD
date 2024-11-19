`timescale 1ns / 1ps

// `include "FlipFlopLabs.srcs/sources_1/new/D_FlipFlop.sv"
module tb_D_FlipFlop ();
  logic clk, rst, d, q, nq;

  DFF test (
      .clk(clk),
      .rst(rst),
      .en(1'b1),
      .d  (d),
      .q  (q),
      .nq (nq)
  );


  initial begin
    rst = 1'b0;
    d   = 1'b0;
    clk  = 1'b0;
    #10 clk = 1'b1;
    d   = 1'b1;
    rst = 1'b1;
    #5;
    clk  = 1'b0;
    d   = 1'b1;
    rst = 1'b1;
    #5;
    clk  = 1'b1;
    d   = 1'b1;
    rst = 1'b1;
    #5;
    clk  = 1'b0;
    d   = 1'b0;
    rst = 1'b1;
    #5;
    clk  = 1'b0;
    d   = 1'b1;
    rst = 1'b1;
    #5;
    clk  = 1'b1;
    d   = 1'b1;
    rst = 1'b1;
    #5;
    clk  = 1'b1;
    d   = 1'b1;
    rst = 1'b0;
    #5;
    clk  = 1'b1;
    d   = 1'b0;
    rst = 1'b1;
    #5;
    $finish;
  end

endmodule
