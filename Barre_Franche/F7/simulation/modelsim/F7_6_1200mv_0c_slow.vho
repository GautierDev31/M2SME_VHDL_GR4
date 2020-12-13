-- Copyright (C) 1991-2011 Altera Corporation
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
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 11.1 Build 259 01/25/2012 Service Pack 2 SJ Web Edition"

-- DATE "12/13/2020 16:30:47"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	F7 IS
    PORT (
	led_Babord : OUT std_logic;
	led_Tribord : OUT std_logic;
	led_STBY : OUT std_logic;
	led_appuis : OUT std_logic;
	out_bip : OUT std_logic;
	code_fonction : OUT std_logic_vector(3 DOWNTO 0);
	clk_50M : IN std_logic;
	BP_Barbord : IN std_logic;
	BP_Tribord : IN std_logic;
	BP_STBY : IN std_logic;
	reset : IN std_logic
	);
END F7;

-- Design Ports Information
-- reset	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_Babord	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_Tribord	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_STBY	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_appuis	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_bip	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code_fonction[0]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code_fonction[1]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code_fonction[2]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- code_fonction[3]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BP_STBY	=>  Location: PIN_D3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BP_Tribord	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BP_Barbord	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_50M	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_led_Babord : std_logic;
SIGNAL ww_led_Tribord : std_logic;
SIGNAL ww_led_STBY : std_logic;
SIGNAL ww_led_appuis : std_logic;
SIGNAL ww_out_bip : std_logic;
SIGNAL ww_code_fonction : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_clk_50M : std_logic;
SIGNAL ww_BP_Barbord : std_logic;
SIGNAL ww_BP_Tribord : std_logic;
SIGNAL ww_BP_STBY : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL \udiv1hz|clkout~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_50M~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \udiv1hz|Add0~10_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~12_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~14_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~42_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~44_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~7_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~11_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~12_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \BP_Barbord~input_o\ : std_logic;
SIGNAL \clk_50M~input_o\ : std_logic;
SIGNAL \clk_50M~inputclkctrl_outclk\ : std_logic;
SIGNAL \led_Babord~output_o\ : std_logic;
SIGNAL \led_Tribord~output_o\ : std_logic;
SIGNAL \led_STBY~output_o\ : std_logic;
SIGNAL \led_appuis~output_o\ : std_logic;
SIGNAL \out_bip~output_o\ : std_logic;
SIGNAL \code_fonction[0]~output_o\ : std_logic;
SIGNAL \code_fonction[1]~output_o\ : std_logic;
SIGNAL \code_fonction[2]~output_o\ : std_logic;
SIGNAL \code_fonction[3]~output_o\ : std_logic;
SIGNAL \udiv1hz|cpt1~0_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~0_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~5_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~1\ : std_logic;
SIGNAL \udiv1hz|Add0~2_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~3\ : std_logic;
SIGNAL \udiv1hz|Add0~4_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~5\ : std_logic;
SIGNAL \udiv1hz|Add0~7\ : std_logic;
SIGNAL \udiv1hz|Add0~8_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~9\ : std_logic;
SIGNAL \udiv1hz|Add0~11\ : std_logic;
SIGNAL \udiv1hz|Add0~13\ : std_logic;
SIGNAL \udiv1hz|Add0~15\ : std_logic;
SIGNAL \udiv1hz|Add0~16_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~17\ : std_logic;
SIGNAL \udiv1hz|Add0~18_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~19\ : std_logic;
SIGNAL \udiv1hz|Add0~20_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~21\ : std_logic;
SIGNAL \udiv1hz|Add0~22_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~11_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~23\ : std_logic;
SIGNAL \udiv1hz|Add0~25\ : std_logic;
SIGNAL \udiv1hz|Add0~26_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~7_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~27\ : std_logic;
SIGNAL \udiv1hz|Add0~28_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~8_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~29\ : std_logic;
SIGNAL \udiv1hz|Add0~31\ : std_logic;
SIGNAL \udiv1hz|Add0~32_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~33\ : std_logic;
SIGNAL \udiv1hz|Add0~34_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~2_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~35\ : std_logic;
SIGNAL \udiv1hz|Add0~36_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~37\ : std_logic;
SIGNAL \udiv1hz|Add0~38_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~9_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~39\ : std_logic;
SIGNAL \udiv1hz|Add0~40_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~10_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~41\ : std_logic;
SIGNAL \udiv1hz|Add0~43\ : std_logic;
SIGNAL \udiv1hz|Add0~45\ : std_logic;
SIGNAL \udiv1hz|Add0~46_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~4_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~30_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~1_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~12_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~13_combout\ : std_logic;
SIGNAL \udiv1hz|state[0]~2_combout\ : std_logic;
SIGNAL \udiv1hz|state[0]~3_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~0_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~47\ : std_logic;
SIGNAL \udiv1hz|Add0~48_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~2_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~1_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~3_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~49\ : std_logic;
SIGNAL \udiv1hz|Add0~50_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~3_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~51\ : std_logic;
SIGNAL \udiv1hz|Add0~52_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~53\ : std_logic;
SIGNAL \udiv1hz|Add0~55\ : std_logic;
SIGNAL \udiv1hz|Add0~56_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~57\ : std_logic;
SIGNAL \udiv1hz|Add0~59\ : std_logic;
SIGNAL \udiv1hz|Add0~60_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~61\ : std_logic;
SIGNAL \udiv1hz|Add0~62_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~58_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~54_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~9_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~5_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~24_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1~6_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~6_combout\ : std_logic;
SIGNAL \udiv1hz|Add0~6_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~4_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~8_combout\ : std_logic;
SIGNAL \udiv1hz|process_0~10_combout\ : std_logic;
SIGNAL \udiv1hz|clkout~2_combout\ : std_logic;
SIGNAL \udiv1hz|clkout~feeder_combout\ : std_logic;
SIGNAL \udiv1hz|clkout~q\ : std_logic;
SIGNAL \udiv1hz|clkout~clkctrl_outclk\ : std_logic;
SIGNAL \BP_STBY~input_o\ : std_logic;
SIGNAL \BP_Tribord~input_o\ : std_logic;
SIGNAL \uF7|state[0]~3_combout\ : std_logic;
SIGNAL \uF7|state[0]~0_combout\ : std_logic;
SIGNAL \uF7|state[2]~4_combout\ : std_logic;
SIGNAL \uF7|state[1]~1_combout\ : std_logic;
SIGNAL \uF7|state[1]~2_combout\ : std_logic;
SIGNAL \uF7|out_F7_led_Babord~0_combout\ : std_logic;
SIGNAL \uF7|out_F7_led_Babord~q\ : std_logic;
SIGNAL \uF7|out_F7_led_Tribord~0_combout\ : std_logic;
SIGNAL \uF7|out_F7_led_Tribord~q\ : std_logic;
SIGNAL \uF7|out_F7_led_STBY~0_combout\ : std_logic;
SIGNAL \uF7|out_F7_led_STBY~q\ : std_logic;
SIGNAL \uF7|Mux7~1_combout\ : std_logic;
SIGNAL \uF7|Mux7~0_combout\ : std_logic;
SIGNAL \uF7|Mux7~2_combout\ : std_logic;
SIGNAL \uF7|out_F7_led_appuis~q\ : std_logic;
SIGNAL \uF7|Mux11~0_combout\ : std_logic;
SIGNAL \uF7|out_F7_bip~q\ : std_logic;
SIGNAL \uF7|Mux6~0_combout\ : std_logic;
SIGNAL \uF7|Mux6~1_combout\ : std_logic;
SIGNAL \uF7|Mux5~0_combout\ : std_logic;
SIGNAL \uF7|Mux4~0_combout\ : std_logic;
SIGNAL \udiv1hz|cpt1\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \udiv1hz|state\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \uF7|out_F7_code_fonction\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \uF7|state\ : std_logic_vector(2 DOWNTO 0);

BEGIN

led_Babord <= ww_led_Babord;
led_Tribord <= ww_led_Tribord;
led_STBY <= ww_led_STBY;
led_appuis <= ww_led_appuis;
out_bip <= ww_out_bip;
code_fonction <= ww_code_fonction;
ww_clk_50M <= clk_50M;
ww_BP_Barbord <= BP_Barbord;
ww_BP_Tribord <= BP_Tribord;
ww_BP_STBY <= BP_STBY;
ww_reset <= reset;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\udiv1hz|clkout~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \udiv1hz|clkout~q\);

\clk_50M~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_50M~input_o\);

-- Location: LCCOMB_X40_Y16_N10
\udiv1hz|Add0~10\ : cycloneive_lcell_comb
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

-- Location: LCCOMB_X40_Y16_N12
\udiv1hz|Add0~12\ : cycloneive_lcell_comb
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

-- Location: LCCOMB_X40_Y16_N14
\udiv1hz|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~14_combout\ = (\udiv1hz|cpt1\(7) & (!\udiv1hz|Add0~13\)) # (!\udiv1hz|cpt1\(7) & ((\udiv1hz|Add0~13\) # (GND)))
-- \udiv1hz|Add0~15\ = CARRY((!\udiv1hz|Add0~13\) # (!\udiv1hz|cpt1\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(7),
	datad => VCC,
	cin => \udiv1hz|Add0~13\,
	combout => \udiv1hz|Add0~14_combout\,
	cout => \udiv1hz|Add0~15\);

-- Location: LCCOMB_X40_Y15_N10
\udiv1hz|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~42_combout\ = (\udiv1hz|cpt1\(21) & (!\udiv1hz|Add0~41\)) # (!\udiv1hz|cpt1\(21) & ((\udiv1hz|Add0~41\) # (GND)))
-- \udiv1hz|Add0~43\ = CARRY((!\udiv1hz|Add0~41\) # (!\udiv1hz|cpt1\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(21),
	datad => VCC,
	cin => \udiv1hz|Add0~41\,
	combout => \udiv1hz|Add0~42_combout\,
	cout => \udiv1hz|Add0~43\);

-- Location: LCCOMB_X40_Y15_N12
\udiv1hz|Add0~44\ : cycloneive_lcell_comb
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

-- Location: FF_X40_Y16_N13
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

-- Location: FF_X40_Y16_N11
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

-- Location: FF_X41_Y15_N7
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

-- Location: FF_X41_Y15_N5
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

-- Location: LCCOMB_X41_Y15_N26
\udiv1hz|process_0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~7_combout\ = (\udiv1hz|cpt1\(21) & (\udiv1hz|cpt1\(22) & (\udiv1hz|cpt1\(20) & \udiv1hz|cpt1\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(21),
	datab => \udiv1hz|cpt1\(22),
	datac => \udiv1hz|cpt1\(20),
	datad => \udiv1hz|cpt1\(19),
	combout => \udiv1hz|process_0~7_combout\);

-- Location: LCCOMB_X41_Y15_N6
\udiv1hz|cpt1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~11_combout\ = (\udiv1hz|Add0~42_combout\ & ((\udiv1hz|process_0~3_combout\) # (!\udiv1hz|process_0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|process_0~10_combout\,
	datac => \udiv1hz|process_0~3_combout\,
	datad => \udiv1hz|Add0~42_combout\,
	combout => \udiv1hz|cpt1~11_combout\);

-- Location: LCCOMB_X41_Y15_N4
\udiv1hz|cpt1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~12_combout\ = (\udiv1hz|Add0~44_combout\ & ((\udiv1hz|process_0~3_combout\) # (!\udiv1hz|process_0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|process_0~10_combout\,
	datac => \udiv1hz|process_0~3_combout\,
	datad => \udiv1hz|Add0~44_combout\,
	combout => \udiv1hz|cpt1~12_combout\);

-- Location: IOIBUF_X25_Y34_N15
\BP_Barbord~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BP_Barbord,
	o => \BP_Barbord~input_o\);

-- Location: IOIBUF_X27_Y0_N22
\clk_50M~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_50M,
	o => \clk_50M~input_o\);

-- Location: CLKCTRL_G18
\clk_50M~inputclkctrl\ : cycloneive_clkctrl
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

-- Location: IOOBUF_X7_Y34_N9
\led_Babord~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uF7|out_F7_led_Babord~q\,
	devoe => ww_devoe,
	o => \led_Babord~output_o\);

-- Location: IOOBUF_X7_Y34_N16
\led_Tribord~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uF7|out_F7_led_Tribord~q\,
	devoe => ww_devoe,
	o => \led_Tribord~output_o\);

-- Location: IOOBUF_X3_Y34_N2
\led_STBY~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uF7|out_F7_led_STBY~q\,
	devoe => ww_devoe,
	o => \led_STBY~output_o\);

-- Location: IOOBUF_X7_Y34_N2
\led_appuis~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uF7|out_F7_led_appuis~q\,
	devoe => ww_devoe,
	o => \led_appuis~output_o\);

-- Location: IOOBUF_X1_Y34_N2
\out_bip~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uF7|out_F7_bip~q\,
	devoe => ww_devoe,
	o => \out_bip~output_o\);

-- Location: IOOBUF_X38_Y34_N16
\code_fonction[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uF7|out_F7_code_fonction\(0),
	devoe => ww_devoe,
	o => \code_fonction[0]~output_o\);

-- Location: IOOBUF_X49_Y34_N2
\code_fonction[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uF7|out_F7_code_fonction\(1),
	devoe => ww_devoe,
	o => \code_fonction[1]~output_o\);

-- Location: IOOBUF_X49_Y34_N9
\code_fonction[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uF7|out_F7_code_fonction\(2),
	devoe => ww_devoe,
	o => \code_fonction[2]~output_o\);

-- Location: IOOBUF_X40_Y34_N2
\code_fonction[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \code_fonction[3]~output_o\);

-- Location: LCCOMB_X41_Y16_N16
\udiv1hz|cpt1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~0_combout\ = (\udiv1hz|Add0~14_combout\ & ((\udiv1hz|process_0~3_combout\) # (!\udiv1hz|process_0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|Add0~14_combout\,
	datab => \udiv1hz|process_0~10_combout\,
	datac => \udiv1hz|process_0~3_combout\,
	combout => \udiv1hz|cpt1~0_combout\);

-- Location: FF_X41_Y16_N17
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

-- Location: LCCOMB_X40_Y16_N0
\udiv1hz|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~0_combout\ = \udiv1hz|cpt1\(0) $ (VCC)
-- \udiv1hz|Add0~1\ = CARRY(\udiv1hz|cpt1\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(0),
	datad => VCC,
	combout => \udiv1hz|Add0~0_combout\,
	cout => \udiv1hz|Add0~1\);

-- Location: LCCOMB_X41_Y16_N8
\udiv1hz|cpt1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~5_combout\ = (\udiv1hz|Add0~0_combout\ & ((\udiv1hz|process_0~3_combout\) # (!\udiv1hz|process_0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|process_0~3_combout\,
	datab => \udiv1hz|process_0~10_combout\,
	datac => \udiv1hz|Add0~0_combout\,
	combout => \udiv1hz|cpt1~5_combout\);

-- Location: FF_X41_Y16_N9
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

-- Location: LCCOMB_X40_Y16_N2
\udiv1hz|Add0~2\ : cycloneive_lcell_comb
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

-- Location: FF_X40_Y16_N3
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

-- Location: LCCOMB_X40_Y16_N4
\udiv1hz|Add0~4\ : cycloneive_lcell_comb
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

-- Location: FF_X40_Y16_N5
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

-- Location: LCCOMB_X40_Y16_N6
\udiv1hz|Add0~6\ : cycloneive_lcell_comb
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

-- Location: LCCOMB_X40_Y16_N8
\udiv1hz|Add0~8\ : cycloneive_lcell_comb
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

-- Location: FF_X40_Y16_N9
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

-- Location: LCCOMB_X40_Y16_N16
\udiv1hz|Add0~16\ : cycloneive_lcell_comb
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

-- Location: FF_X40_Y16_N17
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

-- Location: LCCOMB_X40_Y16_N18
\udiv1hz|Add0~18\ : cycloneive_lcell_comb
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

-- Location: FF_X40_Y16_N19
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

-- Location: LCCOMB_X40_Y16_N20
\udiv1hz|Add0~20\ : cycloneive_lcell_comb
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

-- Location: FF_X40_Y16_N21
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

-- Location: LCCOMB_X40_Y16_N22
\udiv1hz|Add0~22\ : cycloneive_lcell_comb
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

-- Location: FF_X40_Y16_N23
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

-- Location: LCCOMB_X41_Y16_N14
\udiv1hz|process_0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~11_combout\ = (\udiv1hz|cpt1\(6) & (\udiv1hz|cpt1\(11) & (!\udiv1hz|cpt1\(7) & !\udiv1hz|state\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(6),
	datab => \udiv1hz|cpt1\(11),
	datac => \udiv1hz|cpt1\(7),
	datad => \udiv1hz|state\(0),
	combout => \udiv1hz|process_0~11_combout\);

-- Location: LCCOMB_X40_Y16_N24
\udiv1hz|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~24_combout\ = (\udiv1hz|cpt1\(12) & (\udiv1hz|Add0~23\ $ (GND))) # (!\udiv1hz|cpt1\(12) & (!\udiv1hz|Add0~23\ & VCC))
-- \udiv1hz|Add0~25\ = CARRY((\udiv1hz|cpt1\(12) & !\udiv1hz|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(12),
	datad => VCC,
	cin => \udiv1hz|Add0~23\,
	combout => \udiv1hz|Add0~24_combout\,
	cout => \udiv1hz|Add0~25\);

-- Location: LCCOMB_X40_Y16_N26
\udiv1hz|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~26_combout\ = (\udiv1hz|cpt1\(13) & (!\udiv1hz|Add0~25\)) # (!\udiv1hz|cpt1\(13) & ((\udiv1hz|Add0~25\) # (GND)))
-- \udiv1hz|Add0~27\ = CARRY((!\udiv1hz|Add0~25\) # (!\udiv1hz|cpt1\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(13),
	datad => VCC,
	cin => \udiv1hz|Add0~25\,
	combout => \udiv1hz|Add0~26_combout\,
	cout => \udiv1hz|Add0~27\);

-- Location: LCCOMB_X41_Y15_N22
\udiv1hz|cpt1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~7_combout\ = (\udiv1hz|Add0~26_combout\ & ((\udiv1hz|process_0~3_combout\) # (!\udiv1hz|process_0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|process_0~10_combout\,
	datac => \udiv1hz|process_0~3_combout\,
	datad => \udiv1hz|Add0~26_combout\,
	combout => \udiv1hz|cpt1~7_combout\);

-- Location: FF_X41_Y15_N23
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

-- Location: LCCOMB_X40_Y16_N28
\udiv1hz|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~28_combout\ = (\udiv1hz|cpt1\(14) & (\udiv1hz|Add0~27\ $ (GND))) # (!\udiv1hz|cpt1\(14) & (!\udiv1hz|Add0~27\ & VCC))
-- \udiv1hz|Add0~29\ = CARRY((\udiv1hz|cpt1\(14) & !\udiv1hz|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(14),
	datad => VCC,
	cin => \udiv1hz|Add0~27\,
	combout => \udiv1hz|Add0~28_combout\,
	cout => \udiv1hz|Add0~29\);

-- Location: LCCOMB_X41_Y15_N28
\udiv1hz|cpt1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~8_combout\ = (\udiv1hz|Add0~28_combout\ & ((\udiv1hz|process_0~3_combout\) # (!\udiv1hz|process_0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|process_0~3_combout\,
	datab => \udiv1hz|process_0~10_combout\,
	datac => \udiv1hz|Add0~28_combout\,
	combout => \udiv1hz|cpt1~8_combout\);

-- Location: FF_X41_Y15_N29
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

-- Location: LCCOMB_X40_Y16_N30
\udiv1hz|Add0~30\ : cycloneive_lcell_comb
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

-- Location: LCCOMB_X40_Y15_N0
\udiv1hz|Add0~32\ : cycloneive_lcell_comb
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

-- Location: FF_X40_Y15_N1
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

-- Location: LCCOMB_X40_Y15_N2
\udiv1hz|Add0~34\ : cycloneive_lcell_comb
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

-- Location: LCCOMB_X41_Y16_N6
\udiv1hz|cpt1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~2_combout\ = (\udiv1hz|Add0~34_combout\ & ((\udiv1hz|process_0~3_combout\) # (!\udiv1hz|process_0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|process_0~3_combout\,
	datab => \udiv1hz|process_0~10_combout\,
	datac => \udiv1hz|Add0~34_combout\,
	combout => \udiv1hz|cpt1~2_combout\);

-- Location: FF_X41_Y16_N7
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

-- Location: LCCOMB_X40_Y15_N4
\udiv1hz|Add0~36\ : cycloneive_lcell_comb
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

-- Location: FF_X40_Y15_N5
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

-- Location: LCCOMB_X40_Y15_N6
\udiv1hz|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~38_combout\ = (\udiv1hz|cpt1\(19) & (!\udiv1hz|Add0~37\)) # (!\udiv1hz|cpt1\(19) & ((\udiv1hz|Add0~37\) # (GND)))
-- \udiv1hz|Add0~39\ = CARRY((!\udiv1hz|Add0~37\) # (!\udiv1hz|cpt1\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(19),
	datad => VCC,
	cin => \udiv1hz|Add0~37\,
	combout => \udiv1hz|Add0~38_combout\,
	cout => \udiv1hz|Add0~39\);

-- Location: LCCOMB_X41_Y16_N18
\udiv1hz|cpt1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~9_combout\ = (\udiv1hz|Add0~38_combout\ & ((\udiv1hz|process_0~3_combout\) # (!\udiv1hz|process_0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|process_0~10_combout\,
	datac => \udiv1hz|process_0~3_combout\,
	datad => \udiv1hz|Add0~38_combout\,
	combout => \udiv1hz|cpt1~9_combout\);

-- Location: FF_X41_Y16_N19
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

-- Location: LCCOMB_X40_Y15_N8
\udiv1hz|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|Add0~40_combout\ = (\udiv1hz|cpt1\(20) & (\udiv1hz|Add0~39\ $ (GND))) # (!\udiv1hz|cpt1\(20) & (!\udiv1hz|Add0~39\ & VCC))
-- \udiv1hz|Add0~41\ = CARRY((\udiv1hz|cpt1\(20) & !\udiv1hz|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|cpt1\(20),
	datad => VCC,
	cin => \udiv1hz|Add0~39\,
	combout => \udiv1hz|Add0~40_combout\,
	cout => \udiv1hz|Add0~41\);

-- Location: LCCOMB_X41_Y16_N28
\udiv1hz|cpt1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~10_combout\ = (\udiv1hz|Add0~40_combout\ & ((\udiv1hz|process_0~3_combout\) # (!\udiv1hz|process_0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|process_0~10_combout\,
	datac => \udiv1hz|process_0~3_combout\,
	datad => \udiv1hz|Add0~40_combout\,
	combout => \udiv1hz|cpt1~10_combout\);

-- Location: FF_X41_Y16_N29
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

-- Location: LCCOMB_X40_Y15_N14
\udiv1hz|Add0~46\ : cycloneive_lcell_comb
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

-- Location: LCCOMB_X41_Y16_N4
\udiv1hz|cpt1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~4_combout\ = (\udiv1hz|Add0~46_combout\ & ((\udiv1hz|process_0~3_combout\) # (!\udiv1hz|process_0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|process_0~10_combout\,
	datac => \udiv1hz|process_0~3_combout\,
	datad => \udiv1hz|Add0~46_combout\,
	combout => \udiv1hz|cpt1~4_combout\);

-- Location: FF_X41_Y16_N5
\udiv1hz|cpt1[23]\ : dffeas
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
	q => \udiv1hz|cpt1\(23));

-- Location: LCCOMB_X41_Y16_N20
\udiv1hz|cpt1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~1_combout\ = (\udiv1hz|Add0~30_combout\ & ((\udiv1hz|process_0~3_combout\) # (!\udiv1hz|process_0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|process_0~10_combout\,
	datac => \udiv1hz|process_0~3_combout\,
	datad => \udiv1hz|Add0~30_combout\,
	combout => \udiv1hz|cpt1~1_combout\);

-- Location: FF_X41_Y16_N21
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

-- Location: LCCOMB_X41_Y16_N0
\udiv1hz|process_0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~12_combout\ = (!\udiv1hz|cpt1\(17) & (!\udiv1hz|cpt1\(15) & (\udiv1hz|cpt1\(16) & \udiv1hz|cpt1\(18))))

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
	combout => \udiv1hz|process_0~12_combout\);

-- Location: LCCOMB_X41_Y16_N10
\udiv1hz|process_0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~13_combout\ = (\udiv1hz|cpt1\(24) & (!\udiv1hz|cpt1\(23) & (!\udiv1hz|cpt1\(25) & \udiv1hz|process_0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(24),
	datab => \udiv1hz|cpt1\(23),
	datac => \udiv1hz|cpt1\(25),
	datad => \udiv1hz|process_0~12_combout\,
	combout => \udiv1hz|process_0~13_combout\);

-- Location: LCCOMB_X41_Y15_N18
\udiv1hz|state[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|state[0]~2_combout\ = (\udiv1hz|process_0~10_combout\ & (((\udiv1hz|process_0~11_combout\ & \udiv1hz|process_0~13_combout\)) # (!\udiv1hz|process_0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|process_0~3_combout\,
	datab => \udiv1hz|process_0~11_combout\,
	datac => \udiv1hz|process_0~10_combout\,
	datad => \udiv1hz|process_0~13_combout\,
	combout => \udiv1hz|state[0]~2_combout\);

-- Location: LCCOMB_X41_Y15_N0
\udiv1hz|state[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|state[0]~3_combout\ = (\udiv1hz|state[0]~2_combout\ & ((\udiv1hz|process_0~3_combout\) # ((!\udiv1hz|process_0~10_combout\)))) # (!\udiv1hz|state[0]~2_combout\ & (((\udiv1hz|state\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|process_0~3_combout\,
	datab => \udiv1hz|state[0]~2_combout\,
	datac => \udiv1hz|state\(0),
	datad => \udiv1hz|process_0~10_combout\,
	combout => \udiv1hz|state[0]~3_combout\);

-- Location: FF_X41_Y15_N1
\udiv1hz|state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \udiv1hz|state[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \udiv1hz|state\(0));

-- Location: LCCOMB_X41_Y16_N2
\udiv1hz|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~0_combout\ = (\udiv1hz|cpt1\(6)) # ((\udiv1hz|cpt1\(11)) # ((!\udiv1hz|state\(0)) # (!\udiv1hz|cpt1\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(6),
	datab => \udiv1hz|cpt1\(11),
	datac => \udiv1hz|cpt1\(7),
	datad => \udiv1hz|state\(0),
	combout => \udiv1hz|process_0~0_combout\);

-- Location: LCCOMB_X40_Y15_N16
\udiv1hz|Add0~48\ : cycloneive_lcell_comb
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

-- Location: FF_X40_Y15_N17
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

-- Location: LCCOMB_X41_Y16_N26
\udiv1hz|process_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~2_combout\ = (\udiv1hz|cpt1\(24)) # (!\udiv1hz|cpt1\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \udiv1hz|cpt1\(25),
	datad => \udiv1hz|cpt1\(24),
	combout => \udiv1hz|process_0~2_combout\);

-- Location: LCCOMB_X41_Y16_N24
\udiv1hz|process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~1_combout\ = (((\udiv1hz|cpt1\(16)) # (\udiv1hz|cpt1\(18))) # (!\udiv1hz|cpt1\(15))) # (!\udiv1hz|cpt1\(17))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(17),
	datab => \udiv1hz|cpt1\(15),
	datac => \udiv1hz|cpt1\(16),
	datad => \udiv1hz|cpt1\(18),
	combout => \udiv1hz|process_0~1_combout\);

-- Location: LCCOMB_X41_Y16_N30
\udiv1hz|process_0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~3_combout\ = ((\udiv1hz|process_0~0_combout\) # ((\udiv1hz|process_0~2_combout\) # (\udiv1hz|process_0~1_combout\))) # (!\udiv1hz|cpt1\(23))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(23),
	datab => \udiv1hz|process_0~0_combout\,
	datac => \udiv1hz|process_0~2_combout\,
	datad => \udiv1hz|process_0~1_combout\,
	combout => \udiv1hz|process_0~3_combout\);

-- Location: LCCOMB_X40_Y15_N18
\udiv1hz|Add0~50\ : cycloneive_lcell_comb
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

-- Location: LCCOMB_X41_Y15_N12
\udiv1hz|cpt1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~3_combout\ = (\udiv1hz|Add0~50_combout\ & ((\udiv1hz|process_0~3_combout\) # (!\udiv1hz|process_0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \udiv1hz|process_0~10_combout\,
	datac => \udiv1hz|process_0~3_combout\,
	datad => \udiv1hz|Add0~50_combout\,
	combout => \udiv1hz|cpt1~3_combout\);

-- Location: FF_X41_Y15_N13
\udiv1hz|cpt1[25]\ : dffeas
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
	q => \udiv1hz|cpt1\(25));

-- Location: LCCOMB_X40_Y15_N20
\udiv1hz|Add0~52\ : cycloneive_lcell_comb
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

-- Location: FF_X40_Y15_N21
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

-- Location: LCCOMB_X40_Y15_N22
\udiv1hz|Add0~54\ : cycloneive_lcell_comb
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

-- Location: LCCOMB_X40_Y15_N24
\udiv1hz|Add0~56\ : cycloneive_lcell_comb
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

-- Location: FF_X40_Y15_N25
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

-- Location: LCCOMB_X40_Y15_N26
\udiv1hz|Add0~58\ : cycloneive_lcell_comb
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

-- Location: LCCOMB_X40_Y15_N28
\udiv1hz|Add0~60\ : cycloneive_lcell_comb
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

-- Location: FF_X40_Y15_N29
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

-- Location: LCCOMB_X40_Y15_N30
\udiv1hz|Add0~62\ : cycloneive_lcell_comb
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

-- Location: FF_X40_Y15_N31
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

-- Location: FF_X40_Y15_N27
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

-- Location: FF_X40_Y15_N23
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

-- Location: LCCOMB_X39_Y15_N0
\udiv1hz|process_0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~9_combout\ = (!\udiv1hz|cpt1\(26) & (!\udiv1hz|cpt1\(29) & (!\udiv1hz|cpt1\(28) & !\udiv1hz|cpt1\(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(26),
	datab => \udiv1hz|cpt1\(29),
	datac => \udiv1hz|cpt1\(28),
	datad => \udiv1hz|cpt1\(27),
	combout => \udiv1hz|process_0~9_combout\);

-- Location: LCCOMB_X41_Y15_N14
\udiv1hz|process_0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~5_combout\ = (!\udiv1hz|cpt1\(5) & (!\udiv1hz|cpt1\(9) & (!\udiv1hz|cpt1\(4) & !\udiv1hz|cpt1\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(5),
	datab => \udiv1hz|cpt1\(9),
	datac => \udiv1hz|cpt1\(4),
	datad => \udiv1hz|cpt1\(8),
	combout => \udiv1hz|process_0~5_combout\);

-- Location: LCCOMB_X41_Y15_N24
\udiv1hz|cpt1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|cpt1~6_combout\ = (\udiv1hz|Add0~24_combout\ & ((\udiv1hz|process_0~3_combout\) # (!\udiv1hz|process_0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|process_0~3_combout\,
	datab => \udiv1hz|process_0~10_combout\,
	datac => \udiv1hz|Add0~24_combout\,
	combout => \udiv1hz|cpt1~6_combout\);

-- Location: FF_X41_Y15_N25
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

-- Location: LCCOMB_X41_Y15_N30
\udiv1hz|process_0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~6_combout\ = (\udiv1hz|cpt1\(13) & (\udiv1hz|cpt1\(12) & (!\udiv1hz|cpt1\(10) & \udiv1hz|cpt1\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(13),
	datab => \udiv1hz|cpt1\(12),
	datac => \udiv1hz|cpt1\(10),
	datad => \udiv1hz|cpt1\(14),
	combout => \udiv1hz|process_0~6_combout\);

-- Location: FF_X40_Y16_N7
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

-- Location: LCCOMB_X41_Y15_N20
\udiv1hz|process_0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~4_combout\ = (!\udiv1hz|cpt1\(1) & (!\udiv1hz|cpt1\(0) & (!\udiv1hz|cpt1\(3) & !\udiv1hz|cpt1\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(1),
	datab => \udiv1hz|cpt1\(0),
	datac => \udiv1hz|cpt1\(3),
	datad => \udiv1hz|cpt1\(2),
	combout => \udiv1hz|process_0~4_combout\);

-- Location: LCCOMB_X41_Y15_N2
\udiv1hz|process_0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~8_combout\ = (\udiv1hz|process_0~7_combout\ & (\udiv1hz|process_0~5_combout\ & (\udiv1hz|process_0~6_combout\ & \udiv1hz|process_0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|process_0~7_combout\,
	datab => \udiv1hz|process_0~5_combout\,
	datac => \udiv1hz|process_0~6_combout\,
	datad => \udiv1hz|process_0~4_combout\,
	combout => \udiv1hz|process_0~8_combout\);

-- Location: LCCOMB_X41_Y15_N8
\udiv1hz|process_0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|process_0~10_combout\ = (!\udiv1hz|cpt1\(30) & (!\udiv1hz|cpt1\(31) & (\udiv1hz|process_0~9_combout\ & \udiv1hz|process_0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|cpt1\(30),
	datab => \udiv1hz|cpt1\(31),
	datac => \udiv1hz|process_0~9_combout\,
	datad => \udiv1hz|process_0~8_combout\,
	combout => \udiv1hz|process_0~10_combout\);

-- Location: LCCOMB_X41_Y15_N16
\udiv1hz|clkout~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|clkout~2_combout\ = (\udiv1hz|state[0]~2_combout\ & ((\udiv1hz|process_0~3_combout\) # ((!\udiv1hz|process_0~10_combout\)))) # (!\udiv1hz|state[0]~2_combout\ & (((\udiv1hz|clkout~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \udiv1hz|process_0~3_combout\,
	datab => \udiv1hz|process_0~10_combout\,
	datac => \udiv1hz|clkout~q\,
	datad => \udiv1hz|state[0]~2_combout\,
	combout => \udiv1hz|clkout~2_combout\);

-- Location: LCCOMB_X41_Y15_N10
\udiv1hz|clkout~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \udiv1hz|clkout~feeder_combout\ = \udiv1hz|clkout~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \udiv1hz|clkout~2_combout\,
	combout => \udiv1hz|clkout~feeder_combout\);

-- Location: FF_X41_Y15_N11
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

-- Location: CLKCTRL_G6
\udiv1hz|clkout~clkctrl\ : cycloneive_clkctrl
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

-- Location: IOIBUF_X1_Y34_N8
\BP_STBY~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BP_STBY,
	o => \BP_STBY~input_o\);

-- Location: IOIBUF_X25_Y34_N22
\BP_Tribord~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_BP_Tribord,
	o => \BP_Tribord~input_o\);

-- Location: LCCOMB_X24_Y33_N16
\uF7|state[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \uF7|state[0]~3_combout\ = (!\uF7|state[0]~0_combout\ & ((!\BP_Tribord~input_o\) # (!\BP_Barbord~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BP_Barbord~input_o\,
	datac => \BP_Tribord~input_o\,
	datad => \uF7|state[0]~0_combout\,
	combout => \uF7|state[0]~3_combout\);

-- Location: FF_X24_Y33_N17
\uF7|state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \uF7|state[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uF7|state\(0));

-- Location: LCCOMB_X24_Y33_N8
\uF7|state[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uF7|state[0]~0_combout\ = (\uF7|state\(1)) # ((\uF7|state\(2)) # (\uF7|state\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uF7|state\(1),
	datac => \uF7|state\(2),
	datad => \uF7|state\(0),
	combout => \uF7|state[0]~0_combout\);

-- Location: LCCOMB_X24_Y33_N26
\uF7|state[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \uF7|state[2]~4_combout\ = (\BP_Barbord~input_o\ & (!\BP_STBY~input_o\ & (\BP_Tribord~input_o\ & !\uF7|state[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BP_Barbord~input_o\,
	datab => \BP_STBY~input_o\,
	datac => \BP_Tribord~input_o\,
	datad => \uF7|state[0]~0_combout\,
	combout => \uF7|state[2]~4_combout\);

-- Location: FF_X24_Y33_N27
\uF7|state[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \uF7|state[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uF7|state\(2));

-- Location: LCCOMB_X24_Y33_N20
\uF7|state[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \uF7|state[1]~1_combout\ = (\BP_Barbord~input_o\ & (!\BP_Tribord~input_o\ & !\uF7|state\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BP_Barbord~input_o\,
	datab => \BP_Tribord~input_o\,
	datac => \uF7|state\(1),
	combout => \uF7|state[1]~1_combout\);

-- Location: LCCOMB_X24_Y33_N22
\uF7|state[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \uF7|state[1]~2_combout\ = (\uF7|state\(0)) # ((\uF7|state\(2)) # (\uF7|state[1]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uF7|state\(0),
	datac => \uF7|state\(2),
	datad => \uF7|state[1]~1_combout\,
	combout => \uF7|state[1]~2_combout\);

-- Location: FF_X24_Y33_N23
\uF7|state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \uF7|state[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uF7|state\(1));

-- Location: LCCOMB_X24_Y33_N24
\uF7|out_F7_led_Babord~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uF7|out_F7_led_Babord~0_combout\ = (\uF7|state\(0) & (\uF7|out_F7_led_Babord~q\ & \uF7|state\(1))) # (!\uF7|state\(0) & ((\uF7|out_F7_led_Babord~q\) # (\uF7|state\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uF7|state\(0),
	datac => \uF7|out_F7_led_Babord~q\,
	datad => \uF7|state\(1),
	combout => \uF7|out_F7_led_Babord~0_combout\);

-- Location: FF_X24_Y33_N25
\uF7|out_F7_led_Babord\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \uF7|out_F7_led_Babord~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uF7|out_F7_led_Babord~q\);

-- Location: LCCOMB_X23_Y33_N8
\uF7|out_F7_led_Tribord~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uF7|out_F7_led_Tribord~0_combout\ = !\uF7|state\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uF7|state\(0),
	combout => \uF7|out_F7_led_Tribord~0_combout\);

-- Location: FF_X23_Y33_N9
\uF7|out_F7_led_Tribord\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \uF7|out_F7_led_Tribord~0_combout\,
	ena => \uF7|state\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uF7|out_F7_led_Tribord~q\);

-- Location: LCCOMB_X24_Y33_N10
\uF7|out_F7_led_STBY~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uF7|out_F7_led_STBY~0_combout\ = (\uF7|state\(0) & (((\uF7|out_F7_led_STBY~q\)))) # (!\uF7|state\(0) & (!\uF7|state\(2) & ((\uF7|state\(1)) # (\uF7|out_F7_led_STBY~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uF7|state\(2),
	datab => \uF7|state\(1),
	datac => \uF7|out_F7_led_STBY~q\,
	datad => \uF7|state\(0),
	combout => \uF7|out_F7_led_STBY~0_combout\);

-- Location: FF_X24_Y33_N11
\uF7|out_F7_led_STBY\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \uF7|out_F7_led_STBY~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uF7|out_F7_led_STBY~q\);

-- Location: LCCOMB_X24_Y33_N30
\uF7|Mux7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \uF7|Mux7~1_combout\ = (\uF7|state\(0) & (\BP_Barbord~input_o\ & ((!\uF7|state\(1))))) # (!\uF7|state\(0) & (((\uF7|out_F7_led_appuis~q\) # (\uF7|state\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BP_Barbord~input_o\,
	datab => \uF7|state\(0),
	datac => \uF7|out_F7_led_appuis~q\,
	datad => \uF7|state\(1),
	combout => \uF7|Mux7~1_combout\);

-- Location: LCCOMB_X24_Y33_N28
\uF7|Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uF7|Mux7~0_combout\ = (\BP_Tribord~input_o\ & \uF7|state\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \BP_Tribord~input_o\,
	datac => \uF7|state\(1),
	combout => \uF7|Mux7~0_combout\);

-- Location: LCCOMB_X24_Y33_N4
\uF7|Mux7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \uF7|Mux7~2_combout\ = (\uF7|state\(2) & (\BP_STBY~input_o\)) # (!\uF7|state\(2) & (((\uF7|Mux7~1_combout\) # (\uF7|Mux7~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uF7|state\(2),
	datab => \BP_STBY~input_o\,
	datac => \uF7|Mux7~1_combout\,
	datad => \uF7|Mux7~0_combout\,
	combout => \uF7|Mux7~2_combout\);

-- Location: FF_X24_Y33_N5
\uF7|out_F7_led_appuis\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \uF7|Mux7~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uF7|out_F7_led_appuis~q\);

-- Location: LCCOMB_X24_Y33_N14
\uF7|Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uF7|Mux11~0_combout\ = (!\uF7|state\(0) & (!\uF7|state\(2) & \uF7|state\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uF7|state\(0),
	datac => \uF7|state\(2),
	datad => \uF7|state\(1),
	combout => \uF7|Mux11~0_combout\);

-- Location: FF_X24_Y33_N15
\uF7|out_F7_bip\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \uF7|Mux11~0_combout\,
	ena => \uF7|state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uF7|out_F7_bip~q\);

-- Location: LCCOMB_X24_Y33_N18
\uF7|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uF7|Mux6~0_combout\ = (\uF7|state\(1) & (((!\uF7|state\(0)) # (!\BP_Tribord~input_o\)))) # (!\uF7|state\(1) & (\BP_Barbord~input_o\ & ((\uF7|state\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BP_Barbord~input_o\,
	datab => \BP_Tribord~input_o\,
	datac => \uF7|state\(1),
	datad => \uF7|state\(0),
	combout => \uF7|Mux6~0_combout\);

-- Location: LCCOMB_X24_Y33_N0
\uF7|Mux6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \uF7|Mux6~1_combout\ = (\uF7|state\(2)) # ((!\uF7|Mux6~0_combout\ & ((\uF7|state\(0)) # (\uF7|out_F7_code_fonction\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uF7|state\(2),
	datab => \uF7|state\(0),
	datac => \uF7|out_F7_code_fonction\(0),
	datad => \uF7|Mux6~0_combout\,
	combout => \uF7|Mux6~1_combout\);

-- Location: FF_X24_Y33_N1
\uF7|out_F7_code_fonction[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \uF7|Mux6~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uF7|out_F7_code_fonction\(0));

-- Location: LCCOMB_X24_Y33_N2
\uF7|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uF7|Mux5~0_combout\ = (\uF7|state\(2)) # ((\uF7|state\(0) & \uF7|state\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uF7|state\(2),
	datab => \uF7|state\(0),
	datad => \uF7|state\(1),
	combout => \uF7|Mux5~0_combout\);

-- Location: FF_X24_Y33_N3
\uF7|out_F7_code_fonction[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \uF7|Mux5~0_combout\,
	ena => \uF7|state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uF7|out_F7_code_fonction\(1));

-- Location: LCCOMB_X24_Y33_N12
\uF7|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \uF7|Mux4~0_combout\ = (!\uF7|state\(2) & ((\uF7|state\(0)) # (!\uF7|state\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uF7|state\(0),
	datac => \uF7|state\(2),
	datad => \uF7|state\(1),
	combout => \uF7|Mux4~0_combout\);

-- Location: FF_X24_Y33_N13
\uF7|out_F7_code_fonction[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \udiv1hz|clkout~clkctrl_outclk\,
	d => \uF7|Mux4~0_combout\,
	ena => \uF7|state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uF7|out_F7_code_fonction\(2));

-- Location: IOIBUF_X9_Y34_N22
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

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


