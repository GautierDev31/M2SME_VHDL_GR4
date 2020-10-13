library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity F1 is   port( 
	in_fred_anemometre : in std_logic;
	start_stop : in std_logic;
	raz_n : in std_logic;
	continu : in std_logic;
	clk_50M : in std_logic;
	led0 : out std_logic;
	led1 : out std_logic; 
	led2 : out std_logic; 
	led3 : out std_logic; 
	led4 : out std_logic; 
	led5 : out std_logic; 
	led6 : out std_logic; 
	led7 : out std_logic;
	data_valid : out std_logic);
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

component compteur_monocoup
Port (
		m_start_stop : in std_logic ;
		m_clk_2hz : in std_logic;
		m_in_freq_anemometre : in std_logic;
		m_anemo_mococoup : out std_logic_vector (7 downto 0)
	 ) ;
end component;

component synchro_anemo
Port (
	in_continu : in std_logic;
	in_raz_n : in std_logic;
	in_data_anemo_continu : in std_logic_vector(7 downto 0);
	in_data_anemo_monocoup : in std_logic_vector(7 downto 0);
	out_data_anemometre: out std_logic_vector(7 downto 0);
	out_data_valid : out std_logic
	);
end component;


component Affichage_8bits
port( 
	led0 : out std_logic; 
	led1 : out std_logic; 
	led2 : out std_logic; 
	led3 : out std_logic; 
	led4 : out std_logic; 
	led5 : out std_logic; 
	led6 : out std_logic; 
	led7 : out std_logic;
	leds : in std_logic_vector (7 downto 0));
end component ;

	signal clk_2hz_out : std_logic;
	signal clk_1hz_out : std_logic;
	signal data_anemo_out : std_logic_vector(7 downto 0);
	signal data_anemo_aff : std_logic_vector(7 downto 0);
	signal data_anemo_continu_out : std_logic_vector(7 downto 0);
	signal data_anemo_continu_raf_out : std_logic_vector(7 downto 0);
	signal data_anemo_monocoup_out : std_logic_vector(7 downto 0);
	signal data_valid_out : std_logic;

	
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
	vect_anemo => data_anemo_continu_out
);

uraf : raf_anemo PORT MAP(
	clk1Hz => clk_1hz_out,
	vect => data_anemo_continu_out,
	data_anemo => data_anemo_continu_raf_out
);

uaffichage : Affichage_8bits PORT MAP(
	led0 => led0,
	led1 => led1,
	led2 => led2, 
	led3 => led3,
	led4 => led4, 
	led5 => led5,
	led6 => led6,
	led7 => led7,
	leds => data_anemo_aff
);

ucptmono : compteur_monocoup PORT MAP (
	m_clk_2hz => clk_2hz_out,
	m_in_freq_anemometre => in_fred_anemometre,
	m_anemo_mococoup => data_anemo_monocoup_out,
	m_start_stop => start_stop
);

usynchro : synchro_anemo PORT MAP (
	in_continu => continu,
	in_raz_n => raz_n,
	in_data_anemo_continu => data_anemo_continu_raf_out,
	in_data_anemo_monocoup => data_anemo_monocoup_out,
	out_data_anemometre => data_anemo_aff,
	out_data_valid => data_valid
);

end ar;