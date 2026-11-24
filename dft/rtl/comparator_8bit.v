
`timescale 1ns/1ps

module comparator_8bit (
    input  wire [7:0] A,
    input  wire [7:0] B,
    output wire       GT,
    output wire       EQ,
    output wire       LT
);

    // A greater than B
    assign GT = (A > B);

    // A equal to B
    assign EQ = (A == B);

    // A less than B
    assign LT = (A < B);

endmodule
