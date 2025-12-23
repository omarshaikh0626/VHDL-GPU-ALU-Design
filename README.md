# Overview
This is my Digital Systems (COE328) Lab 6 Term Project that represents an 8-bit GPU/ALU with Finite-State Machine controls through VHDL programming. 
The design supports opcode based arithmetic, logical, and shift operations tested through waveform and FGPA board simulations.
The following files are correspondant to lab/project requirements, and are specific to my section and other details. 

# Structure
Core ALU structure based on main block diagram schematic
2 Latches: Same code structure/file for both inputs
1 Moore Machine: Sequential current states & Student ID based Moore logic
1 Decoder
1 ALU Core: Handles 9 opcode operations (modified for 2 other versions as per lab requirements)
4 SSEGs: 'Seven Segment Displays' for hexadecimal representation of values presented on FGPA board
