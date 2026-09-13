`timescale 1ns / 1ps

module tb_stream_parity;

    reg clk;
    reg reset;
    reg serial_in;
    
    wire parity_out;
    wire valid;

    stream_parity uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .parity_out(parity_out),
        .valid(valid)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        serial_in = 0;
        
        #10;
        reset = 0;
        
        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 0;
        
        #10 serial_in = 1;
        #10 serial_in = 1;
        
        #30 $stop;
    end

endmodule