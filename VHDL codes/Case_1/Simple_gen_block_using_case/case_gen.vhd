
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity case_gen is
	port(
	A:  	in STD_LOGIC_VECTOR (3 downto 0);
	B:		in STD_LOGIC_VECTOR (3 downto 0);
	C:  	out STD_LOGIC_VECTOR (3 downto 0)
	);
end case_gen;

architecture Behavioral of case_gen is
	constant flag :STD_LOGIC_VECTOR(1 downto 0)  := "00";
begin
		simple_condition : case flag generate 
		when "00" =>
			C <= A and B;
		when "01" =>
			C <= A or B;
		when "10" =>
			C <= A xor B;
		when others =>
			C <= A xnor B;
		end generate simple_condition;
end Behavioral;



