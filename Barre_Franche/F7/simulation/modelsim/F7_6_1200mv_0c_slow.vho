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

-- DATE "11/10/2020 09:02:44"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	CompteurBP IS
    PORT (
	outCompteurBP_BP_Tribord : OUT std_logic;
	outCompteurBP_BP_Babord : OUT std_logic;
	outCompteurBP_BP_STBY : OUT std_logic;
	outCompteurBP_BP_Appuis : OUT std_logic;
	inCompteurBP_clk_50M : IN std_logic;
	inCompteurBP_BP_Babord : IN std_logic;
	inCompteurBP_BP_Tribord : IN std_logic;
	inCompteurBP_BP_STBY : IN std_logic
	);
END CompteurBP;

-- Design Ports Information
-- inCompteurBP_clk_50M	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inCompteurBP_BP_Babord	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inCompteurBP_BP_Tribord	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inCompteurBP_BP_STBY	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outCompteurBP_BP_Tribord	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outCompteurBP_BP_Babord	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outCompteurBP_BP_STBY	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- outCompteurBP_BP_Appuis	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_inCompteurBP_clk_50M : std_logic;
SIGNAL ww_inCompteurBP_BP_Babord : std_logic;
SIGNAL ww_inCompteurBP_BP_Tribord : std_logic;
SIGNAL ww_inCompteurBP_BP_STBY : std_logic;
SIGNAL \inCompteurBP_clk_50M~input_o\ : std_logic;
SIGNAL \inCompteurBP_BP_Babord~input_o\ : std_logic;
SIGNAL \inCompteurBP_BP_Tribord~input_o\ : std_logic;
SIGNAL \inCompteurBP_BP_STBY~input_o\ : std_logic;
SIGNAL \outCompteurBP_BP_Tribord~output_o\ : std_logic;
SIGNAL \outCompteurBP_BP_Babord~output_o\ : std_logic;
SIGNAL \outCompteurBP_BP_STBY~output_o\ : std_logic;
SIGNAL \outCompteurBP_BP_Appuis~output_o\ : std_logic;

BEGIN

outCompteurBP_BP_Tribord <= ww_outCompteurBP_BP_Tribord;
outCompteurBP_BP_Babord <= ww_outCompteurBP_BP_Babord;
outCompteurBP_BP_STBY <= ww_outCompteurBP_BP_STBY;
outCompteurBP_BP_Appuis <= ww_outCompteurBP_BP_Appuis;
ww_inCompteurBP_clk_50M <= inCompteurBP_clk_50M;
ww_inCompteurBP_BP_Babord <= inCompteurBP_BP_Babord;
ww_inCompteurBP_BP_Tribord <= inCompteurBP_BP_Tribord;
ww_inCompteurBP_BP_STBY <= inCompteurBP_BP_STBY;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X53_Y11_N2
\outCompteurBP_BP_Tribord~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \outCompteurBP_BP_Tribord~output_o\);

-- Location: IOOBUF_X38_Y34_N16
\outCompteurBP_BP_Babord~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \outCompteurBP_BP_Babord~output_o\);

-- Location: IOOBUF_X11_Y34_N2
\outCompteurBP_BP_STBY~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \outCompteurBP_BP_STBY~output_o\);

-- Location: IOOBUF_X0_Y24_N16
\outCompteurBP_BP_Appuis~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \outCompteurBP_BP_Appuis~output_o\);

-- Location: IOIBUF_X53_Y22_N8
\inCompteurBP_clk_50M~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inCompteurBP_clk_50M,
	o => \inCompteurBP_clk_50M~input_o\);

-- Location: IOIBUF_X0_Y23_N1
\inCompteurBP_BP_Babord~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inCompteurBP_BP_Babord,
	o => \inCompteurBP_BP_Babord~input_o\);

-- Location: IOIBUF_X0_Y23_N15
\inCompteurBP_BP_Tribord~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inCompteurBP_BP_Tribord,
	o => \inCompteurBP_BP_Tribord~input_o\);

-- Location: IOIBUF_X3_Y34_N1
\inCompteurBP_BP_STBY~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inCompteurBP_BP_STBY,
	o => \inCompteurBP_BP_STBY~input_o\);

ww_outCompteurBP_BP_Tribord <= \outCompteurBP_BP_Tribord~output_o\;

ww_outCompteurBP_BP_Babord <= \outCompteurBP_BP_Babord~output_o\;

ww_outCompteurBP_BP_STBY <= \outCompteurBP_BP_STBY~output_o\;

ww_outCompteurBP_BP_Appuis <= \outCompteurBP_BP_Appuis~output_o\;
END structure;


