library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

Entity avalon_anemo is
port (
	clk, chipselect, write_n, reset_n : in std_logic;
	writedata : in std_logic_vector (31 downto 0);
	readdata : out std_logic_vector (31 downto 0);
	address: std_logic_vector (1 downto 0);
	in_fred_anemometre : in std_logic
	   );

end entity ;


Architecture arch_avalon_anemo of avalon_anemo is


	signal start_stop : std_logic;
	signal raz_n : std_logic;
	signal continu : std_logic;
	signal clk_50M : std_logic;
	signal config : std_logic_vector(2 downto 0);
	signal data_valid : std_logic;
	signal data_anemometre : std_logic_vector(7 downto 0);
	
	signal led0 : std_logic;
	signal led1 : std_logic; 
	signal led2 : std_logic; 
	signal led3 : std_logic; 
	signal led4 : std_logic; 
	signal led5 : std_logic; 
	signal led6 : std_logic; 
	signal led7 : std_logic;

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
	clkin => clk,
	clkout => clk_1hz_out
);

udiv2hz : Diviseur_50M_2hz PORT MAP(
	clkin => clk,
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

--*********************** Interface avalon **********************
--***************************************************************
raz_n <= config(0) ;
continu <= config(1) ;
start_stop <= config(2) ;

--************************ Ecriture registres *******************
process_write: 
Process (clk, reset_n)
	begin
	if reset_n = '0' then
		config <= "000" ; -- ou config <= (others => '0') ;
	elsif clk'event and clk = '1' then
		if chipselect ='1' and write_n = '0' then
			if address = "00" then
				config <= writedata(2 downto 0) ;
			end if ;
		end if;
	end if;
end process;

--******************* Lecture registres ************************
--**************************************************************
process_Read:
PROCESS(address, data_anemo_aff)
BEGIN
	case address is
		when "00" => readdata(2 downto 0) <= config ;
						 readdata(31 downto 3) <= (others =>'0') ;
		when "01" => readdata(9 downto 0) <= data_valid & '0' & data_anemo_aff; 
						 readdata(31 downto 10) <= (others => '0') ;
		when others => readdata <= (others => '0');
	end case;
END PROCESS process_Read ;

End arch_avalon_anemo;