udi_top	udi_top_u(
	.UDI_ir_e		(	UDI_ir_e			),	//input	[31:0]								
	.UDI_irvalid_e	(	UDI_irvalid_e		),	//input										
	.UDI_rs_e		(	UDI_rs_e			),	//input	[31:0]								
	.UDI_rt_e		(	UDI_rt_e			),	//input	[31:0]								
	.UDI_endianb_e	(	UDI_endianb_e		),	//input										
	.UDI_kd_mode_e	(	UDI_kd_mode_e		),	//input										
	.UDI_kill_m		(	UDI_kill_m			),	//input										
	.UDI_start_e	(	UDI_start_e			),	//input										
	.UDI_run_m		(	UDI_run_m			),	//input										
	.UDI_greset		(	UDI_greset			),	//input	 									
	.UDI_gclk		(	UDI_gclk			),	//input	 									
	.UDI_gscanenable(	UDI_gscanenable		),	//input										
	.UDI_rd_m		(	UDI_rd_m			),	//output	[31:0]								
	.UDI_wrreg_e	(	UDI_wrreg_e			),	//output	[4:0]								
	.UDI_ri_e		(	UDI_ri_e			),	//output										
	.UDI_stall_m	(	UDI_stall_m			),	//output										
	.UDI_present	(	UDI_present			),	//output										
	.UDI_honor_cee	(	UDI_honor_cee		),	//output										
	.UDI_toudi		(	UDI_toudi			),	//input	[`M14K_UDI_EXT_TOUDI_WIDTH-1:0]		
	.UDI_fromudi	(	UDI_fromudi			)	//output	[`M14K_UDI_EXT_FROMUDI_WIDTH-1:0]	
);

