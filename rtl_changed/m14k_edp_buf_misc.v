
		
	assign UDI_ir_e[31:0]		= mpc_ir_e		;
	assign UDI_irvalid_e		= mpc_irval_e	;
	assign UDI_rs_e[31:0]		= edp_abus_e	;
	assign UDI_rt_e[31:0]		= edp_bbus_e	;
	assign UDI_endianb_e		= cpz_rbigend_e	;
	assign UDI_kd_mode_e		= cpz_kuc_e		;
	assign UDI_kill_m			= mpc_killmd_m	;
	assign UDI_start_e			= mpc_run_ie	;
	assign UDI_run_m			= mpc_run_m		;
	assign UDI_greset			= greset		;
	assign UDI_gscanenable		= gscanenable	;
	assign UDI_gclk				= gclk			;
	
	assign edp_udi_wrreg_e[4:0]	= UDI_wrreg_e	;
	assign edp_udi_ri_e			= UDI_ri_e		;
	assign edp_udi_stall_m		= UDI_stall_m	;
	assign edp_udi_present		= UDI_present	;
	assign edp_udi_honor_cee	= UDI_honor_cee	;
	//mvp_mux2 #(32) _res_m_31_0_(res_m[31:0],mpc_udislt_sel_m, asp_m, {31'h0, bit0_m});
	mvp_mux2 #(32) _res_m_31_0_(res_m[31:0],mpc_udislt_sel_m, asp_m, UDI_rd_m);




