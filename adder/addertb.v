module tb_fa2;

reg [1:0] a;
reg [1:0] b;
reg       cin;
wire [1:0] sum_b;
wire       cout_b;


wire [1:0] sum_str;
wire       cout_str;
wire [1:0] sum_gl;
wire       cout_gl;


fa_b uut_b (
.a(a),
.b(b),
.cin(cin),
.sum_b(sum_b),
.cout_b(cout_b)
);


fa2_str uut_str (
.a(a),
.b(b),
.cin(cin),
.sum_str(sum_str),
.cout_str(cout_str)
);


fa2_gl uut_gl (
.a(a),
.b(b),
.cin(cin),
.sum_gl(sum_gl),
.cout_gl(cout_gl)
);


initial begin
a = 2'b00; b = 2'b00; cin = 1'b0; #10;
a = 2'b01; b = 2'b10; cin = 1'b0; #10;
a = 2'b10; b = 2'b10; cin = 1'b0; #10;
a = 2'b01; b = 2'b01; cin = 1'b1; #10;
a = 2'b11; b = 2'b10; cin = 1'b1; #10;
a = 2'b11; b = 2'b11; cin = 1'b1; #10;
$finish;
end

endmodule