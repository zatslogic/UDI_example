# UDI_example
example project using UDI interface

Instruction for running simulation in Modelsim/Questasim:
1. Add folder rtl_up and fill it with its standart filling.
2. Replace files in rtl_up with files from rtl_up_changed.
3. Compile XilinxCorelib using tcl command compile_simlib in vivado console if you need.
    Than make sure its path contains in modelsim.ini or add it to simMIPSfpga.tcl and simMIPSfpga_2.tcl.
4. Run simMIPSfpga.tcl for simulation UDI example or simMIPSfpga_2.tcl for simulation pipelined version.
