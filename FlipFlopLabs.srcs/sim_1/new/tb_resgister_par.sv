`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 02:30:04 PM
// Design Name: 
// Module Name: tb_resgister_par
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


// module register_par #(
//     parameter n = 8
// ) (
//     input clk,
//     input rst,
//     input en,
//     input [n-1:0] d,
//     output logic [n-1:0] q
// );
module tb_resgister_par ();

logic d[7:0],q[7:0];
logic clk, rst, en;

register_par test(.clk(clk),.rst(rst),.en(en),.d(d),.q(q));

initial begin
    rst = 1'b1;
    clk = 1'b0;
    en = 1'b0;
    #1;
    rst = 1'b0;
    #2;
    rst = 1'b1;
    en = 1'b1;
    repeat(8) begin
        #3 clk = ~clk;
        d = d+4;
    end
    rst = 1'b0;
    repeat(8) begin 
        #3 clk = ~clk;
        d = d+4;
    end
        
end

endmodule
