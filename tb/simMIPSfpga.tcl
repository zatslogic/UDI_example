if [file exists work] {
    vdel -lib ./work -all
}
vlib work
vlib mult_gen_v11_2

vmap work work
vmap mult_gen_v11_2 mult_gen_v11_2

#simulation requires xilinxcorelib
#vmap xilinxcorelib path_to_xilinxcorelib

vcom		-work	xilinxcorelib	../core_project/core_project/core_project.srcs/sources_1/ip/mult_16_x_16_res_32/mult_gen_v11_2/simulation/mult_gen_pkg_v11_2.vhd
vcom		-work	xilinxcorelib	../core_project/core_project/core_project.srcs/sources_1/ip/mult_16_x_16_res_32/mult_gen_v11_2/simulation/mult_gen_v11_2_comp.vhd
vcom		-work	mult_gen_v11_2	../core_project/core_project/core_project.srcs/sources_1/ip/mult_16_x_16_res_32/mult_gen_v11_2/simulation/mult_gen_v11_2_xst_comp.vhd
vcom		-work	mult_gen_v11_2	../core_project/core_project/core_project.srcs/sources_1/ip/mult_16_x_16_res_32/mult_gen_v11_2/simulation/mult_gen_v11_2_xst.vhd
vcom		-work	mult_gen_v11_2	../core_project/core_project/core_project.srcs/sources_1/ip/mult_16_x_16_res_32/mult_gen_v11_2/simulation/mult_gen_v11_2.vhd
vcom		-work	work	./ip/*.vhd
vlog		-work	work	../udi/*.v +incdir+../rtl_up
vlog		-work	work	../rtl_up/*.v +incdir+../rtl_up

#vsim -novopt -t 1ps testbench
vsim -novopt -t 1ps testbench_boot


view wave
view structure
view signals

do wave.do
run -all

