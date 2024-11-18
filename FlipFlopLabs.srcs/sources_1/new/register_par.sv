`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 02:20:55 PM
// Design Name: 
// Module Name: register_par
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


module register_par #(
    parameter n = 8
) (
    input clk,
    input rst,
    input en,
    input [n-1:0] d,
    output logic [n-1:0] q
);
  always_ff @(posedge clk, negedge rst) begin
    if (~rst) q <= 0;
    else if (en) q <= d;
  end
endmodule
