`timescale 1ps/1ps
`include "egypt_mult.v"
module tb_dsdsddsdd;

    reg [15:0] a;
    reg [15:0] b;
    wire [31:0] d;

    dsdsddsdd uut (
        .a(a),
        .b(b),
        .d(d)
    );
    initial begin
        $dumpvars;
        $dumpfile("code1tb.vcd");
    end

    initial begin
        a = 16'd3;
        b = 16'd2;
        #10;
        $display("a = %d, b = %d, d = %d", a, b, d);

        a = 16'd10;
        b = 16'd5;
        #10;
        $display("a = %d, b = %d, d = %d", a, b, d);

        a = 16'd255;
        b = 16'd255;
        #10;
        $display("a = %d, b = %d, d = %d", a, b, d);

        a = 16'd65535;
        b = 16'd1;
        #10;
        $display("a = %d, b = %d, d = %d", a, b, d);

        a = 16'd0;
        b = 16'd100;
        #10;
        $display("a = %d, b = %d, d = %d", a, b, d);

        a = 16'd500;
        b = 16'd300;
        #10;
        $display("a = %d, b = %d, d = %d", a, b, d);

        $stop;
    end

endmodule
