library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity F1 is   port( 
	in_fred_anemometre : in std_logic;
	clk_50M : in std_logic;
	data_anemometre : out std_logic_vector(7 downto 0));
end F1;

architecture ar of F1 is

component Diviseur_50M_1hz  
 port( 
	clkin : in std_logic;
	clkout : out std_logic);
end component;

component Diviseur_50M_2hz    
port( 
	clkin : in std_logic;
	clkout : out std_logic);
end component;

component Compteur
Port(	clk_2hz	: IN std_logic ;
		in_fred_anemo : IN std_logic;
		vect_anemo	: OUT std_logic_vector(7 downto 0)
	) ;
end component;

component raf_anemo
Port (
		clk1Hz	: IN std_logic ;
		vect 	: IN std_logic_vector(7 downto 0) ;
		data_anemo	:OUT std_logic_vector(7 downto 0)
	 ) ;
end component;

	signal clk_2hz_out : std_logic;
	signal clk_1hz_out : std_logic;
	signal data_anemo_out : std_logic_vector(7 downto 0);
	
begin
udiv1hz : Diviseur_50M_1hz PORT MAP(
	clkin => clk_50M,
	clkout => clk_1hz_out
);

udiv2hz : Diviseur_50M_2hz PORT MAP(
	clkin => clk_50M,
	clkout => clk_2hz_out
);

ucpt : Compteur PORT MAP(
	clk_2hz => clk_2hz_out,
	in_fred_anemo => in_fred_anemometre,
	vect_anemo => data_anemo_out
);

uraf : raf_anemo PORT MAP(
	clk1Hz => clk_1hz_out,
	vect => data_anemo_out,
	data_anemo => data_anemometre
);

end ar;