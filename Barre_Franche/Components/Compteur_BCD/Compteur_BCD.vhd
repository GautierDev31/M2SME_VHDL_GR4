library ieee;
use ieee.std_logic_1164.all ;
Use ieee.std_logic_unsigned.all ;

Entity Compteur_BCD is 
Port(	clk_1hz	: IN std_logic ;
		in_fred_anemometre : IN std_logic;
		vect_anemo	: OUT std_logic_vector(7 downto 0)
	) ;
End Compteur_BCD ;

Architecture arch of Compteur_BCD is

 signal cpt_anemo : std_logic_vector(7 downto 0):= "00000000" ;
 signal state : integer := 0;
 
Begin
	Process (clk_1hz, in_fred_anemometre)
	Begin
    if rising_edge(clk_1hz)then
		if state = 0 then state <= 1;
		else state <= 0;
		end if ;
	end if ; 
	
	
	if (in_fred_anemometre = '1' and in_fred_anemometre'event)then
		if state = 1 then
		cpt_anemo <= cpt_anemo + 2; 
		elsif state = 0 and cpt_anemo /= "00000000" then
		vect_anemo <= cpt_anemo;
		cpt_anemo <= "00000000";
		end if;
	end if;	


	End Process ;
End arch ;