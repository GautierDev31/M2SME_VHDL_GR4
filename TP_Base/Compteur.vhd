library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity Compteur is   port( 
	Sa : out std_logic;
	Sb : out std_logic;
	Sc : out std_logic;
	Sd : out std_logic;
	Se : out std_logic;
	Sf : out std_logic;
	Sg : out std_logic;
	clockIN : in std_logic);
end Compteur;

architecture ar of Compteur is

component Compteur_BCD
	port ( 	clkinBCD : in std_logic;
	cpt : out std_logic_vector(3 downto 0)
	);
end component;

component Diviseur_frequence
	port ( clkin : in std_logic;
	clkout : out std_logic);
end component;

component Decodeur 
port( 
	Number : in std_logic_vector (3 downto 0);
	A : out std_logic;
	B : out std_logic;
	C : out std_logic;
	D : out std_logic;
	E : out std_logic;
	F : out std_logic;
	G : out std_logic);
end component;

	signal clock1HZ : std_logic;
	signal Vect : std_logic_vector(3 downto 0);
	
begin
udiv : Diviseur_frequence PORT MAP(
	clkin => clockIN,
	clkout => clock1HZ
);

ucpt : Compteur_BCD PORT MAP(
	clkinBCD => clock1HZ,
	cpt => Vect
);

udec : Decodeur PORT MAP(
	Number => Vect,
	A => Sa,
	B => Sb,
	C => Sc,
	D => Sd,
	E => Se,
	F => Sf,
	G => Sg
);

end ar;

