library ieee;
use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all ;


entity synchro_anemo is   port( 
	in_continu : in std_logic;
	in_raz_n : in std_logic;
	in_data_anemo_continu : in std_logic_vector(7 downto 0);
	in_data_anemo_monocoup : in std_logic_vector(7 downto 0);
	out_data_anemometre: out std_logic_vector(7 downto 0);
	out_data_valid : out std_logic);
end synchro_anemo ;


architecture ar of synchro_anemo is

	signal out_data_anemo : std_logic_vector(7 downto 0) := "00000000";

begin
process( in_continu, in_raz_n, in_data_anemo_continu, in_data_anemo_monocoup)
begin
	
	if in_continu = '0' 
	then 
	out_data_anemo <= in_data_anemo_monocoup;
	elsif in_continu = '1'
	then 
	out_data_anemo <= in_data_anemo_continu;
	end if;
	
	if in_raz_n = '1'
	then 
	out_data_anemo <= "00000000";
	out_data_anemometre <= "00000000";
	end if;
	
	if out_data_anemo /= "00000000"
	then 
	out_data_valid <= '1';
	else out_data_valid <= '0';
	end if ;
	
	out_data_anemometre <= out_data_anemo;
	
end process;
end ar;
	