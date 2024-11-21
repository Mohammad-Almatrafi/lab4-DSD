`timescale 1ns / 1ps
// `include "adder/modules/bit_add_sub.sv"
// `include "DFF/modules/DFF.sv"
module TFF(input clk,input rst,input T,input Q);
assign wq = q;
assign dm = T ? ~wq : wq;
  DFF FF1 (
      .clk(clk),
      .rst(rst),
      .en (1'b1),
      .d  (T),
      .q  (q)
  );


endmodule
module counter_4bit (
    input clk,
    input load,
    input rst,
    input up_down,
    input [3:0] d,
    output [3:0] q
);

  logic [3:0] wq, dm, sub_result, add_result, result;
   assign sub_result[0] = ~wq[0];
  assign sub_result[1] = ~wq[0] ^ wq[1];
  assign sub_result[2] =  &(~wq[1:0]) ^ wq[2];
  assign sub_result[3] =  &(~wq[2:0]) ^ wq[3];
  assign add_result[0] = ~wq[0];
  assign add_result[1] = wq[0] ^ wq[1];
  assign add_result[2] = &wq[1:0] ^ wq[2];
  assign add_result[3] = &wq[2:0] ^ wq[3];
  assign result = up_down ? sub_result : add_result;
  assign dm = load ? d : result;
  DFF FF1 (
      .clk(clk),
      .rst(rst),
      .en (1'b1),
      .d  (dm[0]),
      .q  (q[0])
  );
  DFF FF2 (
      .clk(clk),
      .rst(rst),
      .en (1'b1),
      .d  (dm[1]),
      .q  (q[1])
  );
  DFF FF3 (
      .clk(clk),
      .rst(rst),
      .en (1'b1),
      .d  (dm[2]),
      .q  (q[2])
  );
  DFF FF4 (
      .clk(clk),
      .rst(rst),
      .en (1'b1),
      .d  (dm[3]),
      .q  (q[3])
  );
  assign wq = q;
endmodule

// input  clk,
// input  rst,
// input en,
// input  d,
// output q,
// output nq
