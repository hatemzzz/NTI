`timescale 1ns/1ps

module tb_alu_8bit;

    reg  [7:0]  A;
    reg  [7:0]  B;
    reg         Cin;
    reg  [4:0]  Control;
    wire [15:0] Out;

    alu_8bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Control(Control),
        .Out(Out)
    );

    initial begin
        A = 8'hA5;
        B = 8'h03;
        Cin = 1'b0;

        Control = 5'b00000; #10;
        Control = 5'b00001; #10;
        Control = 5'b00010; #10;
        Control = 5'b00011; #10;
        Control = 5'b00100; #10;
        Control = 5'b00101; #10;
        Control = 5'b00110; #10;
        Control = 5'b00111; #10;
        Control = 5'b01000; #10;
        Control = 5'b01001; #10;
        Control = 5'b01010; #10;
        Control = 5'b01011; #10;
        Control = 5'b01100; #10;
        Control = 5'b01101; #10;
        Control = 5'b01110; #10;
        Control = 5'b01111; #10;
        Control = 5'b10000; #10;
        Control = 5'b10001; #10;
        Control = 5'b10010; #10;
        Control = 5'b10011; Cin = 1'b0; #10;
        Control = 5'b10011; Cin = 1'b1; #10;
        Control = 5'b10100; #10;
        Control = 5'b10101; #10;
        Control = 5'b10110; #10;

        A = 8'h55; B = 8'h55;
        Control = 5'b10101; #10;

        #10;
        $finish;
    end

endmodule