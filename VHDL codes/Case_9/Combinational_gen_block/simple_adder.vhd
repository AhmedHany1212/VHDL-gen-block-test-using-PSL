library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity simple_adder is
	port(
		A,B: in std_logic_vector(3 downto 0);
		Cin: in std_logic;
		sum: out std_logic_vector(3 downto 0);
		Cout: out std_logic
		);
end simple_adder;

architecture Behavioral of simple_adder is
	signal C : std_logic_vector(4 downto 0) :="00000";
	begin
		C(0) <= Cin;
		Cout <= C(4);
		LOOP_ADD : for i in 0 to 3 generate
			sum(I)   <= A(i) xor B(i) xor C(i);
			C(i + 1) <= (A(i) and B(i)) or (A(i) and C(i)) or (B(i) and C(i));
		end generate LOOP_ADD;
	end architecture  Behavioral;