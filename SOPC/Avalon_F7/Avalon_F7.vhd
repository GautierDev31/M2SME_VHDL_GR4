library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity Avalon_F7 is   port( 

	clk, chipselect, write_n, reset_n : in std_logic;
	writedata : in std_logic_vector (31 downto 0);
	readdata : out std_logic_vector (31 downto 0);
	address: std_logic_vector (1 downto 0);

	BP_Barbord : in std_logic;
	BP_Tribord : in std_logic;
	BP_STBY : in std_logic;
	reset : in std_logic;
	
	led_Babord : out std_logic;
	led_Tribord : out std_logic;
	led_STBY : out std_logic;
	led_appuis : out std_logic; -- Juste pour tester avec des leds
	out_bip : out std_logic);
	
end Avalon_F7;

architecture ar of Avalon_F7 is

signal avalon_reset : std_logic_vector (0 downto 0);
signal DivtoF7 : std_logic;
signal config : std_logic_vector (0 downto 0);
signal code_fonction : std_logic_vector (3 downto 0);


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
	clkin => clk,
	clkout => DivtoF7
);


--*********************** Interface avalon **********************
--***************************************************************
avalon_reset <= config ;

--************************ Ecriture registres *******************
process_write: 
Process (clk, reset_n)
	begin
	if reset_n = '0' then
		config <= "0" ; -- ou config <= (others => '0') ;
	elsif clk'event and clk = '1' then
		if chipselect ='1' and write_n = '0' then
			if address = "00" then
				config <= writedata(0 downto 0) ;
			end if ;
		end if;
	end if;
end process;

--******************* Lecture registres ************************
--**************************************************************
process_Read:
PROCESS(address, code_fonction)
BEGIN
	case address is
		when "00" => readdata(0 downto 0 ) <= config ;
						 readdata(31 downto 1) <= (others =>'0') ;
		when "01" => readdata(3 downto 0) <= code_fonction; 
						 readdata(31 downto 4) <= (others => '0') ;
		when others => readdata <= (others => '0');
	end case;
END PROCESS process_Read ;


end ar;