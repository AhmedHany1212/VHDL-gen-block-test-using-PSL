
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity if_gen is
	port(
	A:  in STD_LOGIC_VECTOR (3 downto 0);
	B:	 in STD_LOGIC_VECTOR (3 downto 0);
	C:  out STD_LOGIC_VECTOR (3 downto 0)
	);
end if_gen;

architecture Behavioral of if_gen is
	constant flag :STD_LOGIC_VECTOR(1 downto 0)  := "01";
	begin
		simple_condition : if (flag="00") generate 
		C <= A and B;
							 elsif (flag="01") generate
		C <= A or B;
							 elsif (flag="10") generate
		C <= A xor B;
							 else 				 generate
		C <= A xnor B;
	end generate simple_condition;
end Behavioral;

