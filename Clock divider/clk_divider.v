module clk_divider #(
    parameter integer CLK_IN_FREQ  = 50_000_000,
    parameter integer CLK_OUT_FREQ = 8
) (
    input  wire clk_50m,
    input  wire reset_n,
    output reg  clk_out
);

    localparam integer DIVISOR = CLK_IN_FREQ / (CLK_OUT_FREQ * 2);
    localparam integer CNT_WIDTH = (DIVISOR <= 1) ? 1 : $clog2(DIVISOR);

    reg [CNT_WIDTH-1:0] counter;

    always @(posedge clk_50m or negedge reset_n) begin
        if (!reset_n) begin
            counter <= {CNT_WIDTH{1'b0}};
            clk_out <= 1'b0;
        end else begin
            if (counter == DIVISOR-1) begin
                counter <= {CNT_WIDTH{1'b0}};
                clk_out <= ~clk_out;
            end else begin
                counter <= counter + 1'b1;
            end
        end
    end

endmodule