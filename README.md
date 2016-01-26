# UDI_example
Example project using UDI interface.
It is described in the post http://zatslogic.blogspot.ru/2016/01/using-mips-microaptiv-up-processor.html.


Instruction for running simulation in Modelsim/Questasim:

1. Add folder rtl_up and fill it with its standart filling.

2. Replace in file m14k_udi_stub.v in rtl_up all lines after inputs/outputs block to endmodule keyword with content from file m14k_udi_stub.v from rtl_up_changed. Replace in file m14k_edp_buf_misc.v in rtl_up all lines after wire block to endmodule keyword with content from file m14k_udi_stub.v from rtl_up_changed.

3. Compile XilinxCorelib using tcl command compile_simlib in vivado console if you need.
    Than make sure its path contains in modelsim.ini or add it to simMIPSfpga.tcl and simMIPSfpga_2.tcl.

4. Run simMIPSfpga.tcl for simulation UDI example or simMIPSfpga_2.tcl for simulation pipelined version.
