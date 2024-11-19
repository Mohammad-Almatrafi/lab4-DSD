
module adder_16bit(
    input cin,
    input [15:0] a,
    input [15:0] b,
    output [15:0] s,
    output cout
    );
    logic co[2:0];
    
    bit_adder a1(.cin(cin),.a(a[3:0]),.b(b[3:0]),.s(s[3:0]),.cout(co[0]));
    bit_adder a2(.cin(co[0]),.a(a[7:4]),.b(b[7:4]),.s(s[7:4]),.cout(co[1]));
    bit_adder a3(.cin(co[1]),.a(a[11:8]),.b(b[11:8]),.s(s[11:8]),.cout(co[2]));
    bit_adder a4(.cin(co[2]),.a(a[15:12]),.b(b[15:12]),.s(s[15:12]),.cout(cout));

endmodule