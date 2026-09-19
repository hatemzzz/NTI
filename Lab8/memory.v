module memory#(
    parameter AWIDTH = 5 ,parameter DWIDTH = 8
) (
    input wire      clk,wr,rd,
    input           [AWIDTH - 1 : 0] addr,
    inout  wire     [DWIDTH-1:0] data
);

reg [DWIDTH-1:0] mem [0:(2**AWIDTH)-1];

always @(posedge clk ) begin
    if (wr) begin
        mem[addr] <= data;
    end    
end

assign data = rd ? mem[addr] : 'bz;

endmodule