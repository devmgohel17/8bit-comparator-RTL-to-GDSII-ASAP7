
`timescale 1ns/1ps

module tb_comparator_8bit;

    reg  [7:0] A;
    reg  [7:0] B;

    wire GT;
    wire EQ;
    wire LT;

    integer i;
    integer errors;

    comparator_8bit DUT (
        .A(A),
        .B(B),
        .GT(GT),
        .EQ(EQ),
        .LT(LT)
    );

    task check;
        input [7:0] a_val;
        input [7:0] b_val;
        begin
            A = a_val;
            B = b_val;
            #10;

            if ((GT !== (A > B)) ||
                (EQ !== (A == B)) ||
                (LT !== (A < B))) begin

                $display("FAIL: A=%d B=%d GT=%b EQ=%b LT=%b",
                         A, B, GT, EQ, LT);
                errors = errors + 1;

            end
            else begin
                $display("PASS: A=%d B=%d GT=%b EQ=%b LT=%b",
                         A, B, GT, EQ, LT);
            end
        end
    endtask

    initial begin

        $dumpfile("designs/src/comparator_8bit/sim/comparator.vcd");
        $dumpvars(0, tb_comparator_8bit);

        errors = 0;

        // Basic comparison tests
        check(8'd25, 8'd10);
        check(8'd10, 8'd25);
        check(8'd50, 8'd50);

        // Boundary conditions
        check(8'd255, 8'd0);
        check(8'd0, 8'd255);
        check(8'd255, 8'd255);
        check(8'd0, 8'd0);

        // Additional test cases
        check(8'd128, 8'd127);
        check(8'd100, 8'd200);
        check(8'd75, 8'd75);

        // Random verification
        for (i = 0; i < 100; i = i + 1) begin
            check($random, $random);
        end

        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TEST FAILED: %0d errors", errors);

        $finish;
    end

endmodule
