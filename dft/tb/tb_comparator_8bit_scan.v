
`timescale 1ns/1ps

module tb_comparator_8bit_scan;

    reg clk;
    reg rst_n;
    reg scan_en;
    reg scan_in;

    reg [7:0] A;
    reg [7:0] B;

    wire GT, EQ, LT;
    wire scan_out;

    integer errors;
    integer tests;
    integer i;

    reg [18:0] test_pattern;
    reg [18:0] shifted_data;
    reg [2:0] expected_result;

    comparator_8bit_scan DUT (
        .clk(clk),
        .rst_n(rst_n),
        .scan_en(scan_en),
        .scan_in(scan_in),
        .A(A),
        .B(B),
        .GT(GT),
        .EQ(EQ),
        .LT(LT),
        .scan_out(scan_out)
    );

    // 100 MHz simulation clock
    initial clk = 0;
    always #5 clk = ~clk;

    // Shift a 19-bit pattern into the scan chain
    task scan_load;
        input [18:0] pattern;
        integer j;
        begin
            scan_en = 1;

            for (j = 18; j >= 0; j = j - 1) begin
                @(negedge clk);
                scan_in = pattern[j];
            end

            @(negedge clk);
            scan_en = 0;
        end
    endtask

    // Capture comparator response
    task capture_response;
        begin
            @(posedge clk);
            #1;
        end
    endtask

    // Shift out all 19 scan bits, MSB first
    task scan_unload;
        output [18:0] data;
        integer j;
        begin
            scan_en = 1;

            for (j = 18; j >= 0; j = j - 1) begin
                @(negedge clk);
                data[j] = scan_out;
                scan_in = 0;
            end

            @(negedge clk);
            scan_en = 0;
        end
    endtask

    // Run one scan test
    task run_test;
        input [7:0] test_A;
        input [7:0] test_B;

        begin
            A = test_A;
            B = test_B;

            // Scan chain: A, B, output register bits
            test_pattern = {test_A, test_B, 3'b000};

            scan_load(test_pattern);

            // Expected GT, EQ, LT
            expected_result = {
                (test_A > test_B),
                (test_A == test_B),
                (test_A < test_B)
            };

            capture_response();

            if ({GT, EQ, LT} !== expected_result) begin
                $display("FAIL: A=%d B=%d Expected=%b Got=%b",
                    test_A, test_B,
                    expected_result, {GT, EQ, LT});
                errors = errors + 1;
            end
            else begin
                $display("PASS: A=%d B=%d GT=%b EQ=%b LT=%b",
                    test_A, test_B, GT, EQ, LT);
            end

            scan_unload(shifted_data);

            if (shifted_data[2:0] !== expected_result) begin
                $display("SCAN FAIL: Expected=%b Got=%b",
                    expected_result, shifted_data[2:0]);
                errors = errors + 1;
            end

            tests = tests + 1;
        end
    endtask

    initial begin

        $dumpfile("sim/comparator_dft.vcd");
        $dumpvars(0, tb_comparator_8bit_scan);

        clk = 0;
        rst_n = 0;
        scan_en = 0;
        scan_in = 0;

        A = 0;
        B = 0;

        errors = 0;
        tests = 0;

        #20;
        rst_n = 1;

        // Directed test cases
        run_test(8'd100, 8'd50);
        run_test(8'd25, 8'd25);
        run_test(8'd10, 8'd80);
        run_test(8'd255, 8'd0);
        run_test(8'd0, 8'd255);
        run_test(8'd128, 8'd127);
        run_test(8'd127, 8'd128);

        // Random test cases
        for (i = 0; i < 20; i = i + 1) begin
            run_test($random, $random);
        end

        $display("-----------------------------------");
        $display("Total Tests : %0d", tests);
        $display("Total Errors: %0d", errors);

        if (errors == 0)
            $display("DFT SCAN TEST: PASS");
        else
            $display("DFT SCAN TEST: FAIL");

        $finish;
    end

endmodule
