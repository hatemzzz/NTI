module topmodule (
input wire [3:0] main_in,
output wire [6:0] main_out
);
wire [3:0] w1;

gray2binary uu1(
.gray_in(main_in),
.binary_out(w1)
);

segment uu2(
.bin(w1),
.seg(main_out)
);
    
endmodule