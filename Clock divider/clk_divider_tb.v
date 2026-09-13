`timescale 1ns/1ps

module tb_clk_divider;

    localparam integer TB_CLK_IN_FREQ  = 32;
    localparam integer TB_CLK_OUT_FREQ = 4;
    localparam integer TB_DIVISOR      = TB_CLK_IN_FREQ / (TB_CLK_OUT_FREQ * 2);

    localparam CLK_PERIOD = 20;

    reg clk_50m;
    reg reset_n;
    wire clk_out;

    integer edge_count;
    time    t_last_edge;
    time    t_this_edge;

    clk_divider #(
        .CLK_IN_FREQ  (TB_CLK_IN_FREQ),
        .CLK_OUT_FREQ (TB_CLK_OUT_FREQ)
    ) dut (
        .clk_50m (clk_50m),
        .reset_n (reset_n),
        .clk_out (clk_out)
    );

    initial clk_50m = 1'b0;
    always #(CLK_PERIOD/2) clk_50m = ~clk_50m;

    initial begin
        $display("---------------------------------------------------");
        $display("TB start: CLK_IN=%0d (scaled), CLK_OUT=%0d (scaled)", TB_CLK_IN_FREQ, TB_CLK_OUT_FREQ);
        $display("Expected half-period (in clk_50m cycles) = %0d", TB_DIVISOR);
        $display("---------------------------------------------------");

        reset_n     = 1'b0;
        edge_count  = 0;
        t_last_edge = 0;

        repeat (3) @(posedge clk_50m);

        if (clk_out !== 1'b0)
            $display("FAIL: clk_out not 0 during reset at time %0t", $time);
        else
            $display("PASS: clk_out held low during reset");

        #(CLK_PERIOD/4);
        reset_n = 1'b1;
        $display("Reset released at time %0t", $time);

        repeat (TB_DIVISOR * 2 * 6) @(posedge clk_50m);

        $display("---------------------------------------------------");
        if (edge_count >= 4)
            $display("PASS: observed %0d clk_out toggle edges", edge_count);
        else
            $display("FAIL: only observed %0d clk_out toggle edges", edge_count);
        $display("TB complete at time %0t", $time);
        $display("---------------------------------------------------");
        $finish;
    end

    always @(clk_out) begin
        t_this_edge = $time;
        if (edge_count > 0) begin
            if (t_last_edge != 0) begin
                if (edge_count > 1) begin
                    if ((t_this_edge - t_last_edge) !== (TB_DIVISOR * CLK_PERIOD))
                        $display("WARN: half-period=%0t ns at edge %0d (expected %0d ns)",
                                  t_this_edge - t_last_edge, edge_count, TB_DIVISOR * CLK_PERIOD);
                    else
                        $display("PASS: half-period=%0t ns matches expected at edge %0d",
                                  t_this_edge - t_last_edge, edge_count);
                end
            end
        end
        t_last_edge = t_this_edge;
        edge_count  = edge_count + 1;
    end

    initial begin
        $dumpfile("tb_clk_divider.vcd");
        $dumpvars(0, tb_clk_divider);
    end

endmodule