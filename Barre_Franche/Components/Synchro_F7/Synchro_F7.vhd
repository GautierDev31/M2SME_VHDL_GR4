library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity F1 is   port( 
	in_Synchro_BP_Barbord : std_logic;
	in_Synchro_BP_Tribord : std_logic;
	in_Synchro_BP_STBY : std_logic;
	in_Synchro_Appuis : std_logic;
	in_Synchr_reset : std_logic;
	out_led_Babord : std_logic;
	out_led_Tribord : std_logic;
	out_led_STBY : std_logic;
	out_bip : std_logic;
	out_code_fonction : std_vector (3 downto 0)
	);
end F1;

architecture ar of F1 is

component Diviseur_50M_1hz  

begin

signal mode := integer := 0 -- 0 mode manuel / 1 mode auto

process(in_Synchro_BP_Barbord , in_Synchro_BP_Tribord, in_Synchro_BP_STBY, in_Synchro_Appuis, in_Synchr_reset)
begin
	
	-- Babord 1� / Mode manuel
	if (in_Synchro_BP_Barbord = '1' and in_Synchro_Appuis = '0' and mode = 0) then 
	out_code_fonction = "0100"; -- increment 1�
	
	-- Babord 10� / Mode manuel
	elsif (in_Synchro_BP_Barbord = '1' and in_Synchro_Appuis = '1' and mode = 0) then
	out_code_fonction = "0101"; -- increment 10�
	
	-- Tribord 1� / Mode manuel
	elsif (in_Synchro_BP_Tribord = '1' and in_Synchro_Appuis = 0 and mode = 0) then
	out_code_fonction = "0111"; -- decrement 1�
	
	-- Tribord 10� / Mode manuel
	elsif (in_Synchro_BP_Tribord = '1' and in_Synchro_Appuis = 0 and mode = 0) then
	out_code_fonction = "0110"; -- decrement 10�
	
	-- STBY = Mode pilote automatique / manuel
	elsif (in_Synchro_BP_STBY = '1' and in_Synchro_Appuis = 0) then
	out_code_fonction = "0011";
	
	elsif (in_Synchro_BP_STBY = '1' and in_Synchro_Appuis = 0) then
	out_code_fonction = "0011";
	
	-- Reset
	elsif (in_Synchr_reset = '1') then
	
	out_led_Babord = '0';
	out_led_Tribord = '0';
	out_led_STBY = '0';
	out_bip = '0';
	out_code_fonction = "0000";
	
	end if; 


end process;
end ar;