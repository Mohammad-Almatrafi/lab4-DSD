`timescale 1ns / 1ps

module DLatch (

    input  en,
    input  d,
    input  rst,
    output q,
    output nq
);

  assign q = en || ~rst ? d & rst : q & rst;
  assign nq = ~q;
endmodule
