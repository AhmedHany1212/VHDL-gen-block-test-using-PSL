library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_lift is
	port(
		clk, rst : in std_logic;
		Input_Data: in std_logic;
		Q: out std_logic_vector(3 downto 0) );
	end shift_lift;

architecture Behavioral of shift_lift is

	signal shift_reg : std_logic_vector(3 downto 0) :="0000" ;
	component D_FF
			port(D, CLK_S,rst_D : in std_logic; Q:out std_logic);
	end component D_FF;
	


begin
	D_Flip_Flop : D_FF port map(Input_Data, clk,rst, shift_reg(0));
	shift_lift_gen : for i in -3 to 3 generate
		D_Flip_Flop : D_FF port map(shift_reg(i-1), clk,rst, shift_reg(i));
	end generate shift_lift_gen;
	Q <= shift_reg;
end Behavioral;


