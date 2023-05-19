library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_lift is
	port(
		clk, rst : in std_logic;
		Input_Data: in std_logic;
		Q: out std_logic_vector(3 downto 0)
		);
end shift_lift;

architecture Behavioral of shift_lift is

	signal Shift_reg : std_logic_vector(3 downto 0) := "1010";
	component D_FF
		port(D, CLK_S,rst_D : in std_logic; Q:out std_logic);
	end component D_FF;

begin
	shift_lift_0 : for i in 0 to 0 generate
		D_Flip_Flop : D_FF port map(Input_Data, clk,rst, Shift_reg(i));
	end generate shift_lift_0;
	shift_lift_except_0 : for i in 1 to 3 generate
		D_Flip_Flop : D_FF port map(Shift_reg(i-1), clk,rst, Shift_reg(i));
	end generate shift_lift_except_0;
	Q <= Shift_reg;
end Behavioral;

