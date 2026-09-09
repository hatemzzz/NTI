module shift_register_tb;
localparam WIDTH = 10;
reg clk;
reg rst;
reg hold;
wire [WIDTH - 1 : 0 ] shift_out;

shift_register #(WIDTH)
dut (.*);

    always #5 clk = ~clk;
    initial begin
        clk = 0; 
        $monitor("Time=%0t | rst=%b | hold=%b | out=%b", $time, rst, hold, shift_out);
        
        rst = 1; hold = 0;

        
        rst = 1; hold = 0;
        #5  rst = 0;

        #10 rst = 1;  

        #10 hold = 1;  

        #30 hold = 0; 
       
        #20 hold = 1;    
        
        #50 $finish;     
    end
endmodule