# Lab 7: Seven Segment Display Decoder Implementation  

## Objective  
The objective of this lab is to design and implement a seven-segment display decoder using SystemVerilog. The decoder will convert a 4-bit binary-coded decimal (BCD) input into the appropriate signals to drive a seven-segment display, enabling the representation of hexadecimal digits (0-F).  

## Directory Structure  
- **/constraints/** - FPGA pin assignment files  
- **/docs/** - Documentation related to the project  
- **/rtl/** - SystemVerilog source files for the seven-segment decoder  
- **/testbench/** - Testbench files for simulation  

## Pre-Lab Preparation  
Before proceeding with the lab, ensure you have:  
- Reviewed the operation and structure of seven-segment displays.  
- Installed Xilinx Vivado for synthesis and QuestaSim for simulation.  
- Familiarized yourself with SystemVerilog syntax relevant to combinational circuit design.  

## Materials and Equipment  
- Xilinx Vivado for synthesis  
- QuestaSim for simulation  
- FPGA development board (e.g., Basys 3 or Nexys A7)  
- SystemVerilog source files (`rtl/`) and testbench files (`testbench/`)  
- FPGA pin constraints file (`constraints/`)  

## Procedure  

### 1. Design Phase  
- Develop a truth table mapping 4-bit BCD inputs to the corresponding seven-segment outputs for hexadecimal digits 0-F.  
- Derive the combinational logic expressions for each of the seven segments based on the truth table.  

### 2. Implementation Phase  
- Write SystemVerilog code for the seven-segment decoder using the derived logic expressions and place them in the `rtl/` directory.  
- Define FPGA pin assignments using the files in the `constraints/` directory.  

### 3. Simulation and Testing  
- Load the testbench files from the `testbench/` directory into QuestaSim.  
- Run the testbench to simulate the decoder's behavior and verify that the output waveforms match the
