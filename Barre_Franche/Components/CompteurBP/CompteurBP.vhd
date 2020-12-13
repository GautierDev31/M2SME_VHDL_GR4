library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity CompteurBP is   port( 
	inCompteurBP_clk_1hz : in std_logic;
	inCompteurBP_BP_Babord : in std_logic;
	inCompteurBP_BP_Tribord : in std_logic;
	inCompteurBP_BP_STBY : in std_logic;
	outCompteurBP_BP_Tribord : out std_logic;
	outCompteurBP_BP_Babord : out std_logic;
	outCompteurBP_BP_STBY : out std_logic;
	outCompteurBP_BP_Appuis: out std_logic);
end CompteurBP;

architecture ar of CompteurBP is

signal cpt_babord : integer := 0;
signal cpt_tribord : integer := 0;
signal cpt_STBY : integer := 0;
signal cpt_tmps : integer := 0;

begin
process(inCompteurBP_clk_1hz, inCompteurBP_BP_Babord, inCompteurBP_BP_Tribord, inCompteurBP_BP_STBY)
variable state : integer range 0 to 4;
begin


	if rising_edge(inCompteurBP_clk_1hz) then
	case state is
	when 0 =>
		if inCompteurBP_BP_Babord = '0' then
		cpt_babord <= cpt_babord + 1;
		state := 1;
		elsif inCompteurBP_BP_Tribord = '0' then
		cpt_tribord <= cpt_tribord + 1;
		state := 3;
		elsif inCompteurBP_BP_STBY = '0' then
		cpt_STBY <= cpt_STBY + 1;
		state := 4;
		end if;
	when 1 => -- Babord
		if inCompteurBP_BP_Babord = '0' then
		outCompteurBP_BP_Babord <= '0';
		outCompteurBP_BP_Appuis <= '0';
		cpt_babord <= 0;
		state := 2;
		else
		outCompteurBP_BP_Babord <= '0';
		outCompteurBP_BP_Appuis <= '1';
		cpt_babord <= 0;
		state := 2;
		end if;
	when 3 => -- Tribord
		if inCompteurBP_BP_Tribord = '0' then
		outCompteurBP_BP_Tribord <= '0';
		outCompteurBP_BP_Appuis <= '0';
		cpt_tribord <= 0;
		state := 2;
		else
		outCompteurBP_BP_Tribord <= '0';
		outCompteurBP_BP_Appuis <= '1';
		cpt_tribord <= 0;
		state := 2;
		end if;
	when 4 => -- STBY
		if inCompteurBP_BP_STBY = '0' then
		outCompteurBP_BP_STBY <= '0';
		outCompteurBP_BP_Appuis <= '0';
		cpt_STBY <= 0;
		state := 2;
		else
		outCompteurBP_BP_STBY <= '0';
		outCompteurBP_BP_Appuis <= '1';
		cpt_STBY <= 0;
		state := 2;
		end if;
		
	when 2 => -- Remise a 0
		outCompteurBP_BP_Babord <= '1';
		outCompteurBP_BP_Tribord <= '1';
		outCompteurBP_BP_STBY <= '1';
		outCompteurBP_BP_Appuis <= '1';
		state := 0;
	end case;
	end if; --clock
		
	

end process;
end ar;