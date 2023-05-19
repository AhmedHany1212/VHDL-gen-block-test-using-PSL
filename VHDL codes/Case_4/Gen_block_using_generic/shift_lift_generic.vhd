library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_lift_generic is
	Generic (n: integer :=4);
	port(
		clk, rst : in std_logic;
		Input_Data: in std_logic;
		Q: out std_logic_vector(n-1 downto 0) 
		);
end shift_lift_generic;

architecture Behavioral of shift_lift_generic is

	signal Shift_Lift : std_logic_vector(n-1 downto 0) := "0000";
	component D_FF
		port(D, CLK_S,rst_D : in std_logic; Q:out std_logic);
	end component D_FF;
begin

	D_Flip_Flop : D_FF port map(Input_Data, clk,rst, Shift_Lift(0));
	shift_lift_gen : for i in 1 to n-1 generate
		D_Flip_Flop : D_FF port map(Shift_Lift(i-1), clk,rst, Shift_Lift(i));
	end generate;
	Q <= Shift_Lift;

end Behavioral;

