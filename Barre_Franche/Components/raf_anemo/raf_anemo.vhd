Library ieee ;
use ieee.std_logic_1164.all ;
Use ieee.std_logic_unsigned.all ;

Entity raf_anemo is --rafrechissement anemometre
Port (
		clk1Hz	: IN std_logic ;
		vect 	: IN std_logic_vector(7 downto 0) ;
		data_anemo	:OUT std_logic_vector(7 downto 0)
	 ) ;
End raf_anemo ;

Architecture arch of raf_anemo is
signal v : std_logic_vector(7 downto 0) ;

Begin
		Process(clk1Hz)
		Begin
				if (clk1Hz = '1' and clk1Hz'event) then data_anemo <= vect  ;
				end if ;
		End Process ;
End arch ;
