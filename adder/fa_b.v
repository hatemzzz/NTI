module fa_b (
input [1:0] a,b,
output reg [1:0] sum_b,
input cin,
output reg cout_b
);

always @(*) begin

{cout_b,sum_b} = a+b+cin;

end 
endmodule