-- (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY mult_gen_v11_2;
USE mult_gen_v11_2.mult_gen_v11_2;

ENTITY mult_16_x_16_res_32 IS
  PORT (
    clk : IN STD_LOGIC;
    a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    p : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END mult_16_x_16_res_32;

ARCHITECTURE mult_16_x_16_res_32_arch OF mult_16_x_16_res_32 IS
  COMPONENT mult_gen_v11_2 IS
    GENERIC (
      c_verbosity : INTEGER;
      c_model_type : INTEGER;
      c_xdevicefamily : STRING;
      c_a_width : INTEGER;
      c_a_type : INTEGER;
      c_b_width : INTEGER;
      c_b_type : INTEGER;
      c_out_high : INTEGER;
      c_out_low : INTEGER;
      c_mult_type : INTEGER;
      c_optimize_goal : INTEGER;
      c_has_ce : INTEGER;
      c_has_sclr : INTEGER;
      c_ce_overrides_sclr : INTEGER;
      c_latency : INTEGER;
      c_ccm_imp : INTEGER;
      c_b_value : STRING;
      c_has_zero_detect : INTEGER;
      c_round_output : INTEGER;
      c_round_pt : INTEGER
    );
    PORT (
      clk : IN STD_LOGIC;
      a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      ce : IN STD_LOGIC;
      sclr : IN STD_LOGIC;
      zero_detect : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      p : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      pcasc : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
    );
  END COMPONENT mult_gen_v11_2;
BEGIN
  U0 : mult_gen_v11_2
    GENERIC MAP (
      c_verbosity => 0,
      c_model_type => 0,
      c_xdevicefamily => "artix7",
      c_a_width => 16,
      c_a_type => 0,
      c_b_width => 16,
      c_b_type => 0,
      c_out_high => 31,
      c_out_low => 0,
      c_mult_type => 1,
      c_optimize_goal => 1,
      c_has_ce => 0,
      c_has_sclr => 0,
      c_ce_overrides_sclr => 0,
      c_latency => 1,
      c_ccm_imp => 0,
      c_b_value => "10000001",
      c_has_zero_detect => 0,
      c_round_output => 0,
      c_round_pt => 0
    )
    PORT MAP (
      clk => clk,
      a => a,
      b => b,
      ce => '1',
      sclr => '0',
      p => p
    );
END mult_16_x_16_res_32_arch;
