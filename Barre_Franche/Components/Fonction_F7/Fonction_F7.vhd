library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity Fonction_F7 is   port( 
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
end Fonction_F7;

architecture ar of Fonction_F7 is

signal cpt_babord : integer := 0;
signal cpt_tribord : integer := 0;
signal cpt_STBY : integer := 0;
signal cpt_tmps : integer := 0;

begin
process(in_F7_clk_1hz, in_F7_BP_Babord, in_F7_BP_Tribord, in_F7_BP_STBY)
variable state : integer range 0 to 4;
begin
	
	if rising_edge(in_F7_clk_1hz) then
	case state is
	when 0 =>
		if in_F7_BP_Babord = '0' then
		cpt_babord <= cpt_babord + 1;
		state := 1;
		elsif in_F7_BP_Tribord = '0' then
		cpt_tribord <= cpt_tribord + 1;
		state := 3;
		elsif in_F7_BP_STBY = '0' then
		cpt_STBY <= cpt_STBY + 1;
		state := 4;
		end if;
	when 1 => -- Babord
		if in_F7_BP_Babord = '0' then -- Appuis long
		out_F7_code_fonction <= "0101"; -- increment 10 degré
		out_F7_led_appuis <= '0';
		out_F7_led_Babord <= '0';
		out_F7_bip <= '0';
		cpt_babord <= 0;
		state := 2;
		else -- Appuis court
		out_F7_code_fonction <= "0100"; -- increment 1 degré
		out_F7_led_appuis <= '1';
		out_F7_led_Babord <= '0';
		out_F7_bip <= '0';
		cpt_babord <= 0;
		state := 2;
		end if;
	when 3 => -- Tribord
		if in_F7_BP_Tribord = '0' then
		out_F7_code_fonction <= "0110"; -- decrement 10 degré
		out_F7_led_appuis <= '0';
		out_F7_led_Tribord <= '0';
		out_F7_bip <= '0';
		cpt_tribord <= 0;
		state := 2;
		else
		out_F7_code_fonction <= "0111"; -- decrement 1 degré
		out_F7_led_appuis <= '1';
		out_F7_bip <= '0';
		out_F7_led_Tribord <= '0';
		cpt_tribord <= 0;
		state := 2;
		end if;
	when 4 => -- STBY
		if in_F7_BP_STBY = '0' then
		out_F7_code_fonction <= "0011";
		out_F7_led_appuis <= '0';
		out_F7_led_STBY <= '0';
		out_F7_bip <= '0';
		cpt_STBY <= 0;
		state := 2;
		else
		out_F7_code_fonction <= "0011";
		out_F7_led_appuis <= '1';
		out_F7_bip <= '0';
		out_F7_led_STBY <= '0';
		cpt_STBY <= 0;
		state := 2;
		end if;
		
	when 2 => -- Remise a 0
		out_F7_led_appuis <= '1';
		out_F7_led_Babord <= '1';
		out_F7_led_Tribord <= '1';
		out_F7_code_fonction <= "0000";
		out_F7_bip <= '1';
		out_F7_led_STBY <= '1';
		state := 0;
	end case;
	end if; --clock


end process;
end ar;