
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity multi_if_gen is
	port(
	A:  in STD_LOGIC_VECTOR (3 downto 0);
	B:	 in STD_LOGIC_VECTOR (3 downto 0);
	C:  out STD_LOGIC_VECTOR (3 downto 0)
	);
end multi_if_gen;

architecture Behavioral of multi_if_gen is

	constant flag :STD_LOGIC  := '0';
	begin
		first_condition : if (flag='0') generate 
			C <= A and B;
		end generate first_condition;
		second_condition : if (flag='1') generate 
			C <= A or B;
		end generate second_condition;		
	end Behavioral;

