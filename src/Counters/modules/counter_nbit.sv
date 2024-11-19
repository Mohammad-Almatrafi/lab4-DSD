`timescale 1ns / 1ps

module counter_nbit #(
    parameter n = 4
) (
    input clk,
    input rst,
    input en,
    input load,
    input up_down,
    input [n-1:0] d,
    output logic [n-1:0] q
);
  always_ff @(posedge clk, negedge rst) begin
    if (~rst) q <= 0;
    else if (en) begin
      if (load) q <= d;
      else begin
        if (up_down) q <= q - 1;
        else q <= q + 1;
      end
    end
  end
endmodule
