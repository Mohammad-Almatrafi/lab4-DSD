`timescale 1ns / 1ps

module tb_counter_4bit ();
  logic clk, rst, load, switch;
  logic [3:0] d, q;
  counter_4bit test (
      .clk(clk),
      .rst(rst),
      .load(load),
      .up_down(switch),
      .d(d),
      .q(q)
  );
  initial begin
    rst = 1'b1;
    #1
    rst = 1'b0;
    #2
    clk = 1'b0;
    rst = 1'b1;
    load = 1'b1;
    switch = 1'b0;
    d = 0;

    repeat (36) begin #3 clk = ~clk; d = d+1;end
    load = 1'b0;
    repeat (8) #3 clk = ~clk;
    switch = 1'b1;
    repeat(36) #3 clk = ~clk;
    load = 1'b1;
    
    repeat(8)begin 
        #3 clk = ~clk;
        d = d+1;
    end
    $finish;
  end

endmodule
