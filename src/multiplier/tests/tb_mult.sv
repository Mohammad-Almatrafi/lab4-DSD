`timescale 1ns / 1ps

module tb_mult ();
logic rst;
//in
logic clk = 0;
logic [7:0] x,y;
//out
logic [15:0] z;
mult_8bit mult(
     .clk(clk),
     .rst(rst),
      .x(x),
      .y(y),
      .z(z)
);

always #5 clk = ~clk;

initial begin
    x = 0;
    y = 0;
    rst = 1;
    #5;
    rst = 0;
    #5;
    rst = 1;

    @(negedge clk) begin
        x = 1;
        y = 1;
    end
    repeat(30) @(negedge clk)
    @(negedge clk) begin
        x = 5;
        y = 5;
    end
    repeat(30) @(negedge clk)
    @(negedge clk) begin
        x = 2;
        y = 3;
    end
    repeat(30) @(negedge clk)
    $finish;
end
endmodule
