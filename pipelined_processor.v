module pipelined_processor (
    input clk,
    input rst,
    input [7:0] instr_in,
    output reg [7:0] result_out
);

    reg [7:0] IF_ID, ID_EX, EX_MEM, MEM_WB;
    reg [7:0] alu_out;

    wire [3:0] opcode = ID_EX[7:4];
    wire [3:0] operand = ID_EX[3:0];

    // Stage 1: Instruction Fetch
    always @(posedge clk or posedge rst) begin
        if (rst)
            IF_ID <= 8'd0;
        else
            IF_ID <= instr_in;
    end

    // Stage 2: Instruction Decode
    always @(posedge clk or posedge rst) begin
        if (rst)
            ID_EX <= 8'd0;
        else
            ID_EX <= IF_ID;
    end

    // Stage 3: Execute
    always @(posedge clk or posedge rst) begin
        if (rst)
            EX_MEM <= 8'd0;
        else begin
            case (opcode)
                4'b0001: alu_out = operand + 1;   // INC
                4'b0010: alu_out = operand - 1;   // DEC
                4'b0011: alu_out = operand << 1;  // SHL
                4'b0100: alu_out = operand >> 1;  // SHR
                default: alu_out = 8'd0;          // NOP or invalid
            endcase

            EX_MEM <= alu_out;
        end
    end

    // Stage 4: Writeback
    always @(posedge clk or posedge rst) begin
        if (rst)
            MEM_WB <= 8'd0;
        else
            MEM_WB <= EX_MEM;
    end

    // Output assignment
    always @(*) begin
        result_out = MEM_WB;
    end

endmodule
