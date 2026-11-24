
`timescale 1ns/1ps

module comparator_8bit_scan (
    input  wire clk,
    input  wire rst_n,
    input  wire scan_en,
    input  wire scan_in,

    input  wire [7:0] A,
    input  wire [7:0] B,

    output wire GT,
    output wire EQ,
    output wire LT,
    output wire scan_out
);

    // 19-bit scan chain:
    // [18:3] = Input scan registers
    // [2:0]  = Output scan registers

    reg [18:0] scan_chain;

    wire [7:0] cmp_A;
    wire [7:0] cmp_B;

    wire cmp_GT;
    wire cmp_EQ;
    wire cmp_LT;

    // Scan register assignments
    assign cmp_A = scan_chain[18:11];
    assign cmp_B = scan_chain[10:3];

    // Original 8-bit comparator
    comparator_8bit DUT (
        .A  (cmp_A),
        .B  (cmp_B),
        .GT (cmp_GT),
        .EQ (cmp_EQ),
        .LT (cmp_LT)
    );

    // Scan shift and functional capture
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            scan_chain <= 19'b0;
        end
        else if (scan_en) begin
            // Shift serial test data into chain
            scan_chain <= {scan_chain[17:0], scan_in};
        end
        else begin
            // Load functional inputs and capture outputs
            scan_chain[18:11] <= A;
            scan_chain[10:3]  <= B;

            scan_chain[2] <= cmp_GT;
            scan_chain[1] <= cmp_EQ;
            scan_chain[0] <= cmp_LT;
        end
    end

    // Registered comparator outputs
    assign GT = scan_chain[2];
    assign EQ = scan_chain[1];
    assign LT = scan_chain[0];

    // Serial scan output
    assign scan_out = scan_chain[18];

endmodule
