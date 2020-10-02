library ieee;
use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all ;


entity compteur_monocoup is   port( 
	m_start_stop : in std_logic ;
	m_clk_2hz : in std_logic;
	m_in_freq_anemometre : in std_logic;
	m_anemo_mococoup : out std_logic_vector (7 downto 0));
end compteur_monocoup ;


architecture ar of compteur_monocoup is

	signal cpt : std_logic_vector(7 downto 0) := "00000000";
	signal state : integer := 0;
begin
process(m_start_stop,  m_clk_2hz, m_in_freq_anemometre)
begin
	if m_start_stop = '1' then
		if rising_edge(m_clk_2hz)then
			if state = 0 then state <= 1;
			else state <= 0;
			end if ;
		end if ; 
	
		if (m_in_freq_anemometre = '1' and m_in_freq_anemometre'event)then
			if state = 1 then
			cpt <= cpt + 2; 
			elsif state = 0 and cpt /= "00000000" then
			m_anemo_mococoup <= cpt;
			cpt <= "00000000";
			end if;
		end if;
	end if;
	
	
end process;
end ar;
	