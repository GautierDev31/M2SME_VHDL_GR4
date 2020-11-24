-- Copyright (C) 1991-2010 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II"
-- VERSION "Version 9.1 Build 350 03/24/2010 Service Pack 2 SJ Web Edition"

-- DATE "11/24/2020 11:00:52"

-- 
-- Device: Altera EP3C25Q240C8 Package PQFP240
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	F7 IS
    PORT (
	clk_50M : IN std_logic;
	BP_Barbord : IN std_logic;
	BP_Tribord : IN std_logic;
	BP_STBY : IN std_logic;
	reset : IN std_logic;
	led_Babord : OUT std_logic;
	led_Tribord : OUT std_logic;
	led_STBY : OUT std_logic;
	led_appuis : OUT std_logic;
	out_bip : OUT std_logic;
	code_fonction : OUT std_logic_vector(3 DOWNTO 0)
	);
END F7;

-- Design Ports Information
-- led_Babord	=>  Location: PIN_167,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_Tribord	=>  Location: PIN_187,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_STBY	=>  Location: PIN_159,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_appuis	=>  Location: PIN_161,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_bip	=>  Location: PIN_166,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code_fonction[0]	=>  Location: PIN_160,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code_fonction[1]	=>  Location: PIN_164,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code_fonction[2]	=>  Location: PIN_169,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code_fonction[3]	=>  Location: PIN_43,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_151,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BP_STBY	=>  Location: PIN_152,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BP_Tribord	=>  Location: PIN_184,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BP_Barbord	=>  Location: PIN_168,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_50M	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_162,	 I/O Standard: 2.5 V,	 Current Strength: 8mA

ARCHITECTURE structure OF F7 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk_50M : std_logic;
SIGNAL ww_BP_Barbord : std_logic;
SIGNAL ww_BP_Tribord : std_logic;
SIGNAL ww_BP_STBY : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_led_Babord : std_logic;
SIGNAL ww_led_Tribord : std_logic;
SIGNAL ww_led_STBY : std_logic;
SIGNAL ww_led_appuis : std_logic;
SIGNAL ww_out_bip : std_logic;
SIGNAL ww_code_fonction : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_50M~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \udiv1hz|clkout~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \udiv1hz|Add0~0_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~1\ : std_logic;
SIGNAL \udiv1hz|Add0~2_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~3\ : std_logic;
SIGNAL \udiv1hz|Add0~4_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~5\ : std_logic;
SIGNAL \udiv1hz|Add0~6_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~7\ : std_logic;
SIGNAL \udiv1hz|Add0~8_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~9\ : std_logic;
SIGNAL \udiv1hz|Add0~10_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~11\ : std_logic;
SIGNAL \udiv1hz|Add0~12_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~13\ : std_logic;
SIGNAL \udiv1hz|Add0~14_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~15\ : std_logic;
SIGNAL \udiv1hz|Add0~16_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~17\ : std_logic;
SIGNAL \udiv1hz|Add0~18_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~19\ : std_logic;
SIGNAL \udiv1hz|Add0~20_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~21\ : std_logic;
SIGNAL \udiv1hz|Add0~22_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~23\ : std_logic;
SIGNAL \udiv1hz|Add0~24_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~25\ : std_logic;
SIGNAL \udiv1hz|Add0~26_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~27\ : std_logic;
SIGNAL \udiv1hz|Add0~28_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~29\ : std_logic;
SIGNAL \udiv1hz|Add0~30_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~31\ : std_logic;
SIGNAL \udiv1hz|Add0~32_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~33\ : std_logic;
SIGNAL \udiv1hz|Add0~34_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~35\ : std_logic;
SIGNAL \udiv1hz|Add0~36_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~37\ : std_logic;
SIGNAL \udiv1hz|Add0~38_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~39\ : std_logic;
SIGNAL \udiv1hz|Add0~40_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~41\ : std_logic;
SIGNAL \udiv1hz|Add0~42_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~43\ : std_logic;
SIGNAL \udiv1hz|Add0~44_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~45\ : std_logic;
SIGNAL \udiv1hz|Add0~46_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~47\ : std_logic;
SIGNAL \udiv1hz|Add0~48_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~49\ : std_logic;
SIGNAL \udiv1hz|Add0~50_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~51\ : std_logic;
SIGNAL \udiv1hz|Add0~52_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~53\ : std_logic;
SIGNAL \udiv1hz|Add0~54_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~55\ : std_logic;
SIGNAL \udiv1hz|Add0~56_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~57\ : std_logic;
SIGNAL \udiv1hz|Add0~58_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~59\ : std_logic;
SIGNAL \udiv1hz|Add0~60_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~61\ : std_logic;
SIGNAL \udiv1hz|Add0~62_combout\ : std_logic;
SIGNAL \udiv1hz|clkout~q\ : std_logic;
SIGNAL \ucompteurbp|state[2]~4_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~0_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~1_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~2_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~3_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~4_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~5_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~6_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~7_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~8_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~9_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~10_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~11_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~12_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~13_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~14_combout\ : std_logic;
SIGNAL \udiv1hz|clkout~0_combout\ : std_logic;
SIGNAL \udiv1hz|clkout~1_combout\ : std_logic;
SIGNAL \udiv1hz|state[0]~0_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~0_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~1_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~2_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~3_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~4_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~5_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~6_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~7_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~8_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~9_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~10_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~11_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~12_combout\ : std_logic;
SIGNAL \BP_STBY~input_o\ : std_logic;
SIGNAL \BP_Barbord~input_o\ : std_logic;
SIGNAL \clk_50M~input_o\ : std_logic;
SIGNAL \clk_50M~inputclkctrl_outclk\ : std_logic;
SIGNAL \udiv1hz|clkout~clkctrl_outclk\ : std_logic;
SIGNAL \udiv1hz|clkout~feeder_combout\ : std_logic;
SIGNAL \led_Babord~output_o\ : std_logic;
SIGNAL \led_Tribord~output_o\ : std_logic;
SIGNAL \led_STBY~output_o\ : std_logic;
SIGNAL \led_appuis~output_o\ : std_logic;
SIGNAL \out_bip~output_o\ : std_logic;
SIGNAL \code_fonction[0]~output_o\ : std_logic;
SIGNAL \code_fonction[1]~output_o\ : std_logic;
SIGNAL \code_fonction[2]~output_o\ : std_logic;
SIGNAL \code_fonction[3]~output_o\ : std_logic;
SIGNAL \BP_Tribord~input_o\ : std_logic;
SIGNAL \ucompteurbp|state[0]~2_combout\ : std_logic;
SIGNAL \ucompteurbp|state[2]~5_combout\ : std_logic;
SIGNAL \ucompteurbp|state[0]~3_combout\ : std_logic;
SIGNAL \ucompteurbp|state[1]~0_combout\ : std_logic;
SIGNAL \ucompteurbp|state[1]~1_combout\ : std_logic;
SIGNAL \ucompteurbp|outCompteurBP_BP_Tribord~0_combout\ : std_logic;
SIGNAL \ucompteurbp|outCompteurBP_BP_Tribord~q\ : std_logic;
SIGNAL \ucompteurbp|outCompteurBP_BP_Babord~0_combout\ : std_logic;
SIGNAL \ucompteurbp|outCompteurBP_BP_Babord~q\ : std_logic;
SIGNAL \usynchro|comb~4_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \usynchro|comb~5_combout\ : std_logic;
SIGNAL \usynchro|out_Synchro_led_Babord~combout\ : std_logic;
SIGNAL \usynchro|out_Synchro_led_Babord~0_combout\ : std_logic;
SIGNAL \ucompteurbp|Mux4~0_combout\ : std_logic;
SIGNAL \ucompteurbp|Mux4~1_combout\ : std_logic;
SIGNAL \ucompteurbp|Mux4~2_combout\ : std_logic;
SIGNAL \ucompteurbp|outCompteurBP_BP_Appuis~q\ : std_logic;
SIGNAL \usynchro|comb~6_combout\ : std_logic;
SIGNAL \usynchro|out_Synchro_led_Tribord~0_combout\ : std_logic;
SIGNAL \usynchro|out_Synchro_led_Tribord~combout\ : std_logic;
SIGNAL \ucompteurbp|outCompteurBP_BP_STBY~0_combout\ : std_logic;
SIGNAL \ucompteurbp|outCompteurBP_BP_STBY~q\ : std_logic;
SIGNAL \usynchro|out_Synchro_led_STBY~0_combout\ : std_logic;
SIGNAL \usynchro|comb~7_combout\ : std_logic;
SIGNAL \usynchro|out_Synchro_led_STBY~combout\ : std_logic;
SIGNAL \usynchro|process_0~0_combout\ : std_logic;
SIGNAL \usynchro|comb~8_combout\ : std_logic;
SIGNAL \usynchro|out_Synchro_led_appuis~combout\ : std_logic;
SIGNAL \usynchro|comb~9_combout\ : std_logic;
SIGNAL \usynchro|comb~13_combout\ : std_logic;
SIGNAL \usynchro|comb~10_combout\ : std_logic;
SIGNAL \usynchro|comb~14_combout\ : std_logic;
SIGNAL \usynchro|comb~11_combout\ : std_logic;
SIGNAL \usynchro|comb~12_combout\ : std_logic;
SIGNAL \usynchro|out_Synchro_code_fonction\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ucompteurbp|state\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \udiv1hz|cpt1\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \udiv1hz|state\ : std_logic_vector(31 DOWNTO 0);

BEGIN

ww_clk_50M <= clk_50M;
ww_BP_Barbord <= BP_Barbord;
ww_BP_Tribord <= BP_Tribord;
ww_BP_STBY <= BP_STBY;
ww_reset <= reset;
led_Babord <= ww_led_Babord;
led_Tribord <= ww_led_Tribord;
led_STBY <= ww_led_STBY;
led_appuis <= ww_led_appuis;
out_bip <= ww_out_bip;
code_fonction <= ww_code_fonction;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk_50M~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_50M~input_o\);

\udiv1hz|clkout~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \udiv1hz|clkout~q\);

-- Location: LCCOMB_X20_Y33_N0
\udiv1hz|Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~0_combout\ = \udiv1hz|cpt1\(0) $ (VCC)
-- \udiv1hz|Add0~1\ = CARRY(\udiv1hz|cpt1\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(0),
	datad => VCC,
	combout => \udiv1hz|Add0~0_combout\,
	cout => \udiv1hz|Add0~1\);

-- Location: LCCOMB_X20_Y33_N2
\udiv1hz|Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~2_combout\ = (\udiv1hz|cpt1\(1) & (!\udiv1hz|Add0~1\)) # (!\udiv1hz|cpt1\(1) & ((\udiv1hz|Add0~1\) # (GND)))
-- \udiv1hz|Add0~3\ = CARRY((!\udiv1hz|Add0~1\) # (!\udiv1hz|cpt1\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(1),
	datad => VCC,
	cin => \udiv1hz|Add0~1\,
	combout => \udiv1hz|Add0~2_combout\,
	cout => \udiv1hz|Add0~3\);

-- Location: LCCOMB_X20_Y33_N4
\udiv1hz|Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~4_combout\ = (\udiv1hz|cpt1\(2) & (\udiv1hz|Add0~3\ $ (GND))) # (!\udiv1hz|cpt1\(2) & (!\udiv1hz|Add0~3\ & VCC))
-- \udiv1hz|Add0~5\ = CARRY((\udiv1hz|cpt1\(2) & !\udiv1hz|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(2),
	datad => VCC,
	cin => \udiv1hz|Add0~3\,
	combout => \udiv1hz|Add0~4_combout\,
	cout => \udiv1hz|Add0~5\);

-- Location: LCCOMB_X20_Y33_N6
\udiv1hz|Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~6_combout\ = (\udiv1hz|cpt1\(3) & (!\udiv1hz|Add0~5\)) # (!\udiv1hz|cpt1\(3) & ((\udiv1hz|Add0~5\) # (GND)))
-- \udiv1hz|Add0~7\ = CARRY((!\udiv1hz|Add0~5\) # (!\udiv1hz|cpt1\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(3),
	datad => VCC,
	cin => \udiv1hz|Add0~5\,
	combout => \udiv1hz|Add0~6_combout\,
	cout => \udiv1hz|Add0~7\);

-- Location: LCCOMB_X20_Y33_N8
\udiv1hz|Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~8_combout\ = (\udiv1hz|cpt1\(4) & (\udiv1hz|Add0~7\ $ (GND))) # (!\udiv1hz|cpt1\(4) & (!\udiv1hz|Add0~7\ & VCC))
-- \udiv1hz|Add0~9\ = CARRY((\udiv1hz|cpt1\(4) & !\udiv1hz|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(4),
	datad => VCC,
	cin => \udiv1hz|Add0~7\,
	combout => \udiv1hz|Add0~8_combout\,
	cout => \udiv1hz|Add0~9\);

-- Location: LCCOMB_X20_Y33_N10
\udiv1hz|Add0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~10_combout\ = (\udiv1hz|cpt1\(5) & (!\udiv1hz|Add0~9\)) # (!\udiv1hz|cpt1\(5) & ((\udiv1hz|Add0~9\) # (GND)))
-- \udiv1hz|Add0~11\ = CARRY((!\udiv1hz|Add0~9\) # (!\udiv1hz|cpt1\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(5),
	datad => VCC,
	cin => \udiv1hz|Add0~9\,
	combout => \udiv1hz|Add0~10_combout\,
	cout => \udiv1hz|Add0~11\);

-- Location: LCCOMB_X20_Y33_N12
\udiv1hz|Add0~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~12_combout\ = (\udiv1hz|cpt1\(6) & (\udiv1hz|Add0~11\ $ (GND))) # (!\udiv1hz|cpt1\(6) & (!\udiv1hz|Add0~11\ & VCC))
-- \udiv1hz|Add0~13\ = CARRY((\udiv1hz|cpt1\(6) & !\udiv1hz|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(6),
	datad => VCC,
	cin => \udiv1hz|Add0~11\,
	combout => \udiv1hz|Add0~12_combout\,
	cout => \udiv1hz|Add0~13\);

-- Location: LCCOMB_X20_Y33_N14
\udiv1hz|Add0~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~14_combout\ = (\udiv1hz|cpt1\(7) & (!\udiv1hz|Add0~13\)) # (!\udiv1hz|cpt1\(7) & ((\udiv1hz|Add0~13\) # (GND)))
-- \udiv1hz|Add0~15\ = CARRY((!\udiv1hz|Add0~13\) # (!\udiv1hz|cpt1\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(7),
	datad => VCC,
	cin => \udiv1hz|Add0~13\,
	combout => \udiv1hz|Add0~14_combout\,
	cout => \udiv1hz|Add0~15\);

-- Location: LCCOMB_X20_Y33_N16
\udiv1hz|Add0~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~16_combout\ = (\udiv1hz|cpt1\(8) & (\udiv1hz|Add0~15\ $ (GND))) # (!\udiv1hz|cpt1\(8) & (!\udiv1hz|Add0~15\ & VCC))
-- \udiv1hz|Add0~17\ = CARRY((\udiv1hz|cpt1\(8) & !\udiv1hz|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(8),
	datad => VCC,
	cin => \udiv1hz|Add0~15\,
	combout => \udiv1hz|Add0~16_combout\,
	cout => \udiv1hz|Add0~17\);

-- Location: LCCOMB_X20_Y33_N18
\udiv1hz|Add0~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~18_combout\ = (\udiv1hz|cpt1\(9) & (!\udiv1hz|Add0~17\)) # (!\udiv1hz|cpt1\(9) & ((\udiv1hz|Add0~17\) # (GND)))
-- \udiv1hz|Add0~19\ = CARRY((!\udiv1hz|Add0~17\) # (!\udiv1hz|cpt1\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(9),
	datad => VCC,
	cin => \udiv1hz|Add0~17\,
	combout => \udiv1hz|Add0~18_combout\,
	cout => \udiv1hz|Add0~19\);

-- Location: LCCOMB_X20_Y33_N20
\udiv1hz|Add0~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~20_combout\ = (\udiv1hz|cpt1\(10) & (\udiv1hz|Add0~19\ $ (GND))) # (!\udiv1hz|cpt1\(10) & (!\udiv1hz|Add0~19\ & VCC))
-- \udiv1hz|Add0~21\ = CARRY((\udiv1hz|cpt1\(10) & !\udiv1hz|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(10),
	datad => VCC,
	cin => \udiv1hz|Add0~19\,
	combout => \udiv1hz|Add0~20_combout\,
	cout => \udiv1hz|Add0~21\);

-- Location: LCCOMB_X20_Y33_N22
\udiv1hz|Add0~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~22_combout\ = (\udiv1hz|cpt1\(11) & (!\udiv1hz|Add0~21\)) # (!\udiv1hz|cpt1\(11) & ((\udiv1hz|Add0~21\) # (GND)))
-- \udiv1hz|Add0~23\ = CARRY((!\udiv1hz|Add0~21\) # (!\udiv1hz|cpt1\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(11),
	datad => VCC,
	cin => \udiv1hz|Add0~21\,
	combout => \udiv1hz|Add0~22_combout\,
	cout => \udiv1hz|Add0~23\);

-- Location: LCCOMB_X20_Y33_N24
\udiv1hz|Add0~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~24_combout\ = (\udiv1hz|cpt1\(12) & (\udiv1hz|Add0~23\ $ (GND))) # (!\udiv1hz|cpt1\(12) & (!\udiv1hz|Add0~23\ & VCC))
-- \udiv1hz|Add0~25\ = CARRY((\udiv1hz|cpt1\(12) & !\udiv1hz|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(12),
	datad => VCC,
	cin => \udiv1hz|Add0~23\,
	combout => \udiv1hz|Add0~24_combout\,
	cout => \udiv1hz|Add0~25\);

-- Location: LCCOMB_X20_Y33_N26
\udiv1hz|Add0~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~26_combout\ = (\udiv1hz|cpt1\(13) & (!\udiv1hz|Add0~25\)) # (!\udiv1hz|cpt1\(13) & ((\udiv1hz|Add0~25\) # (GND)))
-- \udiv1hz|Add0~27\ = CARRY((!\udiv1hz|Add0~25\) # (!\udiv1hz|cpt1\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(13),
	datad => VCC,
	cin => \udiv1hz|Add0~25\,
	combout => \udiv1hz|Add0~26_combout\,
	cout => \udiv1hz|Add0~27\);

-- Location: LCCOMB_X20_Y33_N28
\udiv1hz|Add0~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~28_combout\ = (\udiv1hz|cpt1\(14) & (\udiv1hz|Add0~27\ $ (GND))) # (!\udiv1hz|cpt1\(14) & (!\udiv1hz|Add0~27\ & VCC))
-- \udiv1hz|Add0~29\ = CARRY((\udiv1hz|cpt1\(14) & !\udiv1hz|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(14),
	datad => VCC,
	cin => \udiv1hz|Add0~27\,
	combout => \udiv1hz|Add0~28_combout\,
	cout => \udiv1hz|Add0~29\);

-- Location: LCCOMB_X20_Y33_N30
\udiv1hz|Add0~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~30_combout\ = (\udiv1hz|cpt1\(15) & (!\udiv1hz|Add0~29\)) # (!\udiv1hz|cpt1\(15) & ((\udiv1hz|Add0~29\) # (GND)))
-- \udiv1hz|Add0~31\ = CARRY((!\udiv1hz|Add0~29\) # (!\udiv1hz|cpt1\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(15),
	datad => VCC,
	cin => \udiv1hz|Add0~29\,
	combout => \udiv1hz|Add0~30_combout\,
	cout => \udiv1hz|Add0~31\);

-- Location: LCCOMB_X20_Y32_N0
\udiv1hz|Add0~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~32_combout\ = (\udiv1hz|cpt1\(16) & (\udiv1hz|Add0~31\ $ (GND))) # (!\udiv1hz|cpt1\(16) & (!\udiv1hz|Add0~31\ & VCC))
-- \udiv1hz|Add0~33\ = CARRY((\udiv1hz|cpt1\(16) & !\udiv1hz|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(16),
	datad => VCC,
	cin => \udiv1hz|Add0~31\,
	combout => \udiv1hz|Add0~32_combout\,
	cout => \udiv1hz|Add0~33\);

-- Location: LCCOMB_X20_Y32_N2
\udiv1hz|Add0~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~34_combout\ = (\udiv1hz|cpt1\(17) & (!\udiv1hz|Add0~33\)) # (!\udiv1hz|cpt1\(17) & ((\udiv1hz|Add0~33\) # (GND)))
-- \udiv1hz|Add0~35\ = CARRY((!\udiv1hz|Add0~33\) # (!\udiv1hz|cpt1\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(17),
	datad => VCC,
	cin => \udiv1hz|Add0~33\,
	combout => \udiv1hz|Add0~34_combout\,
	cout => \udiv1hz|Add0~35\);

-- Location: LCCOMB_X20_Y32_N4
\udiv1hz|Add0~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~36_combout\ = (\udiv1hz|cpt1\(18) & (\udiv1hz|Add0~35\ $ (GND))) # (!\udiv1hz|cpt1\(18) & (!\udiv1hz|Add0~35\ & VCC))
-- \udiv1hz|Add0~37\ = CARRY((\udiv1hz|cpt1\(18) & !\udiv1hz|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(18),
	datad => VCC,
	cin => \udiv1hz|Add0~35\,
	combout => \udiv1hz|Add0~36_combout\,
	cout => \udiv1hz|Add0~37\);

-- Location: LCCOMB_X20_Y32_N6
\udiv1hz|Add0~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~38_combout\ = (\udiv1hz|cpt1\(19) & (!\udiv1hz|Add0~37\)) # (!\udiv1hz|cpt1\(19) & ((\udiv1hz|Add0~37\) # (GND)))
-- \udiv1hz|Add0~39\ = CARRY((!\udiv1hz|Add0~37\) # (!\udiv1hz|cpt1\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(19),
	datad => VCC,
	cin => \udiv1hz|Add0~37\,
	combout => \udiv1hz|Add0~38_combout\,
	cout => \udiv1hz|Add0~39\);

-- Location: LCCOMB_X20_Y32_N8
\udiv1hz|Add0~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~40_combout\ = (\udiv1hz|cpt1\(20) & (\udiv1hz|Add0~39\ $ (GND))) # (!\udiv1hz|cpt1\(20) & (!\udiv1hz|Add0~39\ & VCC))
-- \udiv1hz|Add0~41\ = CARRY((\udiv1hz|cpt1\(20) & !\udiv1hz|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(20),
	datad => VCC,
	cin => \udiv1hz|Add0~39\,
	combout => \udiv1hz|Add0~40_combout\,
	cout => \udiv1hz|Add0~41\);

-- Location: LCCOMB_X20_Y32_N10
\udiv1hz|Add0~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~42_combout\ = (\udiv1hz|cpt1\(21) & (!\udiv1hz|Add0~41\)) # (!\udiv1hz|cpt1\(21) & ((\udiv1hz|Add0~41\) # (GND)))
-- \udiv1hz|Add0~43\ = CARRY((!\udiv1hz|Add0~41\) # (!\udiv1hz|cpt1\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(21),
	datad => VCC,
	cin => \udiv1hz|Add0~41\,
	combout => \udiv1hz|Add0~42_combout\,
	cout => \udiv1hz|Add0~43\);

-- Location: LCCOMB_X20_Y32_N12
\udiv1hz|Add0~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~44_combout\ = (\udiv1hz|cpt1\(22) & (\udiv1hz|Add0~43\ $ (GND))) # (!\udiv1hz|cpt1\(22) & (!\udiv1hz|Add0~43\ & VCC))
-- \udiv1hz|Add0~45\ = CARRY((\udiv1hz|cpt1\(22) & !\udiv1hz|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(22),
	datad => VCC,
	cin => \udiv1hz|Add0~43\,
	combout => \udiv1hz|Add0~44_combout\,
	cout => \udiv1hz|Add0~45\);

-- Location: LCCOMB_X20_Y32_N14
\udiv1hz|Add0~46\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~46_combout\ = (\udiv1hz|cpt1\(23) & (!\udiv1hz|Add0~45\)) # (!\udiv1hz|cpt1\(23) & ((\udiv1hz|Add0~45\) # (GND)))
-- \udiv1hz|Add0~47\ = CARRY((!\udiv1hz|Add0~45\) # (!\udiv1hz|cpt1\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(23),
	datad => VCC,
	cin => \udiv1hz|Add0~45\,
	combout => \udiv1hz|Add0~46_combout\,
	cout => \udiv1hz|Add0~47\);

-- Location: LCCOMB_X20_Y32_N16
\udiv1hz|Add0~48\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~48_combout\ = (\udiv1hz|cpt1\(24) & (\udiv1hz|Add0~47\ $ (GND))) # (!\udiv1hz|cpt1\(24) & (!\udiv1hz|Add0~47\ & VCC))
-- \udiv1hz|Add0~49\ = CARRY((\udiv1hz|cpt1\(24) & !\udiv1hz|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(24),
	datad => VCC,
	cin => \udiv1hz|Add0~47\,
	combout => \udiv1hz|Add0~48_combout\,
	cout => \udiv1hz|Add0~49\);

-- Location: LCCOMB_X20_Y32_N18
\udiv1hz|Add0~50\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~50_combout\ = (\udiv1hz|cpt1\(25) & (!\udiv1hz|Add0~49\)) # (!\udiv1hz|cpt1\(25) & ((\udiv1hz|Add0~49\) # (GND)))
-- \udiv1hz|Add0~51\ = CARRY((!\udiv1hz|Add0~49\) # (!\udiv1hz|cpt1\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(25),
	datad => VCC,
	cin => \udiv1hz|Add0~49\,
	combout => \udiv1hz|Add0~50_combout\,
	cout => \udiv1hz|Add0~51\);

-- Location: LCCOMB_X20_Y32_N20
\udiv1hz|Add0~52\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~52_combout\ = (\udiv1hz|cpt1\(26) & (\udiv1hz|Add0~51\ $ (GND))) # (!\udiv1hz|cpt1\(26) & (!\udiv1hz|Add0~51\ & VCC))
-- \udiv1hz|Add0~53\ = CARRY((\udiv1hz|cpt1\(26) & !\udiv1hz|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(26),
	datad => VCC,
	cin => \udiv1hz|Add0~51\,
	combout => \udiv1hz|Add0~52_combout\,
	cout => \udiv1hz|Add0~53\);

-- Location: LCCOMB_X20_Y32_N22
\udiv1hz|Add0~54\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~54_combout\ = (\udiv1hz|cpt1\(27) & (!\udiv1hz|Add0~53\)) # (!\udiv1hz|cpt1\(27) & ((\udiv1hz|Add0~53\) # (GND)))
-- \udiv1hz|Add0~55\ = CARRY((!\udiv1hz|Add0~53\) # (!\udiv1hz|cpt1\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(27),
	datad => VCC,
	cin => \udiv1hz|Add0~53\,
	combout => \udiv1hz|Add0~54_combout\,
	cout => \udiv1hz|Add0~55\);

-- Location: LCCOMB_X20_Y32_N24
\udiv1hz|Add0~56\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~56_combout\ = (\udiv1hz|cpt1\(28) & (\udiv1hz|Add0~55\ $ (GND))) # (!\udiv1hz|cpt1\(28) & (!\udiv1hz|Add0~55\ & VCC))
-- \udiv1hz|Add0~57\ = CARRY((\udiv1hz|cpt1\(28) & !\udiv1hz|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(28),
	datad => VCC,
	cin => \udiv1hz|Add0~55\,
	combout => \udiv1hz|Add0~56_combout\,
	cout => \udiv1hz|Add0~57\);

-- Location: LCCOMB_X20_Y32_N26
\udiv1hz|Add0~58\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~58_combout\ = (\udiv1hz|cpt1\(29) & (!\udiv1hz|Add0~57\)) # (!\udiv1hz|cpt1\(29) & ((\udiv1hz|Add0~57\) # (GND)))
-- \udiv1hz|Add0~59\ = CARRY((!\udiv1hz|Add0~57\) # (!\udiv1hz|cpt1\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(29),
	datad => VCC,
	cin => \udiv1hz|Add0~57\,
	combout => \udiv1hz|Add0~58_combout\,
	cout => \udiv1hz|Add0~59\);

-- Location: LCCOMB_X20_Y32_N28
\udiv1hz|Add0~60\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~60_combout\ = (\udiv1hz|cpt1\(30) & (\udiv1hz|Add0~59\ $ (GND))) # (!\udiv1hz|cpt1\(30) & (!\udiv1hz|Add0~59\ & VCC))
-- \udiv1hz|Add0~61\ = CARRY((\udiv1hz|cpt1\(30) & !\udiv1hz|Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(30),
	datad => VCC,
	cin => \udiv1hz|Add0~59\,
	combout => \udiv1hz|Add0~60_combout\,
	cout => \udiv1hz|Add0~61\);

-- Location: LCCOMB_X20_Y32_N30
\udiv1hz|Add0~62\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~62_combout\ = \udiv1hz|cpt1\(31) $ (\udiv1hz|Add0~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(31),
	cin => \udiv1hz|Add0~61\,
	combout => \udiv1hz|Add0~62_combout\);

-- Location: FF_X23_Y32_N21
\udiv1hz|clkout\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|clkout~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|clkout~q\);

-- Location: LCCOMB_X48_Y17_N22
\ucompteurbp|state[2]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ucompteurbp|state[2]~4_combout\ = (\BP_Barbord~input_o\) # ((\BP_Tribord~input_o\) # (!\BP_STBY~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BP_Barbord~input_o\,
	datab => \BP_Tribord~input_o\,
	datac => \BP_STBY~input_o\,
	combout => \ucompteurbp|state[2]~4_combout\);

-- Location: FF_X20_Y33_N13
\udiv1hz|cpt1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(6));

-- Location: FF_X20_Y33_N23
\udiv1hz|cpt1[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(11));

-- Location: FF_X23_Y32_N23
\udiv1hz|state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|state\(0));

-- Location: FF_X19_Y32_N9
\udiv1hz|cpt1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|cpt1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(7));

-- Location: LCCOMB_X19_Y32_N10
\udiv1hz|process_0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~0_combout\ = (\udiv1hz|cpt1\(6)) # (((\udiv1hz|cpt1\(11)) # (!\udiv1hz|state\(0))) # (!\udiv1hz|cpt1\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(6),
	datab => \udiv1hz|cpt1\(7),
	datac => \udiv1hz|cpt1\(11),
	datad => \udiv1hz|state\(0),
	combout => \udiv1hz|process_0~0_combout\);

-- Location: FF_X20_Y32_N1
\udiv1hz|cpt1[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(16));

-- Location: FF_X20_Y32_N5
\udiv1hz|cpt1[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(18));

-- Location: FF_X19_Y32_N5
\udiv1hz|cpt1[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|cpt1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(15));

-- Location: FF_X19_Y32_N23
\udiv1hz|cpt1[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|cpt1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(17));

-- Location: LCCOMB_X23_Y32_N26
\udiv1hz|process_0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~1_combout\ = (\udiv1hz|cpt1\(18)) # (((\udiv1hz|cpt1\(16)) # (!\udiv1hz|cpt1\(15))) # (!\udiv1hz|cpt1\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(18),
	datab => \udiv1hz|cpt1\(17),
	datac => \udiv1hz|cpt1\(15),
	datad => \udiv1hz|cpt1\(16),
	combout => \udiv1hz|process_0~1_combout\);

-- Location: FF_X20_Y32_N17
\udiv1hz|cpt1[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(24));

-- Location: FF_X19_Y32_N25
\udiv1hz|cpt1[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|cpt1~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(23));

-- Location: FF_X23_Y32_N1
\udiv1hz|cpt1[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|cpt1~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(25));

-- Location: LCCOMB_X23_Y32_N18
\udiv1hz|process_0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~2_combout\ = (\udiv1hz|cpt1\(24)) # (((\udiv1hz|process_0~1_combout\) # (!\udiv1hz|cpt1\(23))) # (!\udiv1hz|cpt1\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(24),
	datab => \udiv1hz|cpt1\(25),
	datac => \udiv1hz|process_0~1_combout\,
	datad => \udiv1hz|cpt1\(23),
	combout => \udiv1hz|process_0~2_combout\);

-- Location: FF_X19_Y32_N3
\udiv1hz|cpt1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|cpt1~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(0));

-- Location: FF_X20_Y33_N3
\udiv1hz|cpt1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(1));

-- Location: FF_X20_Y33_N5
\udiv1hz|cpt1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(2));

-- Location: FF_X20_Y33_N7
\udiv1hz|cpt1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(3));

-- Location: LCCOMB_X23_Y32_N28
\udiv1hz|process_0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~3_combout\ = (!\udiv1hz|cpt1\(0) & (!\udiv1hz|cpt1\(3) & (!\udiv1hz|cpt1\(1) & !\udiv1hz|cpt1\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(0),
	datab => \udiv1hz|cpt1\(3),
	datac => \udiv1hz|cpt1\(1),
	datad => \udiv1hz|cpt1\(2),
	combout => \udiv1hz|process_0~3_combout\);

-- Location: FF_X20_Y33_N9
\udiv1hz|cpt1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(4));

-- Location: FF_X20_Y33_N11
\udiv1hz|cpt1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(5));

-- Location: FF_X20_Y33_N17
\udiv1hz|cpt1[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(8));

-- Location: FF_X20_Y33_N19
\udiv1hz|cpt1[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(9));

-- Location: LCCOMB_X23_Y32_N24
\udiv1hz|process_0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~4_combout\ = (!\udiv1hz|cpt1\(4) & (!\udiv1hz|cpt1\(5) & (!\udiv1hz|cpt1\(8) & !\udiv1hz|cpt1\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(4),
	datab => \udiv1hz|cpt1\(5),
	datac => \udiv1hz|cpt1\(8),
	datad => \udiv1hz|cpt1\(9),
	combout => \udiv1hz|process_0~4_combout\);

-- Location: FF_X19_Y32_N29
\udiv1hz|cpt1[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|cpt1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(12));

-- Location: FF_X19_Y32_N15
\udiv1hz|cpt1[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|cpt1~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(13));

-- Location: FF_X19_Y32_N1
\udiv1hz|cpt1[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|cpt1~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(14));

-- Location: FF_X20_Y33_N21
\udiv1hz|cpt1[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(10));

-- Location: LCCOMB_X23_Y32_N8
\udiv1hz|process_0~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~5_combout\ = (\udiv1hz|cpt1\(13) & (\udiv1hz|cpt1\(14) & (\udiv1hz|cpt1\(12) & !\udiv1hz|cpt1\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(13),
	datab => \udiv1hz|cpt1\(14),
	datac => \udiv1hz|cpt1\(12),
	datad => \udiv1hz|cpt1\(10),
	combout => \udiv1hz|process_0~5_combout\);

-- Location: FF_X19_Y32_N27
\udiv1hz|cpt1[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|cpt1~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(19));

-- Location: FF_X19_Y32_N13
\udiv1hz|cpt1[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|cpt1~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(20));

-- Location: FF_X19_Y32_N7
\udiv1hz|cpt1[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|cpt1~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(21));

-- Location: FF_X19_Y32_N17
\udiv1hz|cpt1[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|cpt1~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(22));

-- Location: LCCOMB_X23_Y32_N30
\udiv1hz|process_0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~6_combout\ = (\udiv1hz|cpt1\(22) & (\udiv1hz|cpt1\(19) & (\udiv1hz|cpt1\(20) & \udiv1hz|cpt1\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(22),
	datab => \udiv1hz|cpt1\(19),
	datac => \udiv1hz|cpt1\(20),
	datad => \udiv1hz|cpt1\(21),
	combout => \udiv1hz|process_0~6_combout\);

-- Location: LCCOMB_X23_Y32_N6
\udiv1hz|process_0~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~7_combout\ = (\udiv1hz|process_0~6_combout\ & (\udiv1hz|process_0~4_combout\ & (\udiv1hz|process_0~5_combout\ & \udiv1hz|process_0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|process_0~6_combout\,
	datab => \udiv1hz|process_0~4_combout\,
	datac => \udiv1hz|process_0~5_combout\,
	datad => \udiv1hz|process_0~3_combout\,
	combout => \udiv1hz|process_0~7_combout\);

-- Location: FF_X20_Y32_N21
\udiv1hz|cpt1[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(26));

-- Location: FF_X20_Y32_N23
\udiv1hz|cpt1[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(27));

-- Location: FF_X20_Y32_N25
\udiv1hz|cpt1[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(28));

-- Location: FF_X20_Y32_N27
\udiv1hz|cpt1[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(29));

-- Location: LCCOMB_X23_Y32_N14
\udiv1hz|process_0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~8_combout\ = (!\udiv1hz|cpt1\(29) & (!\udiv1hz|cpt1\(28) & (!\udiv1hz|cpt1\(27) & !\udiv1hz|cpt1\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(29),
	datab => \udiv1hz|cpt1\(28),
	datac => \udiv1hz|cpt1\(27),
	datad => \udiv1hz|cpt1\(26),
	combout => \udiv1hz|process_0~8_combout\);

-- Location: FF_X20_Y32_N29
\udiv1hz|cpt1[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(30));

-- Location: FF_X20_Y32_N31
\udiv1hz|cpt1[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|Add0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|cpt1\(31));

-- Location: LCCOMB_X23_Y32_N4
\udiv1hz|process_0~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~9_combout\ = (!\udiv1hz|cpt1\(30) & (\udiv1hz|process_0~8_combout\ & !\udiv1hz|cpt1\(31)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(30),
	datac => \udiv1hz|process_0~8_combout\,
	datad => \udiv1hz|cpt1\(31),
	combout => \udiv1hz|process_0~9_combout\);

-- Location: LCCOMB_X23_Y32_N10
\udiv1hz|process_0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~10_combout\ = (\udiv1hz|process_0~0_combout\) # ((\udiv1hz|process_0~2_combout\) # ((!\udiv1hz|process_0~7_combout\) # (!\udiv1hz|process_0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|process_0~0_combout\,
	datab => \udiv1hz|process_0~2_combout\,
	datac => \udiv1hz|process_0~9_combout\,
	datad => \udiv1hz|process_0~7_combout\,
	combout => \udiv1hz|process_0~10_combout\);

-- Location: LCCOMB_X23_Y32_N2
\udiv1hz|process_0~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~11_combout\ = (!\udiv1hz|cpt1\(31) & (!\udiv1hz|cpt1\(30) & (\udiv1hz|process_0~8_combout\ & \udiv1hz|process_0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(31),
	datab => \udiv1hz|cpt1\(30),
	datac => \udiv1hz|process_0~8_combout\,
	datad => \udiv1hz|process_0~7_combout\,
	combout => \udiv1hz|process_0~11_combout\);

-- Location: LCCOMB_X19_Y32_N18
\udiv1hz|process_0~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~12_combout\ = (\udiv1hz|cpt1\(6) & (!\udiv1hz|cpt1\(7) & (\udiv1hz|cpt1\(11) & !\udiv1hz|state\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(6),
	datab => \udiv1hz|cpt1\(7),
	datac => \udiv1hz|cpt1\(11),
	datad => \udiv1hz|state\(0),
	combout => \udiv1hz|process_0~12_combout\);

-- Location: LCCOMB_X19_Y32_N20
\udiv1hz|process_0~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~13_combout\ = (!\udiv1hz|cpt1\(17) & (!\udiv1hz|cpt1\(15) & (\udiv1hz|cpt1\(16) & \udiv1hz|cpt1\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(17),
	datab => \udiv1hz|cpt1\(15),
	datac => \udiv1hz|cpt1\(16),
	datad => \udiv1hz|cpt1\(18),
	combout => \udiv1hz|process_0~13_combout\);

-- Location: LCCOMB_X19_Y32_N30
\udiv1hz|process_0~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~14_combout\ = (!\udiv1hz|cpt1\(23) & (\udiv1hz|cpt1\(24) & (!\udiv1hz|cpt1\(25) & \udiv1hz|process_0~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(23),
	datab => \udiv1hz|cpt1\(24),
	datac => \udiv1hz|cpt1\(25),
	datad => \udiv1hz|process_0~13_combout\,
	combout => \udiv1hz|process_0~14_combout\);

-- Location: LCCOMB_X23_Y32_N12
\udiv1hz|clkout~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|clkout~0_combout\ = ((\udiv1hz|process_0~12_combout\ & (\udiv1hz|process_0~11_combout\ & \udiv1hz|process_0~14_combout\))) # (!\udiv1hz|process_0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|process_0~12_combout\,
	datab => \udiv1hz|process_0~11_combout\,
	datac => \udiv1hz|process_0~14_combout\,
	datad => \udiv1hz|process_0~10_combout\,
	combout => \udiv1hz|clkout~0_combout\);

-- Location: LCCOMB_X23_Y32_N16
\udiv1hz|clkout~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|clkout~1_combout\ = (\udiv1hz|clkout~0_combout\ & (\udiv1hz|process_0~10_combout\)) # (!\udiv1hz|clkout~0_combout\ & ((\udiv1hz|clkout~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|process_0~10_combout\,
	datac => \udiv1hz|clkout~q\,
	datad => \udiv1hz|clkout~0_combout\,
	combout => \udiv1hz|clkout~1_combout\);

-- Location: LCCOMB_X23_Y32_N22
\udiv1hz|state[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|state[0]~0_combout\ = (\udiv1hz|clkout~0_combout\ & (\udiv1hz|process_0~10_combout\)) # (!\udiv1hz|clkout~0_combout\ & ((\udiv1hz|state\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|clkout~0_combout\,
	datab => \udiv1hz|process_0~10_combout\,
	datac => \udiv1hz|state\(0),
	combout => \udiv1hz|state[0]~0_combout\);

-- Location: LCCOMB_X19_Y32_N8
\udiv1hz|cpt1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~0_combout\ = (\udiv1hz|process_0~10_combout\ & \udiv1hz|Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \udiv1hz|process_0~10_combout\,
	datad => \udiv1hz|Add0~14_combout\,
	combout => \udiv1hz|cpt1~0_combout\);

-- Location: LCCOMB_X19_Y32_N4
\udiv1hz|cpt1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~1_combout\ = (\udiv1hz|Add0~30_combout\ & \udiv1hz|process_0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \udiv1hz|Add0~30_combout\,
	datad => \udiv1hz|process_0~10_combout\,
	combout => \udiv1hz|cpt1~1_combout\);

-- Location: LCCOMB_X19_Y32_N22
\udiv1hz|cpt1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~2_combout\ = (\udiv1hz|process_0~10_combout\ & \udiv1hz|Add0~34_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \udiv1hz|process_0~10_combout\,
	datad => \udiv1hz|Add0~34_combout\,
	combout => \udiv1hz|cpt1~2_combout\);

-- Location: LCCOMB_X19_Y32_N24
\udiv1hz|cpt1~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~3_combout\ = (\udiv1hz|Add0~46_combout\ & \udiv1hz|process_0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \udiv1hz|Add0~46_combout\,
	datad => \udiv1hz|process_0~10_combout\,
	combout => \udiv1hz|cpt1~3_combout\);

-- Location: LCCOMB_X23_Y32_N0
\udiv1hz|cpt1~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~4_combout\ = (\udiv1hz|process_0~10_combout\ & \udiv1hz|Add0~50_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \udiv1hz|process_0~10_combout\,
	datad => \udiv1hz|Add0~50_combout\,
	combout => \udiv1hz|cpt1~4_combout\);

-- Location: LCCOMB_X19_Y32_N2
\udiv1hz|cpt1~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~5_combout\ = (\udiv1hz|process_0~10_combout\ & \udiv1hz|Add0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \udiv1hz|process_0~10_combout\,
	datad => \udiv1hz|Add0~0_combout\,
	combout => \udiv1hz|cpt1~5_combout\);

-- Location: LCCOMB_X19_Y32_N28
\udiv1hz|cpt1~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~6_combout\ = (\udiv1hz|process_0~10_combout\ & \udiv1hz|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \udiv1hz|process_0~10_combout\,
	datad => \udiv1hz|Add0~24_combout\,
	combout => \udiv1hz|cpt1~6_combout\);

-- Location: LCCOMB_X19_Y32_N14
\udiv1hz|cpt1~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~7_combout\ = (\udiv1hz|Add0~26_combout\ & \udiv1hz|process_0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \udiv1hz|Add0~26_combout\,
	datad => \udiv1hz|process_0~10_combout\,
	combout => \udiv1hz|cpt1~7_combout\);

-- Location: LCCOMB_X19_Y32_N0
\udiv1hz|cpt1~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~8_combout\ = (\udiv1hz|process_0~10_combout\ & \udiv1hz|Add0~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \udiv1hz|process_0~10_combout\,
	datad => \udiv1hz|Add0~28_combout\,
	combout => \udiv1hz|cpt1~8_combout\);

-- Location: LCCOMB_X19_Y32_N26
\udiv1hz|cpt1~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~9_combout\ = (\udiv1hz|process_0~10_combout\ & \udiv1hz|Add0~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \udiv1hz|process_0~10_combout\,
	datad => \udiv1hz|Add0~38_combout\,
	combout => \udiv1hz|cpt1~9_combout\);

-- Location: LCCOMB_X19_Y32_N12
\udiv1hz|cpt1~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~10_combout\ = (\udiv1hz|Add0~40_combout\ & \udiv1hz|process_0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \udiv1hz|Add0~40_combout\,
	datad => \udiv1hz|process_0~10_combout\,
	combout => \udiv1hz|cpt1~10_combout\);

-- Location: LCCOMB_X19_Y32_N6
\udiv1hz|cpt1~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~11_combout\ = (\udiv1hz|Add0~42_combout\ & \udiv1hz|process_0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \udiv1hz|Add0~42_combout\,
	datad => \udiv1hz|process_0~10_combout\,
	combout => \udiv1hz|cpt1~11_combout\);

-- Location: LCCOMB_X19_Y32_N16
\udiv1hz|cpt1~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~12_combout\ = (\udiv1hz|Add0~44_combout\ & \udiv1hz|process_0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \udiv1hz|Add0~44_combout\,
	datad => \udiv1hz|process_0~10_combout\,
	combout => \udiv1hz|cpt1~12_combout\);

-- Location: IOIBUF_X53_Y17_N1
\BP_STBY~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BP_STBY,
	o => \BP_STBY~input_o\);

-- Location: IOIBUF_X53_Y23_N15
\BP_Barbord~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BP_Barbord,
	o => \BP_Barbord~input_o\);

-- Location: IOIBUF_X0_Y16_N1
\clk_50M~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_50M,
	o => \clk_50M~input_o\);

-- Location: CLKCTRL_G4
\clk_50M~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_50M~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_50M~inputclkctrl_outclk\);

-- Location: CLKCTRL_G18
\udiv1hz|clkout~clkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \udiv1hz|clkout~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \udiv1hz|clkout~clkctrl_outclk\);

-- Location: LCCOMB_X23_Y32_N20
\udiv1hz|clkout~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \udiv1hz|clkout~feeder_combout\ = \udiv1hz|clkout~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \udiv1hz|clkout~1_combout\,
	combout => \udiv1hz|clkout~feeder_combout\);

-- Location: IOOBUF_X53_Y23_N23
\led_Babord~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \usynchro|out_Synchro_led_Babord~combout\,
	devoe => ww_devoe,
	o => \led_Babord~output_o\);

-- Location: IOOBUF_X45_Y34_N9
\led_Tribord~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \usynchro|out_Synchro_led_Tribord~combout\,
	devoe => ww_devoe,
	o => \led_Tribord~output_o\);

-- Location: IOOBUF_X53_Y20_N23
\led_STBY~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \usynchro|out_Synchro_led_STBY~combout\,
	devoe => ww_devoe,
	o => \led_STBY~output_o\);

-- Location: IOOBUF_X53_Y21_N23
\led_appuis~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \usynchro|out_Synchro_led_appuis~combout\,
	devoe => ww_devoe,
	o => \led_appuis~output_o\);

-- Location: IOOBUF_X53_Y22_N2
\out_bip~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \out_bip~output_o\);

-- Location: IOOBUF_X53_Y20_N16
\code_fonction[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \usynchro|out_Synchro_code_fonction\(0),
	devoe => ww_devoe,
	o => \code_fonction[0]~output_o\);

-- Location: IOOBUF_X53_Y22_N9
\code_fonction[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \usynchro|out_Synchro_code_fonction\(1),
	devoe => ww_devoe,
	o => \code_fonction[1]~output_o\);

-- Location: IOOBUF_X53_Y24_N23
\code_fonction[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \usynchro|out_Synchro_code_fonction\(2),
	devoe => ww_devoe,
	o => \code_fonction[2]~output_o\);

-- Location: IOOBUF_X0_Y12_N9
\code_fonction[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \code_fonction[3]~output_o\);

-- Location: IOIBUF_X49_Y34_N8
\BP_Tribord~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BP_Tribord,
	o => \BP_Tribord~input_o\);

-- Location: LCCOMB_X48_Y17_N28
\ucompteurbp|state[0]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ucompteurbp|state[0]~2_combout\ = (\BP_Barbord~input_o\) # (\BP_Tribord~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BP_Barbord~input_o\,
	datac => \BP_Tribord~input_o\,
	combout => \ucompteurbp|state[0]~2_combout\);

-- Location: LCCOMB_X48_Y17_N0
\ucompteurbp|state[2]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ucompteurbp|state[2]~5_combout\ = (!\ucompteurbp|state[2]~4_combout\ & (!\ucompteurbp|state\(0) & (!\ucompteurbp|state\(2) & !\ucompteurbp|state\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ucompteurbp|state[2]~4_combout\,
	datab => \ucompteurbp|state\(0),
	datac => \ucompteurbp|state\(2),
	datad => \ucompteurbp|state\(1),
	combout => \ucompteurbp|state[2]~5_combout\);

-- Location: FF_X48_Y17_N1
\ucompteurbp|state[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \ucompteurbp|state[2]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ucompteurbp|state\(2));

-- Location: LCCOMB_X48_Y17_N26
\ucompteurbp|state[0]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ucompteurbp|state[0]~3_combout\ = (!\ucompteurbp|state\(1) & (\ucompteurbp|state[0]~2_combout\ & (!\ucompteurbp|state\(0) & !\ucompteurbp|state\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ucompteurbp|state\(1),
	datab => \ucompteurbp|state[0]~2_combout\,
	datac => \ucompteurbp|state\(0),
	datad => \ucompteurbp|state\(2),
	combout => \ucompteurbp|state[0]~3_combout\);

-- Location: FF_X48_Y17_N27
\ucompteurbp|state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \ucompteurbp|state[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ucompteurbp|state\(0));

-- Location: LCCOMB_X48_Y17_N18
\ucompteurbp|state[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ucompteurbp|state[1]~0_combout\ = (!\ucompteurbp|state\(1) & ((\ucompteurbp|state\(2)) # ((!\BP_Barbord~input_o\ & \BP_Tribord~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BP_Barbord~input_o\,
	datab => \BP_Tribord~input_o\,
	datac => \ucompteurbp|state\(1),
	datad => \ucompteurbp|state\(2),
	combout => \ucompteurbp|state[1]~0_combout\);

-- Location: LCCOMB_X48_Y17_N8
\ucompteurbp|state[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ucompteurbp|state[1]~1_combout\ = (\ucompteurbp|state\(0)) # (\ucompteurbp|state[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ucompteurbp|state\(0),
	datad => \ucompteurbp|state[1]~0_combout\,
	combout => \ucompteurbp|state[1]~1_combout\);

-- Location: FF_X48_Y17_N9
\ucompteurbp|state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \ucompteurbp|state[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ucompteurbp|state\(1));

-- Location: LCCOMB_X48_Y17_N24
\ucompteurbp|outCompteurBP_BP_Tribord~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ucompteurbp|outCompteurBP_BP_Tribord~0_combout\ = (\ucompteurbp|state\(1) & (\ucompteurbp|state\(0))) # (!\ucompteurbp|state\(1) & ((\ucompteurbp|outCompteurBP_BP_Tribord~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ucompteurbp|state\(0),
	datac => \ucompteurbp|outCompteurBP_BP_Tribord~q\,
	datad => \ucompteurbp|state\(1),
	combout => \ucompteurbp|outCompteurBP_BP_Tribord~0_combout\);

-- Location: FF_X48_Y17_N25
\ucompteurbp|outCompteurBP_BP_Tribord\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \ucompteurbp|outCompteurBP_BP_Tribord~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ucompteurbp|outCompteurBP_BP_Tribord~q\);

-- Location: LCCOMB_X48_Y17_N10
\ucompteurbp|outCompteurBP_BP_Babord~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ucompteurbp|outCompteurBP_BP_Babord~0_combout\ = (\ucompteurbp|state\(0) & ((\ucompteurbp|outCompteurBP_BP_Babord~q\) # (!\ucompteurbp|state\(1)))) # (!\ucompteurbp|state\(0) & (\ucompteurbp|outCompteurBP_BP_Babord~q\ & !\ucompteurbp|state\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ucompteurbp|state\(0),
	datac => \ucompteurbp|outCompteurBP_BP_Babord~q\,
	datad => \ucompteurbp|state\(1),
	combout => \ucompteurbp|outCompteurBP_BP_Babord~0_combout\);

-- Location: FF_X48_Y17_N11
\ucompteurbp|outCompteurBP_BP_Babord\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \ucompteurbp|outCompteurBP_BP_Babord~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ucompteurbp|outCompteurBP_BP_Babord~q\);

-- Location: LCCOMB_X48_Y17_N14
\usynchro|comb~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|comb~4_combout\ = (!\ucompteurbp|outCompteurBP_BP_STBY~q\ & !\ucompteurbp|outCompteurBP_BP_Babord~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ucompteurbp|outCompteurBP_BP_STBY~q\,
	datac => \ucompteurbp|outCompteurBP_BP_Babord~q\,
	combout => \usynchro|comb~4_combout\);

-- Location: IOIBUF_X53_Y17_N8
\reset~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LCCOMB_X48_Y17_N2
\usynchro|comb~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|comb~5_combout\ = (!\ucompteurbp|outCompteurBP_BP_Tribord~q\ & ((\reset~input_o\) # ((!\ucompteurbp|outCompteurBP_BP_Appuis~q\ & !\usynchro|comb~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ucompteurbp|outCompteurBP_BP_Appuis~q\,
	datab => \usynchro|comb~4_combout\,
	datac => \ucompteurbp|outCompteurBP_BP_Tribord~q\,
	datad => \reset~input_o\,
	combout => \usynchro|comb~5_combout\);

-- Location: LCCOMB_X49_Y17_N30
\usynchro|out_Synchro_led_Babord\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|out_Synchro_led_Babord~combout\ = (!\usynchro|comb~5_combout\ & ((\ucompteurbp|outCompteurBP_BP_Tribord~q\) # (\usynchro|out_Synchro_led_Babord~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ucompteurbp|outCompteurBP_BP_Tribord~q\,
	datac => \usynchro|out_Synchro_led_Babord~combout\,
	datad => \usynchro|comb~5_combout\,
	combout => \usynchro|out_Synchro_led_Babord~combout\);

-- Location: LCCOMB_X48_Y17_N20
\usynchro|out_Synchro_led_Babord~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|out_Synchro_led_Babord~0_combout\ = (\ucompteurbp|outCompteurBP_BP_Tribord~q\) # ((\reset~input_o\) # ((!\ucompteurbp|outCompteurBP_BP_Appuis~q\ & !\usynchro|comb~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ucompteurbp|outCompteurBP_BP_Appuis~q\,
	datab => \usynchro|comb~4_combout\,
	datac => \ucompteurbp|outCompteurBP_BP_Tribord~q\,
	datad => \reset~input_o\,
	combout => \usynchro|out_Synchro_led_Babord~0_combout\);

-- Location: LCCOMB_X48_Y17_N4
\ucompteurbp|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ucompteurbp|Mux4~0_combout\ = (\BP_Tribord~input_o\ & (\ucompteurbp|state\(1) & \ucompteurbp|state\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \BP_Tribord~input_o\,
	datac => \ucompteurbp|state\(1),
	datad => \ucompteurbp|state\(0),
	combout => \ucompteurbp|Mux4~0_combout\);

-- Location: LCCOMB_X48_Y17_N6
\ucompteurbp|Mux4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ucompteurbp|Mux4~1_combout\ = (!\ucompteurbp|state\(1) & ((\ucompteurbp|state\(0) & (\BP_Barbord~input_o\)) # (!\ucompteurbp|state\(0) & ((\ucompteurbp|outCompteurBP_BP_Appuis~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BP_Barbord~input_o\,
	datab => \ucompteurbp|state\(1),
	datac => \ucompteurbp|state\(0),
	datad => \ucompteurbp|outCompteurBP_BP_Appuis~q\,
	combout => \ucompteurbp|Mux4~1_combout\);

-- Location: LCCOMB_X48_Y17_N16
\ucompteurbp|Mux4~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ucompteurbp|Mux4~2_combout\ = (\ucompteurbp|state\(2) & (\BP_STBY~input_o\)) # (!\ucompteurbp|state\(2) & (((\ucompteurbp|Mux4~0_combout\) # (\ucompteurbp|Mux4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BP_STBY~input_o\,
	datab => \ucompteurbp|state\(2),
	datac => \ucompteurbp|Mux4~0_combout\,
	datad => \ucompteurbp|Mux4~1_combout\,
	combout => \ucompteurbp|Mux4~2_combout\);

-- Location: FF_X48_Y17_N17
\ucompteurbp|outCompteurBP_BP_Appuis\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \ucompteurbp|Mux4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ucompteurbp|outCompteurBP_BP_Appuis~q\);

-- Location: LCCOMB_X49_Y17_N16
\usynchro|comb~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|comb~6_combout\ = (\usynchro|out_Synchro_led_Babord~0_combout\ & ((\ucompteurbp|outCompteurBP_BP_Tribord~q\) # ((\ucompteurbp|outCompteurBP_BP_Appuis~q\) # (!\ucompteurbp|outCompteurBP_BP_Babord~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ucompteurbp|outCompteurBP_BP_Tribord~q\,
	datab => \usynchro|out_Synchro_led_Babord~0_combout\,
	datac => \ucompteurbp|outCompteurBP_BP_Babord~q\,
	datad => \ucompteurbp|outCompteurBP_BP_Appuis~q\,
	combout => \usynchro|comb~6_combout\);

-- Location: LCCOMB_X49_Y17_N26
\usynchro|out_Synchro_led_Tribord~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|out_Synchro_led_Tribord~0_combout\ = (!\ucompteurbp|outCompteurBP_BP_Tribord~q\ & (\ucompteurbp|outCompteurBP_BP_Babord~q\ & !\ucompteurbp|outCompteurBP_BP_Appuis~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ucompteurbp|outCompteurBP_BP_Tribord~q\,
	datac => \ucompteurbp|outCompteurBP_BP_Babord~q\,
	datad => \ucompteurbp|outCompteurBP_BP_Appuis~q\,
	combout => \usynchro|out_Synchro_led_Tribord~0_combout\);

-- Location: LCCOMB_X49_Y17_N24
\usynchro|out_Synchro_led_Tribord\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|out_Synchro_led_Tribord~combout\ = (!\usynchro|comb~6_combout\ & ((\usynchro|out_Synchro_led_Tribord~0_combout\) # (\usynchro|out_Synchro_led_Tribord~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \usynchro|comb~6_combout\,
	datac => \usynchro|out_Synchro_led_Tribord~0_combout\,
	datad => \usynchro|out_Synchro_led_Tribord~combout\,
	combout => \usynchro|out_Synchro_led_Tribord~combout\);

-- Location: LCCOMB_X48_Y17_N12
\ucompteurbp|outCompteurBP_BP_STBY~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \ucompteurbp|outCompteurBP_BP_STBY~0_combout\ = (\ucompteurbp|state\(0) & (((\ucompteurbp|outCompteurBP_BP_STBY~q\)))) # (!\ucompteurbp|state\(0) & (!\ucompteurbp|state\(1) & ((\ucompteurbp|outCompteurBP_BP_STBY~q\) # (\ucompteurbp|state\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ucompteurbp|state\(0),
	datab => \ucompteurbp|state\(1),
	datac => \ucompteurbp|outCompteurBP_BP_STBY~q\,
	datad => \ucompteurbp|state\(2),
	combout => \ucompteurbp|outCompteurBP_BP_STBY~0_combout\);

-- Location: FF_X48_Y17_N13
\ucompteurbp|outCompteurBP_BP_STBY\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \ucompteurbp|outCompteurBP_BP_STBY~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ucompteurbp|outCompteurBP_BP_STBY~q\);

-- Location: LCCOMB_X49_Y17_N12
\usynchro|out_Synchro_led_STBY~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|out_Synchro_led_STBY~0_combout\ = (!\ucompteurbp|outCompteurBP_BP_Tribord~q\ & (!\ucompteurbp|outCompteurBP_BP_Appuis~q\ & (!\ucompteurbp|outCompteurBP_BP_Babord~q\ & \ucompteurbp|outCompteurBP_BP_STBY~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ucompteurbp|outCompteurBP_BP_Tribord~q\,
	datab => \ucompteurbp|outCompteurBP_BP_Appuis~q\,
	datac => \ucompteurbp|outCompteurBP_BP_Babord~q\,
	datad => \ucompteurbp|outCompteurBP_BP_STBY~q\,
	combout => \usynchro|out_Synchro_led_STBY~0_combout\);

-- Location: LCCOMB_X49_Y17_N22
\usynchro|comb~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|comb~7_combout\ = (\usynchro|out_Synchro_led_Babord~0_combout\ & !\usynchro|out_Synchro_led_STBY~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \usynchro|out_Synchro_led_Babord~0_combout\,
	datad => \usynchro|out_Synchro_led_STBY~0_combout\,
	combout => \usynchro|comb~7_combout\);

-- Location: LCCOMB_X49_Y17_N10
\usynchro|out_Synchro_led_STBY\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|out_Synchro_led_STBY~combout\ = (!\usynchro|comb~7_combout\ & ((\usynchro|out_Synchro_led_STBY~0_combout\) # (\usynchro|out_Synchro_led_STBY~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \usynchro|out_Synchro_led_STBY~0_combout\,
	datac => \usynchro|comb~7_combout\,
	datad => \usynchro|out_Synchro_led_STBY~combout\,
	combout => \usynchro|out_Synchro_led_STBY~combout\);

-- Location: LCCOMB_X49_Y17_N18
\usynchro|process_0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|process_0~0_combout\ = (\ucompteurbp|outCompteurBP_BP_Tribord~q\ & \ucompteurbp|outCompteurBP_BP_Appuis~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ucompteurbp|outCompteurBP_BP_Tribord~q\,
	datac => \ucompteurbp|outCompteurBP_BP_Appuis~q\,
	combout => \usynchro|process_0~0_combout\);

-- Location: LCCOMB_X49_Y17_N0
\usynchro|comb~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|comb~8_combout\ = (!\ucompteurbp|outCompteurBP_BP_Appuis~q\ & ((\ucompteurbp|outCompteurBP_BP_Tribord~q\) # ((\ucompteurbp|outCompteurBP_BP_Babord~q\) # (\ucompteurbp|outCompteurBP_BP_STBY~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ucompteurbp|outCompteurBP_BP_Tribord~q\,
	datab => \ucompteurbp|outCompteurBP_BP_Appuis~q\,
	datac => \ucompteurbp|outCompteurBP_BP_Babord~q\,
	datad => \ucompteurbp|outCompteurBP_BP_STBY~q\,
	combout => \usynchro|comb~8_combout\);

-- Location: LCCOMB_X51_Y21_N0
\usynchro|out_Synchro_led_appuis\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|out_Synchro_led_appuis~combout\ = (!\usynchro|comb~8_combout\ & ((\usynchro|process_0~0_combout\) # (\usynchro|out_Synchro_led_appuis~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \usynchro|process_0~0_combout\,
	datac => \usynchro|comb~8_combout\,
	datad => \usynchro|out_Synchro_led_appuis~combout\,
	combout => \usynchro|out_Synchro_led_appuis~combout\);

-- Location: LCCOMB_X48_Y17_N30
\usynchro|comb~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|comb~9_combout\ = (\ucompteurbp|outCompteurBP_BP_Tribord~q\ & (!\ucompteurbp|outCompteurBP_BP_Appuis~q\)) # (!\ucompteurbp|outCompteurBP_BP_Tribord~q\ & (\reset~input_o\ & ((\ucompteurbp|outCompteurBP_BP_Appuis~q\) # 
-- (\usynchro|comb~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ucompteurbp|outCompteurBP_BP_Appuis~q\,
	datab => \usynchro|comb~4_combout\,
	datac => \ucompteurbp|outCompteurBP_BP_Tribord~q\,
	datad => \reset~input_o\,
	combout => \usynchro|comb~9_combout\);

-- Location: LCCOMB_X49_Y17_N2
\usynchro|comb~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|comb~13_combout\ = (\ucompteurbp|outCompteurBP_BP_Tribord~q\ & (\ucompteurbp|outCompteurBP_BP_Appuis~q\)) # (!\ucompteurbp|outCompteurBP_BP_Tribord~q\ & (!\ucompteurbp|outCompteurBP_BP_Appuis~q\ & ((\ucompteurbp|outCompteurBP_BP_Babord~q\) # 
-- (\ucompteurbp|outCompteurBP_BP_STBY~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ucompteurbp|outCompteurBP_BP_Tribord~q\,
	datab => \ucompteurbp|outCompteurBP_BP_Appuis~q\,
	datac => \ucompteurbp|outCompteurBP_BP_Babord~q\,
	datad => \ucompteurbp|outCompteurBP_BP_STBY~q\,
	combout => \usynchro|comb~13_combout\);

-- Location: LCCOMB_X51_Y17_N24
\usynchro|out_Synchro_code_fonction[0]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|out_Synchro_code_fonction\(0) = (!\usynchro|comb~9_combout\ & ((\usynchro|comb~13_combout\) # (\usynchro|out_Synchro_code_fonction\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \usynchro|comb~9_combout\,
	datac => \usynchro|comb~13_combout\,
	datad => \usynchro|out_Synchro_code_fonction\(0),
	combout => \usynchro|out_Synchro_code_fonction\(0));

-- Location: LCCOMB_X49_Y17_N20
\usynchro|comb~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|comb~10_combout\ = (\ucompteurbp|outCompteurBP_BP_Tribord~q\) # ((\reset~input_o\ & ((\usynchro|comb~4_combout\) # (\ucompteurbp|outCompteurBP_BP_Appuis~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \usynchro|comb~4_combout\,
	datab => \reset~input_o\,
	datac => \ucompteurbp|outCompteurBP_BP_Appuis~q\,
	datad => \ucompteurbp|outCompteurBP_BP_Tribord~q\,
	combout => \usynchro|comb~10_combout\);

-- Location: LCCOMB_X49_Y17_N4
\usynchro|comb~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|comb~14_combout\ = (!\ucompteurbp|outCompteurBP_BP_Tribord~q\ & (!\ucompteurbp|outCompteurBP_BP_Appuis~q\ & ((\ucompteurbp|outCompteurBP_BP_Babord~q\) # (\ucompteurbp|outCompteurBP_BP_STBY~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ucompteurbp|outCompteurBP_BP_Tribord~q\,
	datab => \ucompteurbp|outCompteurBP_BP_Appuis~q\,
	datac => \ucompteurbp|outCompteurBP_BP_Babord~q\,
	datad => \ucompteurbp|outCompteurBP_BP_STBY~q\,
	combout => \usynchro|comb~14_combout\);

-- Location: LCCOMB_X49_Y17_N28
\usynchro|out_Synchro_code_fonction[1]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|out_Synchro_code_fonction\(1) = (!\usynchro|comb~10_combout\ & ((\usynchro|comb~14_combout\) # (\usynchro|out_Synchro_code_fonction\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \usynchro|comb~10_combout\,
	datac => \usynchro|comb~14_combout\,
	datad => \usynchro|out_Synchro_code_fonction\(1),
	combout => \usynchro|out_Synchro_code_fonction\(1));

-- Location: LCCOMB_X49_Y17_N6
\usynchro|comb~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|comb~11_combout\ = (!\ucompteurbp|outCompteurBP_BP_Tribord~q\ & (\usynchro|out_Synchro_led_Babord~0_combout\ & ((\ucompteurbp|outCompteurBP_BP_Appuis~q\) # (!\ucompteurbp|outCompteurBP_BP_Babord~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ucompteurbp|outCompteurBP_BP_Tribord~q\,
	datab => \usynchro|out_Synchro_led_Babord~0_combout\,
	datac => \ucompteurbp|outCompteurBP_BP_Babord~q\,
	datad => \ucompteurbp|outCompteurBP_BP_Appuis~q\,
	combout => \usynchro|comb~11_combout\);

-- Location: LCCOMB_X49_Y17_N8
\usynchro|comb~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|comb~12_combout\ = (\ucompteurbp|outCompteurBP_BP_Tribord~q\) # ((\ucompteurbp|outCompteurBP_BP_Babord~q\ & !\ucompteurbp|outCompteurBP_BP_Appuis~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ucompteurbp|outCompteurBP_BP_Tribord~q\,
	datac => \ucompteurbp|outCompteurBP_BP_Babord~q\,
	datad => \ucompteurbp|outCompteurBP_BP_Appuis~q\,
	combout => \usynchro|comb~12_combout\);

-- Location: LCCOMB_X49_Y17_N14
\usynchro|out_Synchro_code_fonction[2]\ : cycloneiii_lcell_comb
-- Equation(s):
-- \usynchro|out_Synchro_code_fonction\(2) = (!\usynchro|comb~11_combout\ & ((\usynchro|comb~12_combout\) # (\usynchro|out_Synchro_code_fonction\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \usynchro|comb~11_combout\,
	datab => \usynchro|comb~12_combout\,
	datac => \usynchro|out_Synchro_code_fonction\(2),
	combout => \usynchro|out_Synchro_code_fonction\(2));

ww_led_Babord <= \led_Babord~output_o\;

ww_led_Tribord <= \led_Tribord~output_o\;

ww_led_STBY <= \led_STBY~output_o\;

ww_led_appuis <= \led_appuis~output_o\;

ww_out_bip <= \out_bip~output_o\;

ww_code_fonction(0) <= \code_fonction[0]~output_o\;

ww_code_fonction(1) <= \code_fonction[1]~output_o\;

ww_code_fonction(2) <= \code_fonction[2]~output_o\;

ww_code_fonction(3) <= \code_fonction[3]~output_o\;
END structure;


