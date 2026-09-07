module topmodule_tb;
reg [3:0] main_in_tb;
wire [6:0] main_out_tb;

topmodule uu3(
    .main_in(main_in_tb),
    .main_out(main_out_tb)
);

integer i;

initial begin
    $monitor("Time = %0t ns | Gray In = %b | 7-Seg Out = %b", $time, main_in_tb, main_out_tb);

    for (i = 0; i < 16; i = i + 1) begin
        main_in_tb = i[3:0];
        #10;
    end

    #10;
    $finish;
end

endmodule
