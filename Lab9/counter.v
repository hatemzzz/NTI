module counter #(parameter WIDTH = 5 )(
    input wire [WIDTH - 1 : 0] cnt_in,
    input wire rst , load , enab , clk 
    output reg [WIDTH - 1 : 0] cnt_out
);
reg [WIDTH-1:0] cnt_next;
always @(posedge clk ) begin
   

end
endmodule