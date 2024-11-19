`timescale 1ns / 1ps
// `include "adder/modules/bit_add_sub.sv"
// `include "DFF/modules/DFF.sv"
module counter_4bit (
    input clk,
    input load,
    input rst,
    input up_down,
    input [3:0] d,
    output [3:0] q
);

  logic [3:0] wq, dm, nq,result;
  logic ignore;

  bit_add_sub nn (
      up_down,
      wq,
      4'b0001,
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
  assign wq = q;
endmodule

// input  clk,
// input  rst,
// input en,
// input  d,
// output q,
// output nq
