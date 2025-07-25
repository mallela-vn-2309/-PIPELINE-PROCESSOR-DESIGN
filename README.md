# -PIPELINE-PROCESSOR-DESIGN
COMPANY: COOTECH IT SOLUTIONS
NAME: MALLELA VEERANIKHITHA
INTERN ID: CT08DF2955
DOMAIN: VLSI
DURATION: 2 MONTHS
MENTOR: NEELA SANTOSH

📌 Objective
The primary goal of this task was to simulate a 4-stage pipelined processor that performs basic operations like increment (INC), decrement (DEC), shift left (SHL), and shift right (SHR) on 4-bit operands. This project aims to strengthen the understanding of pipeline architecture and how instructions move through different processing stages in a typical CPU. The project also involved writing a Verilog RTL model and testbench, running simulations, and observing timing behavior using ModelSim.

🛠️ Project Overview
Pipelining is a fundamental concept in modern processor design. Instead of executing instructions sequentially, pipelining overlaps instruction execution across multiple stages to improve throughput. In this project, a simplified pipelined processor was created with the following four stages:

Instruction Fetch (IF): Captures the 8-bit instruction from the input.

Instruction Decode (ID): Separates the opcode (bits [7:4]) and operand (bits [3:0]).

Execute (EX): Performs the actual operation (INC, DEC, SHL, SHR).

Writeback (WB): Stores the result and drives the final output.

The 8-bit instruction format includes:

Opcode (4 MSBs): Selects the operation

Operand (4 LSBs): Value for the operation

Example:

0001_0010 → Opcode 0001 (INC), Operand 0010 (2)

🧪 Simulation and Testing
The processor module was designed in Verilog using always blocks for each stage, triggered on the positive edge of the clock. Four pipeline registers (IF_ID, ID_EX, EX_MEM, MEM_WB) were used to hold data between stages.

The testbench created clock and reset signals and applied four instructions with delays:

0001_0010 → INC 2

0010_0100 → DEC 4

0011_0011 → SHL 3

0100_1000 → SHR 8

After each instruction, a short delay was introduced to observe the output after all stages.

ModelSim was used to compile and simulate the design. The waveform showed the clock, reset, instruction input (instr_in), and output (result_out) signals. The outputs verified that operations were executed correctly with appropriate pipeline delays.

📈 Results and Output
The waveform viewer clearly showed how instructions passed through the pipeline. Key observations included:

Each result appears after 3 clock cycles due to pipeline latency.

All arithmetic and shift operations produced the correct output.

Final output remained stable when NOP (0000_0000) was applied.

For example:

INC 2 produced 3

DEC 4 produced 3

SHL 3 produced 6

SHR 8 produced 4

🧰 Tools and Technologies
Verilog HDL: RTL and testbench design

ModelSim: Simulation and waveform analysis

Waveform Viewer: Visual confirmation of pipeline delays and result accuracy

✅ Conclusion
This project effectively demonstrated a basic pipelined processor design. It introduced core concepts such as instruction staging, operation decoding, and execution with proper timing. By analyzing the simulation output and waveform, I gained hands-on experience with pipelining and better understood how processors achieve instruction-level parallelism. This task laid a solid foundation for future complex designs like multi-cycle datapaths, branching logic, and instruction memory integration.

