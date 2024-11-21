`timescale 1ns / 1ps
// `include "Register/modules/register_par.sv"
// `include "adder_16bit.sv"
// `include "Counters/modules/counter_nbit.sv"
module mult_8bit (
    input clk,
    input rst,
    input [7:0] x,
    input [7:0] y,
    output [15:0] z
);
  logic [7:0] xOut, yOut, c;
  logic rstL, en_int;
  logic [15:0] add_result, zOut;

  register_par #(8) x_reg (
      .clk(clk),
      .rst(rst),
      .en (1'b1),
      .d  (x),
      .q  (xOut)
  );
  register_par #(8) y_reg (
      .clk(clk),
      .rst(rst),
      .en (1'b1),
      .d  (y),
      .q  (yOut)
  );

  adder_16bit add (
      .a  ({8'h00, xOut}),
      .b  (zOut),
      .cin(1'b0),
      .s  (add_result)
  );
  counter_nbit #(8) count (
      .clk(clk),
      .rst(rstL),
      .en(en_int),
      .load(1'b0),
      .up_down(1'b0),
      .d(8'h0),
      .q(c)
  );



  register_par #(16) z_reg (
      .clk(clk),
      .rst(rstL),
      .en (en_int),
      .d  (add_result),
      .q  (z)
  );
  assign zOut = z;

  always @(*) begin
    if (x != xOut || y != yOut) rstL = 1'b0;
    else rstL = 1'b1;
    if (c >= yOut) en_int = 1'b0;
    else en_int = 1'b1;
  end

endmodule




// don't forget the rst logic with or
