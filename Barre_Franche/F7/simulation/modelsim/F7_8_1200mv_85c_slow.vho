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

-- DATE "11/21/2020 20:14:36"

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

ENTITY 	CompteurBP IS
    PORT (
	outCompteurBP_BP_Tribord : OUT std_logic;
	outCompteurBP_BP_Babord : OUT std_logic;
	outCompteurBP_BP_STBY : OUT std_logic;
	outCompteurBP_BP_Appuis : OUT std_logic;
	inCompteurBP_clk_1hz : IN std_logic;
	inCompteurBP_BP_Babord : IN std_logic;
	inCompteurBP_BP_Tribord : IN std_logic;
	inCompteurBP_BP_STBY : IN std_logic
	);
END CompteurBP;

-- Design Ports Information
-- outCompteurBP_BP_Tribord	=>  Location: PIN_9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outCompteurBP_BP_Babord	=>  Location: PIN_18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outCompteurBP_BP_STBY	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outCompteurBP_BP_Appuis	=>  Location: PIN_38,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inCompteurBP_clk_1hz	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inCompteurBP_BP_Tribord	=>  Location: PIN_22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inCompteurBP_BP_Babord	=>  Location: PIN_4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inCompteurBP_BP_STBY	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF CompteurBP IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_outCompteurBP_BP_Tribord : std_logic;
SIGNAL ww_outCompteurBP_BP_Babord : std_logic;
SIGNAL ww_outCompteurBP_BP_STBY : std_logic;
SIGNAL ww_outCompteurBP_BP_Appuis : std_logic;
SIGNAL ww_inCompteurBP_clk_1hz : std_logic;
SIGNAL ww_inCompteurBP_BP_Babord : std_logic;
SIGNAL ww_inCompteurBP_BP_Tribord : std_logic;
SIGNAL ww_inCompteurBP_BP_STBY : std_logic;
SIGNAL \inCompteurBP_clk_1hz~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \outCompteurBP_BP_Tribord~output_o\ : std_logic;
SIGNAL \outCompteurBP_BP_Babord~output_o\ : std_logic;
SIGNAL \outCompteurBP_BP_STBY~output_o\ : std_logic;
SIGNAL \outCompteurBP_BP_Appuis~output_o\ : std_logic;
SIGNAL \inCompteurBP_clk_1hz~input_o\ : std_logic;
SIGNAL \inCompteurBP_clk_1hz~inputclkctrl_outclk\ : std_logic;
SIGNAL \inCompteurBP_BP_STBY~input_o\ : std_logic;
SIGNAL \inCompteurBP_BP_Tribord~input_o\ : std_logic;
SIGNAL \state[1]~5_combout\ : std_logic;
SIGNAL \state[1]~6_combout\ : std_logic;
SIGNAL \Mux4~3_combout\ : std_logic;
SIGNAL \state[2]~7_combout\ : std_logic;
SIGNAL \inCompteurBP_BP_Babord~input_o\ : std_logic;
SIGNAL \state[0]~4_combout\ : std_logic;
SIGNAL \state[0]~8_combout\ : std_logic;
SIGNAL \outCompteurBP_BP_Tribord~0_combout\ : std_logic;
SIGNAL \outCompteurBP_BP_Tribord~reg0_q\ : std_logic;
SIGNAL \outCompteurBP_BP_Babord~0_combout\ : std_logic;
SIGNAL \outCompteurBP_BP_Babord~reg0_q\ : std_logic;
SIGNAL \outCompteurBP_BP_STBY~0_combout\ : std_logic;
SIGNAL \outCompteurBP_BP_STBY~reg0_q\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux4~1_combout\ : std_logic;
SIGNAL \Mux4~2_combout\ : std_logic;
SIGNAL \outCompteurBP_BP_Appuis~reg0_q\ : std_logic;
SIGNAL state : std_logic_vector(2 DOWNTO 0);

BEGIN

outCompteurBP_BP_Tribord <= ww_outCompteurBP_BP_Tribord;
outCompteurBP_BP_Babord <= ww_outCompteurBP_BP_Babord;
outCompteurBP_BP_STBY <= ww_outCompteurBP_BP_STBY;
outCompteurBP_BP_Appuis <= ww_outCompteurBP_BP_Appuis;
ww_inCompteurBP_clk_1hz <= inCompteurBP_clk_1hz;
ww_inCompteurBP_BP_Babord <= inCompteurBP_BP_Babord;
ww_inCompteurBP_BP_Tribord <= inCompteurBP_BP_Tribord;
ww_inCompteurBP_BP_STBY <= inCompteurBP_BP_STBY;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inCompteurBP_clk_1hz~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inCompteurBP_clk_1hz~input_o\);

-- Location: IOOBUF_X0_Y28_N9
\outCompteurBP_BP_Tribord~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \outCompteurBP_BP_Tribord~reg0_q\,
	devoe => ww_devoe,
	o => \outCompteurBP_BP_Tribord~output_o\);

-- Location: IOOBUF_X0_Y24_N16
\outCompteurBP_BP_Babord~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \outCompteurBP_BP_Babord~reg0_q\,
	devoe => ww_devoe,
	o => \outCompteurBP_BP_Babord~output_o\);

-- Location: IOOBUF_X0_Y29_N2
\outCompteurBP_BP_STBY~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \outCompteurBP_BP_STBY~reg0_q\,
	devoe => ww_devoe,
	o => \outCompteurBP_BP_STBY~output_o\);

-- Location: IOOBUF_X0_Y14_N9
\outCompteurBP_BP_Appuis~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \outCompteurBP_BP_Appuis~reg0_q\,
	devoe => ww_devoe,
	o => \outCompteurBP_BP_Appuis~output_o\);

-- Location: IOIBUF_X0_Y16_N1
\inCompteurBP_clk_1hz~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inCompteurBP_clk_1hz,
	o => \inCompteurBP_clk_1hz~input_o\);

-- Location: CLKCTRL_G4
\inCompteurBP_clk_1hz~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inCompteurBP_clk_1hz~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inCompteurBP_clk_1hz~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y26_N15
\inCompteurBP_BP_STBY~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inCompteurBP_BP_STBY,
	o => \inCompteurBP_BP_STBY~input_o\);

-- Location: IOIBUF_X0_Y23_N22
\inCompteurBP_BP_Tribord~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inCompteurBP_BP_Tribord,
	o => \inCompteurBP_BP_Tribord~input_o\);

-- Location: LCCOMB_X1_Y25_N22
\state[1]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \state[1]~5_combout\ = (state(2)) # ((!\inCompteurBP_BP_Babord~input_o\ & (\inCompteurBP_BP_Tribord~input_o\ & !state(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inCompteurBP_BP_Babord~input_o\,
	datab => \inCompteurBP_BP_Tribord~input_o\,
	datac => state(2),
	datad => state(1),
	combout => \state[1]~5_combout\);

-- Location: LCCOMB_X1_Y25_N26
\state[1]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \state[1]~6_combout\ = (\state[1]~5_combout\) # (state(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state[1]~5_combout\,
	datad => state(0),
	combout => \state[1]~6_combout\);

-- Location: FF_X1_Y25_N27
\state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inCompteurBP_clk_1hz~inputclkctrl_outclk\,
	d => \state[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => state(1));

-- Location: LCCOMB_X1_Y25_N2
\Mux4~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux4~3_combout\ = (!state(1) & !state(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => state(1),
	datad => state(2),
	combout => \Mux4~3_combout\);

-- Location: LCCOMB_X1_Y25_N4
\state[2]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \state[2]~7_combout\ = (\state[0]~4_combout\ & (!state(0) & (\inCompteurBP_BP_STBY~input_o\ & \Mux4~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state[0]~4_combout\,
	datab => state(0),
	datac => \inCompteurBP_BP_STBY~input_o\,
	datad => \Mux4~3_combout\,
	combout => \state[2]~7_combout\);

-- Location: FF_X1_Y25_N5
\state[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inCompteurBP_clk_1hz~inputclkctrl_outclk\,
	d => \state[2]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => state(2));

-- Location: IOIBUF_X0_Y30_N1
\inCompteurBP_BP_Babord~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inCompteurBP_BP_Babord,
	o => \inCompteurBP_BP_Babord~input_o\);

-- Location: LCCOMB_X1_Y25_N12
\state[0]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \state[0]~4_combout\ = (!\inCompteurBP_BP_Tribord~input_o\ & !\inCompteurBP_BP_Babord~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inCompteurBP_BP_Tribord~input_o\,
	datad => \inCompteurBP_BP_Babord~input_o\,
	combout => \state[0]~4_combout\);

-- Location: LCCOMB_X1_Y25_N16
\state[0]~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \state[0]~8_combout\ = (!state(1) & (!state(2) & (!state(0) & !\state[0]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => state(1),
	datab => state(2),
	datac => state(0),
	datad => \state[0]~4_combout\,
	combout => \state[0]~8_combout\);

-- Location: FF_X1_Y25_N17
\state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inCompteurBP_clk_1hz~inputclkctrl_outclk\,
	d => \state[0]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => state(0));

-- Location: LCCOMB_X1_Y25_N0
\outCompteurBP_BP_Tribord~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \outCompteurBP_BP_Tribord~0_combout\ = (state(1) & ((state(0)))) # (!state(1) & (\outCompteurBP_BP_Tribord~reg0_q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => state(1),
	datac => \outCompteurBP_BP_Tribord~reg0_q\,
	datad => state(0),
	combout => \outCompteurBP_BP_Tribord~0_combout\);

-- Location: FF_X1_Y25_N1
\outCompteurBP_BP_Tribord~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inCompteurBP_clk_1hz~inputclkctrl_outclk\,
	d => \outCompteurBP_BP_Tribord~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \outCompteurBP_BP_Tribord~reg0_q\);

-- Location: LCCOMB_X1_Y25_N18
\outCompteurBP_BP_Babord~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \outCompteurBP_BP_Babord~0_combout\ = (state(1) & (\outCompteurBP_BP_Babord~reg0_q\ & state(0))) # (!state(1) & ((\outCompteurBP_BP_Babord~reg0_q\) # (state(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => state(1),
	datac => \outCompteurBP_BP_Babord~reg0_q\,
	datad => state(0),
	combout => \outCompteurBP_BP_Babord~0_combout\);

-- Location: FF_X1_Y25_N19
\outCompteurBP_BP_Babord~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inCompteurBP_clk_1hz~inputclkctrl_outclk\,
	d => \outCompteurBP_BP_Babord~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \outCompteurBP_BP_Babord~reg0_q\);

-- Location: LCCOMB_X1_Y25_N28
\outCompteurBP_BP_STBY~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \outCompteurBP_BP_STBY~0_combout\ = (state(0) & (((\outCompteurBP_BP_STBY~reg0_q\)))) # (!state(0) & (!state(1) & ((\outCompteurBP_BP_STBY~reg0_q\) # (state(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000111010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => state(1),
	datab => state(0),
	datac => \outCompteurBP_BP_STBY~reg0_q\,
	datad => state(2),
	combout => \outCompteurBP_BP_STBY~0_combout\);

-- Location: FF_X1_Y25_N29
\outCompteurBP_BP_STBY~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inCompteurBP_clk_1hz~inputclkctrl_outclk\,
	d => \outCompteurBP_BP_STBY~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \outCompteurBP_BP_STBY~reg0_q\);

-- Location: LCCOMB_X1_Y25_N14
\Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (state(1) & (((\inCompteurBP_BP_Tribord~input_o\ & state(0))))) # (!state(1) & ((\inCompteurBP_BP_Babord~input_o\) # ((!state(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inCompteurBP_BP_Babord~input_o\,
	datab => \inCompteurBP_BP_Tribord~input_o\,
	datac => state(1),
	datad => state(0),
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X1_Y25_N24
\Mux4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux4~1_combout\ = (state(2) & (\inCompteurBP_BP_STBY~input_o\)) # (!state(2) & ((\outCompteurBP_BP_Appuis~reg0_q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inCompteurBP_BP_STBY~input_o\,
	datac => state(2),
	datad => \outCompteurBP_BP_Appuis~reg0_q\,
	combout => \Mux4~1_combout\);

-- Location: LCCOMB_X1_Y25_N6
\Mux4~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Mux4~2_combout\ = (state(2) & (((\Mux4~1_combout\)))) # (!state(2) & (\Mux4~0_combout\ & ((state(0)) # (\Mux4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => state(0),
	datab => state(2),
	datac => \Mux4~0_combout\,
	datad => \Mux4~1_combout\,
	combout => \Mux4~2_combout\);

-- Location: FF_X1_Y25_N7
\outCompteurBP_BP_Appuis~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inCompteurBP_clk_1hz~inputclkctrl_outclk\,
	d => \Mux4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \outCompteurBP_BP_Appuis~reg0_q\);

ww_outCompteurBP_BP_Tribord <= \outCompteurBP_BP_Tribord~output_o\;

ww_outCompteurBP_BP_Babord <= \outCompteurBP_BP_Babord~output_o\;

ww_outCompteurBP_BP_STBY <= \outCompteurBP_BP_STBY~output_o\;

ww_outCompteurBP_BP_Appuis <= \outCompteurBP_BP_Appuis~output_o\;
END structure;


