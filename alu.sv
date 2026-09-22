module alu #(
    parameter int WIDTH = 8
) (
    input   logic   [WIDTH-1:0]   a,
    input   logic   [WIDTH-1:0]   b,
    input   logic   [2:0]         op,

    output  logic   [WIDTH-1:0] result
);

    always_comb begin : alu_logic
        case (op)
            3'b000: result = a + b;
            3'b001: result = a - b;
            3'b010: result = a & b;
            3'b011: result = a | b;
            3'b100: result = a ^ b;
            3'b101: begin
                result = '0;
                result[0] = (a < b);
            end
            3'b110: result = a << 1;
            3'b111: result = a >> 1;
            
            default: result = '0;
        endcase
    end

endmodule
