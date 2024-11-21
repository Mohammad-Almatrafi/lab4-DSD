`timescale 1ns / 1ps

module tb_counter_4bit ();
  logic clk = 0;
  logic rst, load,  switch;
  logic [3:0] d, q;
  counter_4bit test (
      .clk(clk),
      .rst(rst),
      .load(load),
      .up_down(switch),
      .d(d),
      .q(q)
  );
  always #5 clk = ~clk;
  initial begin
    rst = 1;
    load = 0;
    d = 0;
    switch = 0;

    #5 rst = 0;
    #5 rst = 1;

    repeat (18) @(negedge clk);

    @(negedge clk) rst = 0;

    @(negedge clk) begin
      rst = 1;
      switch = 1;
    end

    repeat (18) @(negedge clk);

    @(negedge clk) load = 1;
    
    @(negedge clk) d = 3;
    @(negedge clk) load = 0;
    
    @(negedge clk) d = 8;
    repeat (18) @(negedge clk);

    @(negedge clk) $finish;
  end

endmodule
