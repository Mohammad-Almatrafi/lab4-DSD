`timescale 1ns / 1ps

module bit_adder(
    input cin,
    input [3:0] a,
    input [3:0] b,
    output [3:0] s,
    output cout
    );
    
    logic [2:0] c;
    full_adder fa1(a[0],b[0],cin,s[0],c[0]);
    full_adder fa2(a[1],b[1],c[0],s[1],c[1]);
    full_adder fa3(a[2],b[2],c[1],s[2],c[2]);
    full_adder fa4(a[3],b[3],c[2],s[3],cout);
 
endmodule
