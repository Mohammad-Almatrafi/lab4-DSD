`timescale 1ns / 1ps

module register_beh (
    input clk,
    input rst,
    input en,
    input [3:0] d,
    output logic [3:0] q
);


  always @(posedge clk, negedge rst) begin
    if (~rst) q <= 4'h0;
    else if(en) q <= d;
  end
endmodule
