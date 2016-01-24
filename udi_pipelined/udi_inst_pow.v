module	udi_udi_inst_pow	(
	input					gclk				,
	input					gscanenable			,
	input		[31:0]		in_rs				,
	input		[15:0]		in_rt				,
	output		[31:0]		out_rd				,
	input					udi_ctl_thr_wr		,
	input		[1:0]		udi_ctl_sum_mode	,
	input					udi_ctl_res_sel		
);

	wire	[31:0]	mult_i_out		;
	wire	[31:0]	mult_q_out		;
	wire	[31:0]	mult_i_out_d	;
	wire	[31:0]	mult_q_out_d	;
	wire	[31:0]	threshold		;
	wire	[32:0]	sum				;
	wire	[31:0]	sum_out			;
	wire	[31:0]	sum_out_d		;
	wire			comp_res		;
	
	localparam	CTL_SUM_MODE_NONE		=	2'b00	;
	localparam	CTL_SUM_MODE_SUM		=	2'b01	;
	localparam	CTL_SUM_MODE_SUMSHIFT	=	2'b10	;
	localparam	CTL_SUM_MODE_BYPASS		=	2'b11	;
	
	assign	sum			=	mult_i_out_d	+	mult_q_out_d						;
	assign	comp_res	=	(sum_out_d	>	threshold)	?	1'b1	:	1'b0		;
	assign	out_rd		=	(udi_ctl_res_sel)	?	{30'd0,comp_res}	:	sum_out_d	;
	
	assign	sum_out	=	(udi_ctl_sum_mode	==	CTL_SUM_MODE_SUM)		?	sum[31:0]	:
						(udi_ctl_sum_mode	==	CTL_SUM_MODE_SUMSHIFT)	?	sum[32:1]	:
						(udi_ctl_sum_mode	==	CTL_SUM_MODE_BYPASS)	?	mult_i_out	:	32'd0	;
	
	mvp_cregister_wide #(32) _udi_thr_31_0_(threshold, gscanenable,  udi_ctl_thr_wr, gclk, in_rs);
	mvp_register #(32) _udi_mul_1_31_0_(mult_i_out_d, gclk, mult_i_out);
	mvp_register #(32) _udi_mul_2_31_0_(mult_q_out_d, gclk, mult_q_out);
	mvp_register #(32) _udi_sum_out_31_0_(sum_out_d, gclk, sum_out);
	
	mult_16_x_16_res_32 mult_16_x_16_res_32_u1(
    .clk	(	gclk			),	//: IN STD_LOGIC;
    .a		(	in_rs[31:16]	),	//: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    .b		(	in_rs[31:16]	),	//: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    .p		(	mult_i_out		)	//: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);

	mult_16_x_16_res_32 mult_16_x_16_res_32_u2(
    .clk	(	gclk			),	//: IN STD_LOGIC;
    .a		(	in_rt			),	//: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    .b		(	in_rt			),	//: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    .p		(	mult_q_out		)	//: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
	
endmodule
