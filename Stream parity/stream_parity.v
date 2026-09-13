module stream_parity(
    input clk,reset,serial_in,
    output reg parity_out,valid
);

reg [7:0] window;
reg [3:0] count;
function [7:0] shift_window(input [7:0] current_window, input new_bit);
    begin
        shift_window = {current_window[6:0],new_bit};
    end
endfunction

function parity(input [7:0] data);
    begin
        parity= ^data;
    end
endfunction

always @(posedge clk ) begin

if (reset) begin
        parity_out<=1'b0;
        valid <= 1'b0;
        window <=8'b0;
        count <= 4'b0;
end else begin
    window <= shift_window(window,serial_in);
    parity_out<= parity(shift_window(window,serial_in));
    if (count < 4'd8 ) begin
        count <= count + 1'b1;
    end
    if (count == 4'd8) begin
        valid <= 1'b1;
    end
end
    end
endmodule