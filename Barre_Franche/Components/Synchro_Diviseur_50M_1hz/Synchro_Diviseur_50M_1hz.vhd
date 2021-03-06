library ieee;
use ieee.std_logic_1164.all;


entity Synchro_Diviseur_50M_1hz is   port( 
	clkin : in std_logic;
	clkout1 : out std_logic;
	clkout2 : out std_logic);
end Synchro_Diviseur_50M_1hz ;


architecture div of Synchro_Diviseur_50M_1hz is
	signal cpt1 : integer:= 0;
	signal cpt2 : integer;
	signal state : integer:= 0;
begin
process (clkin)
begin
	if rising_edge(clkin) -- Si on resoit un front montant clkin
	then 
		cpt1 <= cpt1 + 1;
		if cpt1 = 25000000 and state = 0 then clkout1 <= '1';clkout2 <= '1'; state <= 1; end if;
		if cpt1 = 50000000 and state = 1 then clkout1 <= '0';clkout2 <= '0'; state <= 0; cpt1 <= 0; end if;
	end if;
end process;
end div;
	

