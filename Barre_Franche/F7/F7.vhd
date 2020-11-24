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

signal DivtoCompteur_clk_1Hz : std_logic;
signal CompteurtoSynchro_BP_Babord : std_logic;
signal CompteurtoSynchro_BP_Trbibord : std_logic;
signal CompteurtoSynchro_BP_STBY : std_logic;
signal CompteurtoSynchro_BP_Appuis : std_logic;


component Diviseur_50M_1hz  
 port( 
	clkin : in std_logic;
	clkout : out std_logic);
end component;

component CompteurBP  
 port( 
	inCompteurBP_clk_1hz : in std_logic;
	inCompteurBP_BP_Babord : in std_logic;
	inCompteurBP_BP_Tribord : in std_logic;
	inCompteurBP_BP_STBY : in std_logic;
	outCompteurBP_BP_Tribord : out std_logic;
	outCompteurBP_BP_Babord : out std_logic;
	outCompteurBP_BP_STBY : out std_logic;
	outCompteurBP_BP_Appuis: out std_logic);
end component;

component Synchro_F7
 port( 
	in_Synchro_BP_Barbord : in std_logic;
	in_Synchro_BP_Tribord : in std_logic;
	in_Synchro_BP_STBY : in std_logic;
	in_Synchro_Appuis : in std_logic;
	in_Synchr_reset : in std_logic;
	out_Synchro_led_Babord : out std_logic;
	out_Synchro_led_Tribord : out std_logic;
	out_Synchro_led_STBY : out std_logic;
	out_Synchro_led_appuis : out std_logic; -- Juste pour tester avec des leds
	out_Synchro_bip : out std_logic;
	out_Synchro_code_fonction : out std_logic_vector (3 downto 0));
end component;
	
begin

udiv1hz : Diviseur_50M_1hz PORT MAP(
	clkin => clk_50M,
	clkout => DivtoCompteur_clk_1Hz
);

ucompteurbp : CompteurBP PORT MAP(
	inCompteurBP_clk_1hz => DivtoCompteur_clk_1Hz,
	inCompteurBP_BP_Babord => BP_Barbord,
	inCompteurBP_BP_Tribord => BP_Tribord,
	inCompteurBP_BP_STBY => BP_STBY,
	outCompteurBP_BP_Tribord => CompteurtoSynchro_BP_Babord,
	outCompteurBP_BP_Babord => CompteurtoSynchro_BP_Trbibord,
	outCompteurBP_BP_STBY => CompteurtoSynchro_BP_STBY,
	outCompteurBP_BP_Appuis => CompteurtoSynchro_BP_Appuis
);

usynchro : Synchro_F7 PORT MAP (
	in_Synchro_BP_Barbord => CompteurtoSynchro_BP_Babord,
	in_Synchro_BP_Tribord => CompteurtoSynchro_BP_Trbibord,
	in_Synchro_BP_STBY => CompteurtoSynchro_BP_STBY,
	in_Synchro_Appuis => CompteurtoSynchro_BP_Appuis,
	in_Synchr_reset => reset,
	out_Synchro_led_Babord => led_Babord,
	out_Synchro_led_Tribord => led_Tribord,
	out_Synchro_led_STBY => led_STBY,
	out_Synchro_led_appuis => led_appuis, -- A retirer plus tard
	out_Synchro_bip => out_bip,
	out_Synchro_code_fonction => code_fonction

);


end ar;