module alu_8bit (
    input  wire [7:0]  A,
    input  wire [7:0]  B,
    input  wire        Cin,
    input  wire [4:0]  Control,
    output reg  [15:0] Out
);

    always @(*) begin
        Out = 16'h0000;
        case (Control)
            5'b00000: Out = A + B;                                         
            5'b00001: Out = A + B + 1'b1;                                  
            5'b00010: Out = A + (~B) + 1'b1;                               
            5'b00011: Out = A + (~B);                                      
            5'b00100: Out = A + 1'b1;                                      
            5'b00101: Out = A - 1'b1;                                      
            5'b00110: Out = (A * B) + 1'b1;                                
            5'b00111: Out = A & B;                                         
            5'b01000: Out = A | B;                                         
            5'b01001: Out = A ^ B;                                         
            5'b01010: Out = ~A;                                            
            5'b01011: Out = ~(A & B);                                      
            5'b01100: Out = (B[2:0] < 8) ? {8'h00, (A << B[2:0])} : 16'h0; 
            5'b01101: Out = A >> B[2:0];                                   
            5'b01110: Out = A <<< B[2:0];                                  
            5'b01111: Out = $signed(A) >>> B[2:0];                         
            5'b10000: Out = {8'h00, (A >> B[2:0]) | (A << (8 - B[2:0]))};  
            5'b10001: Out = {8'h00, (A << B[2:0]) | (A >> (8 - B[2:0]))};  
            5'b10010: Out = {8'h00, (A >= B ? A : B)};                     
            5'b10011: Out = Cin ? {8'h00, B} : {8'h00, A};                 
            5'b10100: Out = {~B, ~A};                                      
            5'b10101: Out = {10'd0, (A >= B), (A > B), (A == B), (A <= B), (A < B), (A != B)};
            5'b10110: Out = {14'd0, ~(^B), ^A};                             
            default:  Out = 16'h0000;
        endcase
    end

endmodule