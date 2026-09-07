module fa_str (
input  wire a,
input  wire b,
input  wire cin,
output wire sum,
output wire cout
);


assign sum  = a ^ b ^ cin;
assign cout = (a & b) | ((a ^ b) & cin);

endmodule


module fa2_str (
input  wire [1:0] a,
input  wire [1:0] b,
input  wire       cin,
output wire [1:0] sum_str,
output wire       cout_str
);

wire c_mid;

fa_str fa0 (
.a   (a[0]),
.b   (b[0]),
.cin (cin),
.sum (sum_str[0]),
.cout(c_mid)
);

fa_str fa1 (
.a   (a[1]),
.b   (b[1]),
.cin (c_mid),
.sum (sum_str[1]),
.cout(cout_str)
);

endmodule