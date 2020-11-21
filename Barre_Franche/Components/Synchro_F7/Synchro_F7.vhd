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

	
begin
udiv1hz : Diviseur_50M_1hz PORT MAP(
	clkin => clk_50M,
	clkout => clk_1hz_out
);


end ar;