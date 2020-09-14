library ieee;
use ieee.std_logic_1164.all;


entity Diviseur_frequence is   port( 
	clkin : in std_logic;
	clkout : inout std_logic);
end Diviseur_frequence ;


architecture div of Diviseur_frequence is
	signal cpt1 : integer;
	signal cpt2 : integer;
begin
process (clkin, clkout)
begin
	if rising_edge(clkin) -- Si on resoit un front montant clkin
	then 
		cpt1 <= cpt1 + 1;
		if cpt1 = 25 then cpt2 <= 1; else cpt2 <= 0; end if;
		if cpt2 = 1 then clkout <= not(clkout); cpt1 <= 0; end if;
	end if;
end process;
end div;
	

