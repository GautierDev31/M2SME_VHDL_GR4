-- Avalon_F7_0.vhd

-- This file was auto-generated as part of a generation operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Avalon_F7_0 is
	port (
		clk         : in  std_logic                     := '0';             --          clock.clk
		chipselect  : in  std_logic                     := '0';             -- avalon_slave_0.chipselect
		write_n     : in  std_logic                     := '0';             --               .write_n
		writedata   : in  std_logic_vector(31 downto 0) := (others => '0'); --               .writedata
		readdata    : out std_logic_vector(31 downto 0);                    --               .readdata
		address     : in  std_logic_vector(1 downto 0)  := (others => '0'); --               .address
		reset_n     : in  std_logic                     := '0';             --          reset.reset_n
		BP_Barbord  : in  std_logic                     := '0';             --    conduit_end.export
		BP_Tribord  : in  std_logic                     := '0';             --  conduit_end_1.export
		BP_STBY     : in  std_logic                     := '0';             --  conduit_end_2.export
		reset       : in  std_logic                     := '0';             --  conduit_end_3.export
		led_Babord  : out std_logic;                                        --  conduit_end_4.export
		led_Tribord : out std_logic;                                        --  conduit_end_5.export
		led_STBY    : out std_logic;                                        --  conduit_end_6.export
		led_appuis  : out std_logic;                                        --  conduit_end_7.export
		out_bip     : out std_logic                                         --  conduit_end_8.export
	);
end entity Avalon_F7_0;

architecture rtl of Avalon_F7_0 is
	component Avalon_F7 is
		port (
			clk         : in  std_logic                     := 'X';             -- clk
			chipselect  : in  std_logic                     := 'X';             -- chipselect
			write_n     : in  std_logic                     := 'X';             -- write_n
			writedata   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			readdata    : out std_logic_vector(31 downto 0);                    -- readdata
			address     : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			reset_n     : in  std_logic                     := 'X';             -- reset_n
			BP_Barbord  : in  std_logic                     := 'X';             -- export
			BP_Tribord  : in  std_logic                     := 'X';             -- export
			BP_STBY     : in  std_logic                     := 'X';             -- export
			reset       : in  std_logic                     := 'X';             -- export
			led_Babord  : out std_logic;                                        -- export
			led_Tribord : out std_logic;                                        -- export
			led_STBY    : out std_logic;                                        -- export
			led_appuis  : out std_logic;                                        -- export
			out_bip     : out std_logic                                         -- export
		);
	end component Avalon_F7;

begin

	avalon_f7_0 : component Avalon_F7
		port map (
			clk         => clk,         --          clock.clk
			chipselect  => chipselect,  -- avalon_slave_0.chipselect
			write_n     => write_n,     --               .write_n
			writedata   => writedata,   --               .writedata
			readdata    => readdata,    --               .readdata
			address     => address,     --               .address
			reset_n     => reset_n,     --          reset.reset_n
			BP_Barbord  => BP_Barbord,  --    conduit_end.export
			BP_Tribord  => BP_Tribord,  --  conduit_end_1.export
			BP_STBY     => BP_STBY,     --  conduit_end_2.export
			reset       => reset,       --  conduit_end_3.export
			led_Babord  => led_Babord,  --  conduit_end_4.export
			led_Tribord => led_Tribord, --  conduit_end_5.export
			led_STBY    => led_STBY,    --  conduit_end_6.export
			led_appuis  => led_appuis,  --  conduit_end_7.export
			out_bip     => out_bip      --  conduit_end_8.export
		);

end architecture rtl; -- of Avalon_F7_0
