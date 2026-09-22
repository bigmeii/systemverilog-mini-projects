module alu_tb;
    parameter int WIDTH = 8;

    logic   [WIDTH-1:0]   a;
    logic   [WIDTH-1:0]   b;
    logic   [2:0]         op;
    logic   [WIDTH-1:0] result;

    alu #(
        .WIDTH(WIDTH)
    ) dut (
        .a(a),
        .b(b),
        .op(op),
        .result(result)
    );

    initial begin
        check(8'd5, 8'd3, 3'b000, 8'd8); //ADD
        check(8'd10, 8'd4, 3'b001, 8'd6); //SUB
        check(8'b11001100, 8'b10101010, 3'b010, 8'b10001000); //AND
        check(8'b11001100, 8'b10101010, 3'b011, 8'b11101110); //OR

        $display("All tests completed.");
    end

    task check(
        input   logic   [WIDTH-1:0]     test_a,
        input   logic   [WIDTH-1:0]     test_b,
        input   logic   [2:0]           test_op,
        input   logic   [WIDTH-1:0]     expected
    );

    begin
        a = test_a;
        b = test_b;
        op = test_op;

        #1;

        if (result !== expected) begin
            $error("FAIL: a=%0d b=%0d op=%b expected=%0d got=%0d", a, b, op, expected, result);
        end
        else begin
            $display("PASS: a=%0d b=%0d op=%b result=%0d", a, b, op, result);
        end
    end
    endtask
endmodule
