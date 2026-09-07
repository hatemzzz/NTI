module decoder_tb;
localparam N = 2;
localparam WIDTH_OUTPUT = 2**N;
 reg [N-1:0] decoder_in;
 reg en ;
 wire [WIDTH_OUTPUT-1:0] decoder_out;

decoder #(
.N(N),
.WIDTH_OUTPUT(WIDTH_OUTPUT))

uut (
    .en(en),
    .decoder_in(decoder_in),
    .decoder_out(decoder_out)
);

initial begin
en = 1'b0; decoder_in = 2'b00; #10;
en = 1'b0; decoder_in = 2'b11; #10;

en=1'b1;

decoder_in= 2'b00 ;#10;
decoder_in= 2'b01 ;#10;
decoder_in= 2'b10 ;#10;
decoder_in= 2'b11 ;#10;

$finish;
end



    
endmodule