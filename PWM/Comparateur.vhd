library ieee;
use ieee.std_logic_1164.all;


entity Comparateur is   port( 
	clk_1kHz : in std_logic;
	PWM : out std_logic;
	BTN1 : in std_logic;
	BTN2 : in std_logic;
	BTN3 : in std_logic;
	BTN4 : in std_logic
	);
end Comparateur ;

architecture arch of Comparateur is
	signal duty : integer:= 0;
	signal cpt : integer:= 0;
	signal state : integer:=0;
	
begin	
process(BTN1, BTN2, BTN3, BTN4, clk_1kHz)
begin
	if BTN1 = '1' then duty <= 1; 
	elsif BTN2 = '1' then duty <= 2; 
	elsif BTN3 = '1' then duty <= 3; 
	elsif BTN4 = '1' then duty <= 4; 
	end if ;
	
	if rising_edge(clk_1kHz)
	then cpt <= cpt + 1; 
	if cpt < duty and state = 0 then PWM <= '1'; state <= 1; end if;
	if cpt = duty and state = 1 then PWM <= '0'; end if;
	if cpt >(duty + (5 - duty)) and state = 1 then state <= 0; cpt <= 0; end if;
 end if;
end process;
end arch;

