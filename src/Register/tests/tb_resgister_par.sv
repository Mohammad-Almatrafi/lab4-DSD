`timescale 1ns / 1ps

// `include "Register/modules/register_par.sv"
module tb_resgister_par ();

  logic [7:0] d, q;
  logic clk, rst, en;

  register_par test (
      .clk(clk),
      .rst(rst),
      .en (en),
      .d  (d),
      .q  (q)
  );

  initial begin
    rst = 1'b1;
    clk = 1'b0;
    en  = 1'b0;
    #1;
    rst = 1'b0;
    #2;
    rst = 1'b1;
    en  = 1'b1;
    repeat (8) begin
      #3 clk = ~clk;
      d = d + 4;
    end
    rst = 1'b0;
    repeat (8) begin
      #3 clk = ~clk;
      d = d + 4;
    end

  end

endmodule
