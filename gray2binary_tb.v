module gray2binary_tb;
reg [3:0] tbgray_in;
wire [3:0] tbbinary_out;

gray2binary uut (
.gray_in(tbgray_in),
.binary_out(tbbinary_out)
);

initial begin
tbgray_in = 4'b0000; #10;
tbgray_in = 4'b0001; #10;
tbgray_in = 4'b0010; #10;
tbgray_in = 4'b0100; #10;
tbgray_in = 4'b1000; #10;
tbgray_in = 4'b0110; #10;
tbgray_in = 4'b1100; #10;
end
endmodule