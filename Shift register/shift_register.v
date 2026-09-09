module shift_register
#(parameter WIDTH = 10) 
(
input clk,
input  rst,
input  hold,
output reg [WIDTH - 1 : 0 ] shift_out
);
always @(posedge clk or negedge rst ) begin
    if (!rst) begin
        shift_out <= {1'b1,{WIDTH-1{1'b0}}};
    end else if (!hold) begin
        shift_out <= shift_out;
    end else begin
        shift_out <= shift_out >> 1;
    end
    
end
endmodule