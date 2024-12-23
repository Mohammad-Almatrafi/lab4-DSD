`timescale 1ns / 1ps

// `include "FlipFlopLabs.srcs/sources_1/new/counter_nbit.sv"
module tb_counter_nbit;
  logic clk, rst, en, load, switch;
  logic [3:0] d, q;
  counter_nbit test (
      .clk(clk),
      .rst(rst),
      .en(en),
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
    en = 1'b1;
    load = 1'b0;
    switch = 1'b0;
    d = 0;

    repeat (36) #3 clk = ~clk;
    en = 1'b0;
    repeat (8) #3 clk = ~clk;
    en = 1'b1;
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
