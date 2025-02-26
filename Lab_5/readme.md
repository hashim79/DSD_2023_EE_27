README: Seven Segment Display using K-Maps

Overview

This project involves designing a combinational circuit for a seven-segment display using Karnaugh Maps (K-Maps) for logic minimization. The implementation is done using SystemVerilog and synthesized on an FPGA.

Files Included

constraints.xdc - FPGA pin assignments for segment control and anode selection.

seven_segment.sv - SystemVerilog code implementing the seven-segment decoder.

seven_segment_tb.sv - Testbench for simulation of the seven-segment display.

report.pdf - Detailed report including truth tables, K-Maps, and synthesis results.

Setup and Installation

Install Xilinx Vivado and QuestaSim for synthesis and simulation.

Load the SystemVerilog files into the Vivado project.

Assign FPGA pins using constraints.xdc.

Simulation and Synthesis

Simulation:

Open QuestaSim and compile seven_segment_tb.sv.

Run the testbench and verify the output waveforms.

Synthesis:

Use Xilinx Vivado to synthesize the design.

Generate the bitstream and program the FPGA board.

Expected Outcome

The seven-segment display should correctly display hexadecimal characters (0-F).

The minimized logic should optimize resource usage on the FPGA.





