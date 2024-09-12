
module dsdsddsdd(a, b, d);
    input [15:0] a;
    input [15:0] b;
    output reg [31:0] d;

    // Declare wires for internal connections
    wire [31:0] c [15:0]; // Partial products
    wire [31:0] sum [15:0]; // Summation of partial products
    
    // AND gates for bit-wise multiplication
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : AND_gates
            assign c[i] = b * a[i];  // Each partial product is b shifted by i if a[i] is 1
        end
    endgenerate
    
    // Adders to accumulate the partial products
    assign sum[0] = c[0]; // First partial product
    
    generate
        for (i = 1; i < 16; i = i + 1) begin : shift_add
            assign sum[i] = sum[i-1] + (c[i] << i); // Add partial product shifted by i
        end
    endgenerate
    
    // Final output
    always @(*) begin
        d = sum[15]; // Final summation result
    end
endmodule 
