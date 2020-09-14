library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity Decodeur is   port( 
	Number : in std_logic_vector (3 downto 0);
	A : out std_logic;
	B : out std_logic;
	C : out std_logic;
	D : out std_logic;
	E : out std_logic;
	F : out std_logic;
	G : out std_logic);
end Decodeur ;


architecture dec of Decodeur is
	signal Segment : std_logic_vector(1 to 7);
begin

	A <= Segment(1);	
	B <= Segment(2);
	C <= Segment(3);
	D <= Segment(4);
	E <= Segment(5);
	F <= Segment(6);
	G <= Segment(7);
	
	Segment <= "1111110" When Number = "0000"
	else "0110000" When Number = "0001"
	else "1101101" When Number = "0010"
	else "1111001" When Number = "0011"
	else "0110011" When Number = "0100"
	else "1011011" When Number = "0101"
	else "1011111" When Number = "0110"
	else "1110000" When Number = "0111"
	else "1111111" When Number = "1000"
	else "1111101" When Number = "1001"
	else "0000000";

end dec;
	

