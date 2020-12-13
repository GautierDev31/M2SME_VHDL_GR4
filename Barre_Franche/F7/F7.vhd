library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity F7 is   port( 
	clk_50M : in std_logic;
	BP_Barbord : in std_logic;
	BP_Tribord : in std_logic;
	BP_STBY : in std_logic;
	reset : in std_logic;
	led_Babord : out std_logic;
	led_Tribord : out std_logic;
	led_STBY : out std_logic;
	led_appuis : out std_logic; -- Juste pour tester avec des leds
	out_bip : out std_logic;
	code_fonction : out std_logic_vector (3 downto 0));
end F7;

architecture ar of F7 is

-- signal DivtoCompteur_clk_1Hz : std_logic;
-- signal CompteurtoSynchro_BP_Babord : std_logic;
-- signal CompteurtoSynchro_BP_Trbibord : std_logic;
-- signal CompteurtoSynchro_BP_STBY : std_logic;
-- signal CompteurtoSynchro_BP_Appuis : std_logic;
signal DivtoF7 : std_logic;

component Fonction_F7 port( 
	in_F7_clk_1hz : in std_logic;
	in_F7_BP_Babord : in std_logic;
	in_F7_BP_Tribord : in std_logic;
	in_F7_BP_STBY : in std_logic;
	in_F7_reset : in std_logic;
	out_F7_led_Babord : out std_logic;
	out_F7_led_Tribord : out std_logic;
	out_F7_led_STBY : out std_logic;
	out_F7_led_appuis : out std_logic; -- Juste pour tester avec des leds
	out_F7_bip : out std_logic;
	out_F7_code_fonction : out std_logic_vector (3 downto 0)
	);
end component;

component Diviseur_50M_1hz  
 port( 
	clkin : in std_logic;
	clkout : out std_logic);
end component;


begin

uF7 : Fonction_F7 PORT MAP (
	in_F7_clk_1hz => DivtoF7,
	in_F7_BP_Babord => BP_Barbord,
	in_F7_BP_Tribord => BP_Tribord,
	in_F7_BP_STBY => BP_STBY,
	in_F7_reset => reset,
	out_F7_led_Babord => led_Babord,
	out_F7_led_Tribord => led_Tribord,
	out_F7_led_STBY => led_STBY,
	out_F7_led_appuis => led_appuis, -- Juste pour tester avec des leds
	out_F7_bip => out_bip,
	out_F7_code_fonction => code_fonction

);

udiv1hz : Diviseur_50M_1hz PORT MAP(
	clkin => clk_50M,
	clkout => DivtoF7
);



end ar;