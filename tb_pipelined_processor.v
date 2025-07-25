module tb_pipelined_processor;

    reg clk, rst;
    reg [7:0] instr_in;
    wire [7:0] result_out;

    pipelined_processor DUT (
        .clk(clk),
        .rst(rst),
        .instr_in(instr_in),
        .result_out(result_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        rst = 1;
        instr_in = 8'd0;
        #10 rst = 0;

        instr_in = 8'b0001_0010; #10; // INC 2 -> 3
        instr_in = 8'b0010_0100; #10; // DEC 4 -> 3
        instr_in = 8'b0011_0011; #10; // SHL 3 -> 6
        instr_in = 8'b0100_1000; #10; // SHR 8 -> 4

        instr_in = 8'b0000_0000; #50; // NOP, idle

        $finish;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t | rst=%b | instr_in=%b | result_out=%d",
                 $time, rst, instr_in, result_out);
    end

endmodule
