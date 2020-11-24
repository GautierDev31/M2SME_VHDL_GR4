library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity Synchro_F7 is   port( 
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
	out_Synchro_code_fonction : out std_logic_vector (3 downto 0)
	);
end Synchro_F7;

architecture ar of Synchro_F7 is

signal mode : integer := 0; -- 0 mode manuel / 1 mode auto

begin
process(in_Synchro_BP_Barbord , in_Synchro_BP_Tribord, in_Synchro_BP_STBY, in_Synchro_Appuis, in_Synchr_reset)
begin
	
	-- Babord 1° / Mode manuel
	if (in_Synchro_BP_Barbord = '1' and in_Synchro_Appuis = '0' and mode = 0) then 
	out_Synchro_code_fonction <= "0100"; -- increment 1°
	
	out_Synchro_led_Babord <= '1';
	out_Synchro_led_Tribord <= '0';
	out_Synchro_led_STBY <= '0';
	out_Synchro_led_appuis <= '0';
	
	-- Babord 10° / Mode manuel
	elsif (in_Synchro_BP_Barbord = '1' and in_Synchro_Appuis = '1' and mode = 0) then
	out_Synchro_code_fonction <= "0101"; -- increment 10°
	
	out_Synchro_led_Babord <= '1';
	out_Synchro_led_Tribord <= '0';
	out_Synchro_led_STBY <= '0';
	out_Synchro_led_appuis <= '1';
	
	-- Tribord 1° / Mode manuel
	elsif (in_Synchro_BP_Tribord = '1' and in_Synchro_Appuis = '0' and mode = 0) then
	out_Synchro_code_fonction <= "0111"; -- decrement 1°
	
	out_Synchro_led_Babord <= '0';
	out_Synchro_led_Tribord <= '1';
	out_Synchro_led_STBY <= '0';
	out_Synchro_led_appuis <= '0';
	
	-- Tribord 10° / Mode manuel
	elsif (in_Synchro_BP_Tribord = '1' and in_Synchro_Appuis = '0' and mode = 0) then
	out_Synchro_code_fonction <= "0110"; -- decrement 10°
	
	out_Synchro_led_Babord <= '0';
	out_Synchro_led_Tribord <= '1';
	out_Synchro_led_STBY <= '0';
	out_Synchro_led_appuis <= '1';
	
	-- STBY = Mode pilote automatique / manuel
	elsif (in_Synchro_BP_STBY = '1' and in_Synchro_Appuis = '0') then
	out_Synchro_code_fonction <= "0011";
	
	out_Synchro_led_Babord <= '0';
	out_Synchro_led_Tribord <= '0';
	out_Synchro_led_STBY <= '1';
	out_Synchro_led_appuis <= '0';
	
	elsif (in_Synchro_BP_STBY = '1' and in_Synchro_Appuis = '0') then
	out_Synchro_code_fonction <= "0011";
	
	out_Synchro_led_Babord <= '0';
	out_Synchro_led_Tribord <= '0';
	out_Synchro_led_STBY <= '1';
	out_Synchro_led_appuis <= '0';
	
	-- Reset
	elsif (in_Synchr_reset = '1') then
	
	out_Synchro_led_Babord <= '0';
	out_Synchro_led_Tribord <= '0';
	out_Synchro_led_STBY <= '0';
	out_Synchro_bip <= '0';
	out_Synchro_code_fonction <= "0000";
	
	end if; 


end process;
end ar;