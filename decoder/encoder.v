module encoder (
input en,
input [3:0] enc_in,
output reg [1:0] enc_out
);
always @(*) begin
    if (!en) begin
        enc_out = 2'b00;
    end else begin
        case (enc_in)
            4'b0001: enc_out=2'b00;
            4'b0010: enc_out=2'b01;
            4'b0100: enc_out=2'b10;
            4'b1000: enc_out=2'b11;
            default: enc_out=2'b00;
        endcase  
    end
end
endmodule