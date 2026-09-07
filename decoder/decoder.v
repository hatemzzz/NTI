module decoder #(
    parameter N = 2, parameter WIDTH_OUTPUT = 2**N)
( 
input en,
input [N-1:0] decoder_in,
output [WIDTH_OUTPUT-1:0] decoder_out
);
assign decoder_out = en ? 1'b1<<decoder_in : 0 ; 

endmodule
