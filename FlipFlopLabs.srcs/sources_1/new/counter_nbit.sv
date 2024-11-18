`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 02:20:55 PM
// Design Name: 
// Module Name: counter_nbit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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
