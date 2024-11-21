`timescale 1ns / 1ps

module tb_Register;
  logic clk, rst;
  logic [3:0] d, q1,q2;

  Register test (
      .clk(clk),
      .rst(rst),
      .en(1'b1),
      .d  (d),
      .q  (q1)
  );
  register_beh n (
      .clk(clk),
      .rst(rst),
      .en(1'b1),
      .d  (d),
      .q  (q2)
  );

  initial begin
    rst = 1'b0;
    d   = 4'h0;
    clk = 1'b0;
    #5;
    rst = 1'b1;
    d   = 4'h9;
    clk = 1'b0;
    #5;
    rst = 1'b1;
    d   = 4'h9;
    clk = 1'b1;
    #5;
    rst = 1'b1;
    d   = 4'h9;
    clk = 1'b0;
    #5;
    rst = 1'b0;
    d   = 4'h9;
    clk = 1'b0;
    #5;
    rst = 1'b1;
    d   = 4'h1;
    clk = 1'b0;
    #5;
    rst = 1'b1;
    clk = 1'b1;
    d   = 4'h1;
    #5;
    rst = 1'b1;
    clk = 1'b1;
    d   = 4'h1;
    #5;
    rst = 1'b0;
    clk = 1'b1;
    d   = 4'h1;
    $finish;
  end



endmodule
