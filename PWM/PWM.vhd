library ieee;
use ieee.std_logic_1164.all;


entity PWM is   port( 
	BTN1 : in std_logic;
	BTN2 : in std_logic;
	BTN3 : in std_logic;
	BTN4 : in std_logic;
	PWMin: in std_logic;
	PWMout : out std_logic);
end PWM ;

architecture ar of  PWM is

component Diviseur_frequence
	port ( clkin : in std_logic;
	clkout : out std_logic);
end component;

component Comparateur 
port( 
	clk_1kHz : in std_logic;
	PWM : out std_logic;
	BTN1 : in std_logic;
	BTN2 : in std_logic;
	BTN3 : in std_logic;
	BTN4 : in std_logic
	);
end component;

	signal clock1HZ : std_logic;
	signal Vect : std_logic_vector(3 downto 0);
	
begin
udiv : Diviseur_frequence PORT MAP(
	clkin => PWMin,
	clkout => clock1HZ
);

ucp : Comparateur PORT MAP(
	clk_1kHz => clock1HZ,
	PWM => PWMout,
	BTN1 => BTN1,
	BTN2 => BTN2,
	BTN3 => BTN3,
	BTN4 => BTN4
);


end ar;
