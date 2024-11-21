`timescale 1ns / 1ps

module register_par #(
    parameter n = 8
) (
    input clk,
    input rst,
    input en,
    input logic [n-1:0] d,
    output logic [n-1:0] q
);
  always_ff @(posedge clk, negedge rst) begin
    if (~rst) q <= 0;
    else if (en) q <= d;
  end
endmodule
