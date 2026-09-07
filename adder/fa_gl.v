module fa2_gl (
input  wire [1:0] a,
input  wire [1:0] b,
input  wire       cin,
output wire [1:0] sum_gl,
output wire       cout_gl
);


wire axorb0, a_and_b0, cin_and_axorb0, c_mid;


xor g1 (axorb0, a[0], b[0]);
xor g2 (sum_gl[0], axorb0, cin);
and g3 (a_and_b0, a[0], b[0]);
and g4 (cin_and_axorb0, cin, axorb0);
or  g5 (c_mid, a_and_b0, cin_and_axorb0);


wire axorb1, a_and_b1, cin_and_axorb1;


xor g6 (axorb1, a[1], b[1]);
xor g7 (sum_gl[1], axorb1, c_mid);
and g8 (a_and_b1, a[1], b[1]);
and g9 (cin_and_axorb1, c_mid, axorb1);
or  g10 (cout_gl, a_and_b1, cin_and_axorb1);

endmodule