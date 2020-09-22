library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity Compteur_BCD is   port( 
	clkinBCD : in std_logic;
	cpt : out std_logic_vector(3 downto 0));
end Compteur_BCD ;


architecture compteur of Compteur_BCD is
	signal compteur : integer := 0; 
begin
process (clkinBCD, compteur)
begin

	if rising_edge(clkinBCD)
	then compteur <= compteur + 1;
	end if;
	
	if compteur = 1 or compteur = 3 or compteur =5 or compteur =7 or compteur =9
	then cpt(0) <= '1';
	else cpt(0) <= '0'; 
	end if;
	
	if compteur = 2 or compteur =3 or compteur =6 or compteur =7
	then cpt(1) <= '1';
	else cpt(1) <= '0'; 
	end if;
	
	if compteur = 4 or compteur =5 or compteur =6 or compteur =7
	then cpt(2) <= '1';
	else cpt(2) <= '0'; 
	end if;
	
	if compteur = 8 or compteur =9
	then cpt(3) <= '1';
	else cpt(3) <= '0'; 
	end if;
	
	if compteur = 10
	then cpt <= "0000";
	compteur <= 0;
	end if;
	
end process;
end compteur;
	
