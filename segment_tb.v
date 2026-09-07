module segment_tb;

reg [3:0] bin_tb;
wire [6:0] seg_tb;

segment uut(
    .bin(bin_tb),
    .seg(seg_tb)  
);

initial begin
    $monitor("Time = %0t ns | bin = %h (%b) | seg = %b", $time, bin_tb, bin_tb, seg_tb);
    bin_tb = 4'b0000; #10;
    bin_tb = 4'b0001; #10;
    bin_tb = 4'b0100; #10;
    bin_tb = 4'b1110; #10;
    bin_tb = 4'b1000; #10;
    bin_tb = 4'b0101; #10;
    bin_tb = 4'b1001; #10;
    bin_tb = 4'b1011; #10;
    bin_tb = 4'b1111; #10;
    #10;
    $finish;
end

    
endmodule